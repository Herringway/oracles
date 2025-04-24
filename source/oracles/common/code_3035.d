module oracles.common.code_3035;

import oracles.bank00;
import oracles.structures;
import oracles.external;
import oracles.extra;
import oracles.globals;

//;;
//; @param	hl
//objectLoadMovementScript:
//	ldh a,(<hRomBank)
//	push af
//.ifdef ROM_AGES
//	callfrombank0 bank0e.objectLoadMovementScript_body
//.else
//	callfrombank0 bank0d.objectLoadMovementScript_body
//.endif
//	pop af
//	setrombank
//	ret

//;;
//objectRunMovementScript:
//	ldh a,(<hRomBank)
//	push af
//.ifdef ROM_AGES
//	callfrombank0 bank0e.objectRunMovementScript_body
//.else
//	callfrombank0 bank0d.objectRunMovementScript_body
//.endif
//	pop af
//	setrombank
//	ret

bool decCBB3() {
	return --intro.unnamedCBB3 == 0;
}

//;;
//incCbc1:
//	ld hl,$cbc1
//	inc (hl)
//	ret

//;;
//incCbc2:
//	ld hl,$cbc2
//	inc (hl)
//	ret

//;;
//; @param	e
//endgameCutsceneHandler:
//	ldh a,(<hRomBank)
//	push af
//	callfrombank0 bank3Cutscenes.endgameCutsceneHandler_body
//	pop af
//	setrombank
//	ret

//;;
//getEntryFromObjectTable1:
//	ldh a,(<hRomBank)
//	push af
//	ld a, :objectData.objectTable1
//	setrombank
//	ld a,b
//	ld hl, objectData.objectTable1
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld h,(hl)
//	ld l,a
//	pop af
//	setrombank
//	ret

//;;
//fileSelect_redrawDecorations:
//	ldh a,(<hRomBank)
//	push af
//	callfrombank0 bank2.fileSelect_redrawDecorationsAndSetWramBank4
//	pop af
//	setrombank
//	xor a
//	ld ($ff00+R_SVBK),a
//	ret


//.ifdef ROM_AGES
//;;
//; Does a lot of initialization, sets wActiveGroup/wActiveRoom to the given values. This
//; does not load the room's objects.
//;
//; After calling this, the LCD needs to be re-enabled, and the Link object needs to be
//; created.
//;
//; @param	b	Group
//; @param	c	Room
//disableLcdAndLoadRoom:
//	ldh a,(<hRomBank)
//	push af
//	callfrombank0 bank3Cutscenes.disableLcdAndLoadRoom_body
//	pop af
//	setrombank
//	ret

//;;
//; Plays SND_WAVE, and writes something to 'hl'.
//;
//; @param	hl
//playWaveSoundAtRandomIntervals:
//	ldh a,(<hRomBank)
//	push af
//	callfrombank0 cutscenesBank10.agesFunc_10_7298@playWaveSoundAtRandomIntervals_body
//	pop af
//	setrombank
//	ret

//.endif


//;;
//; Same as "addSpritesToOam_withOffset", except this changes the bank first.
//;
//; @param	bc	Sprite offset
//; @param	e	Bank where the OAM data is
//; @param	hl	OAM data
void addSpritesFromBankToOAMWithOffset(ushort offset, ubyte bank, const(ObjLoad)* data) {
	mixin(restoreRomBankOnExit);
	romBank = bank;
	setROMBank(bank);
	addSpritesToOAMWithOffset(offset, data);
}


static if (gameVersion == GameVersion.ages) {
//; Same as "addSpritesToOam", except this changes the bank first.
//; @param	e	Bank where the OAM data is
//; @param	hl	OAM data
void addSpritesFromBankToOAM(ubyte bank, const(ObjLoad)* data) {
	mixin(restoreRomBankOnExit);
	romBank = bank;
	setROMBank(bank);
	addSpritesToOAM(data);
}
}
