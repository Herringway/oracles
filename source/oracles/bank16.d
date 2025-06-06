module oracles.bank16;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.common.serialfunctions;
	public import oracles.common.loadTreasureData;

	public import oracles.ages.data.data4556;
	public import oracles.ages.data.endgameCutsceneOamData;

	public import oracles.common.staticObjects;
	public import oracles.ages.data.staticDungeonObjects;
	public import oracles.ages.data.chestData;
	public import oracles.ages.data.treasureObjectData;

	//;;
	//; Used in the room in present Mermaid's Cave with the changing floor
	//;
	//; @param	b	Floor state (0/1)
	//loadD6ChangingFloorPatternToBigBuffer:
	//	ld a,b
	//	add a
	//	ld hl,@changingFloorData
	//	rst_addDoubleIndex
	//	push hl
	//	ldi a,(hl)
	//	ld d,(hl)
	//	ld e,a
	//	ld b,$41
	//	ld hl,wBigBuffer
	//	call copyMemoryReverse

	//	pop hl
	//	inc hl
	//	inc hl
	//	ldi a,(hl)
	//	ld d,(hl)
	//	ld e,a
	//	ld b,$41
	//	ld hl,wBigBuffer+$80
	//	call copyMemoryReverse

	//	ldh a,(<hActiveObject)
	//	ld d,a
	//	ret

	//@changingFloorData:
	//	.dw @tiles0_bottomHalf
	//	.dw @tiles0_topHalf

	//	.dw @tiles1
	//	.dw @tiles1

	//@tiles0_bottomHalf:
	//	.db $a0 $a0 $a0 $1d $a0 $1d $f4 $f4 $f4 $ff
	//	.db $f4 $f4 $f4 $f4 $a0 $a0 $a0 $a0 $a0 $ff
	//	.db $a0 $a0 $a0 $f4 $f4 $f4 $f4 $f4 $f4 $ff
	//	.db $f4 $f4 $f4 $f4 $f4 $f4 $f4 $a0 $a0 $ff
	//	.db $a0 $f4 $f4 $f4 $f4 $f4 $f4 $f4 $f4 $ff
	//	.db $f4 $f4 $f4 $f4 $f4 $f4 $f4 $f4 $f4 $ff
	//	.db $f4 $f4 $f4 $f4
	//	.db $00

	//@tiles0_topHalf:
	//	.db $a0 $a0 $a0 $1d $a0 $1d $f4 $f4 $f4 $ff
	//	.db $a0 $f4 $f4 $f4 $a0 $a0 $a0 $a0 $a0 $ff
	//	.db $a0 $a0 $a0 $a0 $f4 $f4 $f4 $f4 $a0 $ff
	//	.db $a0 $f4 $f4 $f4 $f4 $f4 $a0 $a0 $a0 $ff
	//	.db $a0 $a0 $f4 $f4 $f4 $f4 $f4 $f4 $f4 $ff
	//	.db $f4 $f4 $f4 $f4 $f4 $f4 $f4 $f4 $a0 $ff
	//	.db $f4 $f4 $f4 $f4
	//	.db $00

	//@tiles1:
	//	.db $a0 $a0 $f4 $1d $a0 $1d $f4 $f4 $f4 $ff
	//	.db $a0 $f4 $f4 $f4 $f4 $f4 $f4 $a0 $a0 $ff
	//	.db $a0 $f4 $f4 $f4 $f4 $f4 $f4 $a0 $a0 $ff
	//	.db $a0 $a0 $a0 $f4 $f4 $f4 $f4 $f4 $a0 $ff
	//	.db $a0 $f4 $f4 $f4 $f4 $a0 $a0 $a0 $a0 $ff
	//	.db $a0 $a0 $a0 $a0 $a0 $a0 $f4 $f4 $a0 $ff
	//	.db $a0 $a0 $f4 $a0
	//	.db $00

	//.ends

	public import oracles.ages.data.interactionAnimations;
	public import oracles.ages.data.partAnimations;
} else {
	public import oracles.common.data.paletteData;
	public import oracles.seasons.tilesetCollisions;
	public import oracles.seasons.smallRoomLayoutTables;
}