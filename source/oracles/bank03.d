module oracles.bank03;

import oracles.bank00;
import oracles.bank02;
import oracles.bank11;
import oracles.bank12;
import oracles.bank3f;

import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.globals;
import oracles.structures;

import replatform64.gameboy;

import std.logger;

void init() {
	gbc.disableInterrupts();
	gbc.IF = 0;
	gbc.IE = 0;
	gbc.STAT = 0;
	gbc.TAC = 0;
	gbc.SC = 0;
	gbc.disableSRAM();
	disableLCD();
	if (gameboyType != 0) {
		gbc.RP = 0;
		selectWRAMBank(0);
		gbc.VBK = 0;
		setCPUDoubleSpeed();
	}
	// pretend we cleared globals here
	clearVRAM();
	//copy OAM function to memory
	gbc.BGP = 0b1110_0100;
	gbc.OBP0 = 0b1110_0100;
	gbc.OBP1 = 0b0110_1100;
	initSound();
	gbc.LYC = 199;
	gbc.STAT = STATValues.lycInterrupt;
	gbc.IF = 0;
	gbc.IE = InterruptFlag.vblank | InterruptFlag.lcd | InterruptFlag.timer | InterruptFlag.serial;
	initGBAModePaletteData();
	gbc.enableInterrupts();
	checkDisplayDMGModeScreen();
	startGame();
}

void setCPUDoubleSpeed() {
	if ((gbc.KEY1 & 0x80) == 1) { // already double speed?
		return;
	}
	gbc.IF = 0;
	gbc.IE = 0;
	gbc.KEY1 = 1;
	gbc.P1 = 0x30;
	gbc.stop(); // set double speed and wait for it to take effect
	while ((gbc.KEY1 & 0x80) != 0x80) {}
	gbc.P1 = 0;
	gbc.IF = 0;
	gbc.IE = 0;
}

void oamDMAFunction() {
	gbc.oam[] = cast(ubyte[])(oam[]);
}


//; Speed table for objects.
//;
//; It's organized in a sort of complicated way which allows it to reuse certain sin and cos
//; values for certain angles, ie. an angle of $08 (right) uses the same values for its
//; Y speed as angle $00 (up) does for its X speed. Due to this, there is an extra .dwsin
//; line at the end of each repetition which is used for angle $18-$1f's X positions only.
immutable ushort[] objectSpeedTable = [
	0xFFE0, 0xFFE1, 0xFFE3, 0xFFE6, 0xFFEA, 0xFFEF, 0xFFF4, 0xFFFA, 0x0000, 0x0006, 0x000C, 0x0011, 0x0016, 0x001A, 0x001D, 0x001F,
	0x0020, 0x001F, 0x001D, 0x001A, 0x0016, 0x0011, 0x000C, 0x0006, 0x0000, 0xFFFA, 0xFFF4, 0xFFEF, 0xFFEA, 0xFFE6, 0xFFE3, 0xFFE1,
	0xFFE0, 0xFFE1, 0xFFE3, 0xFFE6, 0xFFEA, 0xFFEF, 0xFFF4, 0xFFFA, 0xFFC0, 0xFFC2, 0xFFC5, 0xFFCB, 0xFFD3, 0xFFDD, 0xFFE8, 0xFFF4,
	0x0000, 0x000C, 0x0018, 0x0023, 0x002D, 0x0035, 0x003B, 0x003E, 0x0040, 0x003E, 0x003B, 0x0035, 0x002D, 0x0023, 0x0018, 0x000C,
	0x0000, 0xFFF4, 0xFFE8, 0xFFDD, 0xFFD3, 0xFFCB, 0xFFC5, 0xFFC2, 0xFFC0, 0xFFC2, 0xFFC5, 0xFFCB, 0xFFD3, 0xFFDD, 0xFFE8, 0xFFF4,
	0xFFA0, 0xFFA2, 0xFFA8, 0xFFB1, 0xFFBD, 0xFFCB, 0xFFDC, 0xFFEE, 0x0000, 0x0012, 0x0024, 0x0035, 0x0043, 0x004F, 0x0058, 0x005E,
	0x0060, 0x005E, 0x0058, 0x004F, 0x0043, 0x0035, 0x0024, 0x0012, 0x0000, 0xFFEE, 0xFFDC, 0xFFCB, 0xFFBD, 0xFFB1, 0xFFA8, 0xFFA2,
	0xFFA0, 0xFFA2, 0xFFA8, 0xFFB1, 0xFFBD, 0xFFCB, 0xFFDC, 0xFFEE, 0xFF80, 0xFF83, 0xFF8A, 0xFF96, 0xFFA6, 0xFFB9, 0xFFD0, 0xFFE8,
	0x0000, 0x0018, 0x0030, 0x0047, 0x005A, 0x006A, 0x0076, 0x007D, 0x0080, 0x007D, 0x0076, 0x006A, 0x005A, 0x0047, 0x0030, 0x0018,
	0x0000, 0xFFE8, 0xFFD0, 0xFFB9, 0xFFA6, 0xFF96, 0xFF8A, 0xFF83, 0xFF80, 0xFF83, 0xFF8A, 0xFF96, 0xFFA6, 0xFFB9, 0xFFD0, 0xFFE8,
	0xFF60, 0xFF64, 0xFF6D, 0xFF7B, 0xFF8F, 0xFFA8, 0xFFC3, 0xFFE1, 0x0000, 0x001F, 0x003D, 0x0058, 0x0071, 0x0085, 0x0093, 0x009C,
	0x00A0, 0x009C, 0x0093, 0x0085, 0x0071, 0x0058, 0x003D, 0x001F, 0x0000, 0xFFE1, 0xFFC3, 0xFFA8, 0xFF8F, 0xFF7B, 0xFF6D, 0xFF64,
	0xFF60, 0xFF64, 0xFF6D, 0xFF7B, 0xFF8F, 0xFFA8, 0xFFC3, 0xFFE1, 0xFF40, 0xFF44, 0xFF4F, 0xFF61, 0xFF79, 0xFF96, 0xFFB7, 0xFFDB,
	0x0000, 0x0025, 0x0049, 0x006A, 0x0087, 0x009F, 0x00B1, 0x00BC, 0x00C0, 0x00BC, 0x00B1, 0x009F, 0x0087, 0x006A, 0x0049, 0x0025,
	0x0000, 0xFFDB, 0xFFB7, 0xFF96, 0xFF79, 0xFF61, 0xFF4F, 0xFF44, 0xFF40, 0xFF44, 0xFF4F, 0xFF61, 0xFF79, 0xFF96, 0xFFB7, 0xFFDB,
	0xFF20, 0xFF25, 0xFF32, 0xFF46, 0xFF62, 0xFF84, 0xFFAB, 0xFFD5, 0x0000, 0x002B, 0x0055, 0x007C, 0x009E, 0x00BA, 0x00CE, 0x00DB,
	0x00E0, 0x00DB, 0x00CE, 0x00BA, 0x009E, 0x007C, 0x0055, 0x002B, 0x0000, 0xFFD5, 0xFFAB, 0xFF84, 0xFF62, 0xFF46, 0xFF32, 0xFF25,
	0xFF20, 0xFF25, 0xFF32, 0xFF46, 0xFF62, 0xFF84, 0xFFAB, 0xFFD5, 0xFF00, 0xFF05, 0xFF14, 0xFF2C, 0xFF4B, 0xFF72, 0xFF9F, 0xFFCF,
	0x0000, 0x0031, 0x0061, 0x008E, 0x00B5, 0x00D4, 0x00EC, 0x00FB, 0x0100, 0x00FB, 0x00EC, 0x00D4, 0x00B5, 0x008E, 0x0061, 0x0031,
	0x0000, 0xFFCF, 0xFF9F, 0xFF72, 0xFF4B, 0xFF2C, 0xFF14, 0xFF05, 0xFF00, 0xFF05, 0xFF14, 0xFF2C, 0xFF4B, 0xFF72, 0xFF9F, 0xFFCF,
	0xFEE0, 0xFEE6, 0xFEF6, 0xFF11, 0xFF35, 0xFF60, 0xFF92, 0xFFC8, 0x0000, 0x0038, 0x006E, 0x00A0, 0x00CB, 0x00EF, 0x010A, 0x011A,
	0x0120, 0x011A, 0x010A, 0x00EF, 0x00CB, 0x00A0, 0x006E, 0x0038, 0x0000, 0xFFC8, 0xFF92, 0xFF60, 0xFF35, 0xFF11, 0xFEF6, 0xFEE6,
	0xFEE0, 0xFEE6, 0xFEF6, 0xFF11, 0xFF35, 0xFF60, 0xFF92, 0xFFC8, 0xFEC0, 0xFEC7, 0xFED9, 0xFEF6, 0xFF1E, 0xFF4F, 0xFF86, 0xFFC2,
	0x0000, 0x003E, 0x007A, 0x00B1, 0x00E2, 0x010A, 0x0127, 0x0139, 0x0140, 0x0139, 0x0127, 0x010A, 0x00E2, 0x00B1, 0x007A, 0x003E,
	0x0000, 0xFFC2, 0xFF86, 0xFF4F, 0xFF1E, 0xFEF6, 0xFED9, 0xFEC7, 0xFEC0, 0xFEC7, 0xFED9, 0xFEF6, 0xFF1E, 0xFF4F, 0xFF86, 0xFFC2,
	0xFEA0, 0xFEA7, 0xFEBB, 0xFEDC, 0xFF08, 0xFF3D, 0xFF7A, 0xFFBC, 0x0000, 0x0044, 0x0086, 0x00C3, 0x00F8, 0x0124, 0x0145, 0x0159,
	0x0160, 0x0159, 0x0145, 0x0124, 0x00F8, 0x00C3, 0x0086, 0x0044, 0x0000, 0xFFBC, 0xFF7A, 0xFF3D, 0xFF08, 0xFEDC, 0xFEBB, 0xFEA7,
	0xFEA0, 0xFEA7, 0xFEBB, 0xFEDC, 0xFF08, 0xFF3D, 0xFF7A, 0xFFBC, 0xFE80, 0xFE88, 0xFE9E, 0xFEC1, 0xFEF1, 0xFF2B, 0xFF6E, 0xFFB6,
	0x0000, 0x004A, 0x0092, 0x00D5, 0x010F, 0x013F, 0x0162, 0x0178, 0x0180, 0x0178, 0x0162, 0x013F, 0x010F, 0x00D5, 0x0092, 0x004A,
	0x0000, 0xFFB6, 0xFF6E, 0xFF2B, 0xFEF1, 0xFEC1, 0xFE9E, 0xFE88, 0xFE80, 0xFE88, 0xFE9E, 0xFEC1, 0xFEF1, 0xFF2B, 0xFF6E, 0xFFB6,
	0xFE60, 0xFE68, 0xFE80, 0xFEA7, 0xFEDA, 0xFF19, 0xFF61, 0xFFAF, 0x0000, 0x0051, 0x009F, 0x00E7, 0x0126, 0x0159, 0x0180, 0x0198,
	0x01A0, 0x0198, 0x0180, 0x0159, 0x0126, 0x00E7, 0x009F, 0x0051, 0x0000, 0xFFAF, 0xFF61, 0xFF19, 0xFEDA, 0xFEA7, 0xFE80, 0xFE68,
	0xFE60, 0xFE68, 0xFE80, 0xFEA7, 0xFEDA, 0xFF19, 0xFF61, 0xFFAF, 0xFE40, 0xFE49, 0xFE63, 0xFE8C, 0xFEC4, 0xFF08, 0xFF55, 0xFFA9,
	0x0000, 0x0057, 0x00AB, 0x00F8, 0x013C, 0x0174, 0x019D, 0x01B7, 0x01C0, 0x01B7, 0x019D, 0x0174, 0x013C, 0x00F8, 0x00AB, 0x0057,
	0x0000, 0xFFA9, 0xFF55, 0xFF08, 0xFEC4, 0xFE8C, 0xFE63, 0xFE49, 0xFE40, 0xFE49, 0xFE63, 0xFE8C, 0xFEC4, 0xFF08, 0xFF55, 0xFFA9,
	0xFE20, 0xFE2A, 0xFE45, 0xFE71, 0xFEAD, 0xFEF6, 0xFF49, 0xFFA3, 0x0000, 0x005D, 0x00B7, 0x010A, 0x0153, 0x018F, 0x01BB, 0x01D6,
	0x01E0, 0x01D6, 0x01BB, 0x018F, 0x0153, 0x010A, 0x00B7, 0x005D, 0x0000, 0xFFA3, 0xFF49, 0xFEF6, 0xFEAD, 0xFE71, 0xFE45, 0xFE2A,
	0xFE20, 0xFE2A, 0xFE45, 0xFE71, 0xFEAD, 0xFEF6, 0xFF49, 0xFFA3, 0xFE00, 0xFE0A, 0xFE27, 0xFE57, 0xFE96, 0xFEE4, 0xFF3D, 0xFF9D,
	0x0000, 0x0063, 0x00C3, 0x011C, 0x016A, 0x01A9, 0x01D9, 0x01F6, 0x0200, 0x01F6, 0x01D9, 0x01A9, 0x016A, 0x011C, 0x00C3, 0x0063,
	0x0000, 0xFF9D, 0xFF3D, 0xFEE4, 0xFE96, 0xFE57, 0xFE27, 0xFE0A, 0xFE00, 0xFE0A, 0xFE27, 0xFE57, 0xFE96, 0xFEE4, 0xFF3D, 0xFF9D,
	0xFDE0, 0xFDEB, 0xFE0A, 0xFE3C, 0xFE80, 0xFED2, 0xFF30, 0xFF96, 0x0000, 0x006A, 0x00D0, 0x012E, 0x0180, 0x01C4, 0x01F6, 0x0215,
	0x0220, 0x0215, 0x01F6, 0x01C4, 0x0180, 0x012E, 0x00D0, 0x006A, 0x0000, 0xFF96, 0xFF30, 0xFED2, 0xFE80, 0xFE3C, 0xFE0A, 0xFDEB,
	0xFDE0, 0xFDEB, 0xFE0A, 0xFE3C, 0xFE80, 0xFED2, 0xFF30, 0xFF96, 0xFDC0, 0xFDCC, 0xFDEC, 0xFE22, 0xFE69, 0xFEC0, 0xFF24, 0xFF90,
	0x0000, 0x0070, 0x00DC, 0x0140, 0x0197, 0x01DE, 0x0214, 0x0234, 0x0240, 0x0234, 0x0214, 0x01DE, 0x0197, 0x0140, 0x00DC, 0x0070,
	0x0000, 0xFF90, 0xFF24, 0xFEC0, 0xFE69, 0xFE22, 0xFDEC, 0xFDCC, 0xFDC0, 0xFDCC, 0xFDEC, 0xFE22, 0xFE69, 0xFEC0, 0xFF24, 0xFF90,
	0xFDA0, 0xFDAC, 0xFDCF, 0xFE07, 0xFE53, 0xFEAF, 0xFF18, 0xFF8A, 0x0000, 0x0076, 0x00E8, 0x0151, 0x01AD, 0x01F9, 0x0231, 0x0254,
	0x0260, 0x0254, 0x0231, 0x01F9, 0x01AD, 0x0151, 0x00E8, 0x0076, 0x0000, 0xFF8A, 0xFF18, 0xFEAF, 0xFE53, 0xFE07, 0xFDCF, 0xFDAC,
	0xFDA0, 0xFDAC, 0xFDCF, 0xFE07, 0xFE53, 0xFEAF, 0xFF18, 0xFF8A, 0xFD80, 0xFD8D, 0xFDB1, 0xFDEC, 0xFE3C, 0xFE9D, 0xFF0C, 0xFF84,
	0x0000, 0x007C, 0x00F4, 0x0163, 0x01C4, 0x0214, 0x024F, 0x0273, 0x0280, 0x0273, 0x024F, 0x0214, 0x01C4, 0x0163, 0x00F4, 0x007C,
	0x0000, 0xFF84, 0xFF0C, 0xFE9D, 0xFE3C, 0xFDEC, 0xFDB1, 0xFD8D, 0xFD80, 0xFD8D, 0xFDB1, 0xFDEC, 0xFE3C, 0xFE9D, 0xFF0C, 0xFF84,
	0xFD60, 0xFD6D, 0xFD94, 0xFDD2, 0xFE25, 0xFE8B, 0xFEFF, 0xFF7D, 0x0000, 0x0083, 0x0101, 0x0175, 0x01DB, 0x022E, 0x026C, 0x0293,
	0x02A0, 0x0293, 0x026C, 0x022E, 0x01DB, 0x0175, 0x0101, 0x0083, 0x0000, 0xFF7D, 0xFEFF, 0xFE8B, 0xFE25, 0xFDD2, 0xFD94, 0xFD6D,
	0xFD60, 0xFD6D, 0xFD94, 0xFDD2, 0xFE25, 0xFE8B, 0xFEFF, 0xFF7D, 0xFD40, 0xFD4E, 0xFD76, 0xFDB7, 0xFE0F, 0xFE79, 0xFEF3, 0xFF77,
	0x0000, 0x0089, 0x010D, 0x0187, 0x01F1, 0x0249, 0x028A, 0x02B2, 0x02C0, 0x02B2, 0x028A, 0x0249, 0x01F1, 0x0187, 0x010D, 0x0089,
	0x0000, 0xFF77, 0xFEF3, 0xFE79, 0xFE0F, 0xFDB7, 0xFD76, 0xFD4E, 0xFD40, 0xFD4E, 0xFD76, 0xFDB7, 0xFE0F, 0xFE79, 0xFEF3, 0xFF77,
	0xFD20, 0xFD2F, 0xFD59, 0xFD9D, 0xFDF8, 0xFE68, 0xFEE7, 0xFF71, 0x0000, 0x008F, 0x0119, 0x0198, 0x0208, 0x0263, 0x02A7, 0x02D1,
	0x02E0, 0x02D1, 0x02A7, 0x0263, 0x0208, 0x0198, 0x0119, 0x008F, 0x0000, 0xFF71, 0xFEE7, 0xFE68, 0xFDF8, 0xFD9D, 0xFD59, 0xFD2F,
	0xFD20, 0xFD2F, 0xFD59, 0xFD9D, 0xFDF8, 0xFE68, 0xFEE7, 0xFF71, 0xFD00, 0xFD0F, 0xFD3B, 0xFD82, 0xFDE1, 0xFE56, 0xFEDB, 0xFF6B,
	0x0000, 0x0095, 0x0125, 0x01AA, 0x021F, 0x027E, 0x02C5, 0x02F1, 0x0300, 0x02F1, 0x02C5, 0x027E, 0x021F, 0x01AA, 0x0125, 0x0095,
	0x0000, 0xFF6B, 0xFEDB, 0xFE56, 0xFDE1, 0xFD82, 0xFD3B, 0xFD0F, 0xFD00, 0xFD0F, 0xFD3B, 0xFD82, 0xFDE1, 0xFE56, 0xFEDB, 0xFF6B,
];
//	.define TMP_SPEED $20

//	.rept 24
//		; Calculate 8 sin/cos values per line at increments of 11.25 degrees
//		.dwsin 090 7 11.25 (-TMP_SPEED) 0 ; $00 <- angle
//		.dwcos 090 7 11.25 (-TMP_SPEED) 0 ; $08
//		.dwsin 270 7 11.25 (-TMP_SPEED) 0 ; $10
//		.dwcos 270 7 11.25 (-TMP_SPEED) 0 ; $18
//		.dwsin 090 7 11.25 (-TMP_SPEED) 0

//		.redefine TMP_SPEED TMP_SPEED+$20
//	.endr

//	.undefine TMP_SPEED

//;;
//; Calculates the game-transfer secret's text?
//generateGameTransferSecret:
//	ld hl,wFileIsLinkedGame
//	ldi a,(hl)
//	ld b,(hl)
//	ld c,a
//	push bc

//	; When generating a game-transfer secret: if this file is either linked or
//	; a hero's file, mark the secret as a "hero's secret"; otherwise, it's just
//	; linked? (so basically, only the secret from the first game is marked as
//	; linked...)
//	or b
//	ldd (hl),a
//	xor $01
//	or b
//	ld (hl),a

//	ldbc $00,$00
//	call secretFunctionCaller_body

//	pop bc
//	ld hl,wFileIsLinkedGame
//	ld (hl),c
//	inc l
//	ld (hl),b
//	ret

//;;
//; Calls a secret-related function based on parameter 'b':
//;
//; 0: Generate a secret
//; 1: Unpack a secret in ascii form (input and output are both in wTmpcec0)
//; 2: Verify that the gameID of an unpacked secret is valid
//; 3: Generate a gameID for the current file
//; 4: Loads the data associated with an unpacked secret (ie. for game-transfer secret, this
//;    loads the player name, animal companion, etc. from the secret data).
//;
//; @param	b	Function to call
//; @param	c	Secret type
//; @param[out]	zflag	Generally set on success
//secretFunctionCaller_body:
//	push de
//	ld a,($ff00+R_SVBK)
//	push af
//	ld a,TEXT_BANK
//	ld ($ff00+R_SVBK),a

//	call @jumpTable

//	pop af
//	ld ($ff00+R_SVBK),a
//	pop de
//	ret

//@jumpTable:
//	ld a,b
//	rst_jumpTable
//	.dw generateSecret
//	.dw unpackSecret
//	.dw verifyUnpackedSecretGameID
//	.dw generateGameIDIfNeeded
//	.dw loadUnpackedSecretData


//;;
//; Generates a secret. If this is one of the 5-letter secrets, then wShortSecretIndex
//; should be set to the corresponding secret's index (?) before calling this.
//;
//; @param	c	Value for wSecretType
//generateSecret:
//	ld hl,w7SecretText1
//	ld b,$40
//	call clearMemory

//	call andCWith3
//	call generateGameIDIfNeeded

//	call @determineXorCipher
//	ld hl,wSecretXorCipherIndex
//	ldi (hl),a
//	ld (hl),c ; hl = wSecretType

//	ld a,$04 ; Encode the gameID
//	call encodeSecretData
//	; Encode everything else (c is unmodified from before)
//	call encodeSecretData_paramC

//	; Calculate checksum (4 bits) and insert it at the end
//	ld b,$04
//	xor a
//	call insertBitsIntoSecretGenerationBuffer
//	call getSecretBufferChecksum
//	ld hl,w7SecretGenerationBuffer+19
//	or (hl)
//	ld (hl),a

//	call shiftSecretBufferContentsToFront
//	call runXorCipherOnSecretBuffer
//	jp convertSecretBufferToText

//;;
//; Decides which xor cipher to use based on GameID (and, for 5-letter secrets, based on
//; which secret it is).
//;
//; @param	c
//; @param[out]	a	Which xor cipher to use (from 0-7)
//@determineXorCipher:
//	push bc
//	ld hl,wGameID
//	ldi a,(hl)
//	add (hl)
//	ld b,a
//	ld a,c
//	cp $03
//	ld a,b
//	jr nz,@ret

//	ld l,<wShortSecretIndex
//	ld a,(hl)
//	swap a
//	and $0f
//	add b
//	ld b,a
//	ld a,(hl)
//	and $01
//	rlca
//	rlca
//	xor b
//@ret:
//	and $07
//	pop bc
//	ret

//;;
//; @param	c	Secret type to encode (0-4)
//encodeSecretData_paramC:
//	ld a,c

//;;
//; Encodes data into a secret by shifting in the required bits.
//;
//; @param	a	Secret type to encode (0-4)
//encodeSecretData:
//	push bc
//	ld hl,secretDataToEncodeTable
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld h,(hl)
//	ld l,a

//	ldi a,(hl)
//	ld c,a
//--
//	ldi a,(hl)
//	ld e,a
//	ldi a,(hl)
//	ld b,a
//	ld d,>wc600Block
//	ld a,(de)
//	call insertBitsIntoSecretGenerationBuffer
//	dec c
//	jr nz,--
//	pop bc
//	ret

//;;
//; Encodes the given bits into w7SecretGenerationBuffer.
//;
//; It works by shifting each individual bit in, starting from the end of the buffer. If
//; anything overflows it will be lost.
//;
//; @param	a	Byte to encode
//; @param	b	Number of bits to encode
//insertBitsIntoSecretGenerationBuffer:
//	push hl
//	push bc
//	ld c,a
//---
//	ld hl,w7SecretGenerationBuffer+19
//	ld e,20
//	srl c
//--
//	ld a,(hl)
//	rla
//	ldd (hl),a
//	rla
//	rla
//	dec e
//	jr nz,--
//	dec b
//	jr nz,---

//	; Iterate through all characters to remove anything in the upper 2 bits
//	ld hl,w7SecretGenerationBuffer
//	ldde $3f,20
//--
//	ld a,(hl)
//	and d
//	ldi (hl),a
//	dec e
//	jr nz,--

//	pop bc
//	pop hl
//	ret

//;;
//; Unpacks a secret's data to wTmpcec0. (each entry in "secretDataToEncodeTable" gets
//; a separate byte in the output.)
//;
//; Input (the secret in ascii) and output (the unpacked data) are both in wTmpcec0.
//;
//; @param	c	Secret type
//; @param[out]	b	$00 if secret was valid, $01 otherwise
//unpackSecret:
//	ld hl,w7SecretText1
//	ld b,$40
//	call clearMemory
//	call andCWith3
//	call loadSecretBufferFromText
//	jr c,@fail

//	call runXorCipherOnSecretBuffer

//	; Retrieve checksum in 'e', then remove the checksum bits from the secret buffer
//	call getNumCharactersForSecretType
//	ld hl,w7SecretGenerationBuffer-1
//	rst_addAToHl
//	ld a,(hl)
//	and $0f
//	ld e,a
//	xor (hl)
//	ld (hl),a

//	call getSecretBufferChecksum
//	cp e
//	jr nz,@fail

//	call @unpackSecretData

//	; Check the value of "wSecretType" stored in the secret, make sure it's correct
//	ld a,(wTmpcec0+1)
//	cp c
//	jr nz,@fail

//	ld b,$00
//	ret
//@fail:
//	ld b,$01
//	ret

//;;
//@unpackSecretData:
//	ld de,wTmpcec0
//	ld a,$04 ; Unpack gameID, etc
//	call @unpack

//	ld a,c ; Unpack the meat of the data

//;;
//; @param	a	Secret type
//; @param	de	Address to write the extracted data to
//@unpack:
//	ld hl,secretDataToEncodeTable
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld h,(hl)
//	ld l,a

//	ldi a,(hl)
//	ld b,a
//@@nextEntry:
//	inc hl
//	ldi a,(hl)
//	call @readBits
//	ld (de),a
//	inc de
//	dec b
//	jr nz,@@nextEntry
//	ret

//;;
//; @param	a	Number of bits to read from the start of w7SecretGenerationBuffer
//; @param[out]	a	The value of the bits retrieved
//@readBits:
//	push bc
//	push de
//	push hl
//	ld b,a
//	ld c,a
//	ld d,$00
//---
//	; Rotate the entire buffer left one bit
//	ld hl,w7SecretGenerationBuffer+19
//	ld e,20
//--
//	rl (hl)
//	ld a,(hl)
//	rla
//	rla
//	dec hl
//	dec e
//	jr nz,--

//	rr d ; Rotate leftmost bit into d
//	dec b
//	jr nz,---

//	; Result is now in the upper bits of 'd'. We still need to shift it into the lower
//	; bits.
//	ld a,$08
//	sub c
//	ld b,a
//	ld a,d
//	jr z,@@end
//--
//	rrca
//	dec b
//	jr nz,--
//@@end:
//	pop hl
//	pop de
//	pop bc
//	ret

//;;
//; Loads the data associated with an unpacked secret (ie. for game-transfer secrets, copies
//; over player name, animal companion, game type, etc.)
//;
//loadUnpackedSecretData:
//	call andCWith3
//	rst_jumpTable
//	.dw @type0
//	.dw @type1
//	.dw @type2
//	.dw @type3

//@type0: ; Game-transfer secret
//@type1:
//	ld hl,secretDataToEncodeTable@entry0
//	ldi a,(hl)
//	ld b,a
//	ld de,wTmpcec0+4 ; Start from +4 to skip the "header"
//--
//	ld a,(de)
//	push de
//	ld e,(hl)
//	ld d,>wc600Block
//	ld (de),a
//	pop de
//	inc de
//	inc hl
//	inc hl
//	dec b
//	jr nz,--

//	; Copy the secret's game ID
//	ld hl,wGameID
//	ld a,(wTmpcec0+2)
//	ldi (hl),a
//	ld a,(wTmpcec0+3)
//	ld (hl),a

//@type3: ; 5-letter secret
//	ret

//@type2: ; Ring secret
//	ld hl,secretDataToEncodeTable@entry2+1
//	ld b,$08
//	ld de,wTmpcec0+4 ; Start from +4 to skip the "header"
//--
//	ldi a,(hl)
//	push hl
//	ld l,a
//	ld h,>wc600Block
//	ld a,(de)
//	or (hl)
//	ld (hl),a
//	pop hl
//	inc de
//	inc hl
//	dec b
//	jr nz,--
//	ret

//;;
//verifyUnpackedSecretGameID:
//	; Get the gameID of an unpacked secret
//	ld hl,wTmpcec0+2
//	ldi a,(hl)
//	ld d,(hl)
//	ld e,a

//	; If the GameID is zero, accept the secret.
//	; This means that any secret encoded with GameID 0 works on EVERY file, regardless
//	; of that file's game ID. Was this intentional?
//	or d
//	jr z,@success

//	; If nonzero, check that it matches this game's gameID
//	ld hl,wGameID
//	ldi a,(hl)
//	cp e
//	jr nz,@fail
//	ldi a,(hl)
//	cp d
//	jr z,@success
//@fail:
//	ld b,$01
//	ret
//@success:
//	ld b,$00
//	ret

//;;
//; Generates a gameID if one hasn't been calculated yet.
//generateGameIDIfNeeded:
//	ld hl,wGameID
//	ldi a,(hl)
//	or (hl)
//	ret nz

//	; Base the ID on wPlaytimeCounter (which should be pseudo-random).
//	ld l,<wPlaytimeCounter+1
//	ldd a,(hl)
//	and $7f
//	ld b,a
//	ld a,(hl)
//	jr nz,+
//--
//	; The GameID can't be 0, so read from R_DIV until we get a nonzero value.
//	or a
//	jr nz,+
//	ld a,($ff00+R_DIV)
//	jr --
//+
//	ld l,<wGameID
//	ldi (hl),a
//	ld (hl),b
//	ret

//;;
//; Copies the data from w7SecretGenerationBuffer to w7SecretText1. The former consists of
//; "raw bytes", while the latter is ascii.
//;
//convertSecretBufferToText:
//	ld a,c
//	ld hl,@secretSpacingData
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld b,(hl)
//	ld c,a
//	ld de,w7SecretGenerationBuffer
//	ld hl,w7SecretText1
//@nextGroup:
//	ld a,(bc)
//	and $0f
//	ret z

//	push bc
//	ld b,a
//@nextSymbol:
//	ld a,(de)
//	push hl
//	ld hl,secretSymbols
//	rst_addAToHl
//	ld a,(hl)
//	pop hl
//	ldi (hl),a
//	inc de
//	dec b
//	jr nz,@nextSymbol

//	pop bc
//	ld a,(bc)
//	and $f0
//	ldi (hl),a
//	inc bc
//	jr @nextGroup


//; For each secret type, this data tells the above function how to format it (in groups of
//; X characters followed by a gap character).
//@secretSpacingData:
//	.dw @entry0
//	.dw @entry1
//	.dw @entry2
//	.dw @entry3

//; Upper digit: character to print after the X characters are copied
//; Lower digit: number of characters to copy (0 to stop)

//@entry0:
//@entry1:
//	.db $25 $05 $25 $05 $00
//@entry2:
//	.db $25 $05 $25 $00
//@entry3:
//	.db $05 $00


//;;
//; Loads w7SecretGenerationBuffer based on a secret in ASCII format.
//;
//; @param	wTmpcec0	Buffer with the secret in text format
//; @param[out]	cflag		Set if there's a problem with the secret (invalid char)
//loadSecretBufferFromText:
//	call getNumCharactersForSecretType
//	ld hl,wTmpcec0
//	ld de,w7SecretGenerationBuffer
//--
//	ldi a,(hl)
//	call @textCharacterToByte
//	ret c
//	ld (de),a
//	inc de
//	dec b
//	jr nz,--
//	ret

//;;
//; @param	a	Ascii symbol
//; @param[out]	a	Byte corresponding to value
//; @param[out]	cflag	Set if there's no byte corresponding to it
//@textCharacterToByte:
//	push hl
//	push bc
//	ld hl,secretSymbols
//	ldbc $40,$00
//--
//	cp (hl)
//	jr z,@end
//	inc hl
//	inc c
//	dec b
//	jr nz,--
//	scf
//@end:
//	ld a,c
//	pop bc
//	pop hl
//	ret

//;;
//; This xors all bytes in w7SecretGenerationBuffer with the corresponding cipher
//; (determined by the first 3 bits in the secret buffer).
//;
//runXorCipherOnSecretBuffer:
//	call getNumCharactersForSecretType

//	; Determine cipher ID from the first 3 bits of the secret (corresponds to
//	; wSecretXorCipherIndex)
//	ld a,(w7SecretGenerationBuffer)
//	and $38
//	rrca
//	ld de,secretXorCipher
//	call addAToDe

//	ld hl,w7SecretGenerationBuffer
//	ld a,(de)

//	; For the first byte only, don't xor the upper bits so that the cipher ID remains
//	; intact.
//	and $07
//--
//	xor (hl)
//	ldi (hl),a
//	inc de
//	ld a,(de)
//	dec b
//	jr nz,--
//	ret

//;;
//; @param[out]	a	The last 4 bits of the sum of all bytes in w7SecretGenerationBuffer
//getSecretBufferChecksum:
//	ld hl,w7SecretGenerationBuffer
//	ld b,20
//	xor a
//--
//	add (hl)
//	inc hl
//	dec b
//	jr nz,--
//	and $0f
//	ret

//;;
//; For smaller secrets (length < 20), this shifts the contents of the secret to the front
//; of the buffer.
//;
//; @param	c	Secret type
//shiftSecretBufferContentsToFront:
//	call getNumCharactersForSecretType
//	ld a,20
//	sub b
//	ret z

//	ld de,w7SecretGenerationBuffer
//	ld h,d
//	ld l,e
//	rst_addAToHl
//--
//	ldi a,(hl)
//	ld (de),a
//	inc de
//	dec b
//	jr nz,--
//	ret

//;;
//andCWith3:
//	ld a,c
//	and $03
//	ld c,a
//	ret


//; This lists the data that a particular secret type must encode.
//secretDataToEncodeTable:
//	.dw @entry0
//	.dw @entry1
//	.dw @entry2
//	.dw @entry3
//	.dw @header

//; Data format:
//;   b0: the byte to encode (somewhere in the $c6XX region)
//;   b1: the number of bits from that byte to encode

//@header: ; Prefixed to every secret type
//	.db $04
//	.db <wSecretXorCipherIndex	$03
//	.db <wSecretType		$02
//	.db <wGameID			$08
//	.db <wGameID+1			$07

//	; Totals to 20 bits

//@entry0: ; "Game transfer" secret
//@entry1:
//	.db $11                     ; Bit number:
//	.db <wFileIsHeroGame	$01 ; 20
//	.db <wWhichGame		$01 ; 21
//	.db <wLinkName		$08 ; 22
//	.db <wKidName		$08 ; 30
//	.db <wLinkName+1	$08 ; 38
//	.db <wKidName+1		$08 ; 46
//	.db <wChildStatus	$06 ; 54
//	.db <wLinkName+2	$08 ; 60
//	.db <wKidName+2		$08 ; 68
//	.db <wObtainedRingBox	$01 ; 76
//	.db <wLinkName+3	$08 ; 77
//	.db <wAnimalCompanion	$04 ; 85
//	.db <wLinkName+4	$08 ; 89
//	.db <wKidName+3		$08 ; 97
//	.db <wFileIsLinkedGame	$01 ; 105
//	.db <wKidName+4		$08 ; 106
//	.db <wLinkName+5	$02 ; 114 (This is always 00)

//	; Totals to 96 bits
//	; (plus 20 from header, plus 4 for checksum = 120 bits = 20 6-bit characters)

//@entry2: ; Ring secret
//	.db $09
//	.db <wRingsObtained+1 $08
//	.db <wRingsObtained+5 $08
//	.db <wRingsObtained+7 $08
//	.db <wRingsObtained+3 $08
//	.db <wRingsObtained+0 $08
//	.db <wRingsObtained+4 $08
//	.db <wRingsObtained+2 $08
//	.db <wRingsObtained+6 $08
//	.db <wLinkName+5 $02 ; This is always 0

//	; Totals to 66 bits

//@entry3: ; Normal secret
//	.db $01
//	.db <wShortSecretIndex $06

//;;
//; @param	c	Secret type
//; @param[out]	a,b	Number of characters in secret
//getNumCharactersForSecretType:
//	ld a,c
//	ld hl,@lengths
//	rst_addAToHl
//	ld a,(hl)
//	ld b,a
//	ret

//@lengths:
//	.db 20 20 15 5

//; The xor cipher works by starting at position [wSecretXorCipherIndex]*4 in this dataset
//; and subsequently xoring every byte in the secret with the proceeding values.
//; (The bits corresponding to the cipher index in the secret are not xored, though, so that
//; it can be deciphered properly.)
//secretXorCipher:

//.ifdef REGION_JP
//	.db $31 $09 $29 $3b $18 $3c $17 $33
//	.db $35 $01 $0b $0a $30 $21 $2d $25
//	.db $20 $3a $2f $1e $39 $19 $2a $06
//	.db $04 $15 $23 $2e $32 $28 $13 $34
//	.db $10 $0d $3f $1a $37 $0f $3e $36
//	.db $38 $02 $16 $3d $2c $0e $1b $12

//	; TODO: what is this? Is the cipher in the japanese version just unnecessarily longer?
//	.db $63 $65 $67 $30 $68 $71 $31 $6b
//	.db $75 $77 $6e $ae $32 $6f $6d $61
//	.db $72 $7f $7d $6c $62 $64 $86 $78
//	.db $33 $7b $6a $9c $66 $7a $8b $83
//	.db $69 $79 $84 $85 $7c $88 $74 $73
//	.db $35 $36 $37 $8c $ad $82 $81 $87
//	.db $70 $7e $60 $8d $a0 $89 $38 $9b
//	.db $a5 $80 $ac $39 $34 $aa $97 $a1
//.else
//	.db $15 $23 $2e $04 $0d $3f $1a $10
//	.db $3a $2f $1e $20 $0f $3e $36 $37
//	.db $09 $29 $3b $31 $02 $16 $3d $38
//	.db $28 $13 $34 $32 $01 $0b $0a $35
//	.db $0e $1b $12 $2c $21 $2d $25 $30
//	.db $19 $2a $06 $39 $3c $17 $33 $18
//.endif

//.ends

//;;
//; Used for CUTSCENE_FLAMES_FLICKERING and CUTSCENE_TWINROVA_SACRIFICE.
//twinrovaCutsceneCaller:
//	ld a,c
//	rst_jumpTable
//	.dw cutscene18_body
//	.dw cutscene19_body

//;;
//incCutsceneState:
//	ld hl,wCutsceneState
//	inc (hl)
//	ret

//;;
//; Unused
//unused_incTmpcbb3:
//	ld hl,wTmpcbb3
//	inc (hl)
//	ret

//;;
//decTmpcbb4:
//	ld hl,wTmpcbb4
//	dec (hl)
//	ret

//;;
//setScreenShakeCounterTo255:
//	ld a,$ff
//	jp setScreenShakeCounter

//;;
//; State 0: screen fadeout
//twinrovaCutscene_state0:
//	ld a,$04
//	call fadeoutToWhiteWithDelay
//	ld hl,wTmpcbb3
//	ld b,$10
//	call clearMemory
//	jr incCutsceneState

//;;
//; State 1: fading out, then initialize fadein to zelda sacrifice room
//twinrovaCutscene_state1:
//	ld a,(wPaletteThread_mode)
//	or a
//	ret nz

//	call incCutsceneState

//	ld a,<ROOM_ZELDA_IN_FINAL_DUNGEON ; Room with zelda and torches
//	ld (wActiveRoom),a
//	call twinrovaCutscene_fadeinToRoom

//	call refreshObjectGfx

//	ld hl,w1Link.yh
//	ld (hl),$38
//	inc l
//	inc l
//	ld (hl),$78

//	call resetCamera

//	ld hl,objectData.objectData4022
//	call parseGivenObjectData

//	ld a,PALH_ac
//	call loadPaletteHeader

//	ld a,$01
//	ld (wScrollMode),a

//	call loadCommonGraphics

//	ld a,$04
//	call fadeinFromWhiteWithDelay
//	ld a,$02
//	jp loadGfxRegisterStateIndex

//;;
//twinrovaCutscene_fadeinToRoom:
//	call disableLcd
//	call clearScreenVariablesAndWRAMBank1
//	call loadScreenMusicAndSetRoomPack
//	call loadTilesetData
//	call loadTilesetGraphics
//	jp func_131f

//;;
//; CUTSCENE_FLAMES_FLICKERING
//cutscene18_body:
//	ld a,(wCutsceneState)
//	rst_jumpTable
//	.dw twinrovaCutscene_state0
//	.dw twinrovaCutscene_state1
//	.dw twinrovaCutscene_state2
//	.dw twinrovaCutscene_state3
//	.dw cutscene18_state4
//	.dw cutscene18_state5

//;;
//; State 2: waiting for fadein to finish
//twinrovaCutscene_state2:
//	ld a,(wPaletteThread_mode)
//	or a
//	ret nz
//	ld a,$01
//	ld (wTmpcbb4),a
//	jp incCutsceneState

//;;
//; State 3: initializes stuff for state 4
//twinrovaCutscene_state3:
//	call decTmpcbb4
//	ret nz

//	ld (hl),180 ; Wait in state 4 for 180 frames

//	call twinrovaCutscene_deleteAllInteractionsExceptFlames
//	call twinrovaCutscene_loadAngryFlames
//	ld a,SND_OPENING
//	call playSound
//	jp incCutsceneState

//;;
//; State 4: screen shaking, flames flickering with zelda on pedestal
//cutscene18_state4:
//	call setScreenShakeCounterTo255
//	ld a,(wFrameCounter)
//	and $3f
//	jr nz,+
//	ld a,SND_OPENING
//	call playSound
//+
//	call decTmpcbb4
//	ret nz

//	; Fadeout
//	ld a,$04
//	call fadeoutToWhiteWithDelay

//	jp incCutsceneState

//;;
//; State 5: fading out again. When done, it fades in to the next room, and the cutscene's
//; over.
//cutscene18_state5:
//	call setScreenShakeCounterTo255
//	ld a,(wPaletteThread_mode)
//	or a
//	ret nz

//	; Load twinrova fight room, start a fadein, then exit cutscene
//.ifdef ROM_AGES
//	ld a,$f5
//.else
//	ld a,$9e
//.endif
//	ld (wActiveRoom),a
//	call twinrovaCutscene_fadeinToRoom

//	call getFreeEnemySlot
//	ld (hl),ENEMY_TWINROVA
//	ld l,Enemy.var03
//	set 7,(hl)

//	ld hl,w1Link.enabled
//	ld (hl),$03
//	ld l,<w1Link.yh
//	ld (hl),$78
//	inc l
//	inc l
//	ld (hl),$78

//	call resetCamera
//	ld a,CUTSCENE_INGAME
//	ld (wCutsceneIndex),a
//	ld a,$01
//	ld (wScrollMode),a
//	call loadCommonGraphics

//	ld a,$02
//	call fadeinFromWhiteWithDelay
//	ld a,$02
//	jp loadGfxRegisterStateIndex

//;;
//twinrovaCutscene_deleteAllInteractionsExceptFlames:
//	ldhl FIRST_DYNAMIC_INTERACTION_INDEX, Interaction.start
//@next:
//	ld l,Interaction.start
//	ldi a,(hl)
//	or a
//	jr z,+
//	ldi a,(hl)
//	cp INTERAC_TWINROVA_FLAME
//	call z,@delete
//+
//	inc h
//	ld a,h
//	cp $e0
//	jr c,@next
//	ret

//@delete:
//	dec l
//	ld b,$40
//	jp clearMemory

//;;
//; Loads the "angry-looking" version of the flames.
//twinrovaCutscene_loadAngryFlames:
//.ifdef ROM_AGES
//	ld a,PALH_af
//.else
//	ld a,PALH_SEASONS_af
//.endif
//	call loadPaletteHeader
//	ld hl,objectData.objectData402f
//	jp parseGivenObjectData

//;;
//; CUTSCENE_TWINROVA_SACRIFICE
//cutscene19_body:
//	ld a,(wCutsceneState)
//	rst_jumpTable
//	.dw twinrovaCutscene_state0
//	.dw twinrovaCutscene_state1
//	.dw twinrovaCutscene_state2
//	.dw twinrovaCutscene_state3
//	.dw cutscene19_state4
//	.dw cutscene19_state5
//	.dw cutscene19_state6
//	.dw cutscene19_state7
//	.dw cutscene19_state8
//	.dw cutscene19_state9

//;;
//; After fading in to zelda on the pedestal, this shows the "angry flames" and waits for
//; 3 seconds before striking the first flame with lightning.
//cutscene19_state4:
//	call decTmpcbb4
//	ret nz

//	ld (hl),20
//	ld bc,$1878
//cutscene19_strikeFlameWithLightning:
//	call twinrovaCutscene_createLightningStrike
//	jp incCutsceneState

//;;
//; State 5: wait before striking the 2nd flame with lightning.
//cutscene19_state5:
//	call decTmpcbb4
//	ret nz

//	ld (hl),20
//	ld bc,$48a8
//	jr cutscene19_strikeFlameWithLightning

//;;
//; State 6: wait before striking the 3rd flame with lightning.
//cutscene19_state6:
//	call decTmpcbb4
//	ret nz

//	ld (hl),40
//	ld bc,$4848
//	jr cutscene19_strikeFlameWithLightning

//;;
//; State 7: wait before shaking screen around
//cutscene19_state7:
//	call decTmpcbb4
//	ret nz

//	ld (hl),120
//	ld a,SND_BOSS_DEAD
//	call playSound
//	jp incCutsceneState

//;;
//; State 8: shake the screen and repeatedly flash the screen white
//cutscene19_state8:
//	call setScreenShakeCounterTo255
//	ld a,(wFrameCounter)
//	and $07
//	call z,fastFadeinFromWhite
//	call decTmpcbb4
//	ret nz

//	ld a,$04
//	call fadeoutToWhiteWithDelay
//	ld a,SND_FADEOUT
//	call playSound
//	jp incCutsceneState

//;;
//; State 9: wait before fading back to twinrova. Cutscene ends here.
//cutscene19_state9:
//	call setScreenShakeCounterTo255
//	ld a,(wPaletteThread_mode)
//	or a
//	ret nz

//	call clearScreenVariablesAndWRAMBank1
//	ld a,CUTSCENE_INGAME
//	ld (wCutsceneIndex),a
//	ld a,$01
//	ld (wScrollMode),a

//	call getFreeEnemySlot
//	ld (hl),ENEMY_GANON

//	ld a,SNDCTRL_STOPMUSIC
//	jp playSound

//;;
//; @param	bc	Position to strike
//twinrovaCutscene_createLightningStrike:
//	call getFreePartSlot
//	ret nz
//	ld (hl),PART_LIGHTNING
//	inc l
//	inc (hl)
//	ld l,Part.yh
//	ld (hl),b
//	inc l
//	inc l
//	ld (hl),c
//	ret

//;;
//; This function is part of the main loop until the player reaches the file select screen.
void runIntro() {
	if (serialInterruptBehaviour != 0) {
		serialFunc0C8D();
		intro.unnamedCBB3 = (9 << 8) | (intro.unnamedCBB3 & 0xFF);
	} else {
		serialFunc0C85();
		unnamedFFBE = 3;
		serialLinkState = 0;
		if ((keysJustPressed & Pad.start) == 0) {
			return introRunStage();
		}
	}
	// todo: check if this can be 0x80
	if (cast(ubyte)(introInputsEnabled * 2) == 0) {
		introRunStage();
	} else if (introStage != 3) {
		introGotoTitlescreen();
	} else {
		introRunStage();
	}
}

//;;
void introRunStage() {
	switch (introStage) {
		case 0:
			introJapaneseOnlyScreen();
			break;
		case 1:
			introCapcomScreen();
			break;
		case 2:
			introCinematic();
			break;
		case 3:
			introTitlescreen();
			break;
		case 4:
			introRestart();
			break;
		default: assert(0);
	}
}
//; Advance the intro to the next stage (eg. cinematic -> titlescreen)
void introGotoTitlescreen() {
	clearPaletteFadeVariables();
	cutsceneClearObjects();
	introVar = 0;
	cameraY = 0;
	intro.unnamedCBB6 = 0;
	introStage = 3;
	tilesetAnimation = 0xFF;
	introRunStage();
}

void introRestart() {
	introStage = 0;
	introVar = 0;
}

void introGotoNextStage() {
	enableIntroInputs();
	clearDynamicInteractions();
	introStage++;
	introVar = 0;
	clearPaletteFadeVariables();
}

void introIncState() {
	introVar++;
}

//;;
void introJapaneseOnlyScreen() {
	static if (gameRegion == Region.japan) {
		switch (introVar) {
			case 0:
				clearVRAM();
				restartSound();

				loadGFXHeader(GfxH.japaneseIntroScreen);
				loadPaletteHeader(PalH.unnamed00);

				intro.unnamedCBB3 = 60;
				introIncState();
				loadGfxRegisterStateIndex(0);
				break;
			case 1: // Fading in, waiting
				if (--intro.unnamedCBB3 == 0) {
					introIncState();
					fadeoutToWhite();
				}
				break;
			case 2: // Fading out
				if (paletteThreadMode == 0) {
					introGotoNextStage();
				}
				break;
			default: assert(0);
		}
	} else {
		introStage++;
	}
}

void introCapcomScreen() {
	switch (introVar) {
		case 0:
			restartSound();

			clearVRAM();
			loadGFXHeader(GfxH.nintendoCapcomScreen);
			loadPaletteHeader(PalH.unnamed01);

			intro.unnamedCBB3 = 208;

			introIncState();
			fadeinFromWhite();
			loadGFXRegisterStateIndex(0);
			break;
		case 1: // Fading in, waiting
			if (--intro.unnamedCBB3 == 0) {
				introIncState();
				fadeoutToWhite();
			}
			break;
		case 2: // Fading out
			if (paletteThreadMode == 0) {
				introStage = 2;
				introVar = 0;
				intro.cinematicState = 0;
				debug(skipIntro1) intro.cinematicState = 1;
				static if (gameRegion != Region.japan) {
					enableIntroInputs();
				}
			}
			break;
		default: assert(0);
	}
}

void introTitlescreen() {
	void runState() {
		switch (introVar) {
			case 0:
				restartSound();

				//	Stop any irrelevant threads.
				threadStop(1);
				stopTextThread();

				disableLCD();
				loadGFXHeader(GfxH.titleScreen);
				loadPaletteHeader(PalH.unnamed03);

				intro.unnamedCBB3 = 2400;

				introIncState();

				playSound(Mus.titleScreen);

				loadGFXRegisterStateIndex(4);
				break;
			case 1: // State 1: waiting for player to press start
				ubyte a;
				if ((keysJustPressed & Pad.start) == 0) {
					// Check to automatically exit the titlescreen
					if (--intro.unnamedCBB3 != 0) {
						break;
					}
					a = 2;
				} else {
					playSound(Snd.selectItem);
					disableSerialPort();
					a = 3;
				}
				introVar = a;
				playSound(SndCtrl.fastFadeout);
				fadeoutToWhite();
				break;
			case 2: // State 2: fading out to replay intro cinematic
				if (paletteThreadMode == 0) {
					introGotoNextStage();
				}
				break;
			case 3: // State 3: fading out to go to file select
				if (paletteThreadMode == 0) {
					// Initialize file select thread, stop this thread
					threadRestart(1, &fileSelectThreadStart);
					stubThreadStart();
				}
				break;
			default: assert(0);
		}
	}
	ushort _;
	getRandomNumberNoPreserveVars(_);
	runState();
	clearOAM();
	static if (gameVersion == GameVersion.ages) {
		addSpritesFromBankToOAM(0x3F, &titlescreenMakuSeedSprite);
		if ((intro.unnamedCBB3 & 0x20) == 0) {
			addSpritesFromBankToOAM(0x3F, &titlescreenPressStartSprites);
		}
	} else {
		addSpritesToOAM(&titlescreenMakuSeedSprite);
		if ((intro.unnamedCBB3 & 0x20) == 0) {
			addSpritesToOAM(&titlescreenPressStartSprites);
		}
	}
}


static if(gameVersion == GameVersion.seasons) {
	//; In Ages these sprites are located elsewhere
	immutable titlescreenMakuSeedSprite = ObjLoad(
		18,
		[
			Obj(81, 122, 86, 4),
			Obj(80, 130, 116, 4),
			Obj(88, 122, 106, 7),
			Obj(88, 130, 108, 7),
			Obj(88, 138, 110, 7),
			Obj(72, 144, 98, 6),
			Obj(68, 141, 104, 6),
			Obj(84, 138, 84, 3),
			Obj(84, 130, 82, 3),
			Obj(84, 122, 80, 3),
			Obj(64, 133, 102, 6),
			Obj(64, 127, 100, 6),
			Obj(65, 112, 96, 6),
			Obj(84, 118, 90, 6),
			Obj(68, 104, 94, 38),
			Obj(100, 122, 112, 3),
			Obj(100, 130, 114, 3),
			Obj(100, 138, 112, 35),
		]
	);

	immutable titlescreenPressStartSprites = ObjLoad(
		10,
		[
			Obj(128, 44, 56, 0x00),
			Obj(128, 52, 58, 0x00),
			Obj(128, 60, 60, 0x00),
			Obj(128, 68, 62, 0x00),
			Obj(128, 76, 62, 0x00),
			Obj(128, 92, 62, 0x00),
			Obj(128, 100, 64, 0x00),
			Obj(128, 108, 66, 0x00),
			Obj(128, 116, 58, 0x00),
			Obj(128, 124, 64, 0x00),
		]
	);
}

//;;
void runIntroCinematic() {
	switch (intro.cinematicState) {
		case 0:
			switch (introVar) {
				case 0: // State 0: initialization
					disableLCD();
					oam = oam.init;
					static if (gameVersion == GameVersion.ages) {
						gbc.SVBK = 4;
						tileMap = tileMap.init;
						attributeMap = attributeMap.init;
						gbc.SVBK = 1;
						clearOAM();
						oamTail = 4;
						loadGFXHeader(GfxH.introLinkRidingHorse);
						loadPaletteHeader(PalH.unnamed90);

						//	wait for 350 frames
						intro.unnamedCBB3 = 350;

						intro.unnamedCBB8 = 0x20;
						intro.triforceState = 0x10;
						intro.unnamedCBB6 = 0x22;
						intro.unnamedCBBA = 0;
						playSound(Mus.intro1);
						fadeinFromWhiteWithDelay(11);
						lockBG7Colour3ToBlack = 1;

						// Load Link and Bird objects
						parseGivenObjectData(&objectData4037[0]);

						loadGFXRegisterStateIndex(0x17);

						gfxRegs6.lcdc = gfxRegs2.lcdc;
						cameraX = 0;
					} else {
						oamTail = 4;
						loadGFXHeader(GfxH.introLinkRidingHorse);
						loadPaletteHeader(PalH.unnamed90);

						//	wait for 894 frames
						intro.unnamedCBB3 = 894;

						intro.unnamedCBB8 = 0x20;
						intro.triforceState = 0x10;
						intro.unnamedCBB6 =0x22 ;
						intro.unnamedCBBA = 0x01;

						loadGFXRegisterStateIndex(8);

						playSound(Mus.intro1);

						GameObject* obj;
						if (getFreeInteractionSlot(obj)) {
							obj.id = Interaction.introSprite;
							obj.subid = 0;
						}
						fadeinFromWhiteWithDelay(20);
						lockBG7Colour3ToBlack = 1;
					}
					introIncState();
					break;
				case 1:
					static if (gameVersion == GameVersion.ages) { // State 1: fading into the sunset
						introCinematicMoveBlackBarsIn();
						if (--intro.unnamedCBB3 == 0) {
							intro.unnamedCBB3 = 6;
							clearPaletteFadeVariablesAndRefreshPalettes();
							lcdNextInterruptBehaviour = 6;
							introIncState();
						}
					} else { // State 1: screen fading in as Link rides closer
						introCinematicMoveBlackBarsIn();
						if (--intro.unnamedCBB3 == 0) {
							clearPaletteFadeVariablesAndRefreshPalettes();
							loadPaletteHeader(PalH.seasons96);
							loadGfxRegisterStateIndex(0x0C);
							intro.unnamedCBBB = gfxRegs2.SCY;
							intro.unnamedCBBC = gfxRegs2.SCX;
							introCinematicRidingHorseDrawLinkOnHorseCloseupSprites1();
							intro.unnamedCBB3 = 344;
							introIncState();
						}
					}
					break;
				case 2:
					static if (gameVersion == GameVersion.ages) { // State 2: scrolling down to reveal Link on horse
						introCinematicRidingHorseUpdateScrollingGround();
						if (decCBB3()) {
							// Set counter to 6 frames (so screen scrolls down once every 6 frames)
							intro.unnamedCBB3 = 6;

							// Must set CameraY for sprites to scroll correctly
							cameraY = ++gfxRegs2.scy;

							// Go to next state once we scroll this far down
							if (cameraY == 72) {
								intro.unnamedCBB3 = 126;
								introIncState();
							}
						}
					} else {
						//;;
						//; State 2: Image of Link bobbing up and down on horse
						//introCinematic_ridingHorse_state2:
						//	ld hl,wTmpcbb3
						//	call decHlRef16WithCap
						//	jr nz,++

						//	call disableLcd
						//	ld a,PALH_SEASONS_92
						//	call loadPaletteHeader
						//	ld a,GFXH_INTRO_LINK_ON_HORSE_CLOSEUP
						//	call loadGfxHeader
						//	ld a,$0a
						//	call loadGfxRegisterStateIndex
						introIncState();
						//	jr introCinematic_ridingHorse_drawLinkOnHorseCloseupSprites_2
						//++
						//	call seasonsFunc_03_5367

						//	; Fall through

						//;;
						//; Draw the sprites that complement the image of Link on the horse (the 1st image)
						//introCinematic_ridingHorse_drawLinkOnHorseCloseupSprites_1:
						//	ld hl,wGfxRegs2.SCY
						//	ldi a,(hl)
						//	cpl
						//	inc a
						//	ld b,a
						//	ld a,(hl)
						//	cpl
						//	inc a
						//	ld c,a
						//	xor a
						//	ldh (<hOamTail),a
						//	ld hl,linkOnHorseCloseupSprites_1
						//	jp addSpritesToOam_withOffset
					}
					break;
				case 3:
					static if (gameVersion == GameVersion.ages) { // State 3: camera has scrolled all the way down; not doing anything for a bit
						introCinematicRidingHorseUpdateScrollingGround();
						if (decCBB3) {
							//	Initialize stuff for state 4
							intro.unnamedCBB3 = 288;
							loadPaletteHeader(PalH.unnamed96);
							loadUncompressedGfxHeader(UGfxH.ages38);

							intro.unnamedCBBA = 0x18;
							loadGFXRegisterStateIndex(0x18);

							cameraY = 0;
							intro.unnamedCBBC = 0;
							createInteraction(Interaction.introSprite, InteractionSubID75.unnamed03);

							intro.unnamedCBB6 = 13;
							intro.unnamedCBBB = 60;
							lcdNextInterruptBehaviour = 3;
							introIncState();
						}
					} else {
						goto case 7;
					}
					break;
				case 4:
					static if (gameVersion == GameVersion.ages) { // State 4: Link riding horse toward camera
						static immutable linkPalettes = [PalH.unnamedA4, PalH.unnamedA5, PalH.unnamedA6];
						{
							addSpritesFromBankToOAM(0x3F, &linkOnHorseFacingCameraSprite);

							// Scroll the top, cloudy layer right every 32 frames
							if ((intro.frameCounter & 0x1F) == 0) {
								gfxRegs1.scx--;
							}
							// Scroll the mountain layer right every 6 frames
							if (--intro.unnamedCBB6 == 0) {
								intro.unnamedCBB6 = 13;
								gfxRegs2.scx--;
							}
							// Change link's palette every 60 frames to gradually get lighter
							if (--intro.unnamedCBBB == 0) {
								intro.unnamedCBBB = 60;
								if (intro.unnamedCBBC != 3) {
									loadPaletteHeader(linkPalettes[intro.unnamedCBBC++]);
								}
							}
						}
						if (--intro.unnamedCBB3 == 0) {
							loadUncompressedGfxHeader(UGfxH.ages36);
							//	; After calling "loadUncompressedGfxHeader", hl points to rom. They almost
							//	; certainly didn't intend to write there. They probably intended for hl to point
							//	; to wTmpcbb3, and set the counter for the next state?
							//	; It makes no difference, though, since the next state doesn't use wTmpcbb3.
							//	ld (hl),90

							loadPaletteHeader(PalH.unnamed9B);
							clearDynamicInteractions();
							clearOAM();
							loadGFXRegisterStateIndex(0x19);
							gfxRegs1.lyc = 0x48;
							gfxRegs1.wy = 0x48;
							introIncState();
						}
					} else {
						goto case 8;
					}
					break;
				case 5:
					static if (gameVersion == GameVersion.ages) { // State 5: closeup of Link's face; face is moving left
						introCinematicMoveBlackBarsOut();
						gfxRegs2.scx += 8;
						if (gfxRegs2.scx >= 96) {
							gfxRegs2.scx = 96;
							introIncState();
							intro.unnamedCBB3 = 24;
							createInteraction(Interaction.introSprite, InteractionSubID75.unnamed04);
						}
					} else {
						goto case 9;
					}
					break;
				case 6:
					static if (gameVersion == GameVersion.ages) { // State 6: closeup of Link's face; screen staying still for a moment
						if (--intro.unnamedCBB3 == 0) {
							disableLCD();
							loadPaletteHeader(PalH.unnamed92);
							loadGFXHeader(GfxH.introLinkOnHorseCloseup);
							clearDynamicInteractions();
							loadGFXRegisterStateIndex(10);
							introIncState();
						}
					} else {
						goto case 10;
					}
					break;
				case 7: // State 7 (3 in seasons): scrolling up on the link+horse shot
					if (--gfxRegs1.scy == 0) {
						intro.unnamedCBB6 = 204;
						introIncState();
					} else { // Draw the sprites that complement the image of Link on the horse (the 2nd image in seasons; the only such image in ages)
						introCinematicRidingHorseDrawLinkOnHorseCloseupSprites2();
					}
					break;
				case 8: // State 8 (4 in seasons): lingering on the link+horse shot
					if (--intro.unnamedCBB6 == 0) {
						loadPaletteHeader(PalH.unnamed93);
						disableLCD();
						clearOAM();
						oamTail = 4;
						loadGFXHeader(GfxH.introOutsideCastle);

						// Screen should be shifted a pixel every 5 frames next state
						intro.unnamedCBBB = 5;

						// Wait for 400 frames in the next state
						intro.unnamedCBB3 = 400;

						// How long to scroll the screen in the next state
						intro.unnamedCBB6 = 180;

						clearPaletteFadeVariablesAndRefreshPalettes();
						loadGFXRegisterStateIndex(11);
						introCinematicRidingHorseDrawTempleSprites();

						// Create 2 interactions of type INTERAC_INTRO_SPRITE with subid's 2 and 1. (These are the horse and cliff sprites.)
						for (ubyte i = 2; i != 0; i--) {
							GameObject* obj;
							if (!getFreeInteractionSlot(obj)) {
								break;
							}
							obj.id = Interaction.introSprite;
							obj.subid = i;
						}
						introIncState();
					} else {
						introCinematicRidingHorseDrawLinkOnHorseCloseupSprites2();
					}
					break;
				case 9: // State 9 (5 in seasons): showing Link on a cliff overlooking the temple
					if (--intro.unnamedCBB3 == 0) {
						fadeoutToWhite();
						introIncState();
						introCinematicRidingHorseDrawTempleSprites();
					} else if (intro.unnamedCBB6 == 0) {
						introCinematicRidingHorseDrawTempleSprites();
					} else {
						intro.unnamedCBB6--;
						 if (gfxRegs1.scx == 0) { // Check if the screen is done moving
							introCinematicRidingHorseDrawTempleSprites();
						} else if (--intro.unnamedCBBB == 0) {
							// Shift screen once every 5 frames
							intro.unnamedCBBB = 5;
							gfxRegs1.scx--;
							introCinematicRidingHorseDrawTempleSprites();
						}
					}
					break;
				case 10: // State 10 (6 in seasons): fading out, then proceed to next cinematic state (temple)
					if (paletteThreadMode == 0) {
						clearDynamicInteractions();
						incIntroCinematicState();
					}
					break;
				default: assert(0);
			}
			break;
		case 1:
			switch (introVar) {
				case 0: // State 0: Load the room
					disableLCD();
					clearOAM();
					oamTail = 4;

					loadGFXHeader(GfxH.introTempleScene);
					loadPaletteHeader(PalH.unnamed91);
					loadGFXRegisterStateIndex(9);
					cameraY = gfxRegs1.scy;

					static if (gameVersion == GameVersion.ages) {
						enum anim = 0x10;
					} else {
						enum anim = 0x18;
					}
					tilesetAnimation = anim;
					loadAnimationData(anim);

					scrollMode = 1;
					setLinkID(SpecialObject.linkCutscene);

					link.enabled = 1;
					link.yh = cast(ubyte)(gfxRegs1.scy + 0x60);
					link.xh = 0x50;

					// Intro input data was moved to another bank in Ages
					static if (gameVersion == GameVersion.ages) {
						enum simInputBank = 0x10;
					} else {
						enum simInputBank = 0x03;
					}
					setSimulatedInputAddress(simInputBank, &templeIntroSimulatedInput[0]);

					// Spawn the 3 pieces of triforce
					ubyte x = 0x30;
					for (ubyte i = 3; i > 0; i--) {
						GameObject* obj;
						if (!getFreeInteractionSlot(obj)) {
							break;
						}
						obj.id = Interaction.introSprites1;
						obj.subid = cast(ubyte)(i - 1);
						obj.yh = 0x19;
						obj.xh = x;
						x += 0x20;
					}
					menuDisabled = 1;
					fadeinFromWhite();
					intro.triforceState = 0;
					introIncState();
					break;
				case 1: // State 1: walking up to triforce
					if (paletteThreadMode == 0) {
						// Check if simulated input is done (bit 7 set)
						if ((useSimulatedInput & 0x80) != 0) {
							useSimulatedInput = 0;
							introCinematicInTempleUpdateCamera();
							introIncState();
						} else {
							introCinematicInTempleUpdateCamera();
						}
					}
					break;
				case 2: // State 2: waiting for cutscene objects to do their thing (nothing to be done here)
					// The "link cutscene object" will write to wIntro.triforceState eventually
					if (intro.triforceState == 3) {
						fadeoutToWhite();
						introIncState();
					}
					break;
				case 3: // State 3: screen fading out temporarily
					if (paletteThreadMode == 0) {
						// Initialize variables needed to make the screen "wavy"
						gfxRegs1.lyc = 1;
						gfxRegs2.lyc = 2;
						lcdNextInterruptBehaviour = 0;
						initWaveScrollValues(0x20);
						fadeinFromWhite();
						introIncState();
						introCinematicInTempleUpdateWave();
					}
					break;
				case 4: // State 4: screen fading back in
					introCinematicInTempleUpdateWave();
					if (paletteThreadMode == 0) {
						intro.unnamedCBB6 = 120;
						introIncState();
					}
					break;
				case 5: // State 5: waving the screen around
					introCinematicInTempleUpdateWave();
					if (--intro.unnamedCBB6 == 0) {
						intro.unnamedCBB6 = 0;
						intro.unnamedCBBA = 0xFF;
						introIncState();
						goto case;
					}
					break;
				case 6: // State 6: this is the instant where Link "falls"?
					introCinematicInTempleUpdateWave();
					if (!flashScreenBody(0, &intro.unnamedCBB6)) {
						clearPaletteFadeVariablesAndRefreshPalettes();
						intro.triforceState = 6;
						playSound(Snd.fairyCutscene);
						introIncState();
					}
					break;
				case 7: // State 7: link is in the process of falling
					introCinematicInTempleUpdateWave();
					if (intro.triforceState == 7) {
						//	; Finished falling; delete Link
						clearLinkObject();
						intro.unnamedCBB6 = func2D48(8);
						introIncState();
					}
					break;
				case 8: // State 8: waiting?
					introCinematicInTempleUpdateWave();
					if (--intro.unnamedCBB6 == 0) {
						intro.unnamedCBB6 = 60;
						introIncState();
					}
					break;
				case 9: // State 9: waiting?
					introCinematicInTempleUpdateWave();
					if (--intro.unnamedCBB6 == 0) {
						playSound(Snd.fadeout);
						fadeoutToWhite();
						introIncState();
					}
					break;
				case 10: // State 10: screen fading out, then moves on to the next cinematic state
					introCinematicInTempleUpdateWave();
					if (paletteThreadMode == 0) {
						clearDynamicInteractions();
						incIntroCinematicState();
					}
					break;
				default: assert(0);
			}
			break;
		case 2:
			switch (introVar) {
				case 0:
					//;;
					//; State 0: load tree graphics
					//introCinematic_preTitlescreen_state0:
					//	call disableLcd

					//	ld a,$ff
					//	ld (wTilesetAnimation),a
					//	ld a,GFXH_TITLESCREEN_TREE_SCROLL
					//	call loadGfxHeader
					//.ifdef ROM_AGES
					//	ld a,PALH_94
					//.else
					//	ld a,PALH_SEASONS_94
					//.endif
					//	call loadPaletteHeader
					//	call refreshObjectGfx
					//	ld a,$0a
					//	call loadGfxRegisterStateIndex

					//	; Create the "tree branches" object
					//	call getFreeInteractionSlot
					//	jr nz,++
					//	ld (hl),INTERAC_INTRO_SPRITES_1
					//	inc l
					//	ld (hl),$08
					//	ld l,Interaction.y
					//	ld a,$60
					//	ldi (hl),a
					//	ldi (hl),a
					//	ld a,$3d
					//	inc l
					//	ldi (hl),a
					//++

					//	; Spawn birds
					//	ld b,$08
					//--
					//	call getFreeInteractionSlot
					//	jr nz,++
					//	ld (hl),INTERAC_INTRO_BIRD
					//	inc l
					//	dec b
					//	ld (hl),b
					//	jr nz,--
					//++
					//	ld a,$03
					//	ld (wTmpcbba),a
					//	ld (wTmpcbb6),a
					//	call fadeinFromWhite
					//	xor a
					//	ldh (<hCameraY),a

					//	ld a,MUS_INTRO_2
					//	call playSound

					//	jp intro_incState
					assert(0, "NYI");
					break;
				case 1:
					//;;
					//; State 1: scrolling up the tree
					//introCinematic_preTitlescreen_state1:
					//	call introCinematic_preTitlescreen_updateScrollingTree
					//	ret nz

					//	; Initialize stuff for state 2.

					//	call intro_incState
					//	ld hl,wTmpcbb3
					//	ld (hl),$02
					//	inc hl
					//	xor a
					//	ld (hl),a

					//	; wTmpcbb6 = counter until the sound effect should be played
					//	ld hl,wTmpcbb6
					//	ld (hl),$10

					//	inc a
					//	ld (wGfxRegs1.LYC),a
					//	inc a
					//	ld (wGfxRegs2.LYC),a
					//	ld a,$01
					//	ldh (<hNextLcdInterruptBehaviour),a

					//	; wBigBuffer will contain separate scrollY values for each line on the screen, in
					//	; order to produce the effect introducing the title.
					//	; Initialize it with normal values for scrollY for now.
					//	ld a,(wGfxRegs1.SCY)
					//	ld b,$90
					//	ld hl,wBigBuffer
					//--
					//	ldi (hl),a
					//	dec b
					//	jr nz,--

					//	ld a,$01

					//	introCinematic_preTitlescreen_updateScrollForTitle()
					assert(0, "NYI");
					break;
				case 2:
					//;;
					//; State 2: game title coming into view
					//introCinematic_preTitlescreen_state2:
					//	; Check whether to play the sound effect
					//	ld hl,wTmpcbb6
					//	ld a,(hl)
					//	or a
					//	jr z,+
					//	dec a
					//	ld (hl),a
					//	ld a,SND_SWORD_OBTAINED
					//	call z,playSound
					//+
					//	; Only update every other frame?
					//	ld a,(wIntro.frameCounter)
					//	and $01
					//	ld hl,wTmpcbb4
					//	ret nz

					//	ld a,(hl)
					//	cp $08
					//	jr nc,@titleDone
					//	inc a
					//	ld (hl),a
					//	ld hl,introCinematic_preTitlescreen_titleSizeData
					//	rst_addAToHl
					//	ld a,(hl)
					//	jp introCinematic_preTitlescreen_updateScrollForTitle

					//@titleDone:
					//	xor a
					//	ld (wTmpcbb6),a
					//	dec a
					//	ld (wTmpcbba),a
					//	jp intro_incState
					assert(0, "NYI");
					break;
				case 3: // State 3: title fully in view; wait a bit, then go to the titlescreen.
					if (!flashScreenBody(1, &intro.unnamedCBB6)) {
						introGotoTitlescreen();
					}
					break;
				default: assert(0);
			}
			break;
		default: assert(0);
	}
}
void introCinematicRidingHorseDrawLinkOnHorseCloseupSprites2() {
	//	; Calculate offset for sprites
	ushort offset = cast(ubyte)-gfxRegs1.scy << 8;
	oamTail = 0;

	static if (gameVersion == GameVersion.ages) {
		addSpritesFromBankToOAMWithOffset(offset, 0x3F, &linkOnHorseCloseupSprites2);

	} else {
		addSpritesToOAMWithOffset(offset, &linkOnHorseCloseupSprites2);
	}
}

//; In the scene overlooking the temple, a few sprites are used to touch up the appearance
//; of the temple, even though it's mostly drawn on the background.
void introCinematicRidingHorseDrawTempleSprites() {
	oamTail = 0;
	ushort offset = cast(ubyte)-gfxRegs1.scx;

	static if (gameVersion == GameVersion.ages) {
		addSpritesFromBankToOAMWithOffset(offset, 0x3F, &introTempleSprites);
	} else {
		addSpritesToOAMWithOffset(offset, &introTempleSprites);
	}
}

//; Decrements the SCX value for the scrolling ground, and recalculates the value of LYC to
//; use for producing the scrolling effect for the ground.
void introCinematicRidingHorseUpdateScrollingGround() {
	ubyte a = cast(ubyte)(168 - gfxRegs2.scy);
	if (a >= 120) {
		a = 199;
	}
	gfxRegs2.lyc = a;
	// SCY should not change at hblank, so copy the value
	gfxRegs6.scy = gfxRegs2.scy;

	// Only decrement SCX every other frame
	if ((intro.frameCounter & 1) == 0) {
		gfxRegs6.scx--;
	}
}

void incIntroCinematicState() {
	intro.cinematicState++;
	introVar = 0;
}

//;;
//; @param[out]	zflag	nz if there's no more scrolling to be done
//introCinematic_preTitlescreen_updateScrollingTree:
//	ld hl,wTmpcbb6
//	dec (hl)
//	ret nz

//	ld a,(wTmpcbba)
//	ld (wTmpcbb6),a
//	ld hl,wGfxRegs1.SCY
//	dec (hl)
//	ld a,(hl)
//	cp $88
//	ret z

//	cp $10
//	jr nz,@label_03_063

//	ld a,UNCMP_GFXH_0d
//	call loadUncompressedGfxHeader
//	ld b,$04
//--
//	call getFreeInteractionSlot
//	jr nz,@ret
//	ld (hl),INTERAC_TITLESCREEN_CLOUDS
//	inc l
//	dec b
//	ld (hl),b
//	jr nz,--
//	jr @ret

//@label_03_063:
//	cp $b0
//	jr nz,@ret
//	ld a,UNCMP_GFXH_2a
//	call loadUncompressedGfxHeader
//@ret:
//	or $01
//	ret

void introCinematicInTempleUpdateWave() {
	frameCounter++;
	loadBigBufferScrollValues(2);
}

//;;
//; This function causes the screen to flash white. Based on parameter 'b', which acts as
//; the "index" if the data to use, this will read through the predefined data to see on
//; what frames it should turn the screen white, and on what frames it should restore the
//; screen to normal.
//;
//; @param	b	Index of "screen flashing" data
//; @param	hl	Counter to use (should start at 0?)
//; @param[out]	zflag	nz if the flashing is complete (all data has been read).
bool flashScreenBody(ubyte index, ubyte* counter) {
	const b = ++(*counter);
	auto data = &screenFlashingData[index][0];
	ubyte count = 0;
	while (true) {
		if ((data[0] & 0x80) != 0) {
			return false;
		}
		if (data[0] >= b) {
			break;
		}
		data++;
		count++;
	}
	// Check if the index has changed from last time?
	if (intro.unnamedCBBA == (count & 1)) {
		return true;
	}
	intro.unnamedCBBA = (count & 1);
	if (intro.unnamedCBBA == 0) {
		clearFadingPalettesBody();
	} else {
		clearPaletteFadeVariablesAndRefreshPalettes();
	}
	return true;
}

// Clears w2FadingBgPalettes, w2FadingSprPalettes (fills contents with $ff), and marks all palettes as needing refresh?
void clearFadingPalettesBody() {
	fadingPalettes[] = 0xFF;
	spritePaletteSources = 0xFF;
	bgPaletteSources = 0xFF;
	dirtySpritePalettes = 0xFF;
	dirtyBGPalettes = 0xFF;
	gbc.SVBK = 0;
}

// Data format:
// Even bytes are the frame numbers on which to turn the screen white; odd bytes
// are when to restore it to normal? $ff signals end of data.
static if (gameVersion == GameVersion.ages) {
	immutable ubyte[][] screenFlashingData = [
		[ 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0xff ], // Used by "raftwreck" cutscene before tokay island (INTERAC_RAFTWRECK_CUTSCENE)
		[ 0x02, 0x04, 0x06, 0x0c, 0x0e, 0xff ],
		[ 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e, 0xff ], // Used by ambi subid $03 (cutscene atop black tower after d7)
		[ 0x01, 0x05, 0x06, 0x0a, 0x0b, 0x0f, 0x11, 0x15, 0x16, 0x1a, 0x1c, 0x20, 0x22, 0x26, 0x28, 0xff ],
		[ 0x03, 0x05, 0x07, 0x0a, 0x0c, 0x10, 0x12, 0x17, 0x19, 0xff ],
		[ 0x01, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0xff ],
	];
} else {
	immutable ubyte[][] screenFlashingData = [
		[ 0x03 ], // ???
		[ 0x02, 0x04, 0x06, 0x08, 0x0c, 0x0e, 0x10, 0xff ],
		[ 0x02, 0x04, 0x06, 0x0c, 0x0e, 0xff ],
		[ 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e, 0xff ],
		[ 0x01, 0x05, 0x06, 0x0a, 0x0b, 0x0f, 0x11, 0x15, 0x16, 0x1a, 0x1c, 0x20, 0x22, 0x26, 0x28, 0xff ],
		[ 0x01, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0xff ],
	];
}

//;;
//; Updates the effect where the title comes into view.
//;
//; @param	a	Number of pixels of the title to show (divided by two)
//introCinematic_preTitlescreen_updateScrollForTitle:
//	ld b,a

//	; Calculate c=$18/b (the amount that the title needs to be shrunk)
//	xor a
//	ld c,a
//--
//	inc c
//	add b
//	cp $18
//	jr z,+
//	ret nc ; Should never return if given a valid parameter
//	jr --
//+
//	; Calculate SCY values for the top half of the title
//	push bc
//	ld a,$38 ; vertical center of title
//	sub b
//	ld h,>wBigBuffer
//	ld l,a
//	xor a
//--
//	push af
//	sub l
//	add $58 ; SCY value that would be needed to draw the title at top of screen
//	ldi (hl),a
//	pop af
//	add c
//	dec b
//	jr nz,--

//	; Calculate SCY values for the bottom half of the title
//	pop bc
//	ld a,$37
//	add b
//	ld l,a
//	ld a,$2f
//--
//	push af
//	sub l
//	add $58 ; SCY value that would be needed to draw the title at top of screen
//	ldd (hl),a
//	pop af
//	sub c
//	dec b
//	jr nz,--
//	ret


//; Each byte is the number of pixels of the title to show on a particular frame, divided by
//; two.
//introCinematic_preTitlescreen_titleSizeData:
//	.db $01 $02 $03 $04 $06 $08 $0c $18

// Updates camera position based on link's Y position.
void introCinematicInTempleUpdateCamera() {
	const tmp = cast(ubyte)(link.yh - gfxRegs1.scy - 0x40);
	if (cast(ubyte)(gfxRegs1.scy + tmp) < 0x70) {
		cameraY = gfxRegs1.scy = cast(ubyte)(gfxRegs1.scy + tmp);
	}
}

//;;
//; Moves the black bars in the intro cinematic in by 2 pixels, until it covers 24 pixels on
//; each end.
void introCinematicMoveBlackBarsIn() {
	gfxRegs1.lyc += 2;
	if (gfxRegs1.lyc >= 23) {
		gfxRegs1.lyc = 23;
	}
	gfxRegs2.wy -= 2;
	if (gfxRegs2.wy < 120) {
		gfxRegs2.wy = 120;
	}
}


static if (gameVersion == GameVersion.ages) {
//;;
//; Moves the black bars out until a certain area in the center of the screen is visible.
//; Used for the closeup of Link's face.
void introCinematicMoveBlackBarsOut() {
	gfxRegs1.lyc -= 2;
	if (gfxRegs1.lyc < 47) {
		gfxRegs1.lyc = 47;
	}
	gfxRegs2.wy += 2;
	if (gfxRegs2.wy >= 96) {
		gfxRegs2.wy = 96;
	}
}

} else {

//;;
//seasonsFunc_03_5367:
//	call @func
//	ld bc,$0506
//	jr nz,+
//	ld bc,$0000
//+
//	ld hl,wTmpcbbb
//	ldi a,(hl)
//	add b
//	ld (wGfxRegs2.SCY),a
//	ld a,(hl)
//	add c
//	ld (wGfxRegs2.SCX),a
//	ret

//;;
//; @param[out]	zflag
//@func:
//	ld a,($cbb6)
//	dec a
//	jr nz,++
//	ld a,($cbba)
//	xor $01
//	ld ($cbba),a
//	ld a,$05
//	jr z,++
//	ld a,$22
//++
//	ld ($cbb6),a
//	ld a,($cbba)
//	or a
//	ret

}


void cutsceneClearObjects() {
	clearDynamicInteractions();
	clearLinkObject();
	refreshObjectGFX();
}


//.ifdef ROM_AGES

//;;
//; @param	bc	ID of interaction to create
void createInteraction(ubyte id, ubyte subid) {
	GameObject* newObject;
	if (!getFreeInteractionSlot(newObject)) {
		return;
	}
	newObject.id = id;
	newObject.subid = subid;
}

//.ifdef REGION_JP

//; TODO: Properly update the label to be here instead of elsewhere
//;data_5951:
//	.db $3c $b4 $3c $50 $78 $b4 $3c $3c
//	.db $3c $70 $78 $78
//.endif


//.else ; ROM_SEASONS


//; In Ages these sprites are located elsewhere

//; Sprites used on the closeup shot of Link on the horse in the intro
//linkOnHorseCloseupSprites_2:
//	.db $26
//	.db $80 $80 $40 $06
//	.db $80 $50 $42 $00
//	.db $80 $58 $44 $00
//	.db $68 $40 $46 $06
//	.db $b8 $3d $20 $02
//	.db $b8 $45 $22 $02
//	.db $b8 $4d $24 $02
//	.db $b8 $55 $26 $02
//	.db $b8 $5d $28 $02
//	.db $90 $28 $2c $02
//	.db $90 $30 $2e $02
//	.db $80 $30 $2a $02
//	.db $20 $78 $48 $05
//	.db $58 $68 $00 $02
//	.db $58 $70 $02 $02
//	.db $68 $68 $04 $02
//	.db $48 $70 $06 $02
//	.db $5a $40 $08 $01
//	.db $5a $48 $0a $01
//	.db $5a $50 $0c $01
//	.db $38 $88 $0e $04
//	.db $30 $78 $10 $04
//	.db $30 $80 $12 $04
//	.db $40 $80 $14 $04
//	.db $50 $76 $16 $04
//	.db $50 $7e $18 $04
//	.db $41 $62 $1a $03
//	.db $80 $28 $1c $02
//	.db $a8 $59 $1e $02
//	.db $98 $20 $30 $02
//	.db $98 $28 $32 $02
//	.db $8c $38 $34 $07
//	.db $a8 $41 $36 $02
//	.db $a8 $49 $38 $02
//	.db $a8 $51 $3a $02
//	.db $90 $40 $3e $07
//	.db $8a $5c $4a $00
//	.db $8a $64 $4c $00

//linkOnHorseCloseupSprites_1:
//	.db $15
//	.db $28 $78 $9c $08
//	.db $20 $58 $80 $08
//	.db $20 $60 $82 $08
//	.db $20 $68 $84 $0a
//	.db $20 $70 $d0 $09
//	.db $20 $70 $86 $0d
//	.db $20 $78 $88 $09
//	.db $20 $80 $8a $09
//	.db $30 $58 $90 $0c
//	.db $30 $80 $9e $09
//	.db $4e $60 $94 $0c
//	.db $58 $68 $96 $0c
//	.db $68 $78 $98 $09
//	.db $60 $80 $9a $0a
//	.db $20 $88 $8c $09
//	.db $20 $90 $8e $09
//	.db $40 $72 $92 $0e
//	.db $42 $62 $a0 $0e
//	.db $70 $30 $b4 $0f
//	.db $70 $38 $b6 $0f
//	.db $78 $68 $b8 $0c

//; Sprites used to touch up the appearance of the temple in the intro (the scene where
//; Link's on a cliff with his horse)
//introTempleSprites:
//	.db $05
//	.db $30 $28 $48 $02
//	.db $30 $30 $4a $02
//	.db $18 $38 $4c $03
//	.db $10 $40 $4e $03
//	.db $18 $48 $50 $03

immutable SimulatedInput[] templeIntroSimulatedInput = [
	SimulatedInput(45, 0),
	SimulatedInput(16, Pad.up),
	SimulatedInput(48, 0),
	SimulatedInput(32, Pad.up),
	SimulatedInput(24, 0),
	SimulatedInput(32, Pad.up),
	SimulatedInput(48, 0),
	SimulatedInput(34, Pad.up),
	SimulatedInput(112, 0),
	SimulatedInput(5, Pad.up),
	SimulatedInput(32, 0),
	SimulatedInput(5, Pad.up),
	SimulatedInput(36, 0),
	SimulatedInput(5, Pad.up),
	SimulatedInput(36, 0),
	SimulatedInput(5, Pad.up),
	SimulatedInput(36, 0),
	SimulatedInput(12, Pad.up),
	SimulatedInput(0xFFFF),
];

//data_5951:
//	.db $3c $b4 $3c $50 $78 $b4 $3c $3c
//	.db $3c $70 $78 $78

//.endif; ROM_SEASONS

//;;
//; Called from endgameCutsceneHandler in bank 0.
//;
//; @param	e
//endgameCutsceneHandler_body:
//	ld hl,wCutsceneState
//	bit 0,(hl)
//	jr nz,+
//	inc (hl)
//	ld hl,wTmpcbb3
//	ld b,$10
//	call clearMemory
//+
//	ld a,e
//	rst_jumpTable
//	.dw endgameCutsceneHandler_09
//	.dw endgameCutsceneHandler_0a
//	.dw endgameCutsceneHandler_0f
//.ifdef ROM_AGES
//	.dw endgameCutsceneHandler_20
//.endif

//;;
//clearFadingPalettes2:
//	; Clear w2FadingBgPalettes and w2FadingSprPalettes
//	ld a,:w2FadingBgPalettes
//	ld ($ff00+R_SVBK),a
//	ld hl,w2FadingBgPalettes
//	ld b,$80
//	call clearMemory

//	xor a
//	ld ($ff00+R_SVBK),a
//	dec a
//	ldh (<hSprPaletteSources),a
//	ldh (<hDirtySprPalettes),a
//	ld a,$fd
//	ldh (<hBgPaletteSources),a
//	ldh (<hDirtyBgPalettes),a
//	ret

static if (gameVersion == GameVersion.ages) {
	//; This code goes right after the cutscene code in bank 3 (shares the same namespace)

	//;;
	//; CUTSCENE_BLACK_TOWER_ESCAPE
	//endgameCutsceneHandler_09:
	//	ld de,wGenericCutscene.cbc1
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw endgameCutsceneHandler_09_stage0
	//	.dw endgameCutsceneHandler_09_stage1


	//endgameCutsceneHandler_09_stage0:
	//	call updateStatusBar
	//	call @runStates
	//	jp updateAllObjects

	//@runStates:
	//	ld de,wGenericCutscene.cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9
	//	.dw @stateA
	//	.dw @stateB
	//	.dw @stateC
	//	.dw @stateD
	//	.dw @stateE
	//	.dw @stateF
	//	.dw @state10
	//	.dw @state11
	//	.dw @state12
	//	.dw @state13
	//	.dw @state14
	//	.dw @state15

	//@state0:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call cutscene_clearCFC0ToCFDF
	//	call incCbc2

	//	; Outside black tower
	//	ld bc,ROOM_AGES_176
	//	call disableLcdAndLoadRoom
	//	call resetCamera

	//	ld a,SNDCTRL_FAST_FADEOUT
	//	call playSound
	//	call clearAllParentItems
	//	call dropLinkHeldItem

	//	ld hl,objectData.objectData_blackTowerEscape_nayruAndRalph
	//	call parseGivenObjectData
	//	ld hl,wGenericCutscene.cbb3
	//	ld (hl),60

	//	ld hl,blackTowerEscapeCutscene_doorBlockReplacement
	//	call cutscene_replaceListOfTiles

	//	call refreshObjectGfx
	//	ld a,$02
	//	call loadGfxRegisterStateIndex
	//	jp fadeinFromWhiteToRoom

	//@state1:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	ld (hl),120
	//	ld l,<wGenericCutscene.cbb6
	//	ld (hl),$10
	//	jp incCbc2

	//@state2:
	//	call decCBB3
	//	jr nz,@updateExplosionSoundsAndScreenShake
	//	ld (hl),60
	//	jp incCbc2

	//@updateExplosionSoundsAndScreenShake:
	//	ld hl,wTmpcbb6
	//	dec (hl)
	//	ret nz
	//	ld (hl),$10
	//	ld a,SND_EXPLOSION
	//	call playSound
	//	ld a,$08
	//	call setScreenShakeCounter
	//	xor a
	//	ret

	//@state3:
	//	call decCBB3
	//	ret nz
	//	ld (hl),30
	//	ld bc,TX_1d0a
	//	call showText
	//	jp incCbc2

	//@state4:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	ld (hl),120
	//	ld l,<wGenericCutscene.cbb6
	//	ld (hl),$10
	//	jp incCbc2

	//@state5:
	//	call decCBB3
	//	jr nz,@explosions

	//	ld (hl),40
	//	call incCbc2

	//	ld hl,w1Link.enabled
	//	ld (hl),$03
	//	ld l,<w1Link.yh
	//	ld (hl),$48
	//	ld l,<w1Link.xh
	//	ld (hl),$50
	//	ld l,<w1Link.direction
	//	ld (hl),DIR_DOWN

	//	ld hl,cutscenesBank10.blackTowerEscape_simulatedInput1
	//	ld a,:cutscenesBank10.blackTowerEscape_simulatedInput1
	//	call setSimulatedInputAddress

	//	ld hl,blackTowerEscapeCutscene_doorOpenReplacement
	//	jp cutscene_replaceListOfTiles

	//@explosions:
	//	call @updateExplosionSoundsAndScreenShake
	//	ret nz
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_EXPLOSION_WITH_DEBRIS
	//	inc l
	//	inc l
	//	inc (hl) ; [var03] = $01
	//	ld a,$01
	//	ld (wTmpcfc0.genericCutscene.cfd0),a
	//	ret

	//@state6:
	//	call decCBB3
	//	jr nz,@explosions
	//	jp incCbc2

	//@state7:
	//	; Wait for signal from an object?
	//	ld a,(wTmpcfc0.genericCutscene.cfd0)
	//	cp $04
	//	ret nz

	//	call incCbc2
	//	xor a
	//	ld (wDisabledObjects),a
	//	ld (wScrollMode),a

	//	ld hl,cutscenesBank10.blackTowerEscape_simulatedInput2
	//	ld a,:cutscenesBank10.blackTowerEscape_simulatedInput2
	//	jp setSimulatedInputAddress

	//@state8:
	//	ld a,(wTmpcfc0.genericCutscene.cfd0)
	//	cp $05
	//	ret nz
	//	call incCbc2
	//	jp fadeoutToWhite

	//@state9:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz

	//	call incCbc2

	//	ld bc,ROOM_AGES_165
	//	call disableLcdAndLoadRoom

	//	call resetCamera
	//	ld a,MUS_DISASTER
	//	call playSound

	//	ld a,$02
	//	call loadGfxRegisterStateIndex

	//	ld hl,objectData.objectData_blackTowerEscape_ambiAndGuards
	//	call parseGivenObjectData

	//	ld hl,wTmpcbb3
	//	ld (hl),30
	//	jp fadeinFromWhiteToRoom

	//@stateA:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz

	//	call incCbc2

	//	ld hl,w1Link.enabled
	//	ld (hl),$03
	//	ld l,<w1Link.yh
	//	ld (hl),$88
	//	ld l,<w1Link.xh
	//	ld (hl),$50
	//	ld l,<w1Link.direction
	//	ld (hl),DIR_UP

	//	ld hl,cutscenesBank10.blackTowerEscape_simulatedInput3
	//	ld a,:cutscenesBank10.blackTowerEscape_simulatedInput3
	//	call setSimulatedInputAddress
	//	xor a
	//	ld (wScrollMode),a
	//	ret

	//@stateB:
	//	ld a,(wTmpcfc0.genericCutscene.cfd0)
	//	cp $06
	//	ret nz
	//	call incCbc2
	//	ld hl,cutscenesBank10.blackTowerEscape_simulatedInput4
	//	ld a,:cutscenesBank10.blackTowerEscape_simulatedInput4
	//	jp setSimulatedInputAddress

	//@stateC:
	//	ld a,(wTmpcfc0.genericCutscene.cfd0)
	//	cp $0a
	//	ret nz
	//	call incCbc2

	//	; TODO: what is this?
	//	ld hl,wTmpcfc0.genericCutscene.cfde
	//	ld (hl),$08
	//	inc l
	//	ld (hl),$00

	//	jp fadeoutToWhite

	//@stateD:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	call cutscene_loadRoomObjectSetAndFadein
	//	xor a
	//	ld (wTmpcfc0.genericCutscene.cfd1),a
	//	ld (wTmpcfc0.genericCutscene.cfdf),a
	//	ld a,$02
	//	jp loadGfxRegisterStateIndex

	//@stateE:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld hl,wTmpcfc0.genericCutscene.cfdf
	//	ld a,(hl)
	//	cp $ff
	//	ret nz
	//	xor a

	//	ldd (hl),a ; wTmpcfc0.genericCutscene.cfdf
	//	inc (hl) ; wTmpcfc0.genericCutscene.cfde
	//	ld a,(hl)
	//	cp $0a
	//	ld a,$0d
	//	jr nz,+
	//	ld a,$0f
	//+
	//	ld hl,wGenericCutscene.cbc2
	//	ld (hl),a
	//	jp fadeoutToWhite

	//@stateF:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz

	//	call incCbc2
	//	call cutscene_loadRoomObjectSetAndFadein

	//	ld hl,w1Link.enabled
	//	ld (hl),$03
	//	ld l,<w1Link.yh
	//	ld (hl),$48
	//	ld l,<w1Link.xh
	//	ld (hl),$60
	//	ld l,<w1Link.direction

	//	ld (hl),DIR_UP
	//	ld a,$0b
	//	ld (wTmpcfc0.genericCutscene.cfd0),a
	//	ld a,$02
	//	jp loadGfxRegisterStateIndex

	//@state10:
	//	call checkIsLinkedGame
	//	jr nz,@@linked

	//	ld a,(wTmpcfc0.genericCutscene.cfd0)
	//	cp $10
	//	ret nz
	//	call incCbc2
	//	jp fadeoutToWhite

	//@@linked:
	//	ld a,(wTmpcfc0.genericCutscene.cfd0)
	//	cp $12
	//	ret nz
	//	ld hl,wGenericCutscene.cbc2
	//	ld (hl),$14
	//	ret

	//@state11:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz

	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),60

	//	ld a,$ff
	//	ld (wTilesetAnimation),a
	//	call disableLcd

	//	ld a,GFXH_LINK_WITH_ORACLE_END_SCENE
	//	call loadGfxHeader
	//	ld a,PALH_9d
	//	call loadPaletteHeader

	//	call cutscene_clearObjects
	//	call cutscene_resetOamWithSomething2
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	jp fadeinFromWhite

	//@state12:
	//	call cutscene_resetOamWithSomething2
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz

	//	call incCbc2
	//	ld hl,wMenuDisabled
	//	ld (hl),$01
	//	ld hl,wTmpcbb3
	//	ld (hl),60

	//	ld bc,TX_1312

	//@showTextDuringTwinrovaCutscene:
	//	ld a,TEXTBOXFLAG_NOCOLORS
	//	ld (wTextboxFlags),a
	//	jp showText

	//@state13:
	//	call cutscene_resetOamWithSomething2
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call cutscene_clearTmpCBB3
	//	ld a,$01
	//	ld (wGenericCutscene.cbc1),a
	//	jp fadeoutToWhite

	//@state14:
	//	ld a,(wTextIsActive)
	//	rlca
	//	ret nc
	//	ld a,(wKeysJustPressed)
	//	or a
	//	ret z
	//	call incCbc2
	//	ld a,$04
	//	jp fadeoutToWhiteWithDelay

	//@state15:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	xor a
	//	ld (wTextIsActive),a
	//	ld a,CUTSCENE_ZELDA_KIDNAPPED
	//	ld (wCutsceneTrigger),a
	//	ret


	//; Twinrova appears just before credits
	//endgameCutsceneHandler_09_stage1:
	//	call @runStates
	//	jp updateAllObjects

	//@runStates:
	//	ld de,wGenericCutscene.cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9

	//@state0:
	//	call cutscene_resetOamWithSomething2
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz

	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),60

	//	call disableLcd
	//	call clearOam
	//	ld a,GFXH_LINK_WITH_ORACLE_AND_TWINROVA_END_SCENE
	//	call loadGfxHeader
	//	ld a,PALH_9e
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex

	//	ld a,MUS_DISASTER
	//	call playSound
	//	jp fadeinFromWhite

	//@state1:
	//	ld a,TEXTBOXFLAG_NOCOLORS
	//	ld (wTextboxFlags),a
	//	ld a,60
	//	ld bc,TX_280b
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call incCbc2
	//	ld a,e
	//	ld (wTmpcbb3),a
	//	jp showText

	//@state2:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc2

	//	ld hl,wTmpcbb5
	//	ld (hl),$d0

	//@loadCertainOamData1:
	//	ld hl,bank16.oamData_4d05
	//	ld e,:bank16.oamData_4d05

	//@loadOamData:
	//	ld b,$30
	//	push de
	//	ld de,wTmpcbb5
	//	ld a,(de)
	//	pop de
	//	ld c,a
	//	jp cutscene_resetOamWithData

	//@state3:
	//	ld hl,wTmpcbb5
	//	inc (hl)
	//	jr nz,@loadCertainOamData1
	//	call clearOam
	//	ld a,UNCMP_GFXH_0a
	//	call loadUncompressedGfxHeader
	//	ld hl,wTmpcbb3
	//	ld (hl),30
	//	jp incCbc2

	//@state4:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb5
	//	ld (hl),$d0

	//@loadCertainOamData2:
	//	ld hl,bank16.oamData_4d9e
	//	ld e,:bank16.oamData_4d9e
	//	jr @loadOamData

	//@state5:
	//	call @loadCertainOamData2
	//	ld hl,wTmpcbb5
	//	dec (hl)
	//	ld a,(hl)
	//	sub $a0
	//	ret nz

	//	ld (wScreenOffsetY),a ; 0
	//	ld (wScreenOffsetX),a

	//	ld a,30
	//	ld (wTmpcbb3),a
	//	ld (wOpenedMenuType),a ; TODO: ???
	//	jp incCbc2

	//@state6:
	//	call @loadCertainOamData2
	//	call decCBB3
	//	ret nz
	//	ld hl,wTmpcbb3
	//	ld (hl),20
	//	ld bc,TX_280c
	//	call endgameCutsceneHandler_09_stage0@showTextDuringTwinrovaCutscene
	//	jp incCbc2

	//@state7:
	//	call @loadCertainOamData2
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	xor a
	//	ld (wOpenedMenuType),a
	//	dec a
	//	ld (wTmpcbba),a
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	jp incCbc2

	//@state8:
	//	call @loadCertainOamData2
	//	ld hl,wTmpcbb3
	//	ld b,$02
	//	call flashScreen
	//	ret z

	//	; Time to load twinrova's face graphics?

	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),30

	//	call disableLcd
	//	call clearOam
	//	xor a
	//	ld ($ff00+R_VBK),a
	//	ld hl,$8000
	//	ld bc,$2000
	//	call clearMemoryBc

	//	xor a
	//	ld ($ff00+R_VBK),a
	//	ld hl,$9c00
	//	ld bc,$0400
	//	call clearMemoryBc

	//	ld a,$01
	//	ld ($ff00+R_VBK),a
	//	ld hl,$9c00
	//	ld bc,$0400
	//	call clearMemoryBc

	//	ld a,GFXH_TWINROVA_CLOSEUP
	//	call loadGfxHeader
	//	ld a,PALH_9c
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	jp clearPaletteFadeVariablesAndRefreshPalettes

	//@state9:
	//	call decCBB3
	//	ret nz
	//	ld a,CUTSCENE_CREDITS
	//	ld (wCutsceneIndex),a
	//	call cutscene_clearTmpCBB3
	//	ld hl,wRoomLayout
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	ld hl,wRoomCollisions
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	ldh (<hCameraY),a
	//	ldh (<hCameraX),a
	//	ld hl,wTmpcbb3
	//	ld (hl),60
	//	ld a,$03
	//	jp fadeoutToBlackWithDelay

	//;;
	//; CUTSCENE_FLAME_OF_DESPAIR
	//endgameCutsceneHandler_20:
	//	call @runStates
	//	jp updateAllObjects

	//@runStates:
	//	ld de,$cbc1
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9
	//	.dw @stateA
	//	.dw @stateB
	//	.dw @stateC
	//	.dw @stateD
	//	.dw @stateE
	//	.dw @stateF
	//	.dw @state10
	//	.dw @state11
	//	.dw @state12
	//	.dw @state13
	//	.dw @state14
	//	.dw @state15
	//	.dw @state16

	//@state0:
	//	ld a,$0b
	//	ld ($cfde),a
	//	call cutscene_loadRoomObjectSetAndFadein
	//	call hideStatusBar
	//	ld a,PALH_ac
	//	call loadPaletteHeader
	//	xor a
	//	ld (wPaletteThread_mode),a
	//	call clearFadingPalettes2
	//	ld hl,wTmpcbb3
	//	ld (hl),$1e
	//	ld a,$13
	//	call loadGfxRegisterStateIndex
	//	ld hl,wGfxRegs1.SCY
	//	ldi a,(hl)
	//	ldh (<hCameraY),a
	//	ld a,(hl)
	//	ldh (<hCameraX),a
	//	ld a,$00
	//	ld (wScrollMode),a
	//	jp incCbc1

	//@state1:
	//	call decCBB3
	//	ret nz
	//	call incCbc1
	//	ld hl,wTmpcbb3
	//	ld (hl),$28
	//	ld a,TEXTBOXFLAG_ALTPALETTE1
	//	ld (wTextboxFlags),a
	//	ld bc,TX_2825
	//	jp showText

	//@state2:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc1
	//	ld a,$20
	//	ld hl,wTmpcbb3
	//	ldi (hl),a
	//	xor a
	//	ld (hl),a
	//	ret

	//@state3:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	ld hl,wTmpcbb3
	//	ld (hl),$20
	//	inc hl
	//	ld a,(hl)
	//	cp $03
	//	jr nc,+
	//	ld b,a
	//	push hl
	//	ld a,SND_LIGHTTORCH
	//	call playSound
	//	pop hl
	//	ld a,b
	//+
	//	inc (hl)
	//	ld hl,@table_5932
	//	rst_addAToHl
	//	ld a,(hl)
	//	or a
	//	ld b,a
	//	jr nz,@func_5920
	//	call fadeinFromBlack
	//	ld a,$01
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld a,MUS_ROOM_OF_RITES
	//	call playSound
	//	jp incCbc1
	//;;
	//; @param	b	values in @table_5932 one at a time
	//@func_5920:
	//	call fastFadeinFromBlack
	//	ld a,b
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	xor a
	//	ld (wDirtyFadeBgPalettes),a
	//	ld (wFadeBgPaletteSources),a
	//	ret
	//@table_5932:
	//	.db $40 $10 $80 $28 $06
	//	.db $00

	//@state4:
	//	ld e,$28
	//	ld bc,TX_2826
	//	call @func_5943
	//	jp cutscene_decCBB3IfNotFadingOut_incState_setCBB3_showText

	//@func_5943:
	//	ld a,TEXTBOXFLAG_DONTCHECKPOSITION
	//	ld (wTextboxFlags),a
	//	ld a,$03
	//	ld (wTextboxPosition),a
	//	ret

	//@state5:
	//	ld e,$28
	//	ld bc,TX_2827
	//@func_5953:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc1
	//	ld hl,wTmpcbb3
	//	ld (hl),e
	//	call @func_5943
	//	jp showText

	//@state6:
	//	ld e,$3c
	//	ld bc,TX_2828
	//	jr @func_5953

	//@state7:
	//	ld e,$b4
	//@func_596d:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc1
	//	ld hl,wTmpcbb3
	//	ld (hl),e
	//	ret

	//@state8:
	//	call @func_5995
	//	call cutscene_rumbleSoundWhenFrameCounterLowerNibbleIs0
	//	call decCBB3
	//	ret nz
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld a,SNDCTRL_MEDIUM_FADEOUT
	//	call playSound
	//	call incCbc1
	//	ld a,$04
	//	jp fadeoutToWhiteWithDelay
	//@func_5995:
	//	ld hl,wGfxRegs1.SCY
	//	ldh a,(<hCameraY)
	//	ldi (hl),a
	//	ldh a,(<hCameraX)
	//	ldi (hl),a
	//	ld hl,@table_59ab
	//	ld de,wGfxRegs1.SCY
	//	call @func_59b3
	//	inc de
	//	jp @func_59b3
	//@table_59ab:
	//	.db $ff $01 $00 $01
	//	.db $00 $00 $ff $00
	//@func_59b3:
	//	push hl
	//	call getRandomNumber
	//	and $07
	//	rst_addAToHl
	//	ld a,(hl)
	//	ld b,a
	//	ld a,(de)
	//	add b
	//	ld (de),a
	//	pop hl
	//	ret

	//@state9:
	//	call @func_5995
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc1
	//	ld a,$0c
	//	ld ($cfde),a
	//	call cutscene_loadRoomObjectSetAndFadein
	//	ld hl,w1Link.enabled
	//	ld (hl),$03
	//	ld l,<w1Link.yh
	//	ld (hl),$48
	//	ld l,<w1Link.xh
	//	ld (hl),$60
	//	ld l,<w1Link.direction
	//	ld (hl),DIR_UP
	//	ld a,$81
	//	ld (wDisabledObjects),a
	//	ld (wMenuDisabled),a
	//	call cutscene_clearCFC0ToCFDF
	//	call showStatusBar
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	ld a,$02
	//	jp loadGfxRegisterStateIndex

	//@stateA:
	//	call updateStatusBar
	//	ld a,($cfd0)
	//	cp $01
	//	ret nz
	//	call incCbc1
	//	ld c,$40
	//	ld a,$29
	//	call giveTreasure
	//	ld a,$08
	//	call setLinkIDOverride
	//	ld l,<w1Link.subid
	//	ld (hl),$0c
	//	ld hl,wTmpcbb3
	//	ld (hl),$5a
	//	ld a,MUS_PRECREDITS
	//	jp playSound

	//@stateB:
	//	call updateStatusBar
	//	call decCBB3
	//	ret nz
	//	call incCbc1
	//	ld hl,wTmpcbb3
	//	ld (hl),$b4
	//	ld bc,$4860
	//	ld a,$ff
	//	jp createEnergySwirlGoingOut

	//@stateC:
	//	call updateStatusBar
	//	call decCBB3
	//	ret nz
	//	call incCbc1
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	jp fadeoutToWhite

	//@stateD:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call incCbc1
	//	call disableLcd
	//	call clearOam
	//	call clearScreenVariablesAndWRAMBank1
	//	call refreshObjectGfx
	//	call hideStatusBar
	//	ld a,$02
	//	ld ($ff00+R_SVBK),a
	//	ld hl,$de90
	//	ld b,$08
	//	ld a,$ff
	//	call fillMemory
	//	xor a
	//	ld ($ff00+R_SVBK),a
	//	ld a,$07
	//	ldh (<hDirtyBgPalettes),a
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_NAYRU
	//	inc l
	//	ld (hl),$12
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_DIN
	//	inc l
	//	ld (hl),$02
	//+
	//	ld a,$02
	//	ld (wOpenedMenuType),a
	//	call func6E9A
	//	ld a,$02
	//	call func_6ed6
	//	ld hl,wTmpcbb3
	//	ld (hl),$1e
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,$10
	//	ldh (<hCameraY),a
	//	xor a
	//	ldh (<hCameraX),a
	//	ld a,$00
	//	ld (wScrollMode),a
	//	ld bc,TX_1d1a
	//	jp showText

	//@stateE:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc1
	//	ld b,$04
	//@func_5ac2:
	//	call fadeinFromWhite
	//	ld a,b
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	xor a
	//	ld (wDirtyFadeBgPalettes),a
	//	ld (wFadeBgPaletteSources),a
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ret

	//@stateF:
	//	ld e,$1e
	//	ld bc,TX_1d1b
	//	jp cutscene_decCBB3IfNotFadingOut_incState_setCBB3_showText

	//@state10:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc1
	//	ld b,$12
	//	jp @func_5ac2

	//@state11:
	//	ld e,$1e
	//	ld bc,TX_1d1c
	//	jp cutscene_decCBB3IfNotFadingOut_incState_setCBB3_showText

	//@state12:
	//	ld e,$3c
	//	jp @func_596d

	//@state13:
	//	call decCBB3
	//	ret nz
	//	call incCbc1
	//	ld hl,wTmpcbb3
	//	ld (hl),$f0
	//	ld a,$ff
	//	ld bc,$4850
	//	jp createEnergySwirlGoingOut

	//@state14:
	//	call decCBB3
	//	ret nz
	//	ld hl,wTmpcbb3
	//	ld (hl),$5a
	//	call fadeoutToWhite
	//	ld a,$fc
	//	ld (wDirtyFadeBgPalettes),a
	//	ld (wFadeBgPaletteSources),a
	//	jp incCbc1

	//@state15:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call incCbc1
	//	call clearDynamicInteractions
	//	call clearParts
	//	call clearOam
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld bc,TX_1d1d
	//	jp showTextNonExitable

	//@state16:
	//	ld a,(wTextIsActive)
	//	rlca
	//	ret nc
	//	call decCBB3
	//	ret nz
	//	call showStatusBar
	//	xor a
	//	ld (wOpenedMenuType),a
	//	dec a
	//	ld (wActiveMusic),a
	//	ld a,SNDCTRL_FAST_FADEOUT
	//	call playSound
	//	ld hl,@warpDest
	//	jp setWarpDestVariables

	//@warpDest:
	//	m_HardcodedWarpA ROOM_AGES_5f4, $0f, $57, $03


	//;;
	//; CUTSCENE_ROOM_OF_RITES_COLLAPSE
	//endgameCutsceneHandler_0f:
	//	ld de,$cbc1
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1

	//@state0:
	//	call updateStatusBar
	//	call @@runSubstates
	//	jp updateAllObjects

	//@@runSubstates:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @@substate0
	//	.dw @@substate1
	//	.dw @@substate2
	//	.dw @@substate3
	//	.dw @@substate4
	//	.dw @@substate5
	//	.dw @@substate6
	//	.dw @@substate7
	//	.dw @@substate8
	//	.dw @@substate9
	//	.dw @@substateA
	//	.dw @@substateB
	//	.dw @@substateC
	//	.dw @@substateD

	//@@substate0:
	//	ld a,$01
	//	ld (de),a
	//	ld hl,wActiveRing
	//	ld (hl),$ff
	//	xor a
	//	ldh (<hActiveObjectType),a
	//	ld de,$d000
	//	ld bc,$f8f0
	//	ld a,$28
	//	call objectCreateExclamationMark
	//	ld a,$28
	//	call objectCreateExclamationMark
	//	ld l,Interaction.yh
	//	ld (hl),$30
	//	inc l
	//	inc l
	//	ld (hl),$78
	//	ld hl,wTmpcbb3
	//	ld (hl),$0a
	//	ret
	//@@substate1:
	//	call decCBB3
	//	ret nz
	//	ld hl,wTmpcbb3
	//	ld (hl),$1e
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	jp incCbc2
	//@@substate2:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$96
	//	jp @@func_5cb0
	//@@substate3:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld bc,TX_3d0e
	//	jp showText
	//@@substate4:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc2
	//	ld a,MUS_DISASTER
	//	call playSound
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	jp @@func_5cb0
	//@@substate5:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	call decCBB3
	//	ret nz
	//	ld hl,wTmpcbb3
	//	ld (hl),$5a
	//	jp incCbc2
	//@@substate6:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld a,SNDCTRL_STOPSFX
	//	jp playSound
	//@@substate7:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld bc,TX_3d0f
	//	jp showText
	//@@substate8:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$68
	//	inc hl
	//	ld (hl),$01
	//	jp @@func_5cb7
	//@@substate9:
	//	ld hl,wTmpcbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld bc,TX_0563
	//	jp showText
	//@@substateA:
	//	ld e,$1e
	//	jp cutscene_incCBC2setCBB3whenCBB3is0
	//@@substateB:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	call @@func_5cb0
	//	ld a,$8c
	//	ld (wTmpcbb3),a
	//	ld a,$ff
	//	ld bc,$4478
	//	jp createEnergySwirlGoingOut
	//@@substateC:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	jp @@func_5cb0
	//@@substateD:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	call decCBB3
	//	ret nz
	//	call incCbc1
	//	inc l
	//	xor a
	//	ld (hl),a
	//	ld a,$03
	//	jp fadeoutToWhiteWithDelay
	//@@func_5cb0:
	//	call getFreePartSlot
	//	ret nz
	//	ld (hl),PART_ROOM_OF_RITES_FALLING_BOULDER
	//	ret
	//@@func_5cb7:
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_MAKU_CONFETTI
	//	ret

	//@state1:
	//	call updateStatusBar
	//	call @@runSubstates
	//	jp updateAllObjects

	//@@runSubstates:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @@substate0
	//	.dw @@substate1
	//	.dw @@substate2
	//	.dw @@substate3
	//	.dw @@substate4
	//	.dw @@substate5
	//	.dw @@substate6
	//	.dw @@substate7
	//	.dw @@substate8
	//	.dw @@substate9
	//	.dw @@substateA
	//@@substate0:
	//	call cutscene_setScreenShakeCounterTo4RumbleAt0
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	ld a,$11
	//	ld ($cfde),a
	//	call cutscene_loadRoomObjectSetAndFadein
	//	ld a,$04
	//	ld b,$02
	//	call cutscene_loadAObjectGfxBTimes_andReload
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld a,SNDCTRL_FAST_FADEOUT
	//	call playSound
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld a,$02
	//	jp loadGfxRegisterStateIndex
	//@@substate1:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call incCbc2
	//	ld a,$3c
	//	ld (wTmpcbb3),a
	//	ld a,$64
	//	ld bc,$4850
	//	jp createEnergySwirlGoingIn
	//@@substate2:
	//	call decCBB3
	//	ret nz
	//	xor a
	//	ld (wTmpcbb3),a
	//	dec a
	//	ld (wTmpcbba),a
	//	jp incCbc2
	//@@substate3:
	//	ld hl,wTmpcbb3
	//	ld b,$01
	//	call flashScreen
	//	ret z
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld a,$01
	//	ld ($cfc0),a
	//	ld a,$03
	//	jp fadeinFromWhiteWithDelay
	//@@substate4:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call refreshObjectGfx
	//	ld a,$04
	//	ld b,$02
	//	call cutscene_loadAObjectGfxBTimes
	//	ld a,MUS_CREDITS_1
	//	call playSound
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	jp incCbc2
	//@@substate5:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$1e
	//	ret
	//@@substate6:
	//	call decCBB3
	//	ret nz
	//	call refreshObjectGfx
	//	ld a,$04
	//	ld b,$02
	//	call cutscene_loadAObjectGfxBTimes
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld hl,$cfc0
	//	ld (hl),$02
	//	jp incCbc2
	//@@substate7:
	//	ld a,($cfc0)
	//	cp $09
	//	ret nz
	//	call incCbc2
	//	ld a,$03
	//	jp fadeoutToWhiteWithDelay
	//@@substate8:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	call disableLcd
	//	call clearScreenVariablesAndWRAMBank1
	//	call hideStatusBar
	//	ld a,GFXH_SCENE_CREDITS_MAKUTREE
	//	call loadGfxHeader
	//	ld a,PALH_c9
	//	call loadPaletteHeader
	//	ld hl,wTmpcbb3
	//	ld (hl),$f0
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	call cutscene_resetOamWithSomething1
	//	ld a,$03
	//	jp fadeinFromWhiteWithDelay
	//@@substate9:
	//	call cutscene_resetOamWithSomething1
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$10
	//	ld a,$03
	//	jp fadeoutToBlackWithDelay
	//@@substateA:
	//	call cutscene_resetOamWithSomething1
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	ld a,CUTSCENE_CREDITS
	//	ld (wCutsceneIndex),a
	//	call cutscene_clearTmpCBB3
	//	ld hl,wRoomLayout
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	ld hl,wRoomCollisions
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	xor a
	//	ldh (<hCameraY),a
	//	ldh (<hCameraX),a
	//	ld hl,wTmpcbb3
	//	ld (hl),$3c
	//	ld a,SNDCTRL_MEDIUM_FADEOUT
	//	jp playSound

	//;;
	//; CUTSCENE_CREDITS
	//endgameCutsceneHandler_0a:
	//	call @runStates
	//	jp func_3539

	//@runStates:
	//	ld de,$cbc1
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//@state0:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @@substate0
	//	.dw @@substate1
	//	.dw @@substate2
	//@@substate0:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call func_60e0
	//	call incCbc2
	//	call clearOam
	//	ld hl,wTmpcbb3
	//	ld (hl),$b4
	//	inc hl
	//	ld (hl),$00
	//	ld hl,wGfxRegs1.LCDC
	//	set 3,(hl)
	//	ld a,MUS_CREDITS_2
	//	jp playSound
	//@@substate1:
	//	ld hl,wTmpcbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),$48
	//	inc hl
	//	ld (hl),$03
	//	ld a,PALH_04
	//	call loadPaletteHeader
	//	ld a,$06
	//	jp fadeinFromBlackWithDelay
	//@@substate2:
	//	ld hl,wTmpcbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	call incCbc1
	//	inc l
	//	ld (hl),a
	//	ld b,$00
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld b,$04
	//+
	//	ld hl,$cfde
	//	ld (hl),b
	//	inc l
	//	ld (hl),$00
	//	jp fadeoutToWhite

	//@state1:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @@substate0
	//	.dw @@substate1
	//	.dw @@substate2
	//	.dw @@substate3
	//	.dw @@substate4
	//@@substate0:
	//	xor a
	//	ldh (<hOamTail),a
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call disableLcd
	//	call incCbc2
	//	call clearDynamicInteractions
	//	call clearOam
	//	ld a,$10
	//	ldh (<hOamTail),a
	//	ld a,($cfde)
	//	ld c,a
	//	call cutscene_clearCFC0ToCFDF
	//	ld a,c
	//	ld ($cfde),a
	//	cp $04
	//	jr nc,+
	//	ld hl,@@table_5f1c
	//	rst_addDoubleIndex
	//	ld b,(hl)
	//	inc hl
	//	ld c,(hl)
	//	ld a,$00
	//	call forceLoadRoom
	//	ld a,($cfde)
	//	ld hl,@@table_5f24
	//	rst_addAToHl
	//	ldi a,(hl)
	//	call loadUncompressedGfxHeader
	//+
	//	ld a,($cfde)
	//	add a
	//	add GFXH_CREDITS_SCENE1
	//	call loadGfxHeader
	//	ld a,PALH_0f
	//	call loadPaletteHeader
	//	ld a,($cfde)
	//	ld b,$ff
	//	or a
	//	jr z,+
	//	cp $07
	//	jr z,+
	//	ld b,$01
	//+
	//	ld c,a
	//	ld a,b
	//	ld (wTilesetAnimation),a
	//	call loadAnimationData
	//	ld a,c
	//	ld hl,@@table_5f28
	//	rst_addAToHl
	//	ldi a,(hl)
	//	call loadPaletteHeader
	//	call reloadObjectGfx
	//	ld a,$01
	//	ld (wScrollMode),a
	//	xor a
	//	ldh (<hCameraX),a
	//	ld hl,$cfde
	//	ld b,(hl)
	//	call cutscene_parseObjectData_andLoadObjectGfx
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	jp fadeinFromWhite

	//@@table_5f1c:
	//	dwbe ROOM_AGES_038
	//	dwbe ROOM_AGES_03a
	//	dwbe ROOM_AGES_04a
	//	dwbe ROOM_AGES_116

	//@@table_5f24:
	//	.db $2d $0f
	//	.db $2d $0f

	//@@table_5f28:
	//	.db $30 $2d
	//	.db $2d $27
	//	.db $ca $ca
	//	.db $ca $ae

	//@@substate1:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld a,($cfdf)
	//	or a
	//	ret z
	//	call incCbc2
	//	ld a,$ff
	//	ld (wTilesetAnimation),a
	//	jp fadeoutToWhite
	//@@substate2:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	call disableLcd
	//	call clearWramBank1
	//	ld a,($cfde)
	//	add a
	//	add GFXH_CREDITS_IMAGE1
	//	call loadGfxHeader
	//	ld hl,wTmpcbb3
	//	ld (hl),$5a
	//	ld a,PALH_a1
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,($cfde)
	//	ld hl,@@table_5f81
	//	rst_addAToHl
	//	ld a,(hl)
	//	ld (wGfxRegs1.SCX),a
	//	ld a,$10
	//	ldh (<hCameraX),a
	//	xor a
	//	ld ($cfdf),a
	//	jp fadeinFromWhite
	//@@table_5f81:
	//	.db $00 $d0 $00 $d0
	//	.db $00 $d0 $00 $d0
	//@@substate3:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_CREDITS_TEXT_HORIZONTAL
	//	inc l
	//	ld a,($cfde)
	//	ldi (hl),a
	//	ld (hl),$00
	//	ret
	//@@substate4:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	xor a
	//	ldh (<hOamTail),a
	//	ld a,($cfdf)
	//	or a
	//	ret z
	//	ld b,$03
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld b,$07
	//+
	//	ld hl,$cfde
	//	ld a,(hl)
	//	cp b
	//	jr nc,@@func_5fc7
	//	inc (hl)
	//	xor a
	//	ld ($cbc2),a
	//	jr ++
	//@@func_5fc7:
	//	call cutscene_clearTmpCBB3
	//	call cutscene_clearCFC0ToCFDF
	//	ld a,$02
	//	ld ($cbc1),a
	//++
	//	jp fadeoutToWhite

	//@state2:
	//	jpab cutscenesBank10.agesFunc_10_70f6

	//@state3:
	//	jpab cutscenesBank10.agesFunc_10_7298

	//;;
	//; Called from disableLcdAndLoadRoom in bank 0.
	//;
	//disableLcdAndLoadRoom_body:
	//	ld a,b
	//	ld (wActiveGroup),a
	//	ld a,c
	//	ld (wActiveRoom),a
	//	call disableLcd
	//	call clearScreenVariablesAndWRAMBank1
	//	ld hl,wLinkInAir
	//	ld b,wcce9-wLinkInAir
	//	call clearMemory
	//	call initializeVramMaps
	//	call loadScreenMusicAndSetRoomPack
	//	call loadTilesetData
	//	call loadTilesetGraphics
	//	call func_131f
	//	ld a,$01
	//	ld (wScrollMode),a
	//	call loadCommonGraphics
	//	call clearOam
	//	ld a,$10
	//	ldh (<hOamTail),a
	//	ret


	//cutscene_parseObjectData_andLoadObjectGfx:
	//	call getEntryFromObjectTable1
	//	call parseGivenObjectData
	//	call refreshObjectGfx
	//	jp cutsceneFunc_6026

	//cutsceneFunc_6026:
	//	ld a,($cfde)
	//	cp $00
	//	jr z,cutscene_load_04_ObjectGfx2Times_andReload
	//	cp $01
	//	jr z,cutscene_load_26_ObjectGfx2Times_andReload
	//	cp $02
	//	jr z,cutscene_load_24_ObjectGfx2Times_andReload
	//	cp $04
	//	jr z,cutscene_load_26_ObjectGfx2Times_andReload
	//	ret

	//cutscene_loadAObjectGfxBTimes:
	//	ld hl,wLoadedObjectGfx
	//cutscene_loadAintoHL_BTimes:
	//	ldi (hl),a
	//	inc a
	//	ld (hl),$01
	//	inc l
	//	dec b
	//	jr nz,cutscene_loadAintoHL_BTimes
	//	ret

	//cutscene_load_24_ObjectGfx2Times_andReload:
	//	ld a,$24
	//	ld b,$02
	//	jr cutscene_loadAObjectGfxBTimes_andReload
	//cutscene_load_26_ObjectGfx2Times_andReload:
	//	ld a,$26
	//	ld b,$02
	//	jr cutscene_loadAObjectGfxBTimes_andReload
	//cutscene_load_04_ObjectGfx2Times_andReload:
	//	ld a,$04
	//	ld b,$02

	//cutscene_loadAObjectGfxBTimes_andReload:
	//	call cutscene_loadAObjectGfxBTimes
	//	jp reloadObjectGfx

	//cutscene_incCBC2setCBB3whenCBB3is0:
	//	call cutscene_decCBB3IfTextNotActive
	//	ret nz
	//	call incCbc2
	//	ld hl,wTmpcbb3
	//	ld (hl),e
	//	ret

	//;;
	//cutscene_decCBB3IfTextNotActive:
	//	ld a,(wTextIsActive)
	//	or a
	//	ret nz
	//	jp decCBB3

	//;;
	//cutscene_decCBB3IfNotFadingOut:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	jp decCBB3


	//cutscene_decCBB3IfNotFadingOut_incState_setCBB3_showText:
	//	call cutscene_decCBB3IfNotFadingOut
	//	ret nz
	//	call incCbc1
	//	ld a,e
	//	ld (wTmpcbb3),a
	//	jp showText

	//;;
	//cutscene_clearTmpCBB3:
	//	ld hl,wTmpcbb3
	//	ld b,$10
	//	jp clearMemory

	//;;
	//cutscene_clearCFC0ToCFDF:
	//	ld b,$20
	//	ld hl,$cfc0
	//	jp clearMemory

	//cutscene_setScreenShakeCounterTo4RumbleAt0:
	//	ld a,$04
	//	call setScreenShakeCounter
	//cutscene_rumbleSoundWhenFrameCounterLowerNibbleIs0:
	//	ld a,(wFrameCounter)
	//	and $0f
	//	ld a,SND_RUMBLE2
	//	jp z,playSound
	//	ret


	//;;
	//cutscene_resetOamWithSomething1:
	//	ld hl,bank16.oamData_4f73
	//	ld e,:bank16.oamData_4f73
	//	ld bc,$3038
	//	jr cutscene_resetOamWithData

	//;;
	//cutscene_resetOamWithSomething2:
	//	ld hl,bank16.oamData_4e37
	//	ld e,:bank16.oamData_4e37
	//	ld bc,$3038

	//;;
	//; @param	bc	Sprite offset
	//; @param	hl	OAM data to load
	//cutscene_resetOamWithData:
	//	xor a
	//	ldh (<hOamTail),a
	//	jp addSpritesFromBankToOam_withOffset

	//;;
	//; @param	hl	List of tiles (see below for example of format)
	//cutscene_replaceListOfTiles:
	//	ld b,(hl)
	//	inc hl
	//@loop:
	//	ld c,(hl)
	//	inc hl
	//	ldi a,(hl)
	//	push bc
	//	push hl
	//	call setTile
	//	pop hl
	//	pop bc
	//	dec b
	//	jr nz,@loop
	//	ret

	//blackTowerEscapeCutscene_doorBlockReplacement:
	//	.db $04     ; # of entries
	//	.db $44 $83 ; Position, New Tile Value
	//	.db $45 $83
	//	.db $54 $83
	//	.db $55 $83

	//blackTowerEscapeCutscene_doorOpenReplacement:
	//	.db $04
	//	.db $44 $df
	//	.db $45 $ed
	//	.db $54 $80
	//	.db $55 $80

	//;;
	//func_60e0:
	//	ld hl,wLinkHealth
	//	ld (hl),$04
	//	ld l,<wInventoryB
	//	ldi a,(hl)
	//	ld b,(hl)
	//	ld hl,wcde3
	//	ldi (hl),a
	//	ld (hl),b
	//	jp disableActiveRing

	//;;
	//func_60f1:
	//	ld hl,wLinkMaxHealth
	//	ldd a,(hl)
	//	ld (hl),a
	//	ld hl,wcde3
	//	ldi a,(hl)
	//	ld b,(hl)
	//	ld hl,wInventoryB
	//	ldi (hl),a
	//	ld (hl),b
	//	jp enableActiveRing

	//	;;
	//	; CUTSCENE_FAIRIES_HIDE
	//	func_03_6103:
	//		ld a,($cfd1)
	//		cp $07
	//		jp z,fairyCutscene_cfd1is07
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//		.dw @state6
	//		.dw @state7
	//		.dw @state8
	//		.dw @state9
	//		.dw @stateA
	//		.dw @stateB
	//	@state0:
	//		ld hl,wTmpcbb3
	//		ld a,(w1Link.yh)
	//		ldi (hl),a
	//		ld a,(w1Link.xh)
	//		ldi (hl),a
	//		ld a,(w1Link.direction)
	//		ld (hl),a
	//		call fadeoutToWhite
	//		jp fairyCutscene_incState
	//	@state1:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,<ROOM_AGES_081
	//	@loadNewFairyRoom:
	//		ld (wActiveRoom),a
	//		call fairyCutscene_incState
	//		xor a
	//		ld ($cfd2),a
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		call initializeVramMaps
	//		call loadScreenMusicAndSetRoomPack
	//		call loadTilesetData
	//		call loadTilesetGraphics
	//		call func_131f
	//		ld a,$01
	//		ld (wScrollMode),a
	//		call refreshObjectGfx
	//		call loadCommonGraphics
	//		ld a,$02
	//		call loadGfxRegisterStateIndex
	//		jp fadeinFromWhite
	//	@state2:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld b,$0c
	//	;;
	//	; @param	b	var03
	//	@spawnForestFairy:
	//		call getFreeInteractionSlot
	//		ret nz
	//		ld (hl),INTERAC_FOREST_FAIRY
	//		ld l,Interaction.var03
	//		ld (hl),b
	//		jp fairyCutscene_incState
	//	@state3:
	//	@state6:
	//	@state9:
	//		ld hl,$cfd2
	//		ld a,(hl)
	//		or a
	//		ret z
	//		ld (hl),$00
	//		call fairyCutscene_incState
	//		jp fadeoutToWhite
	//	@state4:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,<ROOM_AGES_080
	//		jr @loadNewFairyRoom
	//	@state5:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld b,$0d
	//		jr @spawnForestFairy
	//	@state7:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,<ROOM_AGES_091
	//		jr @loadNewFairyRoom
	//	@state8:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld b,$0e
	//		jp @spawnForestFairy
	//	@stateA:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,<ROOM_AGES_082
	//		call @loadNewFairyRoom
	//		ld hl,w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld a,(wTmpcbb3)
	//		ldi (hl),a
	//		inc l
	//		ld a,(wTmpcbb4)
	//		ld (hl),a
	//		ld a,(wTmpcbb5)
	//		ld l,<w1Link.direction
	//		ld (hl),a
	//		ret
	//	@stateB:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		xor a
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		inc a
	//		ld (wCutsceneIndex),a
	//		ld bc,TX_1104
	//		jp showText
			
	//	fairyCutscene_cfd1is07:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld bc,TX_110a
	//		call showText
	//		jp fairyCutscene_incState
	//	@state1:
	//		ld a,(wTextIsActive)
	//		or a
	//		ret nz
	//		call fairyCutscene_incState
	//		ld a,$0c
	//		ld (wTmpcbb6),a
	//		ld a,SND_MYSTERY_SEED
	//		call playSound
	//		jp fastFadeinFromWhite
	//	@state2:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,wTmpcbb6
	//		dec (hl)
	//		ret nz
	//		jr @state1
	//	@state3:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,wTmpcbb6
	//		dec (hl)
	//		ret nz
	//		call fairyCutscene_incState
	//		xor a
	//		ld ($cfd0),a
	//		ld a,SND_MYSTERY_SEED
	//		call playSound
	//		ld a,$08
	//		jp fadeinFromWhiteWithDelay
	//	@state4:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call fairyCutscene_incState
	//		ld bc,TX_110b
	//		jp showText
	//	@state5:
	//		ld a,GLOBALFLAG_WON_FAIRY_HIDING_GAME
	//		call setGlobalFlag
	//		ld a,GLOBALFLAG_FOREST_UNSCRAMBLED
	//		call setGlobalFlag
	//		xor a
	//		ld (wMenuDisabled),a
	//		ld (wDisabledObjects),a
	//		inc a
	//		ld (wCutsceneIndex),a
	//		ret
			
	//	fairyCutscene_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret

	//	;;
	//	; CUTSCENE_BOOTED_FROM_PALACE
	//	func_03_6275:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//	@state0:
	//		call fadeoutToWhite
	//		jr @bootedFromPalace_incState
	//	@state1:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call clearAllParentItems
	//		call dropLinkHeldItem
	//		ld a,>ROOM_AGES_146
	//		ld (wActiveGroup),a
	//		ld a,<ROOM_AGES_146
	//		ld (wActiveRoom),a
	//		call disableLcd
	//		call clearOam
	//		call clearScreenVariablesAndWRAMBank1
	//		call initializeVramMaps
	//		call loadScreenMusicAndSetRoomPack
	//		call loadTilesetData
	//		call loadTilesetGraphics
	//		call func_131f
	//		ld a,$01
	//		ld (wScrollMode),a
	//		call loadCommonGraphics
	//		call initializeRoom
	//		call fadeinFromWhite
	//		ld a,$02
	//		call loadGfxRegisterStateIndex
	//	@bootedFromPalace_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret
	//	@state2:
	//		ld a,$03
	//		ld ($d000),a
	//		ld a,$0f
	//		ld (wLinkForceState),a
	//		jr @bootedFromPalace_incState
	//	@state3:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,($d005)
	//		cp $02
	//		ret nz
	//		ld bc,TX_590a
	//		call showText
	//		jr @bootedFromPalace_incState
	//	@state4:
	//		ld a,(wTextIsActive)
	//		or a
	//		ret nz
	//		ld (wMenuDisabled),a
	//		ld (wDisabledObjects),a
	//		ld (wDisableScreenTransitions),a
	//		ld (wCutsceneIndex),a
	//		ld a,(wActiveMusic2)
	//		ld (wActiveMusic),a
	//		jp playSound

	//	;;
	void miscCutsceneHandler(ubyte scene) {
		switch (scene) {
			case 0:
		//		.dw nayruSingingCutsceneHandler
				assert(0, "NYI");
				break;
			case 1:
		//		.dw makuTreeDisappearingCutsceneHandler
				assert(0, "NYI");
				break;
			case 2:
		//		.dw blackTowerExplanationCutsceneHandler
				assert(0, "NYI");
				break;
			case 3:
		//		.dw nayruWarpToMakuTreeCutsceneHandler
				assert(0, "NYI");
				break;
			case 4:
		//		.dw turnToStoneCutsceneHandler
				assert(0, "NYI");
				break;
			case 5:
		//		.dw twinrovaRevealCutsceneHandler
				assert(0, "NYI");
				break;
			case 6:
				pregameIntroCutsceneHandler();
				break;
			case 7:
		//		.dw blackTowerCompleteCutsceneHandler
				assert(0, "NYI");
				break;
			default: assert(0);
		}
	}

	//	;;
	//	; CUTSCENE_NAYRU_SINGING
	//	nayruSingingCutsceneHandler:
	//		call @runStates
	//		ld hl,wCutsceneState
	//		ld a,(hl)
	//		cp $02
	//		ret z
	//		cp $03
	//		ret z
	//		jp updateAllObjects

	//	@runStates:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//		.dw @state6
	//		.dw @state7
	//		.dw @state8
	//		.dw @state9
	//		.dw @stateA
	//		.dw @stateB
	//		.dw @stateC
	//		.dw @stateD
	//		.dw nayruSingingStateE
	//		.dw nayruSingingStateF
	//		.dw nayruSingingState10
	//		.dw nayruSingingState11
	//	@state0:
	//		ld a,$01
	//		ld (de),a
	//		ld a,SND_CLOSEMENU
	//		jp playSound
	//	@state1:
	//		ld a,$ff
	//		ld (wTilesetAnimation),a
	//		ld a,$08
	//		ld ($cfd0),a
	//		ld hl,wMenuDisabled
	//		ld (hl),$01
	//		ld hl,$d01a
	//		res 7,(hl)
	//		call saveGraphicsOnEnterMenu
	//		ld a,GFXH_NAYRU_SINGING_CUTSCENE
	//		call loadGfxHeader
	//		ld a,PALH_95
	//		call loadPaletteHeader
	//		ld a,$04
	//		call loadGfxRegisterStateIndex
	//		ld hl,wTmpcbb3
	//		ld (hl),$58
	//		inc hl
	//		ld (hl),$02
	//		ld hl,wTmpcbb6
	//		ld (hl),$28
	//		call fastFadeinFromWhite
	//		call cutsceneIncCutsceneState
	//		ld hl,wTmpcbb5
	//		ld (hl),$02
	//	@func_6397:
	//		call clearOam
	//		ld b,$00
	//		ld a,(wGfxRegs1.SCX)
	//		cpl
	//		inc a
	//		ld c,a
	//		ld hl,bank3f.oamData_7249
	//		ld e,:bank3f.oamData_7249
	//		jp addSpritesFromBankToOam_withOffset
	//	@state2:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		jp nz,@func_6397
	//		ret nz
	//		call @func_63db
	//		call @func_6397
	//		ld hl,wTmpcbb3
	//		call decHlRef16WithCap
	//		jr z,+
	//		ldi a,(hl)
	//		ld h,(hl)
	//		ld l,a
	//		ld bc,$00f0
	//		call compareHlToBc
	//		ret nc
	//		ld a,(wKeysJustPressed)
	//		and BTN_A
	//		ret z
	//	+
	//		ld a,SND_CLOSEMENU
	//		call playSound
	//		call cutsceneIncCutsceneState
	//		jp fastFadeoutToWhite
	//	@func_63db:
	//		ld a,(wFrameCounter)
	//		and $07
	//		ret nz
	//		ld hl,wTmpcbb6
	//		ld a,(hl)
	//		or a
	//		ret z
	//		dec (hl)
	//		ld hl,wGfxRegs1.SCX
	//		inc (hl)
	//		ret
	//	@state3:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		jp nz,@func_6397
	//		ret nz
	//		xor a
	//		ld (wTilesetAnimation),a
	//		ld hl,$d01a
	//		set 7,(hl)
	//		ld a,$09
	//		ld ($cfd0),a
	//		call cutsceneIncCutsceneState
	//		ld hl,wTmpcbb3
	//		ld (hl),$aa
	//		jp reloadGraphicsOnExitMenu
	//	@state4:
	//		ld a,($cfd0)
	//		cp $0f
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld hl,$de90
	//		ld bc,paletteData44a8
	//		jp func_13c6
	//	@state5:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,PALH_99
	//		call loadPaletteHeader
	//		ld a,$10
	//		ld ($cfd0),a
	//		jp cutsceneIncCutsceneState
	//	@state6:
	//		ld a,($cfd0)
	//		cp $14
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld hl,wTmpcbb3
	//		ld (hl),$3c
	//		jp fadeoutToWhite
	//	@state7:
	//		call cutscene_decCBB3IfNotFadingOut
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld a,$15
	//		ld ($cfd0),a
	//		ld a,$03
	//		jp fadeinFromWhiteWithDelay
	//	@state8:
	//		ld a,($cfd0)
	//		cp $18
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		xor a
	//		ld ($cfd2),a
	//		call getFreePartSlot
	//		ret nz
	//		ld (hl),PART_LIGHTNING
	//		inc l
	//		inc (hl)
	//		inc l
	//		inc (hl)
	//		ld l,Part.yh
	//		ld (hl),$24
	//		ld l,Part.xh
	//		ld (hl),$28
	//		ret
	//	@state9:
	//		ld a,($cfd2)
	//		or a
	//		ret z
	//		call cutsceneIncCutsceneState
	//		call getThisRoomFlags
	//		set 6,(hl)
	//		ld c,$22
	//		ld a,$d7
	//		jp setTile
	//	@stateA:
	//		ld a,($cfd0)
	//		cp $1d
	//		ret nz
	//		ld hl,wTmpcbb3
	//		ld (hl),$78
	//		jp cutsceneIncCutsceneState
	//	@stateB:
	//		call decCBB3
	//		ret nz
	//		ld (hl),$5a
	//		call cutsceneIncCutsceneState
	//		ld bc,TX_5607
	//		jp showText
	//	@stateC:
	//		call cutscene_decCBB3IfTextNotActive
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		xor a
	//		ld hl,$cfde
	//		ldi (hl),a
	//		ld (hl),a
	//		jp fadeoutToWhite
	//	@stateD:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call cutscene_loadRoomObjectSetAndFadein
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex

	//	;;
	//	cutscene_loadRoomObjectSetAndFadein:
	//		ld hl,wTmpcfc0.genericCutscene.cfde
	//		ld a,(hl)
	//		push af
	//		call cutscene_disableLcdLoadRoomResetCamera
	//		pop af
	//		ld b,a
	//		call getEntryFromObjectTable2
	//		call parseGivenObjectData
	//		call refreshObjectGfx
	//		xor a
	//		ld (wTmpcfc0.genericCutscene.cfd1),a
	//		jp fadeinFromWhite

	//	nayruSingingStateE:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,$cfdf
	//		ld a,(hl)
	//		cp $ff
	//		ret nz
	//		xor a
	//		ldd (hl),a
	//		inc (hl)
	//		ld a,(hl)
	//		cp $03
	//		ld a,$0d
	//		jr nz,+
	//		ld a,$0f
	//	+
	//		ld hl,wCutsceneState
	//		ld (hl),a
	//		jp fadeoutToWhite
			
	//	nayruSingingStateF:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call cutscene_loadRoomObjectSetAndFadein
	//		ld a,PALH_99
	//		call loadPaletteHeader
	//		ld a,$08
	//		call setLinkIDOverride
	//		ld l,<w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.subid
	//		ld (hl),$04
	//		ld a,SNDCTRL_MEDIUM_FADEOUT
	//		call playSound
	//		ld a,MUS_SADNESS
	//		call playSound
	//		xor a
	//		ld (wPaletteThread_parameter),a
	//		ld a,$24
	//		ld b,$02
	//		call cutscene_loadAObjectGfxBTimes
	//		call reloadObjectGfx
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex
			
	//	nayruSingingState10:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,($cfd0)
	//		cp $1e
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld hl,$de90
	//		ld bc,paletteData4a30
	//		jp func_13c6
			
	//	nayruSingingState11:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,PALH_TILESET_LYNNA_CITY
	//		call loadPaletteHeader
	//		ld a,$1f
	//		ld ($cfd0),a
	//		ld a,CUTSCENE_INGAME
	//		ld (wCutsceneIndex),a
	//		ret


	//	;;
	//	; CUTSCENE_MAKU_TREE_DISAPPEARING
	//	makuTreeDisappearingCutsceneHandler:
	//		call @makuTreeDisappearing_body
	//		jp updateAllObjects

	//	@makuTreeDisappearing_body:
	//		ld a,($cfc0)
	//		or a
	//		jr z,@label_03_119
	//		ld a,SND_FADEOUT
	//		call playSound
	//		xor a
	//		ld (wLinkStateParameter),a
	//		ld (wMenuDisabled),a
	//		ld a,GLOBALFLAG_0c
	//		call setGlobalFlag
	//		call getThisRoomFlags
	//		set 0,(hl)
	//		xor a
	//		ld (wUseSimulatedInput),a
	//		inc a
	//		ld (wDisabledObjects),a
	//		ld hl,@warpDest
	//		jp setWarpDestVariables
	//	@label_03_119:
	//		ld a,(wFrameCounter)
	//		and $07
	//		ret nz
	//		ld hl,$cbb7
	//		ld a,(hl)
	//		inc a
	//		and $03
	//		ld (hl),a
	//		ld hl,@paletteHeaders
	//		rst_addAToHl
	//		ld a,(hl)
	//		jp loadPaletteHeader

	//	@warpDest:
	//		m_HardcodedWarpA ROOM_AGES_038, $0c, $45, $83
	//	@paletteHeaders:
	//		.db $9a $c4 $8f $c5


	//	;;
	//	; CUTSCENE_BLACK_TOWER_EXPLANATION
	//	blackTowerExplanationCutsceneHandler:
	//		call @runStates
	//		jp updateAllObjects

	//	@runStates:
	//		ld a,($cbb8)
	//		rst_jumpTable
	//		.dw @cbb8_00
	//		.dw @cbb8_01
	//		.dw @cbb8_02
	//	@cbb8_00:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @@state0
	//		.dw @@state1
	//		.dw @@state2
	//		.dw func_6733
	//	@@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		call clearOam
	//		ld a,($cbb8)
	//		ld hl,@@table_6625
	//		rst_addDoubleIndex
	//		ldi a,(hl)
	//		push hl
	//		call loadGfxHeader
	//		pop hl
	//		ld a,(hl)
	//		call loadGfxHeader
	//		ld a,PALH_c3
	//		call loadPaletteHeader
	//		ld b,$78
	//		ld a,($cbb8)
	//		cp $02
	//		jr z,+
	//		ld b,$3c
	//	+
	//		ld hl,wTmpcbb3
	//		ld (hl),b
	//		or a
	//		ld a,MUS_DISASTER
	//		call z,playSound
	//		call cutsceneIncCutsceneState
	//		xor a
	//		ld (wTmpcbb9),a
	//		call fadeinFromWhite
	//		ld a,$70
	//		ld (wScreenOffsetY),a
	//		ld hl,$cc10
	//		ld b,$08
	//		call clearMemory
	//		ld a,$09
	//		jp loadGfxRegisterStateIndex

	//	@@table_6625:
	//		.db GFXH_BLACK_TOWER_STAGE_1_LAYOUT, GFXH_BLACK_TOWER_BASE
	//		.db GFXH_BLACK_TOWER_STAGE_2_LAYOUT, GFXH_BLACK_TOWER_MIDDLE
	//		.db GFXH_BLACK_TOWER_STAGE_3_LAYOUT, GFXH_BLACK_TOWER_MIDDLE

	//	@@state1:
	//		call func_6ef7
	//		call func_6f44
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call decCBB3
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld bc,TX_1005
	//		ld a,($cbb8)
	//		or a
	//		jr z,+
	//		ld bc,TX_1317
	//	+
	//		ld a,TEXTBOXFLAG_NOCOLORS
	//		ld (wTextboxFlags),a
	//		jp showText

	//	@@state2:
	//		call func_6ef7
	//		call func_6f44
	//		ld a,(wTextIsActive)
	//		or a
	//		ret nz
	//		ld hl,wTmpcbb3
	//		ld (hl),$3c
	//		jp cutsceneIncCutsceneState

	//	@cbb8_01:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @cbb8_00@state0
	//		.dw @cbb8_00@state1
	//		.dw @cbb8_00@state2
	//		.dw @cbb8_02@state1
	//		.dw @cbb8_02@state2
	//		.dw @@state5
	//		.dw @@state6
	//		.dw @@state7

	//	@@state5:
	//		call func_6ef7
	//		call func_6f44
	//		call decCBB3
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		jp fadeoutToWhite

	//	@@state6:
	//		call func_6f44
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call clearDynamicInteractions
	//		ld bc, ROOM_AGES_0ba
	//		call disableLcdAndLoadRoom
	//		call resetCamera
	//		call getFreeInteractionSlot
	//		jr nz,+
	//		ld (hl),INTERAC_REMOTE_MAKU_CUTSCENE
	//		inc l
	//		ld (hl),$00
	//		inc l
	//		ld (hl),$04
	//	+
	//		ld hl,w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld (hl),$65
	//		ld l,<w1Link.xh
	//		ld (hl),$58
	//		ld l,<w1Link.direction
	//		ld (hl),DIR_DOWN
	//		ld a,(wLoadingRoomPack)
	//		ld (wRoomPack),a
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		ld a,PALH_0f
	//		call loadPaletteHeader
	//		call fadeinFromWhiteToRoom
	//		call refreshObjectGfx
	//		call showStatusBar
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex

	//	@@state7:
	//		call updateStatusBar
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,$01
	//		ld (wMenuDisabled),a
	//		ld (wDisabledObjects),a
	//		ld (wCutsceneIndex),a
	//		ret
	//	@cbb8_02:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @cbb8_00@state0
	//		.dw @@state1
	//		.dw @@state2
	//		.dw func_6733

	//	@@state1:
	//		call func_6ef7
	//		call func_6f44
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call decCBB3
	//		ret nz
	//		ld a,$04
	//		ld (wTmpcbbb),a
	//		ld (wTmpcbb6),a
	//		ld a,($cbb8)
	//		ld hl,@@table_6722
	//		rst_addAToHl
	//		ld a,(hl)
	//		ld (wTmpcbb3),a
	//		jp cutsceneIncCutsceneState
	//	@@table_6722:
	//		.db $01 $61 $b1
	//	@@state2:
	//		call func_6ef7
	//		call func_6f26
	//		jp nz,func_6f44
	//		ld (hl),$78
	//		call cutsceneIncCutsceneState

	//	func_6733:
	//		call func_6ef7
	//		call func_6f44
	//		call decCBB3
	//		ret nz
	//		ld a,($cbb8)
	//		rst_jumpTable
	//		.dw @cbb8_00
	//		.dw @cbb8_01
	//		.dw @cbb8_02
	//	@cbb8_00:
	//	@cbb8_01:
	//		ld hl,@warpDest1
	//		call setWarpDestVariables
	//		ld a,($cfd3)
	//		ld (wWarpDestPos),a
	//		ld a,($cfd4)
	//		ld (wcc50),a
	//		ld a,$ff
	//		ld (wActiveMusic),a
	//		ld a,$01
	//		ld ($cfc0),a
	//		ld a,SNDCTRL_MEDIUM_FADEOUT
	//		jp playSound
	//	@cbb8_02:
	//		xor a
	//		ld (wLinkStateParameter),a
	//		ld hl,@warpDest2
	//		jp setWarpDestVariables

	//	@warpDest1:
	//		m_HardcodedWarpA ROOM_AGES_186, $0c, $75, $03

	//	@warpDest2:
	//		m_HardcodedWarpA ROOM_AGES_4f6, $0f, $47, $03


	//	;;
	//	; CUTSCENE_NAYRU_WARP_TO_MAKU_TREE
	//	nayruWarpToMakuTreeCutsceneHandler:
	//		call @runStates
	//		call updateStatusBar
	//		jp updateAllObjects
			
	//	@runStates:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//		.dw @state6
	//		.dw @state7
	//		.dw @state8
	//		.dw @state9
	//		.dw @stateA
	//		.dw @stateB
	//		.dw @stateC
	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call clearDynamicInteractions
	//		ld bc, ROOM_AGES_038
	//		call disableLcdAndLoadRoom
	//		call resetCamera
	//		ld b,$04
	//		call getEntryFromObjectTable2
	//		call parseGivenObjectData
	//		call refreshObjectGfx
	//		ld a,$04
	//		ld b,$02
	//		call cutscene_loadAObjectGfxBTimes
	//		call reloadObjectGfx
	//		ld a,SNDCTRL_FAST_FADEOUT
	//		call playSound
	//		ld a,$02
	//		call loadGfxRegisterStateIndex
	//		ld hl,wTmpcbb3
	//		ld (hl),$3c
	//		ld b,$20
	//		ld hl,$cfc0
	//		call clearMemory
	//		ld a,$01
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		ld a,MUS_MAKU_TREE
	//		call playSound
	//		call incMakuTreeState
	//		jp fadeinFromWhiteToRoom
	//	@state1:
	//		call cutscene_decCBB3whenFadeDone
	//		ret nz
	//		ld (hl),$3c
	//		call cutsceneIncCutsceneState
	//		ld a,$68
	//		ld bc,$5050
	//		jp createEnergySwirlGoingIn
	//	@state2:
	//		call decCBB3
	//		ret nz
	//		xor a
	//		ld (hl),a
	//		dec a
	//		ld (wTmpcbba),a
	//		jp cutsceneIncCutsceneState
	//	@state3:
	//		ld hl,wTmpcbb3
	//		ld b,$02
	//		call flashScreen
	//		ret z
	//		call cutsceneIncCutsceneState
	//		ld hl,wTmpcbb3
	//		ld (hl),$3c
	//		ld a,$01
	//		ld ($cfd0),a
	//		call @func_6838
	//		ld a,$03
	//		jp fadeinFromWhiteWithDelay
	//	@func_6838:
	//		ld a,$00
	//		call setLinkIDOverride
	//		ld l,<w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld (hl),$68
	//		ld l,<w1Link.xh
	//		ld (hl),$50
	//		ld l,<w1Link.direction
	//		ld (hl),DIR_UP
	//		ret
	//	@state4:
	//		call cutscene_decCBB3whenFadeDone
	//		ret nz
	//		jp cutsceneIncCutsceneState
	//	@state5:
	//		ld a,($cfd0)
	//		cp $02
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld a,SNDCTRL_FAST_FADEOUT
	//		call playSound
	//		xor a
	//		ld hl,$cfde
	//		ld (hl),$05
	//		inc l
	//		ld (hl),$00
	//		jp fadeoutToWhite
	//	@state6:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call cutscene_loadRoomObjectSetAndFadein
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex
	//	@state7:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,$cfdf
	//		ld a,(hl)
	//		cp $ff
	//		ret nz
	//		xor a
	//		ldd (hl),a
	//		inc (hl)
	//		ld a,(hl)
	//		cp $07
	//		ld a,$06
	//		jr nz,+
	//		ld a,$08
	//		ld hl,$cfd0
	//		ld (hl),$03
	//	+
	//		ld hl,wCutsceneState
	//		ld (hl),a
	//		jp fadeoutToWhite
	//	@state8:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call cutscene_loadRoomObjectSetAndFadein
	//		call @func_6838
	//		ld a,$01
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		ld a,$04
	//		ld b,$02
	//		call cutscene_loadAObjectGfxBTimes
	//		ld a,$26
	//		ld b,$02
	//		call cutscene_loadAintoHL_BTimes
	//		ld a,$24
	//		ld b,$01
	//		call cutscene_loadAintoHL_BTimes
	//		ld b,l
	//		call checkIsLinkedGame
	//		jr z,+
	//		call getFreeInteractionSlot
	//		jr nz,+
	//		ld (hl),INTERAC_TWINROVA
	//	+
	//		call reloadObjectGfx
	//		ld a,MUS_MAKU_TREE
	//		call playSound
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex
	//	@state9:
	//		ld a,($cfd0)
	//		cp $07
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld a,SNDCTRL_STOPSFX
	//		call playSound
	//		ld bc,TX_2800
	//		call checkIsLinkedGame
	//		jr z,+
	//		ld c,<TX_2802
	//	+
	//		jp showText
	//	@stateA:
	//		ld a,(wTextIsActive)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld hl,wTmpcbb3
	//		ld (hl),$b4
	//		ld a,DIR_RIGHT
	//		ld (w1Link.direction),a
	//		ld ($cbb7),a
	//		jr @func_6955
	//	@stateB:
	//		call decCBB3
	//		jr nz,@func_6948
	//		call checkIsLinkedGame
	//		jr z,@func_692b
	//		ld a,$08
	//		ld ($cfd0),a
	//		jr @incCutsceneState
	//	@func_692b:
	//		call getFreePartSlot
	//		jr nz,+
	//		ld (hl),PART_LIGHTNING
	//		inc l
	//		inc (hl)
	//		inc l
	//		inc (hl)
	//		ld l,Part.yh
	//		ld (hl),$40
	//		ld l,Part.xh
	//		ld (hl),$88
	//	+
	//		call getFreeInteractionSlot
	//		jr nz,@incCutsceneState
	//		ld (hl),INTERAC_CLOAKED_TWINROVA
	//	@incCutsceneState:
	//		jp cutsceneIncCutsceneState
	//	@func_6948:
	//		call cutscene_decCBB6
	//		ret nz
	//		ld l,<wGenericCutscene.cbb7
	//		ld a,(hl)
	//		xor $02
	//		ld (hl),a
	//		call @func_6962
	//	@func_6955:
	//		call getRandomNumber_noPreserveVars
	//		and $03
	//		add a
	//		add a
	//		add $10
	//		ld (wTmpcbb6),a
	//		ret
	//	@func_6962:
	//		ld (w1Link.direction),a
	//		ld a,$08
	//		ld (wLinkForceState),a
	//		ret
	//	@stateC:
	//		ld a,($cfd0)
	//		cp $63
	//		jr z,@func_699a
	//		call checkIsLinkedGame
	//		ret z
	//		ld a,($cfd0)
	//		cp $09
	//		ret nc
	//		ld a,(wFrameCounter)
	//		and $07
	//		ret nz
	//		callab agesInteractionsBank0a.func_0a_7877
	//		ld de,w1Link.yh
	//		call objectGetRelativeAngle
	//		call convertAngleToDirection
	//		ld h,d
	//		ld l,<w1Link.direction
	//		cp (hl)
	//		ret z
	//		jr @func_6962
	//	@func_699a:
	//		xor a
	//		ld (wMenuDisabled),a
	//		ld (wDisabledObjects),a
	//		ld a,(wLoadingRoomPack)
	//		ld (wRoomPack),a
	//		ld a,GLOBALFLAG_SAVED_NAYRU
	//		call setGlobalFlag
	//		call refreshObjectGfx
	//		ld a,CUTSCENE_INGAME
	//		ld (wCutsceneIndex),a
	//		ret

	//	;;
	//	; CUTSCENE_BLACK_TOWER_COMPLETE
	//	blackTowerCompleteCutsceneHandler:
	//		call @runStates
	//		call updateStatusBar
	//		jp updateAllObjects
			
	//	@runStates:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//	@state0:
	//		ld a,$3c
	//		ld (wTmpcbb3),a
	//		jp cutsceneIncCutsceneState
	//	@state1:
	//		call decCBB3
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		ld a,SNDCTRL_FAST_FADEOUT
	//		call playSound
	//		jp fastFadeoutToBlack
	//	@state2:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call hideStatusBar
	//		ld a,($ff00+R_SVBK)
	//		push af
	//		ld a,$02
	//		ld ($ff00+R_SVBK),a
	//		ld hl,$de90
	//		ld b,$30
	//		call clearMemory
	//		pop af
	//		ld ($ff00+R_SVBK),a
	//		callab bank1.checkDisableUnderwaterWaves
	//		xor a
	//		ld (wScrollMode),a
	//		ld (wTilesetFlags),a
	//		ld (wGfxRegs1.LYC),a
	//		ld (wGfxRegs2.SCY),a
	//		ld ($d01a),a
	//		ld a,$10
	//		ld (wScreenOffsetY),a
	//		call checkIsLinkedGame
	//		jr z,@func_6a2b
	//		call cutsceneIncCutsceneState
	//		ld hl,wTmpcbb3
	//		ld (hl),$1e
	//		ret
	//	@func_6a2b:
	//		call clearWramBank1
	//		call clearOam
	//		ld a,$05
	//		ld (wCutsceneState),a
	//		ldbc INTERAC_CLOAKED_TWINROVA $01
	//		jp createInteraction
	//	@state3:
	//		call decCBB3
	//		ret nz
	//		ld a,SND_LIGHTNING
	//		call playSound
	//		xor a
	//		ld hl,wTmpcbb3
	//		ld (hl),a
	//		dec a
	//		ld hl,wTmpcbba
	//		ld (hl),a
	//		jp cutsceneIncCutsceneState
	//	@state4:
	//		ld hl,wTmpcbb3
	//		ld b,$02
	//		call flashScreen
	//		ret z
	//		call cutsceneIncCutsceneState
	//		ld a,$10
	//		ld ($cfde),a
	//		callab cutscene_loadRoomObjectSetAndFadein
	//		call showStatusBar
	//		ld a,MUS_DISASTER
	//		call playSound
	//		ld a,PALH_ac
	//		call loadPaletteHeader
	//		ld a,$02
	//		call loadGfxRegisterStateIndex
	//		xor a
	//		ld (wScrollMode),a
	//		ld a,$28
	//		ld (wGfxRegs2.SCX),a
	//		ldh (<hCameraX),a
	//		ld a,$f0
	//		ld (wGfxRegs2.SCY),a
	//	@state5:
	//		ret


	//	;;
	//	; CUTSCENE_TURN_TO_STONE
	//	turnToStoneCutsceneHandler:
	//		call @runStates
	//		call updateStatusBar
	//		jp updateAllObjects

	//	@runStates:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//		.dw @state6
	//	@state0:
	//		call cutsceneIncCutsceneState
	//		ld b,$20
	//		ld hl,$cfc0
	//		call clearMemory
	//		ld a,$0d
	//		ld hl,$cfde
	//		ldi (hl),a
	//		ld (hl),$00
	//		call showStatusBar
	//		jp fadeoutToWhite
	//	@state1:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call cutscene_loadRoomObjectSetAndFadein
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex
	//	@state2:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,$cfdf
	//		ld a,(hl)
	//		cp $ff
	//		ret nz
	//		xor a
	//		ldd (hl),a
	//		inc (hl)
	//		ld a,(hl)
	//		cp $0f
	//		ld a,$01
	//		jr nz,+
	//		ld a,$03
	//	+
	//		ld hl,wCutsceneState
	//		ld (hl),a
	//		jp fadeoutToWhite
	//	@state3:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call @state1
	//		ld a,$08
	//		ld b,$28
	//		ld hl,hCameraY
	//		ldi (hl),a
	//		inc l
	//		ld (hl),b
	//		ld a,$f8
	//		ld hl,wGfxRegs2.SCY
	//		ldi (hl),a
	//		ld (hl),b
	//		xor a
	//		ld (wScrollMode),a
	//		ld (wScreenOffsetY),a
	//		ld (wScreenOffsetX),a
	//		ret
	//	@state4:
	//		ld a,($cfc0)
	//		cp $03
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		jp fadeoutToWhite
	//	@state5:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call clearDynamicInteractions
	//		ld bc, ROOM_AGES_290
	//		call disableLcdAndLoadRoom
	//		call resetCamera
	//		ld hl,objectData.objectData7798
	//		call parseGivenObjectData
	//		ld hl,w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld (hl),$58
	//		ld l,<w1Link.xh
	//		ld (hl),$50
	//		ld l,<w1Link.direction
	//		ld (hl),DIR_DOWN
	//		call refreshObjectGfx
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		call showStatusBar
	//		ld a,$02
	//		call loadGfxRegisterStateIndex
	//		ld a,(wLoadingRoomPack)
	//		ld (wRoomPack),a
	//		jp fadeinFromWhiteToRoom
	//	@state6:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,$01
	//		ld (wMenuDisabled),a
	//		ld (wDisabledObjects),a
	//		ld (wCutsceneIndex),a
	//		ret

	//	;;
	//	; CUTSCENE_TWINROVA_REVEAL
	//	twinrovaRevealCutsceneHandler:
	//		call @runStates
	//		call updateStatusBar
	//		jp updateAllObjects
			
	//	@runStates:
	//		ld de,wCutsceneState
	//		ld a,(de)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//		.dw @state6
	//		.dw @state7
	//		.dw @state8
	//		.dw @state9
	//	@state0:
	//		call cutsceneIncCutsceneState
	//		ld b,$20
	//		ld hl,$cfc0
	//		call clearMemory
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		ld hl,wTmpcbb3
	//		ld (hl),$3c
	//		ld bc,TX_2810
	//		call checkIsLinkedGame
	//		jr z,+
	//		ld c,<TX_2815
	//	+
	//		ld a,$02
	//		ld ($cfc0),a
	//		jp showText
	//	@state1:
	//		call cutscene_decCBB3IfTextNotActive
	//		ret nz
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//	@func_6bc9:
	//		ld hl,wTmpcbb3
	//		xor a
	//		ld (hl),a
	//		dec a
	//		ld (wTmpcbba),a
	//		jp cutsceneIncCutsceneState
	//	@state2:
	//		ld hl,wTmpcbb3
	//		ld b,$01
	//		call flashScreen
	//		ret z
	//		call checkIsLinkedGame
	//		jr nz,@func_6be8
	//		call func_6fb0
	//		jr ++
	//	@func_6be8:
	//		call func_6f9e
	//	++
	//		ld a,$01
	//		ld (wDisabledObjects),a
	//		call clearDynamicInteractions
	//		ld hl,objectData.objectData77b2
	//		call checkIsLinkedGame
	//		jr nz,+
	//		ld hl,wCutsceneState
	//		ld (hl),$06
	//		ld hl,objectData.objectData77a5
	//	+
	//		call parseGivenObjectData
	//		jp cutsceneIncCutsceneState
	//	@state3:
	//		ld a,($cfc0)
	//		cp $03
	//		ret nz
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		ld a,SND_LIGHTNING
	//		call playSound
	//		jp @func_6bc9
	//	@state4:
	//		ld hl,wTmpcbb3
	//		ld b,$04
	//		call flashScreen
	//		ret z
	//		ld a,$12
	//		ld ($cfde),a
	//		call cutscene_loadRoomObjectSetAndFadein
	//		call showStatusBar
	//		call cutsceneIncCutsceneState
	//		ld a,MUS_ZELDA_SAVED
	//		call playSound
	//		ld a,$02
	//		call loadGfxRegisterStateIndex
	//		jp resetCamera
	//	@state5:
	//		ld hl,$cfdf
	//		ld a,(hl)
	//		cp $ff
	//		ret nz
	//		ld a,SND_LIGHTNING
	//		call playSound
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		jp @func_6bc9
	//	@state6:
	//		ld hl,wTmpcbb3
	//		ld b,$01
	//		call flashScreen
	//		ret z
	//		ld hl,$cfde
	//		inc (hl)
	//		call cutscene_loadRoomObjectSetAndFadein
	//		ld hl,w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld (hl),$68
	//		ld l,<w1Link.xh
	//		ld (hl),$50
	//		ld l,<w1Link.direction
	//		ld (hl),DIR_UP
	//		ld a,$2c
	//		ld b,$03
	//		call cutscene_loadAObjectGfxBTimes
	//		call cutsceneIncCutsceneState
	//		xor a
	//		ld (wPaletteThread_mode),a
	//	.ifndef REGION_JP
	//		ldh (<hVBlankFunctionQueueTail),a
	//	.endif
	//		inc a
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		ld a,(wLoadingRoomPack)
	//		ld (wRoomPack),a
	//		call reloadObjectGfx
	//		ld a,$02
	//		call loadGfxRegisterStateIndex
	//		jp func_6fb0
	//	@state7:
	//		ld a,($cfd0)
	//		cp $09
	//		ret nz
	//		ld a,SNDCTRL_FAST_FADEOUT
	//		call playSound
	//		call fadeoutToBlack
	//		ld a,$ff
	//		ld (wFadeSprPaletteSources),a
	//		ld (wDirtyFadeSprPalettes),a
	//		ld a,$03
	//		ld (wFadeBgPaletteSources),a
	//		ld (wDirtyFadeBgPalettes),a
	//		jp cutsceneIncCutsceneState
	//	@state8:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneIncCutsceneState
	//		call showStatusBar
	//		ld a,GLOBALFLAG_GOT_MAKU_SEED
	//		call setGlobalFlag
	//		ld a,$01
	//		ld (wScrollMode),a
	//		xor a
	//		ld (wScreenShakeCounterY),a
	//		ld (wScreenShakeCounterX),a
	//		ld a,$0f
	//		ld (wGfxRegs1.LYC),a
	//		ld a,$f0
	//		ld (wGfxRegs2.SCY),a
	//		call fadeinFromBlack
	//		ldbc INTERAC_MAKU_TREE $06
	//		call createInteraction
	//		ld bc,$4050
	//		call interactionHSetPosition
	//		ld a,(wActiveMusic2)
	//		ld (wActiveMusic),a
	//		jp playSound
	//	@state9:
	//		ld a,($cfc0)
	//		cp $04
	//		ret nz
	//		call refreshObjectGfx
	//		ld a,CUTSCENE_INGAME
	//		ld (wCutsceneIndex),a
	//		ret


	//	;;
	//	; CUTSCENE_PREGAME_INTRO
	void pregameIntroCutsceneHandler() {
		void state12Common(ubyte e) {
			assert(0, "NYI");
			//	--
			//		call decCBB3
			//		ret nz
			//		call cutsceneIncCutsceneState
			//		ld hl,wTmpcbb3
			//		ld (hl),e
			//		ret
		}
		switch (cutsceneState) {
			case 0:
				if (paletteThreadMode == 0) {
					if (!checkIsLinkedGame()) {
						assert(0, "NYI");
						//cutsceneState = 1;
						//disableLCDAndLoadRoom(Room.zeldaInFinalDungeon);
						//resetCamera();
						//loadPaletteHeader(PalH.unnamedAC);
						//parseGivenObjectData(objectData77b6);
						//playSound(Mus.finalDungeon);

						//		ld hl,wTmpcbb3
						//		ld (hl),$3c
						//		ld a,$13
						//		call loadGfxRegisterStateIndex
						//		ld a,(wGfxRegs2.SCX)
						//		ldh (<hCameraX),a
						//		xor a
						//		ldh (<hCameraY),a
						//		ld a,$00
						//		ld (wScrollMode),a
						//		jp clearFadingPalettes2
					} else {
						cutsceneState = 10;
						goto case 10;
					}
				}
				break;
			case 1:
				state12Common(0x96);
				break;
			case 2:
				state12Common(0x3C);
				break;
			case 3:
				assert(0, "NYI");
				//		call decCBB3
				//		ret nz
				//		call cutsceneIncCutsceneState
				//		call fastFadeinFromBlack
				//		ld a,$40
				//		ld (wDirtyFadeSprPalettes),a
				//		ld (wFadeSprPaletteSources),a
				//		ld a,$03
				//		ld (wDirtyFadeBgPalettes),a
				//		ld (wFadeBgPaletteSources),a
				//		ld a,SND_LIGHTTORCH
				//		jp playSound
				break;
			case 4:
				assert(0, "NYI");
				//		ld a,(wPaletteThread_mode)
				//		or a
				//		ret nz
				//		call cutsceneIncCutsceneState
				//		ld a,$0e
				//		ld (wTmpcbb3),a
				//		call fadeinFromBlack
				//		ld a,$bf
				//		ld (wDirtyFadeSprPalettes),a
				//		ld (wFadeSprPaletteSources),a
				//		ld a,$fc
				//		ld (wDirtyFadeBgPalettes),a
				//		ld (wFadeBgPaletteSources),a
				//		ret
				break;
			case 5:
				assert(0, "NYI");
				//		call decCBB3
				//		ret nz
				//		xor a
				//		ld (wPaletteThread_mode),a
				//		ld a,$78
				//		ld (wTmpcbb3),a
				//		jp cutsceneIncCutsceneState
				break;
			case 6:
				assert(0, "NYI");
				//		call decCBB3
				//		ret nz
				//		call cutsceneIncCutsceneState
				//		ld a,TEXTBOXFLAG_DONTCHECKPOSITION
				//		ld (wTextboxFlags),a
				//		ld a,$03
				//		ld (wTextboxPosition),a
				//		ld bc,TX_281a
				//		jp showText
				break;
			case 7:
				assert(0, "NYI");
				//		call retIfTextIsActive
				//		call cutsceneIncCutsceneState
				//		ld (wTmpcbb3),a
				//		dec a
				//		ld (wTmpcbba),a
				//		call restartSound
				//		ld a,SND_BIG_EXPLOSION_2
				//		jp playSound
				break;
			case 8:
				assert(0, "NYI");
				//		ld hl,wTmpcbb3
				//		ld b,$03
				//		call flashScreen
				//		ret z
				//		call cutsceneIncCutsceneState
				//		ld a,$3c
				//		ld (wTmpcbb3),a
				//		ld a,$02
				//		jp fadeoutToWhiteWithDelay
				break;
			case 9:
				assert(0, "NYI");
				//		ld a,(wPaletteThread_mode)
				//		or a
				//		ret nz
				//		call decCBB3
				//		ret nz
				//		jp cutsceneIncCutsceneState
				break;
			case 10:
				disableLCD();
				const oldSVBK = gbc.SVBK;
				gbc.SVBK = 2;
				tilesetBGPalettes[] = 0;
				gbc.SVBK = oldSVBK;
				clearScreenVariablesAndWRAMBank1();
				clearOAM();
				loadPaletteHeader(PalH.unnamed0F);
				func6E9A(2);
				func6EB7();
				playSound(Mus.essenceRoom);
				setLinkID(8);
				link.enabled = 1;
				link.subid = 11;
				scrollMode = 0;
				cutsceneIncCutsceneState();
				clearPaletteFadeVariablesAndRefreshPalettes();
				cameraY = 0;
				cameraX = 0;
				loadGFXRegisterStateIndex(21);
				break;
			case 11:
				if (genericCutscene.unnamedCBB9 != 7) {
					break;
				}
				clearLinkObject();
				genericCutscene.unnamedCBB3 = 60;
				cutsceneIncCutsceneState();
				break;
			case 12:
				assert(0, "NYI");
				//		call decCBB3
				//		ret nz
				//		ld hl,wGameState
				//		xor a
				//		ldi (hl),a
				//		ld (hl),a
				//		ld a,SNDCTRL_STOPMUSIC
				//		call playSound
				//		ld a,GLOBALFLAG_3d
				//		jp setGlobalFlag
				break;
			default: assert(0);
		}
		updateAllObjects();
	}

void func6E9A(ubyte a) {
	varFF8B = a;
	gbc.VBK = 1;
	gbc.vram[0x1800 .. 0x1C00] = a;
	gbc.VBK = 0;
	gbc.vram[0x1800 .. 0x1C00] = 0;
}

void func6EB7() {
	mixin(restoreSVBKOnExit);
	gbc.SVBK = 3;
	vramTiles[0 .. 0x240] = 0;
	vramAttributes[0 .. 0x240] = 2;
}

	//	func_6ed6:
	//		ldh (<hFF8B),a
	//		ld a,($ff00+R_SVBK)
	//		push af
	//		ld a,$04
	//		ld ($ff00+R_SVBK),a
	//		ld hl,$d000
	//		ld bc,$0240
	//		call clearMemoryBc
	//		ld hl,$d400
	//		ld bc,$0240
	//		ldh a,(<hFF8B)
	//		call fillMemoryBc
	//		pop af
	//		ld ($ff00+R_SVBK),a
	//		ret

	//	func_6ef7:
	//		ld a,(wTmpcbb9)
	//		or a
	//		jr z,func_6f0b
	//		ld hl,$cbb7
	//		ld b,$01
	//		call flashScreen
	//		ret z
	//		xor a
	//		ld (wTmpcbb9),a
	//		ret
			
	//	func_6f0b:
	//		ld a,(wFrameCounter)
	//		and $1f
	//		ret nz
	//		call getRandomNumber
	//		and $07
	//		ret nz
	//		ld ($cbb7),a
	//		dec a
	//		ld (wTmpcbb9),a
	//		ld (wTmpcbba),a
	//		ld a,SND_LIGHTNING
	//		jp playSound

	//	func_6f26:
	//		ld hl,wTmpcbb6
	//		dec (hl)
	//		ret nz
	//		call decCBB3
	//		ret z
	//		ld a,(wTmpcbbb)
	//		ld (wTmpcbb6),a
	//		ld hl,wGfxRegs1.SCY
	//		dec (hl)
	//		ld a,(hl)
	//		or a
	//		ret nz
	//		ld a,UNCMP_GFXH_34
	//		call loadUncompressedGfxHeader
	//		or $01
	//		ret

	//	func_6f44:
	//		ld a,(wGfxRegs1.SCY)
	//		cpl
	//		inc a
	//		ld b,a
	//		xor a
	//		ldh (<hOamTail),a
	//		ld c,a
	//		ld a,($cbb8)
	//		rst_jumpTable
	//		.dw @cbb8_00
	//		.dw @cbb8_01
	//		.dw @cbb8_02
	//	@cbb8_00:
	//		ld hl,bank3f.oamData_714c
	//		ld e,:bank3f.oamData_714c
	//		jp addSpritesFromBankToOam_withOffset
	//	@cbb8_01:
	//		ld hl,bank3f.oamData_718d
	//		ld e,:bank3f.oamData_718d
	//		call addSpritesFromBankToOam_withOffset
	//		ld hl,bank3f.oamData_71ce
	//		ld e,:bank3f.oamData_71ce
	//		jp addSpritesFromBankToOam_withOffset
	//	@cbb8_02:
	//		ld hl,bank3f.oamData_71f7
	//		ld e,:bank3f.oamData_71f7
	//		call addSpritesFromBankToOam_withOffset
	//		ld hl,bank3f.oamData_718d
	//		ld e,:bank3f.oamData_718d
	//		ld a,(wGfxRegs1.SCY)
	//		cp $71
	//		jr c,+
	//		ld hl,bank3f.oamData_7220
	//		ld e,:bank3f.oamData_7220
	//	+
	//		jp addSpritesFromBankToOam_withOffset

void cutsceneIncCutsceneState() {
	cutsceneState++;
}

	//	cutscene_decCBB6:
	//		ld hl,wTmpcbb6
	//		dec (hl)
	//		ret
			
	//	cutscene_decCBB3whenFadeDone:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		jp decCBB3

	//	func_6f9e:
	//		ld a,($ff00+R_SVBK)
	//		push af
	//		ld a,$02
	//		ld ($ff00+R_SVBK),a
	//		ld hl,$de90
	//		ld b,$30
	//		call clearMemory
	//		pop af
	//		ld ($ff00+R_SVBK),a
	//	func_6fb0:
	//		ld a,($ff00+R_SVBK)
	//		push af
			
	//		ld a,$02
	//		ld ($ff00+R_SVBK),a
	//		ld hl,w2FadingBgPalettes
	//		ld b,$80
	//		call clearMemory
			
	//		pop af
	//		ld ($ff00+R_SVBK),a
	//		call hideStatusBar
	//		ld a,$fc
	//		ldh (<hBgPaletteSources),a
	//		ldh (<hDirtyBgPalettes),a
	//		xor a
	//		ld (wScrollMode),a
	//		ld (wGfxRegs1.LYC),a
	//		ld (wGfxRegs2.SCY),a
	//		ret

	//	;;
	//	; @param	a	Index?
	//	; @param[out]	b	Index for "objectTable2"?
	//	; @param[out]	c
	//	cutscene_disableLcdLoadRoomResetCamera:
	//		ld hl,@data
	//		rst_addDoubleIndex
	//		ld b,(hl)
	//		inc hl
	//		ld c,(hl)
	//		call disableLcdAndLoadRoom
	//		jp resetCamera

	//	@data:
	//		dwbe ROOM_AGES_098
	//		dwbe ROOM_AGES_05a
	//		dwbe ROOM_AGES_20e
	//		dwbe ROOM_AGES_039
	//		dwbe ROOM_AGES_039
	//		dwbe ROOM_AGES_20e
	//		dwbe ROOM_AGES_05a
	//		dwbe ROOM_AGES_038
	//		dwbe ROOM_AGES_149
	//		dwbe ROOM_AGES_184
	//		dwbe ROOM_AGES_165
	//		dwbe ROOM_ZELDA_IN_FINAL_DUNGEON
	//		dwbe ROOM_AGES_165
	//		dwbe ROOM_AGES_149
	//		dwbe ROOM_AGES_184
	//		dwbe ROOM_AGES_4f6
	//		dwbe ROOM_ZELDA_IN_FINAL_DUNGEON
	//		dwbe ROOM_AGES_038
	//		dwbe ROOM_AGES_149
	//		dwbe ROOM_AGES_038


	//	cutscene_tickDownCBB4ThenSetTo30:
	//		ld hl,$cbb4
	//		dec (hl)
	//		ret nz
	//		ld (hl),30
	//		ret
			
	//	cutscene_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret
			
	//	cutscene_incCBB3:
	//		ld hl,wTmpcbb3
	//		inc (hl)
	//		ret

	//	;;
	//	; CUTSCENE_WALL_RETRACTION
	//	func_701d:
	//		ld a,(wDungeonIndex)
	//		cp $08
	//		jp z,wallRetraction_dungeon8

	//		; D6 wall retraction
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1

	//	@state0:
	//		ld a,GFXH_MERMAIDS_CAVE_WALL_RETRACTION
	//	@func_702f:
	//		call loadGfxHeader
	//		ld b,$10
	//		ld hl,wTmpcbb3
	//		call clearMemory
	//		call reloadTileMap
	//		call resetCamera
	//		call getThisRoomFlags
	//		set 6,(hl)
	//		call loadTilesetAndRoomLayout
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		xor a
	//		ld (wScrollMode),a
	//		jr cutscene_incState
	//	@state1:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @cbb3_00
	//		.dw @cbb3_01
	//	@cbb3_00:
	//		call cutscene_tickDownCBB4ThenSetTo30
	//		ret nz
	//		ld (hl),$3c
	//		jr cutscene_incCBB3
	//	@cbb3_01:
	//		ld a,$3c
	//		call setScreenShakeCounter
	//		call cutscene_tickDownCBB4ThenSetTo30
	//		ret nz
	//		ld (hl),$19
	//		callab tilesets.generateW3VramTilesAndAttributes
	//		ld bc,$260c
	//		call func_70f7
	//		xor a
	//		ld ($ff00+R_SVBK),a
	//		call reloadTileMap
	//		ld a,SND_DOORCLOSE
	//		call playSound
	//		ld hl,$cbb7
	//		inc (hl)
	//		ld a,(hl)
	//		cp $0f
	//		ret c
	//		call func_7098
	//		ld a,$0f
	//		ld ($ce5d),a
	//		ret

	//	func_7098:
	//		ld a,SND_SOLVEPUZZLE
	//		call playSound
	//		ld a,CUTSCENE_INGAME
	//		ld (wCutsceneIndex),a
	//		ld a,$01
	//		ld (wScrollMode),a
	//		xor a
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		call loadTilesetAndRoomLayout
	//		jp loadRoomCollisions
			
	//	wallRetraction_dungeon8:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//	@state0:
	//		ld a,GFXH_ANCIENT_TOMB_WALL_RETRACTION
	//		jp func_701d@func_702f
	//	@state1:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw func_701d@cbb3_00
	//		.dw @cbb3_01
	//	@cbb3_01:
	//		ld a,$3c
	//		call setScreenShakeCounter
	//		call cutscene_tickDownCBB4ThenSetTo30
	//		ret nz
	//		ld (hl),$19
	//		callab tilesets.generateW3VramTilesAndAttributes
	//		ld bc,$4d04
	//		call func_70f7
	//		xor a
	//		ld ($ff00+R_SVBK),a
	//		call reloadTileMap
	//		ld a,SND_DOORCLOSE
	//		call playSound
	//		ld hl,$cbb7
	//		inc (hl)
	//		ld a,(hl)
	//		cp $0b
	//		ret c
	//		jr func_7098
			
	//	func_70f7:
	//		ld a,c
	//		ldh (<hFF8C),a
	//		ld a,b
	//		ldh (<hFF8D),a
	//		swap a
	//		and $0f
	//		add a
	//		ld e,a
	//		ld a,($cbb7)
	//		add e
	//		ldh (<hFF93),a
	//		ld c,$20
	//		call multiplyAByC
	//		ld bc,w3VramTiles
	//		ldh a,(<hFF8D)
	//		and $0f
	//		call addDoubleIndexToBc
	//		add hl,bc
	//		ldh a,(<hFF8C)
	//		ld b,a
	//		ld a,$20
	//		sub b
	//		ldh (<hFF8E),a
	//		push hl
	//		ld c,d
	//		ld de,$d000
	//		call func_712f
	//		pop hl
	//		set 2,h
	//		ld de,$d400
	//	func_712f:
	//		ldh a,(<hFF93)
	//		ld c,a
	//		ld a,$14
	//		sub c
	//		ret c
	//		ld c,a
	//	--
	//		ldh a,(<hFF8C)
	//		ld b,a
	//	-
	//		ld a,$02
	//		ld ($ff00+R_SVBK),a
	//		ld a,(de)
	//		inc de
	//		ldh (<hFF8B),a
	//		ld a,:w3VramTiles
	//		ld ($ff00+R_SVBK),a
	//		ldh a,(<hFF8B)
	//		ldi (hl),a
	//		dec b
	//		jr nz,-
	//		ldh a,(<hFF8E)
	//		call addAToDe
	//		ldh a,(<hFF8E)
	//		rst_addAToHl
	//		dec c
	//		jr nz,--
	//		ret
			

	//	d2Collapse_decCBB4:
	//		ld hl,wTmpcbb4
	//		dec (hl)
	//		ret nz
	//		ret

	//	d2Collapse_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret

	//	d2Collapse_incCBB3:
	//		ld hl,wTmpcbb3
	//		inc (hl)
	//		ret

	//	;;
	//	; CUTSCENE_D2_COLLAPSE
	//	func_7168:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//	@state0:
	//		ld b,$10
	//		ld hl,wTmpcbb3
	//		call clearMemory
	//		call getThisRoomFlags
	//		set 7,(hl)
	//		ld l,<ROOM_AGES_073
	//		set 7,(hl)
	//		xor a
	//		ld (wScrollMode),a
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		call d2Collapse_incState
	//		jp reloadTileMap
	//	@state1:
	//		call d2Collapse_decCBB4
	//		ret nz
	//		call d2Collapse_incState
	//		call getFreeInteractionSlot
	//		jr nz,+
	//		ld (hl),INTERAC_97
	//		ld l,Interaction.yh
	//		ld (hl),$2c
	//		ld l,Interaction.xh
	//		ld (hl),$58
	//	+
	//		ld a,GFXH_WING_DUNGEON_COLLAPSING_1
	//		jp loadGfxHeader
	//	@state2:
	//		ld a,$0f
	//		call setScreenShakeCounter
	//		call func_stub
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @cbb3_00
	//		.dw @cbb3_01
	//		.dw @cbb3_02
	//		.dw @cbb3_03

	//	@cbb3_00:
	//		ld bc,roomGfxChanges.rectangleData_02_7de1
	//		callab roomGfxChanges.copyRectangleFromTmpGfxBuffer_paramBc
	//	@func_71d0:
	//		ld a,UNCMP_GFXH_AGES_3c
	//		call loadUncompressedGfxHeader
	//		ld a,SND_DOORCLOSE
	//		call playSound
	//		ld a,$1e
	//		ld (wTmpcbb4),a
	//		jp d2Collapse_incCBB3
	//	@cbb3_01:
	//		ld b,GFXH_WING_DUNGEON_COLLAPSING_2
	//	--
	//		call d2Collapse_decCBB4
	//		ret nz
	//		ld (hl),$1e
	//		ld a,b
	//		call loadGfxHeader
	//		jr @cbb3_00
	//	@cbb3_02:
	//		ld b,GFXH_WING_DUNGEON_COLLAPSING_3
	//		jr --
	//	@cbb3_03:
	//		call d2Collapse_decCBB4
	//		ret nz
	//		callab roomGfxChanges.drawCollapsedWingDungeon
	//		call @func_71d0
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		jp d2Collapse_incState
	//	@state3:
	//		call d2Collapse_decCBB4
	//		ret nz
	//		jp d2Collapse_incState
	//	@state4:
	//		ld a,CUTSCENE_INGAME
	//		ld (wCutsceneIndex),a
	//		ld a,$01
	//		ld (wScrollMode),a
	//		ld hl,objectData.objectData7e69
	//		call parseGivenObjectData
	//		xor a
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		ld a,(wActiveMusic)
	//		jp playSound
	//	func_stub:
	//		ret


	//	; unused??
	//		.db $00 $01 $00 $00


	//	timewarpCutscene_decCBB4:
	//		ld hl,wTmpcbb4
	//		dec (hl)
	//		ret nz
	//		ret

	//	timewarpCutscene_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret

	//	timewarpCutscene_incCBB3:
	//		ld hl,wTmpcbb3
	//		inc (hl)
	//		ret

	//	;;
	//	; CUTSCENE_TIMEWARP
	//	func_03_7244:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//	@state0:
	//		ld b,$10
	//		ld hl,wTmpcbb3
	//		call clearMemory
	//		call timewarpCutscene_incState
	//		call stopTextThread
	//		xor a
	//		ld hl,wLoadedTreeGfxActive
	//		ldi (hl),a
	//		ld (hl),a
	//		ld a,$01
	//		ld ($cc20),a
	//		dec a
	//		ld (wScrollMode),a
	//		ld a,$08
	//		ld ($cbb7),a
	//		callab bank3f.agesFunc_3f_4133
	//		callab bank6.specialObjectLoadAnimationFrameToBuffer
	//		ld a,GFXH_COMMON_SPRITES_TO_WRAM
	//		call loadGfxHeader
	//		call fastFadeoutToBlack
	//		xor a
	//		ld (wDirtyFadeSprPalettes),a
	//		dec a
	//		ld (wFadeSprPaletteSources),a
	//		ld hl,wLoadedObjectGfx
	//		ld b,$10
	//		call clearMemory
	//		jp hideStatusBar
	//	@state1:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @@cbb3_00
	//		.dw @@cbb3_01
	//		.dw @@cbb3_02
	//		.dw @@cbb3_03
	//		.dw @@cbb3_04
	//		.dw @@cbb3_05
	//	@@cbb3_00:
	//		ld hl,$d000
	//	--
	//		call func_7431
	//		call func_745c
	//		jr timewarpCutscene_incCBB3
	//	@@cbb3_01:
	//		ld hl,$d400
	//		jr --
	//	@@cbb3_02:
	//		ld hl,$d800
	//		jr --
	//	@@cbb3_03:
	//		ld hl,$dc00
	//		jr --
	//	@@cbb3_04:
	//		ld hl,$d000
	//		call func_7431
	//		call func_7456
	//		jp timewarpCutscene_incCBB3
	//	@@cbb3_05:
	//		ld hl,$d400
	//		call func_7431
	//		call func_7450
	//		ld hl,$cbb7
	//		dec (hl)
	//		jr z,@@func_72ec
	//		ld hl,$cbb8
	//		inc (hl)
	//		ld hl,wTmpcbb3
	//		ld (hl),$00
	//		ret
			
	//	@@func_72ec:
	//		xor a
	//		ld ($ff00+R_SVBK),a
	//		call clearItems
	//		call clearEnemies
	//		call clearParts
	//		call clearReservedInteraction0
	//		call clearDynamicInteractions
	//		ld de,$d100
	//		call objectDelete_de
	//	.ifndef REGION_JP
	//		ld a,>w1Link
	//		ld (wLinkObjectIndex),a
	//	.endif
	//		call refreshObjectGfx
	//		xor a
	//		ld ($cc20),a
	//		ld hl,wTmpcbb3
	//		ld (hl),$00
	//		jp timewarpCutscene_incState

	//	@state2:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @@cbb3_00
	//		.dw @@cbb3_01
	//		.dw @@cbb3_02
	//		.dw @@cbb3_03
	//		.dw @@cbb3_04
	//	@@cbb3_00:
	//		ld a,(wcddf)
	//		or a
	//		jr nz,+
	//		callab tilesets.func_04_6f07
	//	+
	//		ld a,$03
	//		ld ($ff00+R_SVBK),a
	//		ld bc,$02c0
	//		ld hl,$d800
	//		call clearMemoryBc
	//		ld bc,$02c0
	//		ld hl,$dc00
	//		call clearMemoryBc
	//		call reloadTileMap
	//		jp timewarpCutscene_incCBB3
	//	@@cbb3_01:
	//		call getFreeInteractionSlot
	//		ld (hl),INTERAC_TIMEWARP
	//		ld l,Interaction.counter1
	//		ld a,120
	//		ld (hl),a
	//		ld (wTmpcbb4),a
	//		ld a,(wTilesetFlags)
	//		and $80
	//		ld a,$02
	//		jr nz,+
	//		dec a
	//	+
	//		ld l,Interaction.var03
	//		ld (hl),a
	//		ld (wcc50),a
	//		ld a,SND_TIMEWARP_INITIATED
	//		call playSound
	//		jp timewarpCutscene_incCBB3
	//	@@cbb3_02:
	//		call timewarpCutscene_decCBB4
	//		ret nz
	//		ld (hl),$3c
	//		call getFreeInteractionSlot
	//		jr nz,+
	//		ld (hl),INTERAC_TIMEWARP
	//		inc l
	//		ld (hl),$02
	//		ld de,w1Link.yh
	//		call objectCopyPosition_rawAddress
	//	+
	//		ld de,w1Link.yh
	//		call getShortPositionFromDE
	//		ld (wTmpcbb9),a
	//		ld de,$d000
	//		call objectDelete_de
	//		jp timewarpCutscene_incCBB3
	//	@@cbb3_03:
	//		call timewarpCutscene_decCBB4
	//		ret nz
	//		call fastFadeinFromBlack
	//		jp timewarpCutscene_incCBB3
	//	@@cbb3_04:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call fadeoutToWhite
	//		jp timewarpCutscene_incState

	//	@state3:
	//		ld a,(wcddf)
	//		or a
	//		jr nz,+
	//		callab tilesets.func_04_6e9b
	//	+
	//		ld a,(wActiveRoom)
	//		ld b,a
	//		ld a,(wActiveGroup)
	//		xor $01
	//		call getRoomFlags
	//		ld (wLinkStateParameter),a
	//		ld hl,wWarpDestGroup
	//		ld a,(wActiveGroup)
	//		xor $01
	//		or $80
	//		ldi (hl),a
	//		ld a,(wActiveRoom)
	//		ldi (hl),a
	//		ld a,$06
	//		ldi (hl),a
	//		ld a,(wActiveTilePos)
	//		ld (hl),a
	//		callab bank1.checkSolidObjectAtWarpDestPos
	//		srl c
	//		jr nc,+
	//		ld a,(wTmpcbb9)
	//		ld (wWarpDestPos),a
	//	+
	//		ld a,CUTSCENE_03
	//		ld (wCutsceneIndex),a
	//		ld a,$ff
	//		ld (wActiveMusic),a
	//		ld a,(wActiveRoom)
	//		ld hl,@sentBackByStrangeForceTable
	//		call checkFlag
	//		ret z
	//		ld a,$01
	//		ld (wSentBackByStrangeForce),a
	//		ret

	//	@sentBackByStrangeForceTable:
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00011100
	//		dbrev %00000000 %00011100
	//		dbrev %00000110 %00011100
	//		dbrev %00000110 %00001000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000
	//		dbrev %00000000 %00000000

	//	func_7431:
	//		push hl
	//		ld a,($cbb8)
	//		and $07
	//		ld hl,table_7440
	//		rst_addDoubleIndex
	//		ldi a,(hl)
	//		ld e,(hl)
	//		ld d,a
	//		pop hl
	//		ret

	//	table_7440:
	//		.db $dd $ff
	//		.db $dd $bb
	//		.db $55 $bb
	//		.db $55 $aa
	//		.db $11 $aa
	//		.db $11 $88
	//		.db $00 $88
	//		.db $00 $00

	//	func_7450:
	//		ld b,$2f
	//		ld c,$06
	//		jr ++

	//	func_7456:
	//		ld b,$3f
	//		ld c,$06
	//		jr ++

	//	func_745c:
	//		ld b,$3f
	//		ld c,$05
	//	++
	//		push bc
	//		push hl
	//		ld a,c
	//		ld ($ff00+R_SVBK),a
	//		ld b,$00
	//	--
	//		ld a,(hl)
	//		and d
	//		ldi (hl),a
	//		ld a,(hl)
	//		and d
	//		ldi (hl),a
	//		ld a,(hl)
	//		and e
	//		ldi (hl),a
	//		ld a,(hl)
	//		and e
	//		ldi (hl),a
	//		dec b
	//		jr nz,--
	//		pop hl
	//		pop bc
	//		ld a,c
	//		sub $05
	//		ld e,a
	//		ld a,h
	//		and $8f
	//		ld d,a
	//		jp queueDmaTransfer


	//	ambiPassageOpen_decCBB4:
	//		ld hl,wTmpcbb4
	//		dec (hl)
	//		ret nz
	//		ret
			
	//	ambiPassageOpen_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret
			
	//	ambiPassageOpen_incCBB3:
	//		ld hl,wTmpcbb3
	//		inc (hl)
	//		ret

	//	;;
	//	; CUTSCENE_AMBI_PASSAGE_OPEN
	//	func_03_7493:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld b,$08
	//		ld hl,wTmpcbb3
	//		call clearMemory
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		call ambiPassageOpen_incState
	//		call disableLcd
	//		call clearOam
	//		call clearScreenVariablesAndWRAMBank1
	//		callab bank1.clearMemoryOnScreenReload
	//		call stopTextThread
	//		xor a
	//		ld bc, ROOM_AGES_127
	//		call forceLoadRoom
	//		call loadRoomCollisions
	//		call func_131f
	//		call loadCommonGraphics
	//		call fadeinFromWhite
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex
	//	@state1:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @cbb3_00
	//		.dw @cbb3_01
	//	@cbb3_00:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call ambiPassageOpen_decCBB4
	//		ret nz
	//		ld (hl),$3e
	//		ld a,(wTmpcbbd)
	//		ld hl,@table_7513
	//		rst_addDoubleIndex
	//		ldi a,(hl)
	//		ld b,(hl)
	//		ld c,a
	//		call getFreeInteractionSlot
	//		ret nz
	//		ld (hl),INTERAC_PUSHBLOCK
	//		ld l,Interaction.angle
	//		ld (hl),b
	//		ld l,Interaction.yh
	//		call setShortPosition_paramC
	//		ld l,Interaction.yh
	//		dec (hl)
	//		dec (hl)
	//		ld l,Interaction.var30
	//		ld (hl),c
	//		jp ambiPassageOpen_incCBB3

	//	@table_7513:
	//		.db $33 $10
	//		.db $34 $00
	//		.db $35 $10
	//		.db $36 $00
	//	@cbb3_01:
	//		call ambiPassageOpen_decCBB4
	//		ret nz
	//		ld (hl),$1e
	//		ld a,SND_SOLVEPUZZLE
	//		call playSound
	//		jp ambiPassageOpen_incState
	//	@state2:
	//		call ambiPassageOpen_decCBB4
	//		ret nz
	//		call getThisRoomFlags
	//		ld a,(wTmpcbbb)
	//		ld (wWarpDestRoom),a
	//		ld l,a
	//		set 7,(hl)
	//		ld a,$81
	//		ld (wWarpDestGroup),a
	//		ld a,(wTmpcbbc)
	//		ld (wWarpDestPos),a
	//		ld a,$00
	//		ld (wWarpTransition),a
	//		ld a,CUTSCENE_03
	//		ld (wCutsceneIndex),a
	//		xor a
	//		ld (wMenuDisabled),a
	//		jp fadeoutToWhite
			
	//	jabuOpen_decCBB4:
	//		ld hl,wTmpcbb4
	//		dec (hl)
	//		ret nz
	//		ret
			
	//	jabuOpen_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret
			
	//	jabuOpen_incCBB3:
	//		ld hl,wTmpcbb3
	//		inc (hl)
	//		ret

	//	;;
	//	; CUTSCENE_JABU_OPEN
	//	func_03_7565:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//	@state0:
	//		ld b,$10
	//		ld hl,wTmpcbb3
	//		call clearMemory
	//		callab bank1.checkDisableUnderwaterWaves
	//		call getThisRoomFlags
	//		set 1,(hl)
	//		ld a,$04
	//		ld (wTmpcbb4),a
	//		xor a
	//		ld (wScrollMode),a
	//		jr jabuOpen_incState
	//	@state1:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @cbb3_00
	//		.dw @cbb3_01
	//		.dw @cbb3_02
	//		.dw @cbb3_03
	//	@cbb3_00:
	//		call jabuOpen_decCBB4
	//		ret nz
	//		ld (hl),$3c
	//		call reloadTileMap
	//		callab bank1.checkInitUnderwaterWaves
	//		jr jabuOpen_incCBB3
	//	@cbb3_01:
	//		call jabuOpen_decCBB4
	//		ret nz
	//		ld (hl),$3c
	//		jr jabuOpen_incCBB3
	//	@cbb3_02:
	//		ld a,$3c
	//		call setScreenShakeCounter
	//		call jabuOpen_decCBB4
	//		ret nz
	//		ld (hl),$3c
	//		call jabuOpen_incCBB3
	//		ldbc, INTERAC_97 $01
	//		call objectCreateInteraction
	//		ld a,GFXH_JABU_OPENING_1
	//	--
	//		call loadGfxHeader
	//		call reloadTileMap
	//		ld a,SND_DOORCLOSE
	//		jp playSound
	//	@cbb3_03:
	//		ld a,$3c
	//		call setScreenShakeCounter
	//		call jabuOpen_decCBB4
	//		ret nz
	//		ld (hl),$3c
	//		call jabuOpen_incState
	//		ld a,GFXH_JABU_OPENING_2
	//		jr --
	//	@state2:
	//		call jabuOpen_decCBB4
	//		ret nz
	//		ld a,SND_SOLVEPUZZLE
	//		call playSound
	//		ld a,CUTSCENE_INGAME
	//		ld (wCutsceneIndex),a
	//		ld a,$01
	//		ld (wScrollMode),a
	//		xor a
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		call loadTilesetAndRoomLayout
	//		jp loadRoomCollisions
			
			
	//	cleanSeas_decCBB4:
	//		ld hl,wTmpcbb4
	//		dec (hl)
	//		ret nz
	//		ret
			
	//	cleanSeas_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret
			
	//	cleanSeas_incCBB3:
	//		ld hl,wTmpcbb3
	//		inc (hl)
	//		ret

	//	;;
	//	; CUTSCENE_CLEAN_SEAS
	//	func_03_7619:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//		.dw @state6
	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld b,$10
	//		ld hl,wTmpcbb3
	//		call clearMemory
	//		call clearScreenVariablesAndWRAMBank1
	//		call refreshObjectGfx
	//		ld a,MUS_FAIRY_FOUNTAIN
	//		call playSound
	//		call cleanSeas_incState
	//		xor a
	//		ld bc, ROOM_AGES_1a5
	//	@func_764a:
	//		push bc
	//		call disableLcd
	//		ld a,PALH_0f
	//		call loadPaletteHeader
	//		call clearOam
	//		call clearScreenVariablesAndWRAMBank1
	//		callab bank1.clearMemoryOnScreenReload
	//		call stopTextThread
	//		ld a,$01
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		xor a
	//		pop bc
	//		call forceLoadRoom
	//		call func_131f
	//		call loadCommonGraphics
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex
	//	@state1:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @@cbb3_00
	//		.dw @@cbb3_01
	//		.dw @@cbb3_02
	//		.dw @@cbb3_03
	//	@@cbb3_00:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,$f0
	//		ld (wTmpcbb4),a
	//		jp cleanSeas_incCBB3
	//	@@cbb3_01:
	//		ld a,(wFrameCounter)
	//		and $07
	//		jr nz,+
	//		call getFreePartSlot
	//		jr nz,+
	//		ld (hl),PART_SPARKLE
	//		call getRandomNumber
	//		and $7f
	//		ld c,a
	//		ld l,Part.yh
	//		call setShortPosition_paramC
	//	+
	//		ld a,(wFrameCounter)
	//		and $1f
	//		ld a,SND_MAGIC_POWDER
	//		call z,playSound
	//		call cleanSeas_decCBB4
	//		ret nz
	//		ld (hl),$78
	//		ld a,$04
	//		call fadeoutToWhiteWithDelay
	//		ld a,SND_FADEOUT
	//		call playSound
	//		jp cleanSeas_incCBB3
	//	@@cbb3_02:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call func_782a
	//		call func_782a
	//		call func_782a
	//		call func_782a
	//		ret z
	//		ld a,$04
	//		call fadeinFromWhiteWithDelay
	//		ld a,SND_FAIRYCUTSCENE
	//		call playSound
	//		jp cleanSeas_incCBB3
	//	@@cbb3_03:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cleanSeas_decCBB4
	//		ret nz
	//		ld (hl),$3c
	//		call cleanSeas_incState
	//		xor a
	//		ld (wTmpcbb3),a
	//		ld bc, ROOM_AGES_1d2
	//		jp @func_764a
	//	@state2:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @state1@cbb3_00
	//		.dw @state1@cbb3_01
	//		.dw @state1@cbb3_02
	//		.dw @@cbb3_03
	//	@@cbb3_03:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cleanSeas_decCBB4
	//		ret nz
	//		ld (hl),$3c
	//		call cleanSeas_incState
	//		xor a
	//		ld (wTmpcbb3),a
	//		ld bc, ROOM_AGES_3b1
	//		call @func_764a
	//		ld hl,objectData.objectData7e71
	//		jp parseGivenObjectData
	//	@state3:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @state1@cbb3_00
	//		.dw @state1@cbb3_01
	//		.dw @state1@cbb3_02
	//		.dw @@cbb3_03
	//	@@cbb3_03:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,$cfc0
	//		bit 7,(hl)
	//		ret z
	//		res 7,(hl)
	//		call cleanSeas_incState
	//		xor a
	//		ld (wTmpcbb3),a
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		ld bc, ROOM_AGES_3b0
	//		call @func_764a
	//		ld hl,objectData.objectData7e7b
	//		jp parseGivenObjectData
	//	@state4:
	//		ld a,(wTmpcbb3)
	//		rst_jumpTable
	//		.dw @state1@cbb3_00
	//		.dw @state1@cbb3_01
	//		.dw @state1@cbb3_02
	//		.dw @@cbb3_03
	//	@@cbb3_03:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,$cfc0
	//		bit 7,(hl)
	//		ret z
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		call cleanSeas_incState
	//		xor a
	//		ld (wTmpcbb3),a
	//		ld bc, ROOM_AGES_1a3
	//		call @func_764a
	//		ld hl,w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld (hl),$38
	//		ld l,<w1Link.xh
	//		ld (hl),$68
	//		ld l,<w1Link.direction
	//		ld (hl),DIR_DOWN
	//		jp setLinkForceStateToState08
	//	@state5:
	//		ld a,(wTmpcbb3)
	//		ld e,a
	//		or a
	//		jr z,+
	//		ld a,(wFrameCounter)
	//		and $1f
	//		jr nz,+
	//		ld a,(w1Link.direction)
	//		and $02
	//		xor $02
	//		or $01
	//		ld (w1Link.direction),a
	//	+
	//		ld a,e
	//		rst_jumpTable
	//		.dw @state1@cbb3_00
	//		.dw @state1@cbb3_01
	//		.dw @state1@cbb3_02
	//		.dw @@cbb3_03
	//	@@cbb3_03:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld hl,$cfc0
	//		bit 7,(hl)
	//		ret z
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		ld a,SND_SOLVEPUZZLE_2
	//		call playSound
	//		jp cleanSeas_incState
	//	@state6:
	//		call cleanSeas_decCBB4
	//		ret nz
	//		ld a,$01
	//		ld (wScrollMode),a
	//		callab bank1.calculateRoomEdge
	//		callab bank1.func_49c9
	//		callab bank1.setObjectsEnabledTo2
	//		xor a
	//		ld (wMenuDisabled),a
	//		ld (wDisabledObjects),a
	//		ld a,(wLoadingRoomPack)
	//		ld (wRoomPack),a
	//		ld a,(wActiveRoom)
	//		ld (wLoadingRoom),a
	//		ld a,$36
	//		ld (wEnteredWarpPosition),a
	//		ld a,(wActiveMusic2)
	//		ld (wActiveMusic),a
	//		call playSound
	//		ld a,CUTSCENE_LOADING_ROOM
	//		ld (wCutsceneIndex),a
	//		ld a,$02
	//		ld (w1Link.direction),a
	//		ld a,GLOBALFLAG_WATER_POLLUTION_FIXED
	//		call setGlobalFlag
	//		jp setDeathRespawnPoint
			
	//	func_782a:
	//		ld a,$eb
	//		call findTileInRoom
	//		ret nz
	//		ld c,l
	//		ld a,(wTilesetFlags)
	//		and $40
	//		ld a,$fc
	//		jr z,+
	//		ld a,$3a
	//	+
	//		call setTile
	//		xor a
	//		ret

	//	.include "code/ages/cutscenes/linkedGameCutscenes.s"

	//	blackTowerEscapeAttempt_incState:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ret


	//		ld hl,wTmpcbb3
	//		inc (hl)
	//		ret

	//	blackTowerEscapeAttempt_decCBB4:
	//		ld hl,wTmpcbb4
	//		dec (hl)
	//		ret

	//	blackTowerEscapeAttempt_loadNewRoom:
	//		call disableLcd
	//		call loadScreenMusicAndSetRoomPack
	//		call loadTilesetData
	//		call loadTilesetGraphics
	//		jp func_131f

	//	;;
	//	; CUTSCENE_BLACK_TOWER_ESCAPE_ATTEMPT
	//	func_03_7cb7:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5
	//		.dw @state6
	//	@state0:
	//		ld a,(wActiveMusic2)
	//		ld (wActiveMusic),a
	//		call playSound
	//		ld hl,wTmpcbb3
	//		ld b,$10
	//		call clearMemory
	//		call clearWramBank1
	//		call refreshObjectGfx
	//		ld a,$01
	//		ld (wDisabledObjects),a
	//		ld (wMenuDisabled),a
	//		ld a,$3c
	//		ld (wTmpcbb4),a
	//		call blackTowerEscapeAttempt_incState
	//		ld hl,w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld (hl),$58
	//		inc l
	//		inc l
	//		ld (hl),$78
	//		ld l,<w1Link.direction
	//		ld (hl),DIR_DOWN
	//		call resetCamera
	//		ld a,$00
	//		ld (wScrollMode),a
	//		ld hl,objectData.objectData7e85
	//		call parseGivenObjectData
	//		ld a,$04
	//		jp fadeinFromWhiteWithDelay
	//	@state1:
	//		ld a,(wTmpcbb5)
	//		cp $04
	//		ret nz
	//		call blackTowerEscapeAttempt_decCBB4
	//		jr z,@func_7d33
	//		ld a,(hl)
	//		cp $01
	//		ret nz
	//		ld a,$0b
	//		ld (wLinkForceState),a
	//		ld a,$50
	//		ld (wLinkStateParameter),a
	//		ld a,$10
	//		ld ($d009),a
	//		ret
	//	@func_7d33:
	//		ld (hl),$10
	//		call blackTowerEscapeAttempt_incState
	//		ld a,$04
	//		jp fadeoutToWhiteWithDelay
	//	@state2:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		call blackTowerEscapeAttempt_incState
	//		ld a,$f3
	//		ld (wActiveRoom),a
	//		call blackTowerEscapeAttempt_loadNewRoom
	//		ld hl,w1Link.yh
	//		ld (hl),$78
	//		inc l
	//		inc l
	//		ld (hl),$78
	//		call resetCamera
	//		call loadCommonGraphics
	//		ld a,$04
	//		call fadeinFromWhiteWithDelay
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex
	//	@state3:
	//		ld a,$00
	//		ld (wScrollMode),a
	//		ld a,$f8
	//		ld (w1Link.yh),a
	//		ld a,$05
	//		ld (wTmpcbb5),a
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call blackTowerEscapeAttempt_decCBB4
	//		ret nz
	//		ld a,$0b
	//		ld (wLinkForceState),a
	//		ld a,$60
	//		ld (wLinkStateParameter),a
	//		ld a,$10
	//		ld ($d009),a
	//		jp blackTowerEscapeAttempt_incState
	//	@state4:
	//		ld a,(wTmpcbb5)
	//		cp $06
	//		ret nz
	//		call func_7e40
	//		ld a,(wScreenShakeCounterY)
	//		dec a
	//		jr z,@func_7dbc
	//		and $1f
	//		ret nz
	//		ld a,(w1Link.direction)
	//		ld c,a
	//		rra
	//		xor c
	//		bit 0,a
	//		ld a,c
	//		jr z,@func_7db6
	//		xor $01
	//		jr ++
	//	@func_7db6:
	//		xor $02
	//	++
	//		ld (w1Link.direction),a
	//		ret
	//	@func_7dbc:
	//		call getFreeInteractionSlot
	//		ret nz
	//		ld (hl),INTERAC_EXCLAMATION_MARK
	//		ld l,Interaction.counter1
	//		ld a,30
	//		ld (hl),a
	//		ld (wTmpcbb4),a
	//		ld a,(w1Link.yh)
	//		sub $10
	//		ld l,Interaction.yh
	//		ldi (hl),a
	//		inc l
	//		ld a,(w1Link.xh)
	//		ld (hl),a
	//		ld a,SND_CLINK
	//		call playSound
	//		call blackTowerEscapeAttempt_incState
	//	@state5:
	//		call func_7e40
	//		call blackTowerEscapeAttempt_decCBB4
	//		ret nz
	//		ld a,$0b
	//		ld (wLinkForceState),a
	//		ld a,$10
	//		ld (wLinkStateParameter),a
	//		ld hl,w1Link.direction
	//		ld a,DIR_DOWN
	//		ldi (hl),a
	//		ld (hl),ANGLE_DOWN
	//		ld a,$07
	//		ld (wTmpcbb5),a
	//		xor a
	//		ld ($cfde),a
	//		call getFreeInteractionSlot
	//		ld (hl),INTERAC_FALLING_ROCK
	//		ld l,Interaction.var03
	//		ld (hl),$01
	//		call getFreeInteractionSlot
	//		ld (hl),INTERAC_VERAN_CUTSCENE_WALLMASTER
	//		ld l,Interaction.yh
	//		ld a,(w1Link.yh)
	//		add $10
	//		ldi (hl),a
	//		ld a,(w1Link.xh)
	//		inc l
	//		ld (hl),a
	//		jp blackTowerEscapeAttempt_incState
	//	@state6:
	//		call func_7e40
	//		ld a,(wTmpcbb5)
	//		cp $08
	//		ret nz
	//		ld a,SNDCTRL_STOPMUSIC
	//		call playSound
	//		xor a
	//		ld (wActiveMusic),a
	//		inc a
	//		ld (wCutsceneIndex),a
	//		ld hl,@warpDest
	//		jp setWarpDestVariables

	//	@warpDest:
	//		m_HardcodedWarpA ROOM_AGES_5d7, $05, $77, $03

	//	func_7e40:
	//		ld a,(wScreenShakeCounterY)
	//		and $0f
	//		ld a,SND_RUMBLE
	//		call z,playSound
	//		ld a,(wScreenShakeCounterY)
	//		or a
	//		ld a,$ff
	//		jp z,setScreenShakeCounter
	//		ret
} else {
	//; TODO: Some code in this file is shared with "code/ages/cutscenes/bank10.s".

	//;;
	//; CUTSCENE_S_DIN_CRYSTAL_DESCENDING
	//endgameCutsceneHandler_09:
	//	ld de,$cbc1
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw endgameCutsceneHandler_09_stage0
	//	.dw endgameCutsceneHandler_09_stage1

	//endgameCutsceneHandler_09_stage0:
	//	call updateStatusBar
	//	call endgameCutsceneHandler_09_stage0_body
	//	call updateAllObjects
	//	jp checkEnemyAndPartCollisionsIfTextInactive

	//endgameCutsceneHandler_09_stage0_body:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9
	//	.dw @stateA
	//	.dw @stateB
	//	.dw @stateC
	//	.dw @stateD
	//	.dw @stateE
	//	.dw @stateF
	//	.dw @state10
	//	.dw @state11
	//	.dw @state12
	//	.dw @state13
	//	.dw @state14
	//	.dw @state15
	//	.dw @state16
	//	.dw @state17
	//	.dw @state18
	//	.dw @state19
	//	.dw @state1A
	//	.dw @state1B
	//	.dw @state1C
	//	.dw @state1D
	//	.dw @state1E
	//	.dw @state1F
	//	.dw @state20
	//	.dw @state21
	//	.dw @state22
	//	.dw @state23
	//	.dw @state24
	//	.dw @state25
	//	.dw @state26
	//	.dw @state27

	//@state0:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld b,$20
	//	ld hl,$cfc0
	//	call clearMemory
	//	call incCbc2
	//	xor a
	//	ld bc,$0790
	//	call disableLcdAndLoadRoom_body
	//	ld a,$0d
	//	call playSound
	//	call clearAllParentItems
	//	call dropLinkHeldItem
	//	ld c,$00
	//@state0Func0:
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld a,INTERAC_DIN
	//	ld (wInteractionIDToLoadExtraGfx),a
	//	ldi (hl),a
	//	ld (hl),c
	//	ld (wLoadedTreeGfxIndex),a
	//+
	//	ld a,c
	//	ld hl,w1Link.enabled
	//	ld (hl),$03
	//	ld de,@state0Table_03_55f3
	//	call addDoubleIndexToDe
	//	ld a,(de)
	//	inc de
	//	ld l,<w1Link.yh
	//	ldi (hl),a
	//	inc l
	//	ld a,(de)
	//	ldi (hl),a
	//	ld l,<w1Link.direction
	//	ld (hl),$03
	//	ld a,c
	//	ld bc,$0050
	//	or a
	//	jr z,+
	//	ld bc,$3050
	//+
	//	ld hl,hCameraY
	//	ld (hl),b
	//	ld hl,hCameraX
	//	ld (hl),c
	//	ld a,$80
	//	ld (wDisabledObjects),a
	//	ld a,$02
	//	call loadGfxRegisterStateIndex
	//	jp fadeinFromWhiteToRoom
	//@state0Table_03_55f3:
	//	.db $99 $c8
	//	.db $99 $b8

	//@state1:
	//	ld hl,wccd8
	//	ld (hl),$ff
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld a,($cfdf)
	//	or a
	//	ret z
	//	call incCbc2
	//	ld bc,TX_3d00
	//	jp showText

	//@state2:
	//	call retIfTextIsActive
	//	call incCbc2
	//	jp fastFadeoutToWhite

	//@state3:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	inc l
	//	ld (hl),$00
	//	jr @state7Func0

	//@state4:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	ld a,SND_RESTORE
	//	call playSound
	//	jp fadeoutToWhite

	//@state5:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	ld a,$00
	//	call seasonsFunc_03_644c
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp fadeinFromWhite

	//@state6:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	jp fastFadeoutToWhite

	//@state7:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//@state7Func0:
	//	call clearDynamicInteractions
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	inc l
	//	ld a,(hl)
	//	ld hl,@state7Table0
	//	rst_addDoubleIndex
	//	ld c,(hl)
	//	inc hl
	//	ld b,(hl)
	//	ld a,$03
	//	call disableLcdAndLoadRoom_body
	//	call fastFadeinFromWhite
	//	ld hl,$cbb4
	//	ld a,(hl)
	//	ld b,a
	//	inc (hl)
	//	cp $04
	//	jr nc,+
	//	ld c,$04
	//	push bc
	//	ld a,$02
	//	call loadGfxRegisterStateIndex
	//	call resetCamera
	//	pop bc
	//	jr ++
	//+
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	push bc
	//	ld c,$01
	//	call @state0Func0
	//	pop bc
	//	ld c,$08
	//	call checkIsLinkedGame
	//	ld b,$ff
	//	jr z,++
	//	ld c,$0d
	//++
	//	ld hl,$cbc2
	//	ld (hl),c
	//	jp seasonsFunc_03_6405
	//@state7Table0:
	//	.db $e7 $00
	//	.db $54 $00
	//	.db $d1 $00
	//	.db $5e $00
	//	.db $90 $07

	//@state8:
	//	ld e,$3c
	//	ld bc,TX_3d01
	//	jr @stateDFunc0

	//@state9:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	jp fadeoutToWhite

	//@stateA:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,$ff
	//	ld (wTilesetAnimation),a
	//	call disableLcd
	//	ld a,GFXH_LINK_WITH_ORACLE_END_SCENE
	//	call loadGfxHeader
	//	ld a,$9d
	//	call loadPaletteHeader
	//	call cutscene_clearObjects
	//	call endgameCutsceneHandler_09_stage1_body@seasonsFunc_03_5ab0
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	jp fadeinFromWhite

	//@stateB:
	//	call endgameCutsceneHandler_09_stage1_body@seasonsFunc_03_5ab0
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	ld hl,wMenuDisabled
	//	ld (hl),$01
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld bc,TX_3d02
	//@stateBFunc0:
	//	ld a,$01
	//	ld (wTextboxFlags),a
	//	jp showText

	//@stateC:
	//	call endgameCutsceneHandler_09_stage1_body@seasonsFunc_03_5ab0
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call seasonsFunc_03_646a
	//	ld a,$01
	//	ld ($cbc1),a
	//	call disableActiveRing
	//	jp fadeoutToWhite

	//@stateD:
	//	ld e,$3c
	//	ld bc,TX_4f00
	//@stateDFunc0:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	ld a,e
	//	ld ($cbb3),a
	//	jp showText

	//@stateE:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	xor a
	//	ld ($cbb3),a
	//	dec a
	//	ld ($cbba),a
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	jp incCbc2

	//@stateF:
	//	ld hl,$cbb3
	//	ld b,$02
	//	call flashScreen
	//	ret z
	//	call incCbc2
	//	xor a
	//	ld bc,$059a
	//	call disableLcdAndLoadRoom_body
	//	ld a,$ac
	//	call loadPaletteHeader
	//	call hideStatusBar
	//	call clearFadingPalettes2
	//	ld b,$06
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_TWINROVA_FLAME
	//	inc l
	//	dec b
	//	ld (hl),b
	//	jr nz,-
	//+
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	ld a,$13
	//	call loadGfxRegisterStateIndex
	//	ld hl,wGfxRegs1.SCY
	//	ldi a,(hl)
	//	ldh (<hCameraY),a
	//	ld a,(hl)
	//	ldh (<hCameraX),a
	//	ld a,$00
	//	ld (wScrollMode),a
	//	ret

	//@state10:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$28
	//	ld a,$04
	//	ld (wTextboxFlags),a
	//	ld bc,TX_4f01
	//	jp showText

	//@state11:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld a,$20
	//	ld hl,$cbb3
	//	ldi (hl),a
	//	xor a
	//	ld (hl),a
	//	ret

	//@state12:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$20
	//	inc hl
	//	ld a,(hl)
	//	cp $03
	//	jr nc,+
	//	ld b,a
	//	push hl
	//	ld a,SND_LIGHTTORCH
	//	call playSound
	//	pop hl
	//	ld a,b
	//+
	//	inc (hl)
	//	ld hl,@state12Table0
	//	rst_addAToHl
	//	ld a,(hl)
	//	or a
	//	ld b,a
	//	jr nz,+
	//	call fadeinFromBlack
	//	ld a,$01
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,MUS_DISASTER
	//	call playSound
	//	jp incCbc2
	//+
	//	call fastFadeinFromBlack
	//	ld a,b
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	xor a
	//	ld (wDirtyFadeBgPalettes),a
	//	ld (wFadeBgPaletteSources),a
	//	ret
	//@state12Table0:
	//	.db $10 $40
	//	.db $80 $28
	//	.db $06 $00

	//@state13:
	//	ld e,$28
	//	ld bc,TX_4f02
	//	call @state13Func0
	//	jp @stateDFunc0
	//@state13Func0:
	//	ld a,$08
	//	ld (wTextboxFlags),a
	//	ld a,$03
	//	ld (wTextboxPosition),a
	//	ret

	//@state14:
	//	ld e,$28
	//	ld bc,TX_4f03
	//-
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),e
	//	call @state13Func0
	//	jp showText

	//@state15:
	//	ld e,$3c
	//	ld bc,TX_4f04
	//	jr -

	//@state16:
	//	ld e,$b4
	//@state16Func0:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),e
	//	ret

	//@state17:
	//	ld hl,wGfxRegs1.SCY
	//	ldh a,(<hCameraY)
	//	ldi (hl),a
	//	ldh a,(<hCameraX)
	//	ldi (hl),a
	//	ld hl,@state17Table0
	//	ld de,wGfxRegs1.SCY
	//	call seasonsFunc_03_79cd
	//	inc de
	//	call seasonsFunc_03_79cd
	//	call seasonsFunc_03_5d00
	//	call decCBB3
	//	ret nz
	//	dec a
	//	ld ($cbba),a
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	jp incCbc2
	//@state17Table0:
	//	.db $ff $01
	//	.db $00 $01
	//	.db $00 $00
	//	.db $ff $00

	//@state18:
	//	ld hl,$cbb3
	//	ld b,$01
	//	call flashScreen
	//	ret z
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	call clearDynamicInteractions
	//	call clearOam
	//	call showStatusBar
	//	xor a
	//	ld bc,ROOM_SEASONS_790
	//	call disableLcdAndLoadRoom_body
	//	ld c,$01
	//	jp @state0Func0

	//@state19:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	ld bc,TX_3d17
	//	jp showText

	//@state1A:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	ld bc,TX_4f09
	//	jp showText

	//@state1B:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld c,$40
	//	ld a,TREASURE_HEART_REFILL
	//	call giveTreasure
	//	ld a,SPECIALOBJECT_LINK_CUTSCENE
	//	call setLinkIDOverride
	//	ld l,<w1Link.subid
	//	ld (hl),$07
	//	ld hl,$cbb3
	//	ld (hl),$5a
	//	ld a,MUS_PRECREDITS
	//	jp playSound

	//@state1C:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$b4
	//	ld bc,$90bd
	//	ld a,$ff
	//	jp createEnergySwirlGoingOut

	//@state1D:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp fadeoutToWhite

	//@state1E:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	call disableLcd
	//	call clearOam
	//	call clearDynamicInteractions
	//	call refreshObjectGfx
	//	call hideStatusBar
	//	ld a,$02
	//	ld ($ff00+R_SVBK),a
	//	ld hl,w2TilesetBgPalettes+$10
	//	ld b,$08
	//	ld a,$ff
	//	call fillMemory
	//	xor a
	//	ld ($ff00+R_SVBK),a
	//	ld a,$07
	//	ldh (<hDirtyBgPalettes),a
	//	ld b,$02
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_TWINROVA_FLAME
	//	inc l
	//	ld a,$05
	//	add b
	//	ld (hl),a
	//	dec b
	//	jr nz,-
	//+
	//	ld a,$02
	//	ld (wOpenedMenuType),a
	//	call seasonsFunc_03_7a6b
	//	ld a,$02
	//	call seasonsFunc_03_7a88
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,$10
	//	ldh (<hCameraY),a
	//	ld (wDeleteEnergyBeads),a
	//	xor a
	//	ldh (<hCameraX),a
	//	ld a,$00
	//	ld (wScrollMode),a
	//	ld bc,TX_4f05
	//	jp showText

	//@state1F:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld b,$02
	//@state1FFunc0:
	//	call fadeinFromWhite
	//	ld a,b
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	xor a
	//	ld (wDirtyFadeBgPalettes),a
	//	ld (wFadeBgPaletteSources),a
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ret

	//@state20:
	//	ld e,$1e
	//	ld bc,TX_4f06
	//	jp @stateDFunc0

	//@state21:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld b,$14
	//	jp @state1FFunc0

	//@state22:
	//	ld e,$1e
	//	ld bc,TX_4f07
	//	jp @stateDFunc0

	//@state23:
	//	ld e,$3c
	//	jp @state16Func0

	//@state24:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$f0
	//	ld a,$ff
	//	ld bc,$4850
	//	jp createEnergySwirlGoingOut

	//@state25:
	//	call decCBB3
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$5a
	//	call fadeoutToWhite
	//	ld a,$fc
	//	ld (wDirtyFadeBgPalettes),a
	//	ld (wFadeBgPaletteSources),a
	//	jp incCbc2

	//@state26:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	call clearDynamicInteractions
	//	call clearParts
	//	call clearOam
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld bc,TX_4f08
	//	jp showTextNonExitable

	//@state27:
	//	ld a,(wTextIsActive)
	//	rlca
	//	ret nc
	//	call decCBB3
	//	ret nz
	//	call showStatusBar
	//	xor a
	//	ld (wOpenedMenuType),a
	//	dec a
	//	ld (wActiveMusic),a
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	ld hl,wWarpDestGroup
	//	ld a,$80|>ROOM_SEASONS_59d
	//	ldi (hl),a
	//	ld a,<ROOM_SEASONS_59d
	//	ldi (hl),a
	//	ld a,$0f
	//	ldi (hl),a
	//	ld a,$57
	//	ldi (hl),a
	//	ld (hl),$03
	//	ret

	//endgameCutsceneHandler_09_stage1:
	//	call endgameCutsceneHandler_09_stage1_body
	//	jp updateAllObjects

	//endgameCutsceneHandler_09_stage1_body:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9

	//@state0:
	//	call @seasonsFunc_03_5ab0
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	call disableLcd
	//	call clearOam
	//	ld a,GFXH_LINK_WITH_ORACLE_AND_TWINROVA_END_SCENE
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_9e
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,MUS_DISASTER
	//	call playSound
	//	jp fadeinFromWhite

	//@state1:
	//	ld a,$01
	//	ld (wTextboxFlags),a
	//	ld a,$3c
	//	ld bc,TX_3d03
	//	jp endgameCutsceneHandler_09_stage0_body@stateDFunc0

	//@state2:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb5
	//	ld (hl),$d0
	//--
	//	ld hl,seasonsOamData_03_6472
	//-
	//	ld b,$30
	//	ld de,$cbb5
	//	ld a,(de)
	//	ld c,a
	//	jr +

	//@seasonsFunc_03_5aa2:
	//	ld hl,oamData_15_4da3
	//	ld e,:oamData_15_4da3
	//	ld bc,$3038
	//	xor a
	//	ldh (<hOamTail),a
	//	jp addSpritesFromBankToOam_withOffset

	//@seasonsFunc_03_5ab0:
	//	ld hl,seasonsOamData_03_65a4
	//	ld bc,$3038
	//+
	//	xor a
	//	ldh (<hOamTail),a
	//	jp addSpritesToOam_withOffset

	//@state3:
	//	ld hl,$cbb5
	//	inc (hl)
	//	jr nz,--
	//	call clearOam
	//	ld a,UNCMP_GFXH_0a
	//	call loadUncompressedGfxHeader
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	jp incCbc2

	//@state4:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb5
	//	ld (hl),$d0
	//@state4Func0:
	//	ld hl,seasonsOamData_03_650b
	//	jr -

	//@state5:
	//	call @state4Func0
	//	ld hl,$cbb5
	//	dec (hl)
	//	ld a,(hl)
	//	sub $a0
	//	ret nz
	//	ld (wScreenOffsetY),a
	//	ld (wScreenOffsetX),a
	//	ld a,$1e
	//	ld ($cbb3),a
	//	ld (wOpenedMenuType),a
	//	jp incCbc2

	//@state6:
	//	call @state4Func0
	//	call decCBB3
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$14
	//	ld bc,TX_3d04
	//	call endgameCutsceneHandler_09_stage0_body@stateBFunc0
	//	jp incCbc2

	//@state7:
	//	call @state4Func0
	//	call seasonsFunc_03_645a
	//	ret nz
	//	xor a
	//	ld (wOpenedMenuType),a
	//	dec a
	//	ld ($cbba),a
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	jp incCbc2

	//@state8:
	//	call @state4Func0
	//	ld hl,$cbb3
	//	ld b,$02
	//	call flashScreen
	//	ret z
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	call disableLcd
	//	call clearOam
	//	xor a
	//	ld ($ff00+R_VBK),a
	//	ld hl,$8000
	//	ld bc,$2000
	//	call clearMemoryBc
	//	xor a
	//	ld ($ff00+R_VBK),a
	//	ld hl,$9c00
	//	ld bc,$0400
	//	call clearMemoryBc
	//	ld a,$01
	//	ld ($ff00+R_VBK),a
	//	ld hl,$9c00
	//	ld bc,$0400
	//	call clearMemoryBc
	//	ld a,GFXH_TWINROVA_CLOSEUP
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_9c
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	jp clearPaletteFadeVariablesAndRefreshPalettes

	//@state9:
	//	call decCBB3
	//	ret nz
	//	ld a,CUTSCENE_S_CREDITS
	//	ld (wCutsceneIndex),a
	//	call seasonsFunc_03_646a
	//	ld hl,$cf00
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	ld hl,$ce00
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	ldh (<hCameraY),a
	//	ldh (<hCameraX),a
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,$03
	//	jp fadeoutToBlackWithDelay

	//;;
	//; CUTSCENE_S_ROOM_OF_RITES_COLLAPSE
	//endgameCutsceneHandler_0f:
	//	ld de,$cbc1
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw endgameCutsceneHandler_0f_stage0
	//	.dw endgameCutsceneHandler_0f_stage1

	//endgameCutsceneHandler_0f_stage0:
	//	call updateStatusBar
	//	call endgameCutsceneHandler_0f_stage0_body
	//	jp updateAllObjects

	//endgameCutsceneHandler_0f_stage0_body:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9
	//	.dw @stateA
	//	.dw @stateB
	//	.dw @stateC
	//	.dw @stateD

	//@state0:
	//	ld a,$01
	//	ld (de),a
	//	ld hl,wActiveRing
	//	ld (hl),$ff
	//	xor a
	//	ldh (<hActiveObjectType),a
	//	ld de,$d000
	//	ld bc,$f8f0
	//	ld a,$28
	//	call objectCreateExclamationMark
	//	ld a,$28
	//	call objectCreateExclamationMark
	//	ld l,Interaction.yh
	//	ld (hl),$30
	//	inc l
	//	inc l
	//	ld (hl),$78
	//	ld hl,$cbb3
	//	ld (hl),$0a
	//	ret

	//@state1:
	//	call decCBB3
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	jp incCbc2

	//@state2:
	//	call seasonsFunc_03_5cfb
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$96
	//	jp seasonsFunc_03_5d0b

	//@state3:
	//	call seasonsFunc_03_5cfb
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld bc,TX_3d0e
	//	jp showText

	//@state4:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld a,MUS_DISASTER
	//	call playSound
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp seasonsFunc_03_5d0b

	//@state5:
	//	call seasonsFunc_03_5cfb
	//	call decCBB3
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$5a
	//	jp incCbc2

	//@state6:
	//	call seasonsFunc_03_5cfb
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,SNDCTRL_STOPSFX
	//	jp playSound

	//@state7:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld bc,TX_3d0f
	//	jp showText

	//@state8:
	//	call seasonsFunc_03_645a
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$2c
	//	inc hl
	//	ld (hl),$01
	//	ld b,$03
	//	jp seasonsFunc_03_5d12

	//@state9:
	//	ld hl,$cbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld bc,TX_3d10
	//	jp showText

	//@stateA:
	//	ld e,$1e
	//	jp endgameCutsceneHandler_09_stage0_body@state16Func0

	//@stateB:
	//	call seasonsFunc_03_5cfb
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	call seasonsFunc_03_5d0b
	//	ld a,$8c
	//	ld ($cbb3),a
	//	ld a,$ff
	//	ld bc,$4478
	//	jp createEnergySwirlGoingOut

	//@stateC:
	//	call seasonsFunc_03_5cfb
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp seasonsFunc_03_5d0b

	//@stateD:
	//	call seasonsFunc_03_5cfb
	//	call decCBB3
	//	ret nz
	//	call incCbc1
	//	inc l
	//	xor a
	//	ld (hl),a
	//	ld a,$03
	//	jp fadeoutToWhiteWithDelay

	//seasonsFunc_03_5cfb:
	//	ld a,$04
	//	call setScreenShakeCounter

	//seasonsFunc_03_5d00:
	//	ld a,(wFrameCounter)
	//	and $0f
	//	ld a,SND_RUMBLE2
	//	jp z,playSound
	//	ret

	//seasonsFunc_03_5d0b:
	//	call getFreePartSlot
	//	ret nz
	//	ld (hl),PART_48
	//	ret

	//seasonsFunc_03_5d12:
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_MAKU_LEAF
	//	inc l
	//	ld (hl),$00
	//	inc l
	//	ld (hl),b
	//	ret

	//endgameCutsceneHandler_0f_stage1:
	//	call updateStatusBar
	//	call endgameCutsceneHandler_0f_stage1_body
	//	jp updateAllObjects

	//endgameCutsceneHandler_0f_stage1_body:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9
	//	.dw @stateA

	//@state0:
	//	call seasonsFunc_03_5cfb
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	xor a
	//	ld bc,ROOM_SEASONS_22b
	//	call disableLcdAndLoadRoom_body
	//	call refreshObjectGfx
	//	ld b,$0c
	//	call getEntryFromObjectTable1
	//	ld d,h
	//	ld e,l
	//	call parseGivenObjectData
	//	ld a,$04
	//	ld b,$02
	//	call seasonsFunc_03_642e
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld a,SNDCTRL_FAST_FADEOUT
	//	call playSound
	//	ld a,$02
	//	call loadGfxRegisterStateIndex
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp fadeinFromWhiteToRoom

	//@state1:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	ld a,$3c
	//	ld ($cbb3),a
	//	ld a,$64
	//	ld bc,$5850
	//	jp createEnergySwirlGoingIn

	//@state2:
	//	call decCBB3
	//	ret nz
	//	xor a
	//	ld ($cbb3),a
	//	dec a
	//	ld ($cbba),a
	//	jp incCbc2

	//@state3:
	//	ld hl,$cbb3
	//	ld b,$01
	//	call flashScreen
	//	ret z
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,$01
	//	ld ($cfc0),a
	//	ld a,$03
	//	jp fadeinFromWhiteWithDelay

	//@state4:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	ld a,$01
	//	ld (wLoadedTreeGfxIndex),a
	//	ld a,MUS_CREDITS_1
	//	call playSound
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp incCbc2

	//@state5:
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$2c
	//	inc hl
	//	ld (hl),$01
	//	ld b,$00
	//	jp seasonsFunc_03_5d12

	//@state6:
	//	ld hl,$cbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	ld a,$01
	//	ld (wLoadedTreeGfxIndex),a
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld hl,$cfc0
	//	ld (hl),$02
	//	jp incCbc2

	//@state7:
	//	ld a,($cfc0)
	//	cp $09
	//	ret nz
	//	call incCbc2
	//	ld a,$03
	//	jp fadeoutToWhiteWithDelay

	//@state8:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	call disableLcd
	//	call clearScreenVariablesAndWRAMBank1
	//	call hideStatusBar
	//	ld a,GFXH_SCENE_CREDITS_MAKUTREE
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_ad
	//	call loadPaletteHeader
	//	ld hl,$cbb3
	//	ld (hl),$f0
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	call endgameCutsceneHandler_09_stage1_body@seasonsFunc_03_5aa2
	//	ld a,$03
	//	jp fadeinFromWhiteWithDelay

	//@state9:
	//	call endgameCutsceneHandler_09_stage1_body@seasonsFunc_03_5aa2
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$10
	//	ld a,$03
	//	jp fadeoutToBlackWithDelay

	//@stateA:
	//	call endgameCutsceneHandler_09_stage1_body@seasonsFunc_03_5aa2
	//	call seasonsFunc_03_6462
	//	ret nz
	//	ld a,CUTSCENE_S_CREDITS
	//	ld (wCutsceneIndex),a
	//	call seasonsFunc_03_646a
	//	ld hl,$cf00
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	ld hl,$ce00
	//	ld bc,$00c0
	//	call clearMemoryBc
	//	xor a
	//	ldh (<hCameraY),a
	//	ldh (<hCameraX),a
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,SNDCTRL_MEDIUM_FADEOUT
	//	jp playSound

	//;;
	//; CUTSCENE_S_CREDITS
	//endgameCutsceneHandler_0a:
	//	call endgameCutsceneHandler_0a_body
	//	jp func_3539

	//endgameCutsceneHandler_0a_body:
	//	ld de,$cbc1
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw endgameCutsceneHandler_0a_stage0
	//	.dw endgameCutsceneHandler_0a_stage1
	//	.dw endgameCutsceneHandler_0a_stage2
	//	.dw endgameCutsceneHandler_0a_stage3

	//endgameCutsceneHandler_0a_stage0:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2

	//@state0:
	//	call seasonsFunc_03_6462
	//	ret nz
	//	call seasonsFunc_03_66dc
	//	call incCbc2
	//	call clearOam
	//	ld hl,$cbb3
	//	ld (hl),$b4
	//	inc hl
	//	ld (hl),$00
	//	ld hl,wGfxRegs1.LCDC
	//	set 3,(hl)
	//	ld a,MUS_CREDITS_2
	//	jp playSound

	//@state1:
	//	ld hl,$cbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	call incCbc2
	//	ld hl,$cbb3
	//	ld (hl),$48
	//	inc hl
	//	ld (hl),$03
	//	ld a,PALH_04
	//	call loadPaletteHeader
	//	ld a,$06
	//	jp fadeinFromBlackWithDelay

	//@state2:
	//	ld hl,$cbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	call incCbc1
	//	inc l
	//	ld (hl),a
	//	ld b,$04
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld b,$08
	//+
	//	ld hl,$cbb4
	//	ld (hl),b
	//	jp fadeoutToWhite

	//endgameCutsceneHandler_0a_stage1:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4

	//@state0:
	//	xor a
	//	ldh (<hOamTail),a
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call disableLcd
	//	call incCbc2
	//	call clearDynamicInteractions
	//	call clearOam
	//	ld a,$10
	//	ldh (<hOamTail),a
	//	ld a,($cbb4)
	//	sub $04
	//	ld hl,@state0Table0
	//	rst_addDoubleIndex
	//	ld b,(hl)
	//	inc hl
	//	ld a,(hl)
	//	or a
	//	jr z,++
	//	ld c,a
	//	ld a,$00
	//	call forceLoadRoom
	//	ld b,$2d
	//	ld a,($cbb4)
	//	cp $04
	//	jr nz,+
	//	ld b,UNCMP_GFXH_0f
	//+
	//	ld a,b
	//	call loadUncompressedGfxHeader
	//++
	//	ld a,($cbb4)
	//	sub $04
	//	add a
	//	add GFXH_CREDITS_SCENE1
	//	call loadGfxHeader
	//	ld a,PALH_0f
	//	call loadPaletteHeader
	//	call reloadObjectGfx
	//	call checkIsLinkedGame
	//	jr nz,+
	//	ld a,($cbb4)
	//	ld b,$10
	//	ld c,$00
	//	cp $05
	//	jr nz,++
	//	ld b,$50
	//	ld c,$0e
	//	jr ++
	//+
	//	ld a,($cbb4)
	//	ld b,$10
	//	ld c,$00
	//	cp $0b
	//	jr nz,++
	//	ld b,$ae
	//	ld c,$ff
	//++
	//	ld a,b
	//	push bc
	//	call loadPaletteHeader
	//	pop bc
	//	ld a,c
	//	ld (wTilesetAnimation),a
	//	call loadAnimationData
	//	ld a,$01
	//	ld (wScrollMode),a
	//	xor a
	//	ldh (<hCameraX),a
	//	ld b,$20
	//	ld hl,$cfc0
	//	call clearMemory
	//	ld hl,$cbb3
	//	ld (hl),$f0
	//	inc l
	//	ld b,(hl)
	//	call seasonsFunc_03_6405
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	jp fadeinFromWhite

	//@state0Table0:
	//	dwbe ROOM_SEASONS_0c6
	//	dwbe ROOM_SEASONS_12b
	//	dwbe ROOM_SEASONS_0b6
	//	dwbe ROOM_SEASONS_0d6
	//	dwbe $0000
	//	dwbe ROOM_SEASONS_12b
	//	dwbe $0000
	//	dwbe $0000

	//@state1:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld a,($cfdf)
	//	or a
	//	ret z
	//	call incCbc2
	//	ld a,$ff
	//	ld (wTilesetAnimation),a
	//	jp fadeoutToWhite

	//@state2:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	call disableLcd
	//	call clearWramBank1
	//	ld a,($cbb4)
	//	sub $04
	//	add a
	//	add GFXH_CREDITS_IMAGE1
	//	call loadGfxHeader
	//	ld hl,$cbb3
	//	ld (hl),$5a
	//	inc l
	//	ld a,(hl)
	//	add $9d
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,($cbb4)
	//	sub $04
	//	ld hl,@state2Table0
	//	rst_addAToHl
	//	ld a,(hl)
	//	ld (wGfxRegs1.SCX),a
	//	ld a,$10
	//	ldh (<hCameraX),a
	//	jp fadeinFromWhite
	//@state2Table0:
	//	.db $00 $d0
	//	.db $00 $d0
	//	.db $00 $d0
	//	.db $00 $d0

	//@state3:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call decCBB3
	//	ret nz
	//	call incCbc2
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_CREDITS_TEXT_HORIZONTAL
	//	inc l
	//	ld a,($cbb4)
	//	sub $04
	//	ldi (hl),a
	//	ld (hl),$00
	//	ret

	//@state4:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	xor a
	//	ldh (<hOamTail),a
	//	ld a,($cfde)
	//	or a
	//	ret z
	//	ld b,$07
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld b,$0b
	//+
	//	ld hl,$cbb4
	//	ld a,(hl)
	//	cp b
	//	jr nc,+
	//	inc (hl)
	//	xor a
	//	ld ($cbc2),a
	//	jr ++
	//+
	//	call seasonsFunc_03_646a
	//	call enableActiveRing
	//	ld a,$02
	//	ld ($cbc1),a
	//	ld hl,wLinkMaxHealth
	//	ldd a,(hl)
	//	ld (hl),a ; [wLinkHealth]
	//	xor a
	//	ld l,<wInventoryB
	//	ldi (hl),a
	//	ld (hl),a ; [wInventoryA]
	//	ld l,<wActiveRing
	//	ld (hl),$ff
	//++
	//	jp fadeoutToWhite

	//endgameCutsceneHandler_0a_stage2:
	//	xor a
	//	ldh (<hOamTail),a
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8

	//@state0:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	call disableLcd
	//	call clearDynamicInteractions
	//	call clearOam
	//	xor a
	//	ld ($cfde),a
	//	ld a,GFXH_CREDITS_SCROLL
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_a0
	//	call loadPaletteHeader
	//	ld a,$09
	//	call loadGfxRegisterStateIndex
	//	call fadeinFromWhite
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_CREDITS_TEXT_VERTICAL
	//	ld l,Interaction.yh
	//	ld (hl),$e8
	//	inc l
	//	inc l
	//	ld (hl),$50
	//	ret

	//@state1:
	//	ld a,($cfde)
	//	or a
	//	ret z
	//	ld hl,$cbb3
	//	ld (hl),$e0
	//	inc hl
	//	ld (hl),$01
	//	jp incCbc2

	//@state2:
	//	ld hl,$cbb3
	//	call decHlRef16WithCap
	//	ret nz
	//	call checkIsLinkedGame
	//	jr nz,+
	//	call seasonsFunc_03_646a
	//	ld a,$03
	//	ld ($cbc1),a
	//	ld a,$04
	//	jp fadeoutToWhiteWithDelay
	//+
	//	ld a,$04
	//	ld ($cbb3),a
	//	ld a,(wGfxRegs1.SCY)
	//	ldh (<hCameraY),a
	//	ld a,UNCMP_GFXH_01
	//	call loadUncompressedGfxHeader
	//	ld a,PALH_0b
	//	call loadPaletteHeader
	//	ld b,$03
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_INTRO_SPRITES_1
	//	inc l
	//	ld (hl),$09
	//	inc l
	//	dec b
	//	ld (hl),b
	//	jr nz,-
	//+
	//	jp incCbc2

	//@state3:
	//	ld a,(wGfxRegs1.SCY)
	//	or a
	//	jr nz,+
	//	ld a,$78
	//	ld ($cbb3),a
	//	jp incCbc2
	//+
	//	call decCBB3
	//	ret nz
	//	ld (hl),$04
	//	ld hl,wGfxRegs1.SCY
	//	dec (hl)
	//	ld a,(hl)
	//	ldh (<hCameraY),a
	//	ret

	//@state4:
	//	call decCBB3
	//	ret nz
	//	ld a,$ff
	//	ld ($cbba),a
	//	jp incCbc2

	//@state5:
	//	ld hl,$cbb3
	//	ld b,$01
	//	call flashScreen
	//	ret z
	//	call disableLcd
	//	ld a,GFXH_CREDITS_LINKED_WAVING_GOODBYE
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_9f
	//	call loadPaletteHeader
	//	call clearDynamicInteractions
	//	ld b,$03
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_cf
	//	inc l
	//	dec b
	//	ld (hl),b
	//	jr nz,-
	//+
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,$04
	//	call fadeinFromWhiteWithDelay
	//	call incCbc2
	//	ld a,$f0
	//	ld ($cbb3),a

	//@seasonsFunc_03_616f:
	//	xor a
	//	ldh (<hOamTail),a
	//	ld a,(wGfxRegs1.SCY)
	//	cp $60
	//	jr nc,+
	//	cpl
	//	inc a
	//	ld b,a
	//	ld a,(wFrameCounter)
	//	and $01
	//	jr nz,+
	//	ld c,a
	//	ld hl,seasonsOamData_03_6641
	//	call addSpritesToOam_withOffset
	//+
	//	ld a,(wGfxRegs1.SCY)
	//	cpl
	//	inc a
	//	ld b,$c7
	//	add b
	//	ld b,a
	//	ld c,$38
	//	ld hl,seasonsOamData_03_668a
	//	push bc
	//	call addSpritesToOam_withOffset
	//	pop bc
	//	ld a,(wGfxRegs1.SCY)
	//	cp $60
	//	ret c
	//	ld hl,seasonsOamData_03_66bf
	//	jp addSpritesToOam_withOffset

	//@state6:
	//	call @seasonsFunc_03_616f
	//	call seasonsFunc_03_6462
	//	ret nz
	//	ld a,$04
	//	ld ($cbb3),a
	//	jp incCbc2

	//@state7:
	//	ld a,(wGfxRegs1.SCY)
	//	cp $98
	//	jr nz,+
	//	ld a,$f0
	//	ld ($cbb3),a
	//	call incCbc2
	//	jr ++
	//+
	//	call decCBB3
	//	jr nz,++
	//	ld (hl),$04
	//	ld hl,wGfxRegs1.SCY
	//	inc (hl)
	//	ld a,(hl)
	//	ldh (<hCameraY),a
	//	cp $60
	//	jr nz,++
	//	call clearDynamicInteractions
	//	ld a,UNCMP_GFXH_2c
	//	call loadUncompressedGfxHeader
	//++
	//	jp @seasonsFunc_03_616f

	//@state8:
	//	call @seasonsFunc_03_616f
	//	call decCBB3
	//	ret nz
	//	call seasonsFunc_03_646a
	//	ld a,$03
	//	ld ($cbc1),a
	//	ld a,$04
	//	jp fadeoutToWhiteWithDelay

	//endgameCutsceneHandler_0a_stage3:
	//	ld de,$cbc2
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9
	//	.dw @stateA
	//	.dw @stateB

	//@state0:
	//	call checkIsLinkedGame
	//	call nz,endgameCutsceneHandler_0a_stage2@seasonsFunc_03_616f
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call disableLcd
	//	call incCbc2
	//	call seasonsFunc_03_66ed
	//	call clearDynamicInteractions
	//	call clearOam
	//	call checkIsLinkedGame
	//	jp z,@state0Func0
	//	ld a,GFXH_CREDITS_LINKED_THE_END
	//	call loadGfxHeader
	//	ld a,$aa
	//	call loadPaletteHeader
	//	ld hl,objectData.objectData5887
	//	call parseGivenObjectData
	//	jr +
	//@state0Func0:
	//	ld a,GFXH_CREDITS_THE_END
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_a9
	//	call loadPaletteHeader
	//+
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	xor a
	//	ld hl,hCameraY
	//	ldi (hl),a
	//	ldi (hl),a
	//	ldi (hl),a
	//	ld (hl),a
	//	ld hl,$cbb3
	//	ld (hl),$f0
	//	ld (hl),a
	//	ld a,SNDCTRL_MEDIUM_FADEOUT
	//	call playSound
	//	ld a,$04
	//	jp fadeinFromWhiteWithDelay

	//@state1:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//@state1Func0:
	//	call checkIsLinkedGame
	//	ret z
	//	ld hl,$cbb4
	//	ld a,(hl)
	//	or a
	//	jr z,+
	//	dec (hl)
	//	ret
	//+
	//	ld a,SND_WAVE
	//	call playSound
	//	call getRandomNumber_noPreserveVars
	//	and $03
	//	ld hl,@state1Table0
	//	rst_addAToHl
	//	ld a,(hl)
	//	ld ($cbb4),a
	//	ret
	//@state1Table0:
	//	.db $a0 $c8
	//	.db $10 $f0

	//@state2:
	//	call @state1Func0
	//	call decCBB3
	//	ret nz
	//	call incCbc2

	//@state3:
	//	call @state1Func0
	//	ld hl,wFileIsLinkedGame
	//	ldi a,(hl)
	//	add (hl)
	//	cp $02
	//	ret z
	//	ld a,(wKeysJustPressed)
	//	and (BTN_START|BTN_A|BTN_B)
	//	ret z
	//	call incCbc2
	//	jp fadeoutToWhite

	//@state4:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCbc2
	//	call disableLcd
	//	call bank3.generateGameTransferSecret
	//	ld a,$ff
	//	ld ($cbba),a
	//	ld a,($ff00+R_SVBK)
	//	push af
	//	ld a,:w7d800
	//	ld ($ff00+R_SVBK),a
	//	ld hl,w7SecretText1
	//	ld de,w7d800
	//	ld bc,$1800
	//-
	//	ldi a,(hl)
	//	call copyTextCharacterGfx
	//	dec b
	//	jr nz,-
	//	pop af
	//	ld ($ff00+R_SVBK),a
	//	ld a,GFXH_SECRET_FOR_LINKED_GAME
	//	call loadGfxHeader
	//	ld a,UNCMP_GFXH_2b
	//	call loadUncompressedGfxHeader
	//	ld a,PALH_05
	//	call loadPaletteHeader
	//	call checkIsLinkedGame
	//	ld a,GFXH_HEROS_SECRET_TEXT
	//	call nz,loadGfxHeader
	//	call clearDynamicInteractions
	//	call clearOam
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	call fileSelect_redrawDecorations
	//	jp fadeinFromWhite

	//@state5:
	//	call fileSelect_redrawDecorations
	//	call seasonsFunc_03_6462
	//	ret nz
	//	ld hl,$cbb3
	//	ld b,$3c
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld b,$b4
	//+
	//	ld (hl),b
	//	jp incCbc2

	//@state6:
	//	call fileSelect_redrawDecorations
	//	call decCBB3
	//	ret nz
	//	call checkIsLinkedGame
	//	jr nz,+
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_GAME_COMPLETE_DIALOG
	//	xor a
	//	ld ($cfde),a
	//+
	//	jp incCbc2

	//@state7:
	//	call fileSelect_redrawDecorations
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld a,(wKeysJustPressed)
	//	and BTN_A
	//	jr nz,++
	//	ret
	//+
	//	ld a,($cfde)
	//	or a
	//	ret z
	//++
	//	call incCbc2
	//	ld a,SNDCTRL_FAST_FADEOUT
	//	call playSound
	//	jp fadeoutToWhite

	//@state8:
	//	call fileSelect_redrawDecorations
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call checkIsLinkedGame
	//	jp nz,resetGame
	//	call disableLcd
	//	call clearOam
	//	call incCbc2
	//	ld a,GFXH_TO_BE_CONTINUED
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_8f
	//	call loadPaletteHeader
	//	call fadeinFromWhite
	//	ld a,$04
	//	jp loadGfxRegisterStateIndex

	//@state9:
	//	call @state9Func0
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$b4
	//	jp incCbc2
	//@state9Func0:
	//	ld hl,oamData_15_4e0c
	//	ld e,:oamData_15_4e0c
	//	ld bc,$3038
	//	xor a
	//	ldh (<hOamTail),a
	//	jp addSpritesFromBankToOam_withOffset

	//@stateA:
	//	call @state9Func0
	//	ld hl,$cbb3
	//	ld a,(hl)
	//	or a
	//	jr z,+
	//	dec (hl)
	//	ret
	//+
	//	ld a,(wKeysJustPressed)
	//	and BTN_A
	//	ret z
	//	call incCbc2
	//	jp fadeoutToWhite

	//@stateB:
	//	call @state9Func0
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	jp resetGame

	//;;
	//; Similar to ages' version of this function
	//;
	//disableLcdAndLoadRoom_body:
	//	ld (wRoomStateModifier),a
	//	ld a,b
	//	ld (wActiveGroup),a
	//	ld a,c
	//	ld (wActiveRoom),a
	//	call disableLcd
	//	call clearScreenVariablesAndWRAMBank1
	//	ld hl,wLinkInAir
	//	ld b,wcce9-wLinkInAir
	//	call clearMemory

	//seasonsFunc_03_63eb:
	//	call initializeVramMaps
	//	call loadScreenMusicAndSetRoomPack
	//	call loadTilesetData
	//	call loadTilesetGraphics
	//	call func_131f
	//	ld a,$01
	//	ld (wScrollMode),a
	//	call loadCommonGraphics
	//	jp clearOam

	//seasonsFunc_03_6405:
	//	ld a,b
	//	cp $ff
	//	ret z
	//	push bc
	//	call refreshObjectGfx
	//	pop bc
	//	call getEntryFromObjectTable1
	//	ld d,h
	//	ld e,l
	//	call parseGivenObjectData
	//	xor a
	//	ld ($cfc0),a
	//	ld a,($cbb4)
	//	cp $05
	//	jr z,+
	//	cp $06
	//	jr z,++
	//	cp $07
	//	jr z,+++
	//	ret
	//+
	//	ld a,$04
	//	ld b,$03

	//seasonsFunc_03_642e:
	//	call seasonsFunc_03_6434
	//	jp reloadObjectGfx

	//seasonsFunc_03_6434:
	//	ld hl,wLoadedObjectGfx
	//-
	//	ldi (hl),a
	//	inc a
	//	ld (hl),$01
	//	inc l
	//	dec b
	//	jr nz,-
	//	ret
	//++
	//	ld a,$0f
	//	ld b,$06
	//	jr seasonsFunc_03_642e
	//+++
	//	ld a,$13
	//	ld b,$02
	//	jr seasonsFunc_03_642e

	//seasonsFunc_03_644c:
	//	ld (wRoomStateModifier),a
	//	call disableLcd
	//	call seasonsFunc_03_63eb
	//	ld a,$02
	//	jp loadGfxRegisterStateIndex

	//seasonsFunc_03_645a:
	//	ld a,(wTextIsActive)
	//	or a
	//	ret nz
	//	jp decCBB3

	//seasonsFunc_03_6462:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	jp decCBB3

	//seasonsFunc_03_646a:
	//	ld hl,$cbb3
	//	ld b,$10
	//	jp clearMemory

	//.include {"{GAME_DATA_DIR}/creditsOamData.s"}

	//seasonsFunc_03_66dc:
	//	ld hl,wLinkHealth
	//	ld (hl),$04
	//	ld l,<wInventoryB
	//	ldi a,(hl)
	//	ld b,(hl)
	//	ld hl,wcc1f
	//	ldi (hl),a
	//	ld (hl),b
	//	jp disableActiveRing

	//seasonsFunc_03_66ed:
	//	ld hl,wLinkMaxHealth
	//	ldd a,(hl)
	//	ld (hl),a
	//	ld hl,wcc1f
	//	ldi a,(hl)
	//	ld b,(hl)
	//	ld hl,wInventoryB
	//	ldi (hl),a
	//	ld (hl),b
	//	jp enableActiveRing

	//	;;
	//	; CUTSCENE_S_PIRATES_DEPART
	//	cutsceneHandler_0c:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw cutsceneHandler_0c_stage0 ; initial
	//		.dw cutsceneHandler_0c_stage1 ; digging through subrosia
	//		.dw cutsceneHandler_0c_stage2 ; inside ship
	//		.dw cutsceneHandler_0c_stage3 ; out in samasa desert
	//		.dw cutsceneHandler_0c_stage4 ; back inside ship
	//		.dw cutsceneHandler_0c_stage5 ; approaching west coast

	//	cutsceneHandler_0c_stage0:
	//		ld b,$10
	//		ld hl,$cbb3
	//		call clearMemory
	//		call clearWramBank1
	//		xor a
	//		ld (wDisabledObjects),a
	//		ld (wScrollMode),a
	//		ld a,(wGfxRegs2.SCY)
	//		ld ($cbba),a
	//		ld a,$80
	//		ld (wMenuDisabled),a
	//		ld a,$01
	//		ld (wCutsceneState),a
	//		ret

	//	cutsceneHandler_0c_stage1:
	//		call seasonsFunc_03_6b6c
	//		ld a,(wFrameCounter)
	//		and $07
	//		ret nz
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4
	//		.dw @state5

	//	@state0:
	//		call incCbb3
	//		ld a,$08
	//		ld ($cbb8),a
	//		ld a,$04
	//		ld ($cbb4),a
	//		ld a,GFXH_PIRATE_SHIP_LEAVING_SUBROSIA_LAYOUT
	//		call loadGfxHeader
	//		ld a,GFXH_PIRATE_SHIP_MOVING_EXTRA_TILES
	//		call loadGfxHeader
	//		ld a,$04
	//		ldh (<hNextLcdInterruptBehaviour),a
	//		call seasonsFunc_03_681a
	//		jp seasonsFunc_03_67f8
	//	@state0Func0:
	//		ld hl,@subrosianSandReplacementPositions
	//		ld d,$0f
	//	-
	//		ldi a,(hl)
	//		ld c,a
	//		ld a,$0f
	//		push hl
	//		call setTile
	//		pop hl
	//		dec d
	//		jr nz,-
	//		ret
	//	@subrosianSandReplacementPositions:
	//		.db $04 $05 $06 $07 $08
	//		.db $14 $15 $16 $17 $18
	//		.db $24 $25 $26 $27 $28

	//	@state1:
	//		ld hl,$cbb4
	//		dec (hl)
	//		ret nz
	//		ld bc,TX_4e00
	//		call showText
	//		call @state0Func0
	//		jp incCbb3

	//	@state2:
	//		call retIfTextIsActive
	//		ld hl,objectData.objectData_sandPuffsFromShipDigging
	//		call parseGivenObjectData
	//		ld a,MUS_TRIUMPHANT
	//		call playSound
	//		jp incCbb3

	//	@state3:
	//		call incCbbfAndCbb8
	//		ld a,(hl)
	//		cp $10
	//		jr c,+
	//		call seasonsFunc_03_681a
	//		jr nz,+
	//		call incCbb3
	//	+
	//		jp seasonsFunc_03_67f8

	//	@state4:
	//		call incCbbfAndCbb8
	//		ld a,(hl)
	//		cp $30
	//		jr c,seasonsFunc_03_67f8
	//		call fadeoutToWhite
	//		call incCbb3
	//		jr seasonsFunc_03_67f8

	//	@state5:
	//		call incCbbfAndCbb8
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		jr nz,seasonsFunc_03_67f8
	//		ld a,$c7
	//		ld (wGfxRegs1.WINY),a
	//		ld (wGfxRegs2.WINY),a
	//		ld a,$03
	//		ldh (<hNextLcdInterruptBehaviour),a
	//		ld a,$02
	//	seasonsFunc_03_67e9:
	//		ld (wCutsceneState),a
	//		xor a
	//		ld ($cfc0),a
	//		ld b,$10
	//		ld hl,$cbb3
	//		jp clearMemory

	//	seasonsFunc_03_67f8:
	//		ld a,$40
	//		ld (wGfxRegs2.LYC),a
	//		ld a,$47
	//		ld (wGfxRegs2.WINX),a
	//		ld a,$a5
	//		ld (wGfxRegs1.WINX),a
	//		ld a,($cbb8)
	//		ld (wGfxRegs2.WINY),a
	//		ld (wGfxRegs1.WINY),a
	//		ld ($cbbc),a
	//		jr seasonsFunc_03_684c

	//	incCbb3:
	//		ld hl,$cbb3
	//		inc (hl)
	//		ret

	//	seasonsFunc_03_681a:
	//		ld a,($cbb7)
	//		ld hl,seasonsTable_03_6844
	//		rst_addAToHl
	//		ld a,(hl)
	//		cp $ff
	//		ret z
	//		ld l,a
	//		ld h,$d0
	//		push hl
	//		ld de,$9c00
	//		ld bc,$0f02
	//		call queueDmaTransfer
	//		pop hl
	//		set 2,h
	//		ld e,$01
	//		call queueDmaTransfer
	//		ld a,$08
	//		ld ($cbb8),a
	//		ld hl,$cbb7
	//		inc (hl)
	//		ret

	//	seasonsTable_03_6844:
	//		.db $c0 $a0 $80 $60
	//		.db $40 $20 $00 $ff

	//	seasonsFunc_03_684c:
	//		ld a,$02
	//		ld ($ff00+R_SVBK),a
	//		ld a,($cbb8)
	//		and $07
	//		ld hl,$d800
	//		rst_addDoubleIndex
	//		ld de,$d9e0
	//		ld b,$10
	//		call copyMemory
	//		ld a,($cbb8)
	//		and $07
	//		ld hl,$d820
	//		rst_addDoubleIndex
	//		ld de,$d9f0
	//		ld b,$10
	//		call copyMemory
	//		ld a,$00
	//		ld ($ff00+R_SVBK),a
	//		ld hl,$d9e0
	//		ld de,$94e1
	//		ld bc,$0102
	//		jp queueDmaTransfer

	//	cutsceneHandler_0c_stage2:
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2

	//	@seasonsFunc_03_688c:
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		call incCbb3
	//		ld bc,ROOM_SEASONS_5d4
	//		call cutsceneHandler_0c_stage3@loadNewRoom
	//		ld hl,w1Link.enabled
	//		ld (hl),$03
	//		ld l,<w1Link.yh
	//		ld (hl),$58
	//		ld l,<w1Link.xh
	//		ld (hl),$70
	//		ld l,<w1Link.direction
	//		ld (hl),$02
	//		xor a
	//		ld (wLinkForceState),a
	//		ld a,$01
	//		ld (wScreenShakeMagnitude),a
	//		call resetCamera
	//		ld a,$02
	//		jp cutsceneHandler_0c_stage3@state0Func1

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call @seasonsFunc_03_688c
	//		ld hl,objectData.objectData_insidePirateShipLeavingSubrosia
	//		jp parseGivenObjectData

	//	@state1:
	//		ret

	//	@state2:
	//		ld a,$03
	//		call seasonsFunc_03_67e9
	//		jp fadeoutToWhite

	//	cutsceneHandler_0c_stage3:
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		call incCbb3
	//		ld a,$40
	//		ld ($cbb8),a
	//		ld ($cbbf),a
	//		ld a,$1e
	//		ld ($cbb4),a
	//		ld a,$01
	//		ld (wRoomStateModifier),a
	//		ld bc,ROOM_SEASONS_0fe
	//		call @loadNewRoom
	//		call @state0Func2
	//		ld e,$0c
	//		call loadObjectGfxHeaderToSlot4
	//		ld a,GFXH_PIRATE_SHIP_LEAVING_DESERT_LAYOUT
	//		call loadGfxHeader
	//		ld hl,objectData.objectData_leavingSamasaDesert
	//		call parseGivenObjectData
	//		ld a,$11
	//		jr @state0Func1
	//	@loadNewRoom:
	//		ld a,b
	//		ld (wActiveGroup),a
	//		ld a,c
	//		ld (wActiveRoom),a
	//		call loadScreenMusicAndSetRoomPack
	//		call loadTilesetData
	//		call loadTilesetGraphics
	//		jp func_131f
	//	@state0Func1:
	//		push af
	//		ld a,$01
	//		ld (wScrollMode),a
	//		call fadeinFromWhite
	//		call loadCommonGraphics
	//		pop af
	//		jp loadGfxRegisterStateIndex
	//	@state0Func2:
	//		ld hl,@state0Table0
	//	-
	//		ldi a,(hl)
	//		cp $ff
	//		ret z
	//		ld c,a
	//		ldi a,(hl)
	//		push hl
	//		call setTile
	//		pop hl
	//		jr -
	//	@state0Table0:
	//		; position - tile - position - tile
	//		.db $05 $ad $06 $ad
	//		.db $08 $ae $09 $ae
	//		.db $15 $ad $16 $ad
	//		.db $18 $ae $19 $ae
	//		.db $25 $ad $26 $ad
	//		.db $28 $ae $29 $ae
	//		.db $35 $ad $36 $ad
	//		.db $38 $ae $39 $ae
	//		.db $ff

	//	@state1:
	//		ld hl,$cbb4
	//		dec (hl)
	//		ret nz
	//		call incCbb3
	//		xor a
	//		ldh (<hCameraY),a
	//		ldh (<hCameraX),a
	//		ld bc,TX_4e09
	//		jp showText

	//	@state2:
	//		call retIfTextIsActive
	//		ld a,$ff
	//		ld ($cfc0),a
	//		jp incCbb3

	//	@state3:
	//		ld a,(wFrameCounter)
	//		and $07
	//		ret nz
	//		call incCbbfAndCbb8
	//		ld a,(hl)
	//		cp $70
	//		jr c,seasonsFunc_03_69d1
	//		call fadeoutToWhite
	//		ld a,$fb
	//		call playSound
	//		call incCbb3
	//		jr seasonsFunc_03_69d1

	//	@state4:
	//		ld a,(wFrameCounter)
	//		and $07
	//		ret nz
	//		call incCbbfAndCbb8
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		jr nz,seasonsFunc_03_69d1
	//		ld a,$c7
	//		ld (wGfxRegs1.WINY),a
	//		ld (wGfxRegs2.WINY),a
	//		ld a,$04
	//		ld (wCutsceneState),a
	//		ld b,$10
	//		ld hl,$cbb3
	//		jp clearMemory

	//	seasonsFunc_03_69d1:
	//		ld a,$a5
	//		ld (wGfxRegs1.WINX),a
	//		ld a,($cbb8)
	//		ld (wGfxRegs2.WINY),a
	//		ld (wGfxRegs1.WINY),a
	//		ld ($cbbc),a
	//		ret

	//	cutsceneHandler_0c_stage4:
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call cutsceneHandler_0c_stage2@seasonsFunc_03_688c
	//		xor a
	//		ld ($cfc0),a
	//		ld hl,objectData.objectData_sickPiratiansInShip
	//		jp parseGivenObjectData

	//	@state1:
	//		ret

	//	@state2:
	//		ld a,$05
	//		call seasonsFunc_03_67e9
	//		jp fadeoutToWhite

	//	cutsceneHandler_0c_stage5:
	//		call seasonsFunc_03_6b6c
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		call incCbb3
	//		ld a,$90
	//		ld ($cbb8),a
	//		ld ($cbbf),a
	//		ld a,$10
	//		ld ($cbbd),a
	//		ld a,$03
	//		ld (wRoomStateModifier),a
	//		ld bc,ROOM_SEASONS_0f2
	//		call cutsceneHandler_0c_stage3@loadNewRoom
	//		ld a,$ff
	//		ld ($cd25),a
	//		ld e,$00
	//		call loadObjectGfxHeaderToSlot4
	//		ld a,GFXH_PIRATE_SHIP_ARRIVING_LAYOUT
	//		call loadGfxHeader
	//		ld a,GFXH_PIRATE_SHIP_MOVING_EXTRA_TILES
	//		call loadGfxHeader
	//		ld hl,objectData.objectData_pirateShipEnteringWestCoast
	//		call parseGivenObjectData
	//		ld a,$12
	//		jp cutsceneHandler_0c_stage3@state0Func1

	//	@state1:
	//		ld a,(wFrameCounter)
	//		and $03
	//		jr nz,@state1Func0
	//		call decCbbfAndCbb8
	//		ld a,(hl)
	//		cp $09
	//		jp nc,@state1Func0
	//		call seasonsFunc_03_6b30
	//		call incCbb3
	//	@state1Func0:
	//		call seasonsFunc_03_69d1
	//		jr seasonsFunc_03_6aca

	//	@state2:
	//		ld a,(wFrameCounter)
	//		and $07
	//		jr nz,@state1Func0
	//		call decCbbfAndCbb8
	//		ld a,(hl)
	//		cp $09
	//		jr nc,@state1Func0
	//		call seasonsFunc_03_6b30
	//		jr nz,@state1Func0
	//		ld a,GLOBALFLAG_PIRATE_SHIP_DOCKED
	//		call setGlobalFlag
	//		xor a
	//		ld (wActiveMusic),a
	//		ld hl,@state2WarpDestVariables
	//		jp setWarpDestVariables
	//	@state2WarpDestVariables:
	//		m_HardcodedWarpA ROOM_SEASONS_0e2 $0f $66 $03

	//	seasonsFunc_03_6a9d:
	//		ld a,$02
	//		ld ($ff00+R_SVBK),a
	//		ld a,($cbbe)
	//		dec a
	//		and $03
	//		ld hl,seasonsTable_03_6b1a
	//		rst_addDoubleIndex
	//		ldi a,(hl)
	//		ld h,(hl)
	//		ld l,a
	//		ld a,($cbb8)
	//		and $07
	//		rst_addDoubleIndex
	//		ld de,$d9e0
	//		call seasonsFunc_03_6b22
	//		ld a,$00
	//		ld ($ff00+R_SVBK),a
	//		ld hl,$d9e0
	//		ld de,$8ce0
	//		ld bc,$0102
	//		jp queueDmaTransfer

	//	seasonsFunc_03_6aca:
	//		ld hl,$cbbd
	//		dec (hl)
	//		jr nz,seasonsFunc_03_6a9d
	//		ld (hl),$10
	//		ld a,$02
	//		ld ($ff00+R_SVBK),a
	//		ld a,($cbbe)
	//		ld hl,seasonsTable_03_6b1a
	//		rst_addDoubleIndex
	//		ldi a,(hl)
	//		ld h,(hl)
	//		ld l,a
	//		ld de,$d9c0
	//		push hl
	//		call seasonsFunc_03_6b22
	//		pop hl
	//		ld a,($cbb8)
	//		and $07
	//		rst_addDoubleIndex
	//		ld de,$d9e0
	//		call seasonsFunc_03_6b22
	//		ld a,$00
	//		ld ($ff00+R_SVBK),a
	//		ld hl,$d9c0
	//		ld de,$88e1
	//		ld bc,$0102
	//		call queueDmaTransfer
	//		ld hl,$d9e0
	//		ld de,$8ce0
	//		ld bc,$0102
	//		call queueDmaTransfer
	//		ld a,($cbbe)
	//		inc a
	//		and $03
	//		ld ($cbbe),a
	//		ret

	//	seasonsTable_03_6b1a:
	//		.db $40 $d8
	//		.db $80 $d8
	//		.db $c0 $d8
	//		.db $00 $d9

	//	seasonsFunc_03_6b22:
	//		ld b,$10
	//		call copyMemory
	//		ld bc,$0010
	//		add hl,bc
	//		ld b,$10
	//		jp copyMemory

	//	seasonsFunc_03_6b30:
	//		ld a,($cbb7)
	//		ld hl,seasonsTable_03_6b59
	//		rst_addDoubleIndex
	//		ldi a,(hl)
	//		cp $ff
	//		ret z
	//		ld h,(hl)
	//	label_03_196:
	//		ld l,a
	//		push hl
	//		ld de,$9c00
	//		ld bc,$2102
	//		call queueDmaTransfer
	//		pop hl
	//		set 2,h
	//		ld e,$01
	//		call queueDmaTransfer
	//		ld a,$10
	//		ld ($cbb8),a
	//		ld hl,$cbb7
	//		inc (hl)
	//		ret

	//	seasonsTable_03_6b59:
	//		.db $20 $d0
	//		.db $40 $d0
	//		.db $60 $d0
	//		.db $80 $d0
	//		.db $a0 $d0
	//		.db $c0 $d0
	//		.db $e0 $d0
	//		.db $00 $d1
	//		.db $20 $d1
	//		.db $ff

	//	seasonsFunc_03_6b6c:
	//		ld hl,oamData_03_6b72
	//		jp addSpritesToOam

	//	oamData_03_6b72:
	//		.db $01
	//		.db $10 $a6 $4c $09

	//	incCbbfAndCbb8:
	//		ld hl,$cbbf
	//		inc (hl)
	//		ld hl,$cbb8
	//		inc (hl)
	//		ret

	//	decCbbfAndCbb8:
	//		ld hl,$cbbf
	//		dec (hl)
	//		ld hl,$cbb8
	//		dec (hl)
	//		ret

	//	;;
	//	; CUTSCENE_S_VOLCANO_ERUPTING
	//	cutsceneHandler_0b:
	//		ld a,(wCutsceneState)
	//		rst_jumpTable
	//		.dw cutsceneHandler_0b_stage0
	//		.dw cutsceneHandler_0b_stage1
	//		.dw cutsceneHandler_0b_stage2
	//		.dw cutsceneHandler_0b_stage3
	//		.dw cutsceneHandler_0b_stage4
	//		.dw cutsceneHandler_0b_stage5

	//	cutsceneHandler_0b_stage0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		ld a,$03
	//		ld (wRoomStateModifier),a
	//		ld bc,ROOM_SEASONS_103
	//		call seasonsFunc_03_6de4
	//		ld a,$78
	//		ld ($cbb4),a
	//		ld a,$01
	//		ld (wCutsceneState),a
	//		xor a
	//		ld ($cbb3),a
	//		ld a,MUS_DISASTER
	//		ld (wActiveMusic),a
	//		call playSound
	//		ld a,SND_OPENING
	//		call playSound
	//		ld a,$01
	//		ld (wScrollMode),a
	//		call fadeinFromWhite
	//		call loadCommonGraphics
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex

	//	cutsceneHandler_0b_stage1:
	//		call seasonsFunc_03_6df8
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call seasonsFunc_03_6ddf
	//		ret nz
	//		ld a,$b0
	//		call playSound
	//		ld hl,$cbb4
	//		ld (hl),$96
	//		inc hl
	//		ld (hl),$01
	//		ld hl,$cbb3
	//		inc (hl)

	//	@state1:
	//		ld bc,$1478
	//		ld hl,$cbb5
	//		call seasonsFunc_03_6db1
	//		call seasonsFunc_03_6ddf
	//		ret nz
	//		ld a,$81
	//		ld (wScreenTransitionDirection),a
	//		ld hl,$cbb3
	//		inc (hl)

	//	@state2:
	//		ld a,(wScrollMode)
	//		and $04
	//		ret z
	//		ld a,$04
	//		ld (wActiveRoom),a
	//		callab bank1.setObjectsEnabledTo2
	//		call loadScreenMusicAndSetRoomPack
	//		call loadTilesetData
	//		call loadTilesetAndRoomLayout
	//		call generateVRAMTilesWithRoomChanges
	//		ld a,$08
	//		ld (wScrollMode),a
	//		ld hl,$cbb3
	//		inc (hl)

	//	@state3:
	//		ld a,(wScrollMode)
	//		and $01
	//		ret z
	//		callab bank1.clearObjectsWithEnabled2
	//		ld hl,$cbb4
	//		ld (hl),$96
	//		inc hl
	//		ld (hl),$01
	//		inc hl
	//		ld (hl),$01
	//		ld a,SND_OPENING
	//		call playSound

	//	seasonsFunc_03_6c5f:
	//		ld hl,wCutsceneState
	//		inc (hl)
	//		ld hl,$cbb3
	//		ld (hl),$00
	//		ret

	//	cutsceneHandler_0b_stage2:
	//		call seasonsFunc_03_6df8
	//		ld bc,$1430
	//		ld hl,$cbb5
	//		call seasonsFunc_03_6db1
	//		ld bc,$1488
	//		ld hl,$cbb6
	//		call seasonsFunc_03_6db1
	//		ld hl,$cbb4
	//		dec (hl)
	//		ret nz
	//		call seasonsFunc_03_6c5f
	//		jp fastFadeoutToWhite

	//	cutsceneHandler_0b_stage3:
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw @state1
	//		.dw @state2
	//		.dw @state3
	//		.dw @state4

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call setScreenShakeCounter
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		ld bc,ROOM_SEASONS_015
	//		call seasonsFunc_03_6de4
	//		ld a,$1e
	//		ld ($cbb4),a
	//		ld hl,$cbb3
	//		inc (hl)
	//		jp seasonsFunc_03_6d9f

	//	@state1:
	//		call seasonsFunc_03_6ddf
	//		ret nz
	//		call seasonsFunc_03_6df8
	//		ld hl,$cbb4
	//		ld (hl),$78
	//		inc hl
	//		ld (hl),$01
	//		ld hl,$cbb3
	//		inc (hl)

	//	@state2:
	//		ld hl,$cbb5
	//		call seasonsFunc_03_6dcb
	//		call seasonsFunc_03_6ddf
	//		ret nz
	//		call seasonsFunc_03_6df8
	//		ld hl,$cbb3
	//		inc (hl)
	//		ld a,$02
	//		call fadeoutToWhiteWithDelay

	//	@state3:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call seasonsFunc_03_6d8b
	//		call getFreeInteractionSlot
	//		jr nz,+
	//		ld (hl),INTERAC_MISCELLANEOUS_2
	//		inc l
	//		ld (hl),$0e
	//	+
	//		ld hl,$cbb3
	//		inc (hl)
	//		ld hl,$cbb4
	//		ld (hl),$78
	//		call seasonsFunc_03_6df8

	//	@state4:
	//		ld hl,$cbb5
	//		call seasonsFunc_03_6dcb
	//		call seasonsFunc_03_6ddf
	//		ret nz
	//		call seasonsFunc_03_6c5f
	//		ld a,$02
	//		jp fadeoutToWhiteWithDelay

	//	cutsceneHandler_0b_stage4:
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw cutsceneHandler_0b_stage3@state1
	//		.dw cutsceneHandler_0b_stage3@state2
	//		.dw cutsceneHandler_0b_stage3@state3
	//		.dw cutsceneHandler_0b_stage3@state4

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call setScreenShakeCounter
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		ld a,GLOBALFLAG_TEMPLE_REMAINS_FILLED_WITH_LAVA
	//		call unsetGlobalFlag
	//		ld bc,ROOM_SEASONS_027
	//		call seasonsFunc_03_6de4
	//		ld a,$1e
	//		ld ($cbb4),a
	//		ld hl,$cbb3
	//		inc (hl)
	//		jp seasonsFunc_03_6d9f

	//	cutsceneHandler_0b_stage5:
	//		ld a,($cbb3)
	//		rst_jumpTable
	//		.dw @state0
	//		.dw cutsceneHandler_0b_stage3@state1
	//		.dw cutsceneHandler_0b_stage3@state2
	//		.dw cutsceneHandler_0b_stage3@state3
	//		.dw @state4

	//	@state0:
	//		ld a,(wPaletteThread_mode)
	//		or a
	//		ret nz
	//		call setScreenShakeCounter
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		ld a,GLOBALFLAG_TEMPLE_REMAINS_FILLED_WITH_LAVA
	//		call unsetGlobalFlag
	//		ld bc,ROOM_SEASONS_017
	//		call seasonsFunc_03_6de4
	//		ld a,$1e
	//		ld ($cbb4),a
	//		ld hl,$cbb3
	//		inc (hl)
	//		jp seasonsFunc_03_6d9f

	//	@state4:
	//		ld hl,$cbb5
	//		call seasonsFunc_03_6dcb
	//		call seasonsFunc_03_6ddf
	//		ret nz
	//		ld hl,@warpDestVariables
	//		jp setWarpDestVariables
	//	@warpDestVariables:
	//		m_HardcodedWarpA ROOM_SEASONS_4ef $00 $69 $03

	//	seasonsFunc_03_6d8b:
	//		call disableLcd
	//		call clearScreenVariablesAndWRAMBank1
	//		ld a,GLOBALFLAG_TEMPLE_REMAINS_FILLED_WITH_LAVA
	//		call setGlobalFlag
	//		call loadTilesetData
	//		call loadTilesetGraphics
	//		call func_131f

	//	seasonsFunc_03_6d9f:
	//		ld a,$01
	//		ld (wScrollMode),a
	//		ld a,$02
	//		call fadeinFromWhiteWithDelay
	//		call loadCommonGraphics
	//		ld a,$02
	//		jp loadGfxRegisterStateIndex

	//	seasonsFunc_03_6db1:
	//		dec (hl)
	//		ret nz
	//		call getRandomNumber
	//		and $0f
	//		add $08
	//		ld (hl),a
	//		call getFreePartSlot
	//		ret nz
	//		ld (hl),PART_VOLCANO_ROCK
	//		inc l
	//		ld (hl),$01
	//		ld l,Part.yh
	//		ld (hl),b
	//		ld l,Part.xh
	//		ld (hl),c
	//		ret

	//	seasonsFunc_03_6dcb:
	//		dec (hl)
	//		ret nz
	//		call getRandomNumber
	//		and $0f
	//		add $08
	//		ld (hl),a
	//		call getFreePartSlot
	//		ret nz
	//		ld (hl),PART_VOLCANO_ROCK
	//		inc l
	//		ld (hl),$02
	//		ret

	//	seasonsFunc_03_6ddf:
	//		ld hl,$cbb4
	//		dec (hl)
	//		ret

	//	seasonsFunc_03_6de4:
	//		ld a,b
	//		ld (wActiveGroup),a
	//		ld a,c
	//		ld (wActiveRoom),a
	//		call loadScreenMusicAndSetRoomPack
	//		call loadTilesetData
	//		call loadTilesetGraphics
	//		jp func_131f

	//	seasonsFunc_03_6df8:
	//		ld a,$ff
	//		jp setScreenShakeCounter

	//; TODO: Some of this file is probably shared with the Ages version? Should try to merge them as
	//; much as possible.

	//;;
	//; CUTSCENE_S_FLAME_OF_DESTRUCTION
	//flameOfDestructionCutsceneBody:
	//	ld a,(wCutsceneState)
	//	rst_jumpTable
	//	.dw bank3Cutscene_state0
	//	.dw flameOfDestructionCutscene_state1

	//;;
	//; CUTSCENE_S_ZELDA_VILLAGERS
	//zeldaAndVillagersCutsceneBody:
	//	ld a,(wCutsceneState)
	//	rst_jumpTable
	//	.dw bank3Cutscene_state0
	//	.dw zeldaAndVillagersCutscene_state1

	//;;
	//; CUTSCENE_S_ZELDA_KIDNAPPED
	//zeldaKidnappedCutsceneBody:
	//	ld a,(wCutsceneState)
	//	rst_jumpTable
	//	.dw bank3Cutscene_state0
	//	.dw zeldaKidnappedCutscene_state1

	//bank3Cutscene_state0:
	//	ld b,$10
	//	ld hl,wGenericCutscene.cbb3
	//	call clearMemory
	//	call clearWramBank1
	//	xor a
	//	ld (wDisabledObjects),a
	//	ld a,$80
	//	ld (wMenuDisabled),a
	//	ld a,$01
	//	ld (wCutsceneState),a
	//	ret

	//flameOfDestructionCutscene_state1:
	//	ld a,(wGenericCutscene.cbb3)
	//	rst_jumpTable
	//	.dw @fadeToBlack
	//	.dw @roomOfRitesStart
	//	.dw @flashScreen
	//	.dw @changePalettes
	//	.dw @startCutsceneText08
	//	.dw @startFadeInAndLightTorch
	//	.dw @createSomeObjects
	//	.dw @startCutsceneText09
	//	.dw @startCutsceneText0a
	//	.dw @startCutsceneText0b
	//	.dw @startCutsceneText0c
	//	.dw @finish

	//@fadeToBlack:
	//	ld a,$28
	//	ld (wGenericCutscene.cbb5),a
	//	call fastFadeoutToBlack
	//	jp incTmpcbb3

	//@roomOfRitesStart:
	//	call waitUntilFadeIsDone
	//	ret nz
	//	call bank3CutsceneLoadRoomOfRites
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_TWINROVA_FLAME
	//	inc l
	//	ld (hl),$03
	//+
	//	ld a,$13
	//	call loadGfxRegisterStateIndex
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	xor a
	//	ld (wGenericCutscene.cbb5),a
	//	ld (wGenericCutscene.cbb6),a
	//	dec a
	//	ld (wGenericCutscene.cbba),a
	//	call incTmpcbb3

	//@flashScreen:
	//	ld hl,wGenericCutscene.cbb5
	//	ld b,$04
	//	call flashScreen
	//	ret z
	//	call clearPaletteFadeVariablesAndRefreshPalettes
	//	jp incTmpcbb3

	//@changePalettes:
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_TWINROVA_FLAME
	//	inc l
	//	ld (hl),$04
	//+
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	ld a,$04
	//	ld (wGenericCutscene.cbb5),a
	//	call clearFadingPalettes2
	//	ld a,$ef
	//	ldh (<hSprPaletteSources),a
	//	ldh (<hDirtySprPalettes),a
	//	jp incTmpcbb3

	//@startCutsceneText08:
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret nz
	//	ld a,$04
	//	ld (wTextboxFlags),a
	//	ld c,<TX_5008
	//	jp showCutscene50xxText

	//@fadeInAndLightTorch:
	//	call fastFadeinFromBlack
	//	ld a,b
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	xor a
	//	ld (wDirtyFadeBgPalettes),a
	//	ld (wFadeBgPaletteSources),a
	//	ld a,SND_LIGHTTORCH
	//	jp playSound

	//@startFadeInAndLightTorch:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld b,$40
	//	call @fadeInAndLightTorch
	//	ld a,$1e
	//	ld (wGenericCutscene.cbb5),a
	//	jp incTmpcbb3

	//@createSomeObjects:
	//	call waitUntilFadeIsDone
	//	ret nz
	//	call fadeinFromBlack
	//	ld a,$af
	//	ld (wDirtyFadeSprPalettes),a
	//	ld (wFadeSprPaletteSources),a
	//	xor a
	//	ld ($cfc6),a
	//	call cutscene_func_03_72af
	//	call loadInteracIdb4_subid6And7
	//	ld a,MUS_DISASTER
	//	ld (wActiveMusic),a
	//	call playSound
	//	ld a,$1e
	//	ld (wGenericCutscene.cbb5),a
	//	jp incTmpcbb3

	//@startCutsceneText09:
	//	call waitUntilFadeIsDone
	//	ret nz
	//	ld c,<TX_5009
	//	jp showCutscene50xxText

	//@startCutsceneText0a:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_500a
	//	jp showCutscene50xxText

	//@startCutsceneText0b:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_500b
	//	jp showCutscene50xxText

	//@startCutsceneText0c:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_500c
	//	call showCutscene50xxText
	//	ld a,$3c
	//	ld (wGenericCutscene.cbb5),a
	//	ret

	//@finish:
	//	call waitUntilTextInactive
	//	ret nz
	//	xor a
	//	ld (wMenuDisabled),a
	//	ld a,GLOBALFLAG_FLAMES_OF_DESTRUCTION_SEEN
	//	call setGlobalFlag
	//	ld a,$03
	//	ld (wRoomStateModifier),a
	//	ld hl,@warpDest
	//	call setWarpDestVariables
	//	ld a,PALH_0f
	//	jp loadPaletteHeader

	//@warpDest:
	//	; d5 overworld entrance
	//	m_HardcodedWarpA ROOM_SEASONS_08a, $00, $25, $83


	//zeldaAndVillagersCutscene_state1:
	//	ld a,(wGenericCutscene.cbb3)
	//	rst_jumpTable
	//	.dw @start
	//	.dw @loadImpaRoomAndMusic
	//	.dw @waitUntilFadeInDone
	//	.dw @waitToFadeOut
	//	.dw @loadSokraRoomAndMusic
	//	.dw @waitUntilFadeInDone2
	//	.dw @finish

	//@start:
	//	call fadeoutToWhite
	//	jp incTmpcbb3

	//@loadImpaRoomAndMusic:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld a,$03
	//	; outside impa's house
	//	ld bc,ROOM_SEASONS_0b6
	//	call disableLcdAndLoadRoom_body
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld a,MUS_TRIUMPHANT
	//	ld (wActiveMusic),a
	//	call playSound
	//	ld a,$02
	//	call loadGfxRegisterStateIndex
	//	xor a
	//	call loadGroupOfInteractions
	//	call fadeinFromWhite
	//	jp incTmpcbb3

	//@waitUntilFadeInDone:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	jp incTmpcbb3

	//@waitToFadeOut:
	//	ld a,($cfc0)
	//	bit 1,a
	//	ret z
	//	call fadeoutToWhite
	//	jp incTmpcbb3

	//@loadSokraRoomAndMusic:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	; horon village Sokra screen
	//	ld bc,ROOM_SEASONS_0e9
	//	call disableLcdAndLoadRoom_body
	//	ld a,SNDCTRL_STOPSFX
	//	call playSound
	//	ld a,$02
	//	call loadGfxRegisterStateIndex
	//	call clearWramBank1
	//	ld a,$01
	//	call loadGroupOfInteractions
	//	call fadeinFromWhite
	//	jp incTmpcbb3

	//@waitUntilFadeInDone2:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld c,<TX_5010
	//	jp showCutscene50xxText

	//@finish:
	//	call waitUntilTextInactive
	//	ret nz
	//	xor a
	//	ld (wMenuDisabled),a
	//	ld a,GLOBALFLAG_ZELDA_VILLAGERS_SEEN
	//	call setGlobalFlag
	//	ld hl,@warpDest
	//	jp setWarpDestVariables

	//@warpDest:
	//	; first room of d8
	//	m_HardcodedWarpA ROOM_SEASONS_587, $93 $ff $01


	//zeldaKidnappedCutscene_state1:
	//	call zeldaKidnappedCutscene_state1Handler
	//	ld hl,wGenericCutscene.cbb3
	//	ld a,(hl)
	//	cp $10
	//	jp c,updateStatusBar
	//	ret

	//zeldaKidnappedCutscene_state1Handler:
	//	ld a,(wGenericCutscene.cbb3)
	//	rst_jumpTable
	//	.dw @startByFadingOut
	//	.dw @loadSokraRoomAndInteractions
	//	.dw @waitUntilRoomLoaded
	//	.dw @startCutsceneText11
	//	.dw @func4
	//	.dw @func5
	//	.dw @startCutsceneText12
	//	.dw @startCutsceneText13
	//	.dw @startCutsceneText14
	//	.dw @func9
	//	.dw @funca
	//	.dw @funcb
	//	.dw @startCutsceneText16
	//	.dw @startCutsceneText17
	//	.dw @funce
	//	.dw @funcf

	//	; stop calling updateStatusBar above
	//	.dw @loadRoomOfRitesAndInteractions
	//	.dw @startCutsceneText18
	//	.dw @startCutsceneText19
	//	.dw @startCutsceneText1a
	//	.dw @finish

	//@startByFadingOut:
	//	call fadeoutToWhite
	//	jp incTmpcbb3

	//@loadSokraRoomAndInteractions:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	; horon village Sokra screen
	//	ld bc,ROOM_SEASONS_0e9
	//	call disableLcdAndLoadRoom_body
	//	ld a,$02
	//	call loadGfxRegisterStateIndex
	//	call restartSound
	//	ld a,$02
	//	call loadGroupOfInteractions
	//	call fadeinFromWhite
	//	ld a,$3c
	//	ld (wGenericCutscene.cbb5),a
	//	jp incTmpcbb3

	//@waitUntilRoomLoaded:
	//	call waitUntilFadeIsDone
	//	ret nz
	//	ld hl,$cfc0
	//	set 7,(hl)
	//	ld a,$ff
	//	ld (wGenericCutscene.cbb5),a
	//	jp incTmpcbb3

	//@startCutsceneText11:
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret nz
	//	ld c,<TX_5011
	//	call showCutscene50xxText
	//	ld a,$5a
	//	ld (wGenericCutscene.cbb5),a
	//	ret

	//@func4:
	//	call waitUntilTextInactive
	//	jr z,+
	//	ld a,$3c
	//	cp (hl)
	//	ret nz
	//	ld hl,$cfc0
	//	set 6,(hl)
	//	ret
	//+
	//	ld hl,$cfc0
	//	set 5,(hl)
	//	ld a,$3c
	//	ld (wGenericCutscene.cbb5),a
	//	jp incTmpcbb3

	//@func5:
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret nz
	//	ld a,$1e
	//	ld (wGenericCutscene.cbb5),a
	//	xor a
	//	ld ($cfc6),a
	//	call cutscene_func_03_72af
	//	call loadInteracIdb4_subid2And3
	//	ld a,$21
	//	ld (wActiveMusic),a
	//	call playSound
	//	jp incTmpcbb3

	//@startCutsceneText12:
	//	ld a,($cfc0)
	//	bit 0,a
	//	ret z
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret nz
	//	ld c,<TX_5012
	//	jp showCutscene50xxText

	//@startCutsceneText13:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_5013
	//	jp showCutscene50xxText

	//@startCutsceneText14:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_5014
	//	jp showCutscene50xxText

	//@func9:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld hl,$cfc0
	//	res 0,(hl)
	//	jp incTmpcbb3

	//@funca:
	//	ld a,($cfc0)
	//	bit 0,a
	//	ret z
	//	xor a
	//	ld (wGenericCutscene.cbb4),a
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	call incTmpcbb3

	//@funcb:
	//	call zeldaKidnappedFlashFadeoutToWhite
	//	ret nz
	//	call clearWramBank1
	//	ld hl,$cfc0
	//	res 0,(hl)
	//	xor a
	//	ld ($cfc6),a
	//	call loadInteracIdb4_subid4And5
	//	ld a,$04
	//	call fadeinFromWhiteWithDelay
	//	ld a,$1e
	//	ld (wGenericCutscene.cbb5),a
	//	jp incTmpcbb3

	//@startCutsceneText16:
	//	call waitUntilFadeIsDone
	//	ret nz
	//	ld c,<TX_5016
	//	jp showCutscene50xxText

	//@startCutsceneText17:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_5017
	//	jp showCutscene50xxText

	//@funce:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld hl,$cfc0
	//	set 0,(hl)
	//	ld a,$3c
	//	ld (wGenericCutscene.cbb5),a
	//	ld a,$bb
	//	call playSound
	//	jp incTmpcbb3

	//@funcf:
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret nz
	//	call fadeoutToWhite
	//	jp incTmpcbb3

	//@loadRoomOfRitesAndInteractions:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call bank3CutsceneLoadRoomOfRites
	//	call loadInteracIdb0
	//	ld a,$f1
	//	call playSound
	//	xor a
	//	ld ($cfc6),a
	//	call loadInteracIdb4_subid6And7
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_TWINROVA_FLAME
	//+
	//	ld a,$13
	//	call loadGfxRegisterStateIndex
	//	call fadeinFromBlack
	//	ld a,$1e
	//	ld (wGenericCutscene.cbb5),a
	//	jp incTmpcbb3

	//@startCutsceneText18:
	//	call waitUntilFadeIsDone
	//	ret nz
	//	ld c,<TX_5018
	//	jp showCutscene50xxText

	//@startCutsceneText19:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_5019
	//	jp showCutscene50xxText

	//@startCutsceneText1a:
	//	call waitUntilTextInactive
	//	ret nz
	//	ld c,<TX_501a
	//	jp showCutscene50xxText

	//@finish:
	//	call waitUntilTextInactive
	//	ret nz
	//	xor a
	//	ld (wMenuDisabled),a
	//	ld a,GLOBALFLAG_ZELDA_KIDNAPPED_SEEN
	//	call setGlobalFlag
	//	ld a,$03
	//	ld (wRoomStateModifier),a
	//	ld hl,@warpDest
	//	jp setWarpDestVariables

	//@warpDest:
	//    ; 1st screen on path to Onox?
	//	.db $c0 $23 $00 $45 $83


	//zeldaKidnappedFlashFadeoutToWhite:
	//	ld a,(wGenericCutscene.cbb4)
	//	rst_jumpTable
	//	.dw @func0
	//	.dw @func1
	//	.dw @func1
	//	.dw @func3
	//	.dw @func4
	//	.dw @func5
	//@func0:
	//	ld a,$0a
	//--
	//	ld (wGenericCutscene.cbb5),a
	//	call clearFadingPalettes
	//	jp incTmpcbb4
	//@func1:
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret nz
	//	ld a,$0a
	//-
	//	ld (wGenericCutscene.cbb5),a
	//	call fastFadeoutToWhite
	//	jp incTmpcbb4
	//@func3:
	//	ld a,$14
	//	jr --
	//@func4:
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret nz
	//	ld a,$1e
	//	jr -
	//@func5:
	//	jp waitUntilFadeIsDone

	//showCutscene50xxText:
	//	ld b,$50
	//	call showText
	//	ld a,$1e
	//	ld (wGenericCutscene.cbb5),a

	//incTmpcbb3:
	//	ld hl,wGenericCutscene.cbb3
	//	inc (hl)
	//	ret

	//incTmpcbb4:
	//	ld hl,wGenericCutscene.cbb4
	//	inc (hl)
	//	ret

	//waitUntilTextInactive:
	//	ld a,(wTextIsActive)
	//	or a
	//	ret nz
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret

	//waitUntilFadeIsDone:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld hl,wGenericCutscene.cbb5
	//	dec (hl)
	//	ret

	//bank3CutsceneLoadRoomOfRites:
	//	xor a
	//	; Room of Rites
	//	ld bc,ROOM_ZELDA_IN_FINAL_DUNGEON
	//	call disableLcdAndLoadRoom_body
	//	ld a,PALH_ac
	//	call loadPaletteHeader
	//	ld a,$28
	//	ld (wGfxRegs1.SCX),a
	//	ld (wGfxRegs2.SCX),a
	//	ldh (<hCameraX),a
	//	ld a,$00
	//	ld (wScrollMode),a
	//	ld a,$10
	//	ldh (<hOamTail),a
	//	jp clearWramBank1

	//loadInteracIdb0:
	//	ld b,$02
	//-
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_TWINROVA_FLAME
	//	inc l
	//	ld a,$02
	//	add b
	//	dec b
	//	ld (hl),a
	//	jr nz,-
	//	ret

	//loadGroupOfInteractions:
	//	ld hl,@interacGroupTable
	//	rst_addDoubleIndex
	//	ldi a,(hl)
	//	ld b,(hl)
	//	ld c,a
	//-
	//	ld a,(bc)
	//	or a
	//	ret z
	//	call getFreeInteractionSlot
	//	ret nz

	//	; load Interaction's id
	//	ld a,(bc)
	//	ldi (hl),a

	//	; load Interaction's subid
	//	inc bc
	//	ld a,(bc)
	//	ldi (hl),a

	//	; load Interaction's var03 in
	//	inc bc
	//	ld a,(bc)
	//	ldi (hl),a

	//	inc bc
	//	ld l,Interaction.yh
	//	ld a,(bc)
	//	ld (hl),a

	//	inc bc
	//	ld l,Interaction.xh
	//	ld a,(bc)
	//	ld (hl),a

	//	inc bc
	//	jr -

	//@interacGroupTable:
	//	.dw @interacGroup1
	//	.dw @interacGroup2
	//	.dw @interacGroup3

	//	; id - subid - var03 - yh - xh
	//@interacGroup1:
	//	.db INTERAC_ZELDA $02 $00 $18 $18
	//	.db $00
	//@interacGroup2:
	//	.db INTERAC_bd $00 $01 $28 $38
	//	.db INTERAC_be $00 $01 $40 $38
	//	.db INTERAC_ZELDA $03 $00 $20 $50
	//	.db INTERAC_bc $00 $00 $48 $50
	//	.db INTERAC_ba $00 $03 $28 $68
	//	.db INTERAC_bb $00 $00 $40 $68
	//	.db $00
	//@interacGroup3:
	//	.db INTERAC_bd $00 $01 $2c $38
	//	.db INTERAC_be $00 $00 $44 $40
	//	.db INTERAC_ZELDA $03 $00 $20 $50
	//	.db INTERAC_bc $00 $00 $50 $58
	//	.db INTERAC_ba $00 $02 $20 $64
	//	.db INTERAC_bb $00 $03 $38 $68
	//	.db $00

	//cutscene_func_03_72af:
	//	ld a,$01
	//	ld (wLoadedTreeGfxIndex),a
	//	ld a,$b4
	//	ld (wInteractionIDToLoadExtraGfx),a
	//	ret

	//loadInteracIdb4_subid2And3:
	//	ld bc,loadInteracIdb4@subid2
	//	call loadInteracIdb4
	//	ld bc,loadInteracIdb4@subid3
	//	jr loadInteracIdb4

	//loadInteracIdb4_subid4And5:
	//	ld bc,loadInteracIdb4@subid4
	//	call loadInteracIdb4
	//	ld bc,loadInteracIdb4@subid5
	//	jr loadInteracIdb4

	//loadInteracIdb4_subid6And7:
	//	ld bc,loadInteracIdb4@subid6
	//	call loadInteracIdb4
	//	ld bc,loadInteracIdb4@subid7

	//loadInteracIdb4:
	//	call getFreeInteractionSlot
	//	ret nz
	//	ld (hl),INTERAC_b4
	//	inc l
	//	ld a,(bc)
	//	inc bc
	//	ld (hl),a
	//	ld l,Interaction.yh
	//	ld a,(bc)
	//	inc bc
	//	ld (hl),a
	//	ld l,Interaction.xh
	//	ld a,(bc)
	//	ld (hl),a
	//	ret

	//	; subid - yh - xh
	//	@subid2:
	//	.db $02 $00 $40
	//	@subid3:
	//	.db $03 $00 $60
	//	@subid4:
	//	.db $04 $50 $68
	//	@subid5:
	//	.db $05 $50 $38
	//	@subid6:
	//	.db $06 $4c $8e
	//	@subid7:
	//	.db $07 $4c $62

	//; TODO: this is more than just intro cutscenes, rename this

	//multiIntroCutsceneHandler:
	//	ld a,e
	//	rst_jumpTable
	//	.dw cutsceneDinDancing
	//	.dw cutsceneDinImprisoned
	//	.dw cutsceneTempleSinking
	//	.dw cutscenePregameIntro
	//	.dw cutsceneOnoxTaunting

	//cutsceneDinDancing:
	//	call cutsceneDinDancingHandler
	//	ld hl,wCutsceneState
	//	ld a,(hl)
	//	cp $02
	//	ret z
	//	cp $03
	//	ret z
	//	jp updateAllObjects

	//cutsceneDinDancingHandler:
	//	ld de,wCutsceneState
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw cutscene06Func0
	//	.dw cutscene06Func1
	//	.dw cutscene06Func2 ; don't updateAllObjects
	//	.dw cutscene06Func3 ; don't updateAllObjects
	//	.dw cutscene06Func4
	//	.dw cutscene06Func5
	//	.dw cutscene06Func6
	//	.dw cutscene06Func7
	//	.dw cutscene06Func8
	//	.dw cutscene06Func9
	//	.dw cutscene06Funca
	//	.dw cutscene06Funcb
	//	.dw cutscene06Funcc
	//	.dw cutscene06Funcd
	//	.dw cutscene06Funce
	//	.dw cutscene06Funcf
	//cutscene06Func0:
	//	ld a,$01
	//	ld (de),a
	//	ld a,SND_CLOSEMENU
	//	call playSound
	//cutscene06Func1:
	//	ld a,$ff
	//	ld (wTilesetAnimation),a
	//	ld a,$01
	//	ld ($cfd0),a
	//	ld hl,$cc02
	//	ld (hl),$01
	//	ld hl,$d01a
	//	res 7,(hl)
	//	call saveGraphicsOnEnterMenu
	//	ld a,GFXH_DIN_DANCING_CUTSCENE
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_95
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld hl,$cbb3
	//	ld (hl),$58
	//	inc hl
	//	ld (hl),$02
	//	ld hl,$cbb6
	//	ld (hl),$28
	//	call fastFadeinFromWhite
	//	call incCutsceneState2
	//	ld hl,$cbb5
	//	ld (hl),$02
		
	//seasonsFunc_03_7386:
	//	call clearOam
	//	ld b,$00
	//	ld a,(wGfxRegs1.SCX)
	//	cpl
	//	inc a
	//	ld c,a
	//	ld hl,seasonsOamData_03_7397
	//	jp addSpritesToOam_withOffset

	//seasonsOamData_03_7397:
	//	.db $24
	//	.db $51 $3f $1e $06
	//	.db $40 $0c $08 $01
	//	.db $4f $0c $28 $01
	//	.db $5c $30 $20 $02
	//	.db $5c $38 $22 $01
	//	.db $4c $3f $04 $01
	//	.db $50 $4a $06 $02
	//	.db $40 $14 $0a $01
	//	.db $4f $14 $2a $01
	//	.db $61 $64 $0c $01
	//	.db $61 $6c $0e $01
	//	.db $71 $64 $2c $01
	//	.db $71 $6c $2e $01
	//	.db $88 $38 $10 $00
	//	.db $69 $50 $26 $04
	//	.db $69 $48 $24 $04
	//	.db $4c $2f $00 $01
	//	.db $4c $37 $02 $01
	//	.db $53 $30 $12 $05
	//	.db $53 $38 $14 $05
	//	.db $11 $86 $42 $03
	//	.db $17 $88 $16 $04
	//	.db $37 $a2 $30 $04
	//	.db $37 $aa $32 $04
	//	.db $21 $9f $18 $05
	//	.db $21 $a7 $1a $05
	//	.db $22 $9e $1c $03
	//	.db $73 $b0 $34 $04
	//	.db $73 $b8 $36 $04
	//	.db $3a $9c $38 $03
	//	.db $3b $2b $3a $03
	//	.db $3b $33 $3c $03
	//	.db $40 $42 $3e $03
	//	.db $70 $80 $40 $03
	//	.db $90 $34 $44 $06
	//	.db $90 $3c $46 $06

	//cutscene06Func2:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	jp nz,seasonsFunc_03_7386
	//	call seasonsFunc_03_7458
	//	call seasonsFunc_03_7386
	//	ld hl,$cbb3
	//	call decHlRef16WithCap
	//	jr z,+
	//	ldi a,(hl)
	//	ld h,(hl)
	//	ld l,a
	//	ld bc,$00f0
	//	call compareHlToBc
	//	ret nc
	//	ld a,($c482)
	//	and $01
	//	ret z
	//+
	//	ld a,SND_CLOSEMENU
	//	call playSound
	//	call incCutsceneState2
	//	jp fastFadeoutToWhite
		
	//seasonsFunc_03_7458:
	//	ld a,(wFrameCounter)
	//	and $07
	//	ret nz
	//	ld hl,$cbb6
	//	ld a,(hl)
	//	or a
	//	ret z
	//	dec (hl)
	//	ld hl,$c487
	//	inc (hl)
	//	ret
	//cutscene06Func3:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	jp nz,seasonsFunc_03_7386
	//	xor a
	//	ld (wTilesetAnimation),a
	//	ld hl,$d01a
	//	set 7,(hl)
	//	xor a
	//	ld ($cfd0),a
	//	call incCutsceneState2
	//	jp reloadGraphicsOnExitMenu

	//cutscene06Func4:
	//	ld a,($cfd0)
	//	cp $02
	//	ret nz
	//	ld hl,$cbb4
	//	xor a
	//	ld (hl),a
	//	call seasonsFunc_03_74aa
	//	ld hl,$de90
	//	ld bc,$44e8
	//	call func_13c6
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	jp incCutsceneState2

	//seasonsFunc_03_74a3:
	//	call decCBB3
	//	ret nz
	//	inc l
	//	inc (hl)
	//	ld a,(hl)
		
	//seasonsFunc_03_74aa:
	//	ld d,h
	//	ld e,l
	//	add a
	//	ld hl,seasonsTable_03_74d1
	//	rst_addDoubleIndex
	//	dec e
	//	ldi a,(hl)
	//	ld (de),a
	//	inc a
	//	ret z

	//seasonsFunc_03_74b6:
	//	ld d,h
	//	ld e,l
	//	call getFreePartSlot
	//	jr nz,+
	//	ld (hl),PART_LIGHTNING
	//	ld l,Part.subid
	//	inc (hl)
	//	inc l
	//	ld a,(de)
	//	ld (hl),a
	//	inc de
	//	ld l,Part.yh
	//	ld a,(de)
	//	ldi (hl),a
	//	inc de
	//	inc hl
	//	ld a,(de)
	//	ld (hl),a
	//+
	//	or $01
	//	ret

	//seasonsTable_03_74d1:
	//	.db $3c $00 $50 $20
	//	.db $3c $01 $70 $58
	//	.db $28 $00 $40 $80
	//	.db $28 $00 $18 $30
	//	.db $1e $02 $10 $80
	//	.db $1e $00 $40 $48
	//	.db $14 $00 $20 $70
	//	.db $14 $04 $78 $88
	//	.db $14 $08 $70 $70
	//	.db $14 $00 $40 $40
	//	.db $ff

	//seasonsTable_03_74fa:
	//	.db $10 $70 $18
		
	//cutscene06Func5:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld hl,$cfd0
	//	ld (hl),$03
	//	call seasonsFunc_03_7516
	//	call seasonsFunc_03_74a3
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp incCutsceneState2

	//seasonsFunc_03_7516:
	//	ld de,$cfd2
	//	ld b,$03
	//-
	//	ld a,(de)
	//	ld c,a
	//	ld a,b
	//	ld hl,bitTable
	//	add l
	//	ld l,a
	//	ld a,(hl)
	//	and c
	//	call nz,cutsceneDinDancing_loadListOfTiles
	//	dec b
	//	bit 7,b
	//	jr z,-
	//	ret

	//;;
	//; @param	b	index of tile list in table below
	//cutsceneDinDancing_loadListOfTiles:
	//	xor c
	//	ld (de),a
	//	push bc
	//	push de
	//	ld a,b
	//	ld hl,@tileListTable
	//	rst_addDoubleIndex
	//	ldi a,(hl)
	//	ld h,(hl)
	//	ld l,a
	//	ld b,(hl)
	//	inc hl
	//-
	//	ld c,(hl)
	//	inc hl
	//	ld e,c
	//	ld d,$cf
	//	ld a,(de)
	//	push bc
	//	push hl
	//	call setTile
	//	pop hl
	//	pop bc
	//	dec b
	//	jr nz,-
	//	pop de
	//	pop bc
	//	ret
	//@tileListTable:
	//	.dw @tileList1
	//	.dw @tileList2
	//	.dw @tileList3
	//	.dw @tileList4
	//	; numTiles -> list of tile indices
	//@tileList1:
	//	.db $02 $65 $75
	//@tileList2:
	//	.db $03 $07 $08 $18
	//@tileList3:
	//	.db $01	$78
	//@tileList4:
	//	.db $04 $66 $67 $76 $77
		
	//cutscene06Func6:
	//	call decCBB3
	//	ret nz
	//	call incCutsceneState2
	//	ld bc,$0c08
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld bc,$0c12
	//+
	//	jp showText
		
	//cutscene06Func7:
	//	call retIfTextIsActive
	//	call incCutsceneState2
	//	ld hl,seasonsTable_03_74fa
	//	jp seasonsFunc_03_74b6
		
	//cutscene06Func8:
	//	ld hl,$cfd2
	//	ld a,(hl)
	//	bit 4,a
	//	ret z
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_DIN_DANCING_EVENT
	//	inc l
	//	ld (hl),$07
	//+
	//	jp incCutsceneState2
		
	//cutscene06Func9:
	//	ld c,$09
	//	call checkIsLinkedGame
	//	jr z,+
	//	ld c,$13
	//+
	//	ld a,$05

	//seasonsFunc_03_75a5:
	//	ld b,a
	//	ld hl,$cfd0
	//	ld a,(hl)
	//	cp b
	//	ret nz
	//	call incCutsceneState2
	//	ld b,$0c
	//	jp showText
		
	//cutscene06Funca:
	//	call retIfTextIsActive
	//	ld hl,$cfd0
	//	ld (hl),$06
	//	jp incCutsceneState2
		
	//cutscene06Funcb:
	//	ld a,$08
	//	ld c,$14
	//	jp seasonsFunc_03_75a5
		
	//cutscene06Funcc:
	//	call retIfTextIsActive
	//	ld hl,$cbb3
	//	ld (hl),$1e
	//	jp incCutsceneState2
		
	//cutscene06Funcd:
	//	call decCBB3
	//	ret nz
	//	ld hl,$cfd0
	//	ld (hl),$09
	//	jp incCutsceneState2
		
	//cutscene06Funce:
	//	ld hl,$cfd0
	//	ld a,(hl)
	//	cp $0b
	//	ret nz
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp incCutsceneState2
		
	//cutscene06Funcf:
	//	call decCBB3
	//	ret nz
	//	call clearOam
	//	call cutscene_clearObjects
	//	ld a,CUTSCENE_S_DIN_IMPRISONED
	//	ld (wCutsceneIndex),a
	//	xor a
	//	ld (wMenuDisabled),a
	//	ld (wCutsceneState),a
	//	ld a,GLOBALFLAG_SEASON_ALWAYS_SPRING
	//	call unsetGlobalFlag
	//	jp fadeoutToWhite


	//cutsceneDinImprisoned:
	//	ld de,wCutsceneState
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw @state0
	//	.dw @state1
	//	.dw @state2
	//	.dw @state3
	//	.dw @state4
	//	.dw @state5
	//	.dw @state6
	//	.dw @state7
	//	.dw @state8
	//	.dw @state9

	//@state0:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld a,$01
	//	ld (de),a
	//	ld a,$09
	//	ld ($cfd0),a
	//	ld hl,$cbb3
	//	ld (hl),$58
	//	inc l
	//	ld (hl),$01
	//	ld a,$09
	//	ld b,$00
	//	call seasonsFunc_03_7aa9
	//	ld a,MUS_ONOX_CASTLE
	//	call playSound
	//	jp fadeinFromWhite

	//@state1:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld hl,$cbb3
	//	call decHlRef16WithCap
	//	jr nz,+
	//	xor a
	//	ld (wGfxRegs1.SCY),a
	//	call incCutsceneState2
	//	jp fadeoutToWhite
	//+
	//	ld hl,$cbb3
	//	ld a,(hl)
	//	and $01
	//	ret nz
	//	ld hl,wGfxRegs1.SCY
	//	ld a,(hl)
	//	or a
	//	ret z
	//	dec a
	//	ld (hl),a
	//	ldh (<hCameraY),a
	//	ret

	//@state2:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCutsceneState2
	//	ld a,$0a
	//	ld ($cfd0),a
	//	call disableLcd
	//	xor a
	//	ld (wScreenOffsetY),a
	//	ld (wScreenOffsetX),a
	//	ld a,GFXH_SCENE_INSIDE_ONOX_CASTLE
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_97
	//	call loadPaletteHeader
	//	ld a,$01
	//	ld (wScrollMode),a
	//	ld a,$18
	//	ld (wTilesetAnimation),a
	//	call loadAnimationData
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld a,INTERAC_DIN_IMPRISONED_EVENT
	//	ldi (hl),a
	//	ld (hl),$00
	//	ld ($cc1d),a
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_DIN_IMPRISONED_EVENT
	//	inc l
	//	ld (hl),$01
	//+
	//	call refreshObjectGfx
	//	ld a,$0d
	//	call loadGfxRegisterStateIndex
	//	ld hl,wGfxRegs1.SCY
	//	ldi a,(hl)
	//	ldh (<hCameraY),a
	//	ld a,(hl)
	//	ldh (<hCameraX),a
	//	jp fadeinFromWhite
	//@state3:
	//	ld hl,$cfd0
	//	ld a,(hl)
	//	cp $0b
	//	ret nz
	//	ld b,$04
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_DIN_IMPRISONED_EVENT
	//	inc l
	//	ld (hl),$02
	//	inc l
	//	dec b
	//	ld a,b
	//	ld (hl),a
	//	jr nz,-
	//+
	//	jp incCutsceneState2

	//@state4:
	//	ld a,($cfd0)
	//	sub $0c
	//	ret nz
	//	ld ($cbb3),a
	//	dec a
	//	ld ($cbba),a
	//	jp incCutsceneState2

	//@state5:
	//	ld hl,$cbb3
	//	ld b,$01
	//	call flashScreen
	//	ret z
	//	call disableLcd
	//	ld a,$01
	//	ldh (<hDirtyBgPalettes),a
	//	ld a,$fe
	//	ldh (<hBgPaletteSources),a
	//	ld a,$81
	//	call seasonsFunc_03_7a6b
	//	ld a,$81
	//	ld ($cbcb),a
	//	call seasonsFunc_03_7a88
	//	ld bc,TX_1e05
	//	call showText
	//	ld a,$0d
	//	call loadGfxRegisterStateIndex
	//	ld hl,wGfxRegs1.SCY
	//	ldi a,(hl)
	//	ldh (<hCameraY),a
	//	ld a,(hl)
	//	ldh (<hCameraX),a
	//	ld hl,$cfd0
	//	ld (hl),$0d
	//	jp incCutsceneState2

	//@state6:
	//	call retIfTextIsActive
	//	call disableLcd
	//	ld a,UNCMP_GFXH_0e
	//	call loadUncompressedGfxHeader
	//	ld a,SND_CLINK
	//	call playSound
	//	ld a,$0d
	//	call loadGfxRegisterStateIndex
	//	call fadeinFromWhite
	//	ld hl,$cbb3
	//	ld (hl),$f0
	//	xor a
	//	ld ($cbcb),a
	//	jp incCutsceneState2

	//@state7:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call decCBB3
	//	ret nz
	//	call incCutsceneState2
	//	jp fadeoutToWhite

	//@state8:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCutsceneState2
	//	ld a,$ff
	//	ld (wTilesetAnimation),a
	//	ld a,$0e
	//	ld ($cfd0),a
	//	ld a,$07
	//	ld b,$01
	//	call seasonsFunc_03_7aa9
	//	jp fadeinFromWhite

	//@state9:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld hl,$cfd0
	//	ld a,(hl)
	//	cp $0f
	//	ret nz

	//	call clearDynamicInteractions
	//	ld a,CUTSCENE_S_TEMPLE_SINKING
	//	ld (wCutsceneIndex),a
	//	xor a
	//	ld (wCutsceneState),a
	//	jp fadeoutToWhite


	//cutsceneTempleSinking:
	//	ld de,wCutsceneState
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw cutscene08Func0
	//	.dw cutscene08Func1
	//	.dw cutscene08Func2
	//	.dw cutscene08Func3
	//	.dw cutscene08Func4
	//	.dw cutscene08Func5
	//	.dw cutscene08Func6
	//	.dw cutscene08Func7
	//	.dw cutscene08Func8
	//cutscene08Func0:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	ld a,$01
	//	ld (de),a
	//	ld b,$02
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_77
	//	inc l
	//	dec b
	//	ld (hl),b
	//	jr nz,-
	//+
	//	call disableLcd
	//	ld a,GFXH_TEMPLEFALL_SCENE1
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_98
	//	call loadPaletteHeader
	//	ld a,$0e
	//	call loadGfxRegisterStateIndex
	//	ld hl,wGfxRegs1.SCY
	//	ldi a,(hl)
	//	ldh (<hCameraY),a
	//	ldi a,(hl)
	//	ldh (<hCameraX),a
	//	ld de,$cbb6
	//	ldi a,(hl)
	//	ld (de),a
	//	inc de
	//	ld a,(hl)
	//	ld (de),a
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	xor a
	//	ld hl,$cfd3
	//	ld (hl),a
	//	call seasonsFunc_03_79db
	//	ld a,MUS_DISASTER
	//	call playSound
	//	jp fadeinFromWhite
	//cutscene08Func1:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	jp nz,seasonsFunc_03_7827
	//	call decCBB3
	//	jr nz,seasonsFunc_03_7827
	//	ld b,$05
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_TEMPLE_SINKING_EXPLOSION
	//	inc l
	//	dec b
	//	ld a,b
	//	ld (hl),a
	//	jr nz,-
	//+
	//	ld hl,$cbb3
	//	ld (hl),$b4
	//	inc hl
	//	ld (hl),$00
	//	call incCutsceneState2

	//seasonsFunc_03_7827:
	//	jp seasonsFunc_03_7981
	//cutscene08Func2:
	//	call decCBB3
	//	jr nz,+
	//	call seasonsFunc_03_7a01
	//	xor a
	//	ld hl,$cbb4
	//	ld (hl),a
	//	call seasonsFunc_03_7917
	//	ld hl,$cfd3
	//	inc (hl)
	//	set 7,(hl)
	//	jp incCutsceneState2
	//+
	//	call seasonsFunc_03_7909
	//	jp seasonsFunc_03_7981
	//cutscene08Func3:
	//	call seasonsFunc_03_7981
	//	call decCBB3
	//	ret nz
	//	inc l
	//	inc (hl)
	//	ld a,(hl)
	//	cp $03
	//	jr z,+
	//	ld hl,$cfd3
	//	inc (hl)
	//	jp seasonsFunc_03_7917
	//+
	//	call disableLcd
	//	ld a,GFXH_TEMPLEFALL_SCENE1
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_98
	//	call loadPaletteHeader
	//	call seasonsFunc_03_7a17
	//	ld hl,$cbb3
	//	ld (hl),$78
	//	inc l
	//	ld (hl),$00
	//	ld hl,$cfd3
	//	inc (hl)
	//	res 7,(hl)
	//	jp incCutsceneState2
	//cutscene08Func4:
	//	call decCBB3
	//	jr nz,+
	//	call disableLcd
	//	ld a,$03
	//	inc l
	//	ld (hl),a
	//	call seasonsFunc_03_7917
	//	ld hl,$cfd3
	//	ld (hl),$ff
	//	call incCutsceneState2
	//	ld hl,$cbba
	//	ld (hl),$02
	//	ld hl,$cbb8
	//	jp seasonsFunc_03_7a3b
	//+
	//	call seasonsFunc_03_7909
	//	jp seasonsFunc_03_7981
	//cutscene08Func5:
	//	call seasonsFunc_03_7981
	//	call seasonsFunc_03_7a2e
	//	call decCBB3
	//	ret nz
	//	inc l
	//	inc (hl)
	//	ld a,(hl)
	//	cp $06
	//	jr z,+
	//	jp seasonsFunc_03_7917
	//+
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	call reloadObjectGfx
	//	ld a,$07
	//	ld b,$01
	//	call seasonsFunc_03_7aa9
	//	call clearPaletteFadeVariablesAndRefreshPalettes
	//	jp incCutsceneState2
	//cutscene08Func6:
	//	call decCBB3
	//	ret nz
	//	ld a,$01
	//	ld ($cc02),a
	//	ld bc,$1e04
	//	call showText
	//	jp incCutsceneState2
	//cutscene08Func7:
	//	call retIfTextIsActive
	//	call incCutsceneState2
	//	ld hl,$cbb3
	//	ld (hl),$5a
	//	jp fadeoutToBlack
	//cutscene08Func8:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call decCBB3
	//	ret nz
	//	xor a
	//	ld (wGameState),a
	//	ld (wCutsceneIndex),a
	//	ld c,a
	//	jpab bank1.loadDeathRespawnBufferPreset

	//seasonsFunc_03_7909:
	//	ld hl,$cbb4
	//	inc (hl)
	//	ld a,(hl)
	//	sub $07
	//	ret nz
	//	ld (hl),a
	//	ld hl,$cbb6
	//	inc (hl)
	//	ret

	//seasonsFunc_03_7917:
	//	ld ($cbbb),a
	//	ld hl,$cbb3
	//	ld (hl),$5a
	//	call disableLcd
	//	ld a,($cbbb)
	//	cp $03
	//	jr c,++
	//	sub $03
	//	ld hl,seasonsTable_03_797b
	//	rst_addDoubleIndex
	//	ld b,$00
	//	ldi a,(hl)
	//	ld c,(hl)
	//	call forceLoadRoom
	//	ld b,$31
	//	ld a,($cbbb)
	//	cp $05
	//	jr nz,+
	//	ld b,UNCMP_GFXH_0f
	//+
	//	ld a,b
	//	call loadUncompressedGfxHeader
	//	ld a,($cbbb)
	//++
	//	add GFXH_TEMPLEFALL_SCENE2
	//	call loadGfxHeader
	//	ld a,($cbbb)
	//	ld hl,seasonsTable_03_7972
	//	rst_addAToHl
	//	ld a,(hl)
	//	call loadPaletteHeader
	//	ld a,PALH_0f
	//	call loadPaletteHeader
	//	ld a,$04
	//	call loadGfxRegisterStateIndex
	//	ld a,($cbbb)
	//	sub $03
	//	ret c
	//	ld hl,seasonsTable_03_7978
	//	rst_addAToHl
	//	ld a,(hl)
	//	ld de,$cbb9
	//	ld (de),a
	//	ret

	//seasonsTable_03_7972:
	//	.db $5f $5f $5f $11 $13 $12

	//seasonsTable_03_7978:
	//	.db $02 $03 $01

	//seasonsTable_03_797b:
	//	.db SEASON_SUMMER, <ROOM_SEASONS_0b8
	//	.db SEASON_AUTUMN, <ROOM_SEASONS_0c6
	//	.db SEASON_AUTUMN, <ROOM_SEASONS_0c8

	//seasonsFunc_03_7981:
	//	call seasonsFunc_03_79bb
	//	ld hl,wFrameCounter
	//	ld a,(hl)
	//	and $0f
	//	ld a,SND_RUMBLE2
	//	call z,playSound
	//	ld de,$cbb5
	//	ld a,(de)
	//	cp $02
	//	jr z,+
	//	ld hl,$cbb4
	//	dec (hl)
	//	jr nz,+
	//	inc a
	//	ld (de),a
	//	call seasonsFunc_03_79db
	//+
	//	add a
	//	add a
	//	ld hl,seasonsTable_03_79e9
	//	rst_addDoubleIndex
	//	ld b,$00
	//	call seasonsFunc_03_79af
	//	ld b,$01

	//seasonsFunc_03_79af:
	//	ld de,wGfxRegs1.SCY
	//	dec b
	//	jr nz,+
	//	ld de,$c488
	//+
	//	jp seasonsFunc_03_79cd

	//seasonsFunc_03_79bb:
	//	ld hl,wGfxRegs1.SCY
	//	ldh a,(<hCameraY)
	//	ldi (hl),a
	//	ldh a,(<hCameraX)
	//	ldi (hl),a
	//	ld de,$cbb6
	//	ld a,(de)
	//	ldi (hl),a
	//	inc de
	//	ld a,(de)
	//	ldi (hl),a
	//	ret

	//seasonsFunc_03_79cd:
	//	push hl
	//	call getRandomNumber
	//	and $07
	//	rst_addAToHl
	//	ld a,(hl)
	//	ld b,a
	//	ld a,(de)
	//	add b
	//	ld (de),a
	//	pop hl
	//	ret

	//seasonsFunc_03_79db:
	//	ld b,a
	//	ld hl,seasonsTable_03_79e7
	//	rst_addAToHl
	//	ld a,(hl)
	//	ld hl,$cbb4
	//	ld (hl),a
	//	ld a,b
	//	ret

	//seasonsTable_03_79e7:
	//	.db $1e $14

	//seasonsTable_03_79e9:
	//	.db $00 $00 $00 $00 $00 $01 $00 $00
	//	.db $00 $00 $01 $00 $00 $00 $ff $00
	//	.db $ff $01 $00 $01 $00 $00 $ff $00

	//seasonsFunc_03_7a01:
	//	ld hl,$cbd5
	//	ld de,$c485
	//	ld b,$0c
	//-
	//	ld a,(de)
	//	ldi (hl),a
	//	inc e
	//	dec b
	//	jr nz,-
	//	call clearOam
	//	ld a,$10
	//	ldh (<hOamTail),a
	//	ret

	//seasonsFunc_03_7a17:
	//	ld hl,$cbd5
	//	ld de,$c485
	//	ld b,$0c
	//-
	//	ldi a,(hl)
	//	ld (de),a
	//	inc e
	//	dec b
	//	jr nz,-
	//	ld a,($c485)
	//	ld ($c497),a
	//	ld ($ff00+R_LCDC),a
	//	ret

	//seasonsFunc_03_7a2e:
	//	ld hl,$cbba
	//	dec (hl)
	//	ret nz
	//	ld (hl),$02
	//	ld hl,$cbb8
	//	dec (hl)
	//	jr nz,+

	//seasonsFunc_03_7a3b:
	//	ld (hl),$1f
	//	ld hl,$cbb9
	//	inc (hl)
	//	ld a,(hl)
	//	and $03
	//	ld (hl),a
	//	ld hl,seasonsTable_03_7a5e
	//	rst_addDoubleIndex
	//	ldi a,(hl)
	//	ld h,(hl)
	//	ld l,a
	//	ld b,h
	//	ld c,l
	//	ld hl,$de90
	//	call func_13c6
	//	xor a
	//	ld (wPaletteThread_mode),a
	//	ld hl,$cbb8
	//+
	//	jp func_35ec

	//seasonsTable_03_7a5e:
	//	.db $b0 $49
	//	.db $10 $4a
	//	.db $e0 $49
	//	.db $40 $4a

	//;;
	//; There is an identical function named "incCutsceneState" in bank3Cutscenes.s.
	//incCutsceneState2:
	//	ld hl,wCutsceneState
	//	inc (hl)
	//	ret

	//seasonsFunc_03_7a6b:
	//	ldh (<hFF8B),a
	//	ld a,$01
	//	ld ($ff00+R_VBK),a
	//	ld hl,$9800
	//	ld bc,$0400
	//	ldh a,(<hFF8B)
	//	call fillMemoryBc
	//	xor a
	//	ld ($ff00+R_VBK),a
	//	ld hl,$9800
	//	ld bc,$0400
	//	jp clearMemoryBc

	//seasonsFunc_03_7a88:
	//	ldh (<hFF8B),a
	//	ld a,($ff00+R_SVBK)
	//	push af
	//	ld a,$04
	//	ld ($ff00+R_SVBK),a
	//	ld hl,$d000
	//	ld bc,$0240
	//	call clearMemoryBc
	//	ld hl,$d400
	//	ld bc,$0240
	//	ldh a,(<hFF8B)
	//	call fillMemoryBc
	//	pop af
	//	ld ($ff00+R_SVBK),a
	//	ret

	//seasonsFunc_03_7aa9:
	//	ld d,a
	//	ld a,b
	//	ld e,a
	//	call disableLcd
	//	push de
	//	ld a,GFXH_SCENE_OUTSIDE_ONOX_CASTLE
	//	call loadGfxHeader
	//	ld a,PALH_0f
	//	call loadPaletteHeader
	//	ld a,PALH_TILESET_ONOX_CASTLE_OUTSIDE_WINTER
	//	call loadPaletteHeader
	//	pop de
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_88
	//	inc l
	//	ld (hl),e
	//+
	//	ld a,d
	//	call loadGfxRegisterStateIndex
	//	ld hl,wGfxRegs1.SCY
	//	ldi a,(hl)
	//	ldh (<hCameraY),a
	//	ld a,(hl)
	//	ldh (<hCameraX),a
	//	ret

	//cutscenePregameIntro:
	//	call cutscenePregameIntroHandler
	//	jp updateAllObjects

	//cutscenePregameIntroHandler:
	//	ld de,wCutsceneState
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw cutscene0dFunc0
	//	.dw cutscene0dFunc1
	//	.dw cutscene0dFunc2
	//	.dw cutscene0dFunc3
	//	.dw cutscene0dFunc4
	//	.dw cutscene0dFunc5
	//	.dw cutscene0dFunc6
	//	.dw cutscene0dFunc7
	//	.dw cutscene0dFunc8
	//	.dw cutscene0dFunc9

	//	.dw cutscene0dFunca
	//	.dw cutscene0dFuncb
	//	.dw cutscene0dFuncc

	//cutscene0dFunc0:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call checkIsLinkedGame
	//	jr nz,+
	//	ld a,$0a
	//	ld (de),a
	//	jp cutscene0dFunca
	//+
	//	ld a,$01
	//	ld (de),a
	//	; Room of Rites
	//	ld bc,ROOM_ZELDA_IN_FINAL_DUNGEON
	//	call disableLcdAndLoadRoom_body
	//	ld a,PALH_ac
	//	call loadPaletteHeader
	//	ld b,$03
	//-
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_TWINROVA_FLAME
	//	inc l
	//	ld (hl),b
	//	dec b
	//	jr nz,-
	//+
	//	ld a,MUS_FINAL_DUNGEON
	//	call playSound
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,$13
	//	call loadGfxRegisterStateIndex
	//	ld a,($c48d)
	//	ldh (<hCameraX),a
	//	xor a
	//	ldh (<hCameraY),a
	//	ld a,$00
	//	ld (wScrollMode),a
	//	jp clearFadingPalettes2
	//cutscene0dFunc1:
	//	ld e,$96
	//-
	//	call decCBB3
	//	ret nz
	//	call incCutsceneState2
	//	ld hl,$cbb3
	//	ld (hl),e
	//	ld a,SND_CREEPY_LAUGH
	//	jp playSound
	//cutscene0dFunc2:
	//	ld e,$3c
	//	jr -
	//cutscene0dFunc3:
	//	call decCBB3
	//	ret nz
	//	call incCutsceneState2
	//	call fastFadeinFromBlack
	//	ld a,$10
	//	ld ($c4b2),a
	//	ld ($c4b4),a
	//	ld a,$03
	//	ld ($c4b1),a
	//	ld ($c4b3),a
	//	ld a,SND_LIGHTTORCH
	//	jp playSound
	//cutscene0dFunc4:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call incCutsceneState2
	//	ld a,$0e
	//	ld ($cbb3),a
	//	call fadeinFromBlack
	//	ld a,$ef
	//	ld ($c4b2),a
	//	ld ($c4b4),a
	//	ld a,$fc
	//	ld ($c4b1),a
	//	ld ($c4b3),a
	//	ret
	//cutscene0dFunc5:
	//	call decCBB3
	//	ret nz
	//	xor a
	//	ld (wPaletteThread_mode),a
	//	ld a,$78
	//	ld ($cbb3),a
	//	jp incCutsceneState2
	//cutscene0dFunc6:
	//	call decCBB3
	//	ret nz
	//	call incCutsceneState2
	//	ld a,$08
	//	ld ($cbae),a
	//	ld a,$03
	//	ld ($cbac),a
	//	ld bc,$0c15
	//	jp showText
	//cutscene0dFunc7:
	//	call retIfTextIsActive
	//	call incCutsceneState2
	//	ld ($cbb3),a
	//	dec a
	//	ld ($cbba),a
	//	call restartSound
	//	ld a,SND_BIG_EXPLOSION_2
	//	jp playSound
	//cutscene0dFunc8:
	//	ld hl,$cbb3
	//	ld b,$03
	//	call flashScreen
	//	ret z
	//	call incCutsceneState2
	//	ld a,$3c
	//	ld ($cbb3),a
	//	ld a,$02
	//	jp fadeoutToWhiteWithDelay
	//cutscene0dFunc9:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call decCBB3
	//	ret nz
	//	jp incCutsceneState2

	//cutsceneOnoxTaunting:
	//	call cutsceneOnoxTauntingHandler
	//	jp updateInteractionsAndDrawAllSprites

	//cutsceneOnoxTauntingHandler:
	//	ld de,wCutsceneState
	//	ld a,(de)
	//	rst_jumpTable
	//	.dw cutscene0eFunc0
	//	.dw cutscene0eFunc1
	//	.dw cutscene0eFunc2
	//	.dw cutscene0eFunc3
	//	.dw cutscene0eFunc4
	//	.dw cutscene0eFunc5
	//	.dw cutscene0eFunc6
	//	.dw cutscene0eFunc7
	//cutscene0eFunc0:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call hideStatusBar
	//	call clearDynamicInteractions
	//	ld a,SNDCTRL_FAST_FADEOUT
	//	call playSound
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld hl,$d01a
	//	res 7,(hl)
	//	xor a
	//	ld ($cfc0),a
	//	jp incCutsceneState2
	//cutscene0eFunc1:
	//	call decCBB3
	//	ret nz
	//	ld (hl),$14
	//	call incCutsceneState2
	//	ld hl,$cbae
	//	ld (hl),$04
	//	ld bc,$1719
	//	jp showText
	//cutscene0eFunc2:
	//	call retIfTextIsActive
	//	call decCBB3
	//	ret nz
	//	call disableLcd
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld a,INTERAC_DIN
	//	ld ($cc1d),a
	//	ldi (hl),a
	//	ld (hl),$06
	//	call refreshObjectGfx
	//+
	//	xor a
	//	ld (wScreenOffsetY),a
	//	ld (wScreenOffsetX),a
	//	ld a,GFXH_SCENE_INSIDE_ONOX_CASTLE
	//	call loadGfxHeader
	//	ld a,PALH_SEASONS_97
	//	call loadPaletteHeader
	//	ld a,$01
	//	ld (wScrollMode),a
	//	ld a,$18
	//	ld (wTilesetAnimation),a
	//	call loadAnimationData
	//	ld a,$0d
	//	call loadGfxRegisterStateIndex
	//	ld hl,wGfxRegs1.SCY
	//	ldi a,(hl)
	//	ldh (<hCameraY),a
	//	ld a,(hl)
	//	ldh (<hCameraX),a
	//	ld a,$18
	//	ld (wTilesetAnimation),a
	//	call loadAnimationData
	//	xor a
	//	ld ($cbb3),a
	//	dec a
	//	ld ($cbba),a
	//	ld a,SND_LIGHTNING
	//	call playSound
	//	jp incCutsceneState2
	//cutscene0eFunc3:
	//	ld hl,$cbb3
	//	ld b,$01
	//	call flashScreen
	//	ret z
	//	xor a
	//	ldh (<hFF8B),a
	//	ld a,$f0
	//	ld c,a
	//	ld ($c4ae),a
	//	call seasonsFunc_35cc
	//	ld a,$ff
	//	ldh (<hDirtyBgPalettes),a
	//	ldh (<hDirtySprPalettes),a
	//	ldh (<hBgPaletteSources),a
	//	ldh (<hSprPaletteSources),a
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	ld a,MUS_DISASTER
	//	call playSound
	//	jp incCutsceneState2
	//cutscene0eFunc4:
	//	call decCBB3
	//	ret nz
	//	ld (hl),$3c
	//	call brightenRoom
	//	ld a,$ff
	//	ld ($c4b2),a
	//	ld ($c4b4),a
	//	xor a
	//	ld ($c4b1),a
	//	ld ($c4b3),a
	//	jp incCutsceneState2
	//cutscene0eFunc5:
	//	ld a,(wPaletteThread_mode)
	//	or a
	//	ret nz
	//	call decCBB3
	//	ret nz
	//	ld (hl),$5a
	//	ld a,$f0
	//	ld ($c4ae),a
	//	call brightenRoom
	//	ld a,$ff
	//	ld ($c4b1),a
	//	ld ($c4b3),a
	//	jp incCutsceneState2
	//cutscene0eFunc6:
	//	call decCBB3
	//	ret nz
	//	call getFreeInteractionSlot
	//	jr nz,+
	//	ld (hl),INTERAC_DIN_IMPRISONED_EVENT
	//	inc l
	//	ld (hl),$05
	//+
	//	jp incCutsceneState2
	//cutscene0eFunc7:
	//	ld a,($cfc0)
	//	or a
	//	ret z
	//	call showStatusBar
	//	ld a,SNDCTRL_FAST_FADEOUT
	//	call playSound
	//	xor a
	//	ld ($cc66),a
	//	ld a,$82
	//	ld ($cc63),a
	//	ld a,$5d
	//	ld ($cc64),a
	//	xor a
	//	ld ($cc65),a
	//	ld a,$03
	//	ld (wWarpTransition2),a
	//	ret

	//cutscene0dFunca:
	//	call disableLcd
	//	ld a,($ff00+R_SVBK)
	//	push af
	//	ld a,$02
	//	ld ($ff00+R_SVBK),a
	//	ld hl,$de80
	//	ld b,$40
	//	call clearMemory
	//	pop af
	//	ld ($ff00+R_SVBK),a
	//	call clearScreenVariablesAndWRAMBank1
	//	call clearOam
	//	ld a,PALH_0f
	//	call loadPaletteHeader
	//	ld a,$02
	//	call seasonsFunc_03_7a6b
	//	call seasonsFunc_03_7db8
	//	ld a,MUS_ESSENCE_ROOM
	//	call playSound
	//	ld a,$08
	//	call setLinkID
	//	ld l,<w1Link.enabled
	//	ld (hl),$01
	//	ld l,<w1Link.subid
	//	ld (hl),$0a
	//	ld a,$00
	//	ld (wScrollMode),a
	//	call incCutsceneState2
	//	call clearPaletteFadeVariablesAndRefreshPalettes
	//	xor a
	//	ldh (<hCameraY),a
	//	ldh (<hCameraX),a
	//	ld a,$15
	//	jp loadGfxRegisterStateIndex
	//cutscene0dFuncb:
	//	ld a,($cbb9)
	//	cp $07
	//	ret nz
	//	call clearLinkObject
	//	ld hl,$cbb3
	//	ld (hl),$3c
	//	jp incCutsceneState2
	//cutscene0dFuncc:
	//	call decCBB3
	//	ret nz
	//	ld hl,wGameState
	//	xor a
	//	ldi (hl),a
	//	ld (hl),a
	//	ld a,SNDCTRL_STOPMUSIC
	//	call playSound
	//	ld a,GLOBALFLAG_3d
	//	jp setGlobalFlag

	//seasonsFunc_03_7db8:
	//	ld a,($ff00+R_SVBK)
	//	push af
	//	ld a,$03
	//	ld ($ff00+R_SVBK),a
	//	ld hl,$d800
	//	ld bc,$0240
	//	call clearMemoryBc
	//	ld hl,$dc00
	//	ld bc,$0240
	//	ld a,$02
	//	call fillMemoryBc
	//	pop af
	//	ld ($ff00+R_SVBK),a
	//	ret
}
