module oracles.bank3f;

import oracles.external;
import oracles.globals;
import oracles.structures;

import replatform64.gameboy;

import std.logger;

public import oracles.common.loadGraphics;
public import oracles.common.treasureAndDrops;
public import oracles.common.textbox;

static if (gameVersion == GameVersion.ages) {
	immutable ubyte[] data5951 = [
		0x3c, 0xb4, 0x3c, 0x50, 0x78, 0xb4, 0x3c, 0x3c, 0x3c, 0x70, 0x78, 0x78,
	];


	//; In Seasons these sprites are located elsewhere

	immutable titlescreenMakuSeedSprite = ObjLoad(
		19,
		[
			Obj(72, -112, 98, 6),
			Obj(66, -114, 104, 6),
			Obj(81, 0x7A, 86, 4),
			Obj(80, -126, 116, 4),
			Obj(88, 0x7A, 106, 7),
			Obj(88, -126, 108, 7),
			Obj(88, -118, 110, 7),
			Obj(84, -118, 84, 3),
			Obj(84, -126, 82, 3),
			Obj(84, 0x7A, 80, 3),
			Obj(100, 0x7A, 112, 3),
			Obj(100, -126, 114, 3),
			Obj(100, -118, 112, 35),
			Obj(64, -122, 102, 6),
			Obj(64, 0x7F, 100, 6),
			Obj(65, 0x70, 96, 6),
			Obj(85, 0x76, 90, 6),
			Obj(68, 0x68, 94, 38),
			Obj(116, 0, 70, 2),
		]
	);

	immutable titlescreenPressStartSprites = ObjLoad(
		10,
		[
			Obj(-128, 44, 56, 0),
			Obj(-128, 52, 58, 0),
			Obj(-128, 60, 60, 0),
			Obj(-128, 68, 62, 0),
			Obj(-128, 76, 62, 0),
			Obj(-128, 92, 62, 0),
			Obj(-128, 100, 64, 0),
			Obj(-128, 108, 66, 0),
			Obj(-128, 116, 58, 0),
			Obj(-128, 124, 64, 0),
		]
	);

	//; Sprites used on the closeup shot of Link on the horse in the intro
	immutable linkOnHorseCloseupSprites2 = ObjLoad(38, [
		Obj(cast(byte)0x80, cast(byte)0x80, 0x40, 0x06),
		Obj(cast(byte)0x80, cast(byte)0x50, 0x42, 0x00),
		Obj(cast(byte)0x80, cast(byte)0x58, 0x44, 0x00),
		Obj(cast(byte)0x68, cast(byte)0x40, 0x46, 0x06),
		Obj(cast(byte)0xb8, cast(byte)0x3d, 0x20, 0x02),
		Obj(cast(byte)0xb8, cast(byte)0x45, 0x22, 0x02),
		Obj(cast(byte)0xb8, cast(byte)0x4d, 0x24, 0x02),
		Obj(cast(byte)0xb8, cast(byte)0x55, 0x26, 0x02),
		Obj(cast(byte)0xb8, cast(byte)0x5d, 0x28, 0x02),
		Obj(cast(byte)0x90, cast(byte)0x28, 0x2c, 0x02),
		Obj(cast(byte)0x90, cast(byte)0x30, 0x2e, 0x02),
		Obj(cast(byte)0x80, cast(byte)0x30, 0x2a, 0x02),
		Obj(cast(byte)0x20, cast(byte)0x78, 0x48, 0x05),
		Obj(cast(byte)0x58, cast(byte)0x68, 0x00, 0x02),
		Obj(cast(byte)0x58, cast(byte)0x70, 0x02, 0x02),
		Obj(cast(byte)0x68, cast(byte)0x68, 0x04, 0x02),
		Obj(cast(byte)0x48, cast(byte)0x70, 0x06, 0x02),
		Obj(cast(byte)0x5a, cast(byte)0x40, 0x08, 0x01),
		Obj(cast(byte)0x5a, cast(byte)0x48, 0x0a, 0x01),
		Obj(cast(byte)0x5a, cast(byte)0x50, 0x0c, 0x01),
		Obj(cast(byte)0x38, cast(byte)0x88, 0x0e, 0x04),
		Obj(cast(byte)0x30, cast(byte)0x78, 0x10, 0x04),
		Obj(cast(byte)0x30, cast(byte)0x80, 0x12, 0x04),
		Obj(cast(byte)0x40, cast(byte)0x80, 0x14, 0x04),
		Obj(cast(byte)0x50, cast(byte)0x76, 0x16, 0x04),
		Obj(cast(byte)0x50, cast(byte)0x7e, 0x18, 0x04),
		Obj(cast(byte)0x41, cast(byte)0x62, 0x1a, 0x03),
		Obj(cast(byte)0x80, cast(byte)0x28, 0x1c, 0x02),
		Obj(cast(byte)0xa8, cast(byte)0x59, 0x1e, 0x02),
		Obj(cast(byte)0x98, cast(byte)0x20, 0x30, 0x02),
		Obj(cast(byte)0x98, cast(byte)0x28, 0x32, 0x02),
		Obj(cast(byte)0x8c, cast(byte)0x38, 0x34, 0x07),
		Obj(cast(byte)0xa8, cast(byte)0x41, 0x36, 0x02),
		Obj(cast(byte)0xa8, cast(byte)0x49, 0x38, 0x02),
		Obj(cast(byte)0xa8, cast(byte)0x51, 0x3a, 0x02),
		Obj(cast(byte)0x90, cast(byte)0x40, 0x3e, 0x07),
		Obj(cast(byte)0x8a, cast(byte)0x5c, 0x4a, 0x00),
		Obj(cast(byte)0x8a, cast(byte)0x64, 0x4c, 0x00),
	]);

	//; Sprites used to touch up the appearance of the temple in the intro (the scene where
	//; Link's on a cliff with his horse)
	immutable introTempleSprites = ObjLoad(5, [
		Obj(0x30, 0x28, 0x48, 0x02),
		Obj(0x30, 0x30, 0x4a, 0x02),
		Obj(0x18, 0x38, 0x4c, 0x03),
		Obj(0x10, 0x40, 0x4e, 0x03),
		Obj(0x18, 0x48, 0x50, 0x03),
	]);

	//; Used in intro (ages only)
	immutable linkOnHorseFacingCameraSprite = ObjLoad(2, [
		Obj(0x70, 0x08, 0x58, 0x02),
		Obj(0x70, 0x10, 0x5A, 0x02),
	]);
} else {
	public import oracles.common.objects.interactions.faroreMakeChest;
}

public import oracles.common.data.objectGfxHeaders;
public import oracles.common.data.treeGfxHeaders;

public import oracles.common.data.enemyData;
public import oracles.common.data.partData;
public import oracles.common.data.itemData;
public import oracles.common.data.interactionData;

public import oracles.common.data.treasureCollectionBehaviours;
public import oracles.common.data.treasureDisplayData;

static if (gameVersion == GameVersion.ages) {
	//oamData_714c:
	//	.db $10
	//	.db $c8 $38 $2e $0e
	//	.db $c8 $40 $30 $0e
	//	.db $c8 $48 $32 $0e
	//	.db $c8 $60 $34 $0f
	//	.db $c8 $68 $36 $0f
	//	.db $c8 $70 $38 $0f
	//	.db $d8 $78 $06 $2e
	//	.db $e8 $80 $00 $0d
	//	.db $e8 $78 $08 $0e
	//	.db $e0 $90 $00 $0d
	//	.db $d8 $a0 $00 $0d
	//	.db $e8 $30 $04 $0e
	//	.db $d8 $30 $06 $0e
	//	.db $f8 $28 $02 $0e
	//	.db $f0 $18 $00 $2d
	//	.db $e8 $08 $00 $2d

	//oamData_718d:
	//	.db $10
	//	.db $a8 $38 $12 $0a
	//	.db $b8 $38 $0e $0f
	//	.db $c8 $38 $0a $0f
	//	.db $a8 $70 $14 $0a
	//	.db $b8 $70 $10 $0a
	//	.db $c8 $70 $0c $0f
	//	.db $e8 $80 $00 $0d
	//	.db $d8 $78 $06 $2e
	//	.db $e8 $78 $08 $0e
	//	.db $e0 $90 $00 $0d
	//	.db $d8 $a0 $00 $0d
	//	.db $f8 $28 $02 $0e
	//	.db $f0 $18 $00 $2d
	//	.db $e8 $08 $00 $2d
	//	.db $d8 $30 $06 $0e
	//	.db $e8 $30 $08 $2e

	//oamData_71ce:
	//	.db $0a
	//	.db $50 $40 $40 $0b
	//	.db $50 $48 $42 $0b
	//	.db $50 $50 $44 $0b
	//	.db $50 $58 $46 $0b
	//	.db $50 $60 $48 $0b
	//	.db $50 $68 $4a $0b
	//	.db $70 $70 $3c $0c
	//	.db $60 $70 $3e $2c
	//	.db $70 $38 $3a $0c
	//	.db $60 $38 $3e $0c

	//oamData_71f7:
	//	.db $0a
	//	.db $10 $40 $22 $08
	//	.db $10 $68 $22 $28
	//	.db $60 $38 $16 $0c
	//	.db $70 $38 $1a $0c
	//	.db $60 $70 $18 $0c
	//	.db $70 $70 $1a $2c
	//	.db $40 $40 $1c $08
	//	.db $40 $68 $1e $08
	//	.db $50 $40 $20 $08
	//	.db $50 $68 $20 $28

	//oamData_7220:
	//	.db $0a
	//	.db $e0 $48 $24 $0b
	//	.db $e0 $60 $24 $2b
	//	.db $e0 $50 $26 $0b
	//	.db $e0 $58 $26 $2b
	//	.db $f0 $48 $28 $0b
	//	.db $f0 $60 $28 $2b
	//	.db $00 $48 $2a $0b
	//	.db $00 $60 $2a $2b
	//	.db $f8 $50 $2c $0b
	//	.db $f8 $58 $2c $2b

	//oamData_7249:
	//	.db $27
	//	.db $38 $38 $00 $01
	//	.db $38 $58 $02 $00
	//	.db $30 $48 $04 $00
	//	.db $30 $50 $06 $00
	//	.db $40 $48 $08 $00
	//	.db $58 $38 $0a $00
	//	.db $50 $40 $0c $02
	//	.db $50 $48 $0e $04
	//	.db $58 $50 $10 $03
	//	.db $60 $57 $12 $03
	//	.db $60 $5f $14 $03
	//	.db $60 $30 $16 $00
	//	.db $72 $38 $18 $00
	//	.db $70 $30 $1a $03
	//	.db $88 $28 $1c $00
	//	.db $3b $9a $1e $04
	//	.db $4b $9a $20 $04
	//	.db $58 $90 $22 $05
	//	.db $58 $98 $24 $05
	//	.db $22 $a0 $26 $06
	//	.db $22 $a8 $28 $06
	//	.db $32 $a0 $2a $06
	//	.db $32 $a8 $2c $06
	//	.db $12 $a0 $2e $06
	//	.db $12 $a8 $30 $06
	//	.db $12 $b0 $32 $06
	//	.db $6c $b0 $34 $03
	//	.db $70 $c0 $36 $01
	//	.db $80 $c0 $38 $05
	//	.db $90 $58 $3a $03
	//	.db $30 $90 $3c $00
	//	.db $90 $c0 $3e $05
	//	.db $90 $78 $40 $05
	//	.db $80 $70 $42 $05
	//	.db $80 $78 $44 $05
	//	.db $80 $88 $46 $05
	//	.db $90 $80 $48 $05
	//	.db $48 $50 $4a $02
	//	.db $60 $40 $4c $00
	public import oracles.ages.objects.interactions.monkeyMain;
	public import oracles.ages.objects.interactions.rabbitMain;
	public import oracles.ages.objects.interactions.tuniNutMain;
}
