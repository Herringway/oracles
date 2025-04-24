module oracles.common.fileManagement;

import oracles.bank00;
import oracles.common.objects.interactions.bipinBlossomFamilySpawner;
import oracles.common.roomSpecificTileChanges;
import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;

import std.logger;

enum FileManagementFunction {
	initialize = 0,
	save = 1,
	load = 2,
	erase = 3,
}

//; @param c What operation to do on the file
//; @param hActiveFileSlot File index
ubyte fileManagementFunction(FileManagementFunction func) {
	final switch (func) {
		case FileManagementFunction.initialize: return initializeFile();
		case FileManagementFunction.save: return saveFile();
		case FileManagementFunction.load: return loadFile();
		case FileManagementFunction.erase: return eraseFile();
	}
}

ubyte initializeFile() {
	infof("Initializing file");
	initializeFileVariables(&initialFileVariables[0]);

	// Initialize data differently based on whether it's a linked or hero game
	initializeFileVariables(&initialFileVariablesTable[state.fileIsHeroGame * 2 + state.fileIsLinkedGame][0]);

	// Clear unappraised rings
	state.unappraisedRings[] = 0xFF;
	// Clear ring box contents
	state.ringBoxContents[] = 0xFF;
	state.activeRing = 0xFF;

	// If hero game, give victory ring
	if (state.fileIsHeroGame != 0) {
		setFlag(&state.obtainedTreasureFlags, Treasure.ring);
		state.unappraisedRings[0] = Ring.victory | 0x40;
	}
	initializeChildOnGameStart();
	static if (gameVersion == GameVersion.ages) {
		initializeVinePositions();
	}
	return saveFile();
}

//;;
//; In addition to saving, this is called after creating a file, as well as when it's about
//; to be loaded (for some reason)
ubyte saveFile() {
	infof("Saving file");
//	; Write $01 here for "ages", $00 for "seasons"
	static if (gameVersion == GameVersion.ages) {
		state.whichGame = 1;
	} else {
		state.whichGame = 0;
	}
	// String to verify save integrity (unique between ages/seasons)
	state.saveFileString[] = saveVerificationString[];
	state.checksum = calculateFileChecksum(cast(ubyte*)&state);
	infof("Calculated checksum: %04X", state.checksum);

	// Save file
	copyFileFromHlToDe(&state, getFileAddress1());
	// Save backup file
	copyFileFromHlToDe(&state, getFileAddress2());

	// Make sure it saved ok
	return verifyFileCopies();
}

ubyte loadFile() {
	infof("Loading file");
	GameState* file;
	ubyte verified = verifyFileCopies();
	if (verified == 0) {
		file = getFileAddress1();
	} else {
		file = getFileAddress2();
	}
	copyFileFromHlToDe(file, &state);
	return verified;
}

ubyte eraseFile() {
	infof("Erasing file");
	void clearFile(GameState* file) {
		gbc.enableSRAM();
		clearFileAtHL(file);
		gbc.disableSRAM();
	}
	clearFile(getFileAddress1());
	clearFile(getFileAddress2());
	return 0;
}

//; Clear $0550 bytes at hl
void clearFileAtHL(GameState* file) {
	infof("Clearing file");
	*file = GameState.init;
}

//; Checks both copies of the file data to see if one is valid.
//; If one is valid but not the other, this also updates the invalid copy with the valid copy's data.
//; @param[out] a $01 if copy 2 was valid while copy 1 wasn't
ubyte verifyFileCopies() {
	ubyte invalidFiles = (verifyFileAtHL(getFileAddress2()) & 1) << 1;
	invalidFiles |= (verifyFileAtHL(getFileAddress1()) & 1);

	switch (invalidFiles) {
		case 0b00: // both succeeded
			return 0;
		case 0b01: // copy 1 failed
			*getFileAddress1() = *getFileAddress2();
			return 1;
		case 0b10: // copy 2 failed
			*getFileAddress2() = *getFileAddress1();
			return 0;
		case 0b11: // both failed
			return 0xFF;
		default: assert(0);
	}
}
//; Copy a file ($0550 bytes) from hl to de.
//; @param de Destination address
//; @param hl Source address
void copyFileFromHlToDe(const(GameState)* source, GameState* destination) {
	gbc.enableSRAM();
	*destination = *source;
	gbc.disableSRAM();
}

//; @param hl Address of file
//; @param[out] a Equals $ff if verification failed
//; @param[out] cflag Set if verification failed
ubyte verifyFileAtHL(GameState* file) {
	gbc.enableSRAM();
	ubyte result = 0; // assume good by default
	if ((calculateFileChecksum(cast(ubyte*)file) != file.checksum) || (file.saveFileString != saveVerificationString)) {
		// failed...
		infof("File failed verification: %s", (calculateFileChecksum(cast(ubyte*)file) != file.checksum) ? "Bad checksum" : ((file.saveFileString != saveVerificationString) ? "Invalid save string" : ""));
		clearFileAtHL(file);
		result = 0xFF;
	}
	gbc.disableSRAM();
	return result;
}

//; Calculate a checksum over $550 bytes (excluding the first 2) for a save file
//; @param hl Address to start at
//; @param[out] de Checksum
ushort calculateFileChecksum(const(ubyte)* data) {
	data += 2; // skip checksum location
	ushort result = 0x0000;
	for (ushort bytesLeft = GameState.sizeof / 2 - 1; bytesLeft != 0; bytesLeft--) {
		result += (data++)[0];
		result += ((data++)[0] << 8);
	}
	return result;
}

//; Get the first address of the save data
//; @param hActiveFileSlot Save slot
//; @param[out] bc Address
GameState* getFileAddress1() {
	return getFileAddressCommon(0);
}

//; Get the second (backup?) address of the save data
//; @param hActiveFileSlot Save slot
//; @param[out] bc Address
GameState* getFileAddress2() {
	return getFileAddressCommon(3);
}

GameState* getFileAddressCommon(ubyte slotOffset) {
	return &gbc.sram!GameState(activeFileSlot + slotOffset);
}

//@saveFileAddresses:
//	.dw $a010
//	.dw $a560
//	.dw $aab0

//	.dw $b000
//	.dw $b550
//	.dw $baa0

// @param hl Address of initial values (should point to initialFileVariables or some variant)
void initializeFileVariables(const(InitialFileValue)* vars) {
	ref ubyte getVar(InitialFileVar variable) {
		final switch(variable) {
			case InitialFileVar.animalCompanion: return state.animalCompanion;
			case InitialFileVar.childStatus: return state.childStatus;
			case InitialFileVar.deathRespawnBufferFacingDir: return state.deathRespawnBuffer.facingDir;
			case InitialFileVar.deathRespawnBufferGroup: return state.deathRespawnBuffer.group;
			case InitialFileVar.deathRespawnBufferRoom: return state.deathRespawnBuffer.room;
			case InitialFileVar.deathRespawnBufferX: return state.deathRespawnBuffer.x;
			case InitialFileVar.deathRespawnBufferY: return state.deathRespawnBuffer.y;
			case InitialFileVar.inventoryStorage: return state.inventoryStorage[0];
			case InitialFileVar.jabuWaterLevel: return state.jabuWaterLevel;
			case InitialFileVar.kidNameEnd: return state.kidName[5];
			case InitialFileVar.linkHealth: return state.linkHealth;
			case InitialFileVar.linkMaxHealth: return state.linkMaxHealth;
			case InitialFileVar.linkNameEnd: return state.linkName[5];
			case InitialFileVar.maxBombs: return state.maxBombs;
			case InitialFileVar.obtainedTreasureFlags: return state.obtainedTreasureFlags[0];
			case InitialFileVar.pirateShipAngle: return state.pirateShipAngle;
			case InitialFileVar.pirateShipRoom: return state.pirateShipRoom;
			case InitialFileVar.pirateShipX: return state.pirateShipX;
			case InitialFileVar.pirateShipY: return state.pirateShipY;
			case InitialFileVar.portalGroup: return state.portalGroup;
			case InitialFileVar.swordLevel: return state.swordLevel;
			case InitialFileVar.shieldLevel: return state.shieldLevel;
			case InitialFileVar.textSpeed: return state.textSpeed;
			case InitialFileVar.unnamedC608: return state.unnamedC608;
			case InitialFileVar.null_: assert(0);
		}
	}
	while (vars.var != 0) {
		getVar(vars.var) = vars.value;
		vars++;
	}
}

// Table to distinguish initial file data based on whether it's a standard, linked, or hero game.
immutable initialFileVariablesTable = [
	initialFileVariablesStandardGame,
	initialFileVariablesLinkedGame,
	initialFileVariablesHeroGame,
	initialFileVariablesLinkedGame,
];

// Standard game (not linked or hero)
immutable InitialFileValue[] initialFileVariablesStandardGame = [
	InitialFileValue(InitialFileVar.linkHealth, 12), // 3 hearts
	InitialFileValue(InitialFileVar.linkMaxHealth, 12),
] ~ initialFileVariablesHeroGame;

// Hero game (not linked+hero game)
immutable InitialFileValue[] initialFileVariablesHeroGame = [
	InitialFileValue(InitialFileVar.childStatus, 0),
	InitialFileValue(InitialFileVar.shieldLevel, 1),
	InitialFileValue(InitialFileVar.animalCompanion, (gameVersion == GameVersion.ages) ? 0 : SpecialObject.ricky),
	InitialFileValue(InitialFileVar.null_),
];

// Linked game, or linked+hero game
immutable InitialFileValue[] initialFileVariablesLinkedGame = [
	InitialFileValue(InitialFileVar.swordLevel, 1),
	InitialFileValue(InitialFileVar.shieldLevel, 1),
	InitialFileValue(InitialFileVar.inventoryStorage, Item.sword),
	InitialFileValue(InitialFileVar.obtainedTreasureFlags, (1 << Treasure.punch) | (1 << Treasure.sword)),
] ~  ((gameVersion == GameVersion.ages) ? [ InitialFileValue(InitialFileVar.pirateShipY, 88), InitialFileValue(InitialFileVar.pirateShipX, 120) ] : []) ~ InitialFileValue(InitialFileVar.null_);

enum InitialFileVar {
	null_ = 0,
	animalCompanion,
	childStatus,
	deathRespawnBufferFacingDir,
	deathRespawnBufferGroup,
	deathRespawnBufferRoom,
	deathRespawnBufferX,
	deathRespawnBufferY,
	inventoryStorage,
	jabuWaterLevel,
	kidNameEnd,
	linkHealth,
	linkMaxHealth,
	linkNameEnd,
	maxBombs,
	obtainedTreasureFlags,
	pirateShipAngle,
	pirateShipRoom,
	pirateShipX,
	pirateShipY,
	portalGroup,
	swordLevel,
	shieldLevel,
	textSpeed,
	unnamedC608,
}

struct InitialFileValue {
	InitialFileVar var;
	ubyte value;
}
//; Initial values for variables in the c6xx block.
enum InitialFileValue[] initialFileVariablesCommon = [
	InitialFileValue(InitialFileVar.textSpeed, 2),
	InitialFileValue(InitialFileVar.unnamedC608, 1),
	InitialFileValue(InitialFileVar.linkNameEnd, 0),  //Ensure names have null terminator
	InitialFileValue(InitialFileVar.kidNameEnd, 0),
	InitialFileValue(InitialFileVar.obtainedTreasureFlags, 1 << Treasure.punch),
	InitialFileValue(InitialFileVar.maxBombs, 10),
	InitialFileValue(InitialFileVar.linkHealth, 16),  // 4 hearts (gets overwritten in standard game)
	InitialFileValue(InitialFileVar.linkMaxHealth, 16),
];
static if (gameVersion == GameVersion.ages) {
	immutable initialFileVariables = initialFileVariablesCommon ~ [
		//	; Initial spawn location
		InitialFileValue(InitialFileVar.deathRespawnBufferGroup, 0),
		InitialFileValue(InitialFileVar.deathRespawnBufferRoom, 138),
		InitialFileValue(InitialFileVar.deathRespawnBufferY, 56),
		InitialFileValue(InitialFileVar.deathRespawnBufferX, 72),
		InitialFileValue(InitialFileVar.deathRespawnBufferFacingDir, 0),

		InitialFileValue(InitialFileVar.jabuWaterLevel, 33),
		InitialFileValue(InitialFileVar.portalGroup, 255),
		InitialFileValue(InitialFileVar.pirateShipRoom, 182),
		InitialFileValue(InitialFileVar.pirateShipY, 72),
		InitialFileValue(InitialFileVar.pirateShipX, 72),
		InitialFileValue(InitialFileVar.pirateShipAngle, 2),
		InitialFileValue(InitialFileVar.null_),
	];
} else {
	immutable initialFileVariables = initialFileVariablesCommon ~ [
		//	; Initial spawn location
		InitialFileValue(InitialFileVar.deathRespawnBufferGroup, 0),
		InitialFileValue(InitialFileVar.deathRespawnBufferRoom, 167),
		InitialFileValue(InitialFileVar.deathRespawnBufferY, 56),
		InitialFileValue(InitialFileVar.deathRespawnBufferX, 72),
		InitialFileValue(InitialFileVar.deathRespawnBufferFacingDir, 2),
		InitialFileValue(InitialFileVar.null_),
	];
}

immutable saveVerificationString = gameVersion == GameVersion.ages ? "Z21216-0" : "Z11216-0";
