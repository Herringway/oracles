/// Port-related code, usually to work around architectural limitations
module oracles.extra;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;

import std.format : format;

static ubyte nothing;
void* getValue(TreasureBehaviourVars var) {
	final switch (var) {
		case TreasureBehaviourVars.none: return &nothing;
		case TreasureBehaviourVars.shieldLevel: return &state.shieldLevel;
		case TreasureBehaviourVars.unnamedC608: return &state.unnamedC608;
		case TreasureBehaviourVars.numBombs: return &state.numBombs;
		case TreasureBehaviourVars.swordLevel: return &state.swordLevel;
		case TreasureBehaviourVars.switchHookLevel: return &state.switchHookLevel;
		case TreasureBehaviourVars.numBombchus: return &state.numBombchus;
		case TreasureBehaviourVars.animalCompanion: return &state.animalCompanion;
		case TreasureBehaviourVars.selectedHarpSong: return &state.selectedHarpSong;
		case TreasureBehaviourVars.braceletLevel: return &state.braceletLevel;
		case TreasureBehaviourVars.seedSatchelLevel: return &state.seedSatchelLevel;
		case TreasureBehaviourVars.numEmberSeeds: return &state.numEmberSeeds;
		case TreasureBehaviourVars.numScentSeeds: return &state.numScentSeeds;
		case TreasureBehaviourVars.numPegasusSeeds: return &state.numPegasusSeeds;
		case TreasureBehaviourVars.numGaleSeeds: return &state.numGaleSeeds;
		case TreasureBehaviourVars.numMysterySeeds: return &state.numMysterySeeds;
		case TreasureBehaviourVars.numRupees: return &state.numRupees;
		case TreasureBehaviourVars.linkHealth: return &state.linkHealth;
		case TreasureBehaviourVars.linkMaxHealth: return &state.linkMaxHealth;
		case TreasureBehaviourVars.numHeartPieces: return &state.numHeartPieces;
		case TreasureBehaviourVars.ringBoxLevel: return &state.ringBoxLevel;
		case TreasureBehaviourVars.numUnappraisedRingsBCD: return &state.numUnappraisedRingsBCD;
		case TreasureBehaviourVars.dungeonSmallKeys: return &state.dungeonSmallKeys[0];
		case TreasureBehaviourVars.dungeonBossKeys: return &state.dungeonBossKeys[0];
		case TreasureBehaviourVars.dungeonCompasses: return &state.dungeonCompasses[0];
		case TreasureBehaviourVars.dungeonMaps: return &state.dungeonMaps[0];
		case TreasureBehaviourVars.numGashaSeeds: return &state.numGashaSeeds;
		case TreasureBehaviourVars.essencesObtained: return &state.essencesObtained;
		case TreasureBehaviourVars.tradeItem: return &state.tradeItem;
		case TreasureBehaviourVars.numSlates: return &state.numSlates;
		case TreasureBehaviourVars.tuniNutState: return &state.tuniNutState;
		case TreasureBehaviourVars.rememberedCompanionID: return &rememberedCompanionID;
	}
}

ubyte getType(GameObject* object) {
	if ((object >= &itemObjects[0]) && (object < &itemObjects.ptr[16])) {
		return 0;
	}
	if ((object >= &interactions[0]) && (object < &interactions.ptr[16])) {
		return 1;
	}
	if ((object >= &enemies[0]) && (object < &enemies.ptr[16])) {
		return 2;
	}
	if ((object >= &parts[0]) && (object < &parts.ptr[16])) {
		return 3;
	}
	assert(0, "Object not found?");
}

ubyte getSlot(GameObject* object) {
	switch (getType(object)) {
		case 0: return cast(ubyte)(object - &itemObjects[0]);
		case 1: return cast(ubyte)(object - &interactions[0]);
		case 2: return cast(ubyte)(object - &enemies[0]);
		case 3: return cast(ubyte)(object - &parts[0]);
		default: assert(0, "Object not found");
	}
}

ubyte speed(int value) {
	return cast(ubyte)(value / 4);
}

ubyte[] remapDestination(RemappedDestination destination) {
	mixin(restoreVBKOnExit);
	gbc.VBK = destination.bank;
	final switch (destination.destination) {
		case GFXDestination.vram: return gbc.vram[destination.offset .. $];
		case GFXDestination.roomLayout: return roomLayout[destination.offset .. $];
		case GFXDestination.nameEntryCharacterGFX: return nameEntryCharacterGFX[destination.offset .. $];
		case GFXDestination.tmpGFXBuffer: return tmpGFXBuffer[destination.offset .. $];
		case GFXDestination.tmpAttrBuffer: return tmpAttrBuffer[destination.offset .. $];
		case GFXDestination.dragonOnoxTileMap1: return dragonOnoxTileMap1[destination.offset .. $];
		case GFXDestination.tileMap: return tileMap[destination.offset .. $];
		case GFXDestination.attributeMap: return attributeMap[destination.offset .. $];
		case GFXDestination.statusBarTileMap: return statusBarTileMap[destination.offset .. $];
		case GFXDestination.statusBarAttributeMap: return statusBarAttributeMap[destination.offset .. $];
		case GFXDestination.vramTiles: return vramTiles[destination.offset .. $];
		case GFXDestination.vramAttributes: return vramAttributes[destination.offset .. $];
		case GFXDestination.gfxBuf: return gfxBuf[destination.offset .. $];
		case GFXDestination.unnamedD800: return unnamedD800[destination.offset .. $];
	}
}
ubyte[] toVRAMRange(ushort addr, ubyte bank)
	in(addr >= 0x8000, format!"Address %04X out of range"(addr))
	in(addr < 0xA000, format!"Address %04X out of range"(addr))
{
	const oldBank = gbc.VBK;
	scope(exit) gbc.VBK = oldBank;
	gbc.VBK = bank;
	return gbc.vram[addr - 0x8000 .. $];
}

GameSettings gameSettings;

enum StartMode {
	intro,
	titleScreen,
	fileSelect,
}

struct GameSettings {
	StartMode startMode;
}

enum restoreRomBankOnExit = q{
	ubyte oldBank = romBank;
	scope(exit) {
		romBank = oldBank;
		setROMBank(oldBank);
	}
};

enum restoreSVBKOnExit = q{
	ubyte oldSVBK = gbc.SVBK;
	scope(exit) {
		gbc.SVBK = oldSVBK;
	}
};

enum restoreVBKOnExit = q{
	ubyte oldVBK = gbc.VBK;
	scope(exit) {
		gbc.VBK = oldVBK;
	}
};

enum GFXDestination {
	vram,
	tmpGFXBuffer,
	tmpAttrBuffer,
	dragonOnoxTileMap1,
	roomLayout,
	nameEntryCharacterGFX,
	tileMap,
	attributeMap,
	statusBarTileMap,
	statusBarAttributeMap,
	vramTiles,
	vramAttributes,
	gfxBuf,
	unnamedD800,
}
