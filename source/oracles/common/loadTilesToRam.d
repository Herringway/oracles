module oracles.common.loadTilesToRam;

import oracles.bank00;

import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.globals;
import oracles.structures;
//;;
//; Generate the buffers at w3VramTiles and w3VramAttributes based on the tiles
//; loaded in wRoomLayout.
void generateW3VramTilesAndAttributes() {
//	ld a,:w3VramTiles
//	ld ($ff00+R_SVBK),a
//	ld hl,wRoomLayout
//	ld de,w3VramTiles
//	ld c,$0b
//---
//	ld b,$10
//--
//	push bc
//	ldi a,(hl)
//	push hl
//	call setHLToTileMappingDataPlusATimes8
//	push de
//	call write4BytesToVRAMLayout
//	pop de
//	set 2,d
//	call write4BytesToVRAMLayout
//	res 2,d
//	ld a,e
//	sub $1f
//	ld e,a
//	pop hl
//	pop bc
//	dec b
//	jr nz,--

//	ld a,$20
//	call addAToDe
//	dec c
//	jr nz,---
	assert(0, "NYI");
}

//;;
//; Take 4 bytes from hl, write 2 to de, write the next 2 $20 bytes later.
void write4BytesToVRAMLayout(ref const(ubyte)* src, ubyte* dest) {
	dest[0] = (src++)[0];
	dest[1] = (src++)[0];
	dest[32] = (src++)[0];
	dest[33] = (src++)[0];
}

//;;
//; This updates up to 4 entries in w2ChangedTileQueue by writing a command to the vblank
//; queue.
//;
void updateChangedTileQueue() {
	if ((scrollMode & 0xE) != 0) {
		return;
	}
	// Update up to 4 tiles per frame
	for (ubyte i = 4; i != 0; i--) {
		if (changedTileQueueHead == changedTileQueueTail) {
			continue;
		}
		changedTileQueueHead = (changedTileQueueHead + 1) & 0x1F;
		auto hl = &changedTileQueue[changedTileQueueHead];

		gbc.SVBK = 2;

		// b = New value of tile
		// c = position of tile
		const b = hl[0];
		const c = hl[1];
		varFF8C = c;
		{
			mixin(restoreSVBKOnExit);
			gbc.SVBK = 3;
			auto src = getVRAMSubtileAddressOfTile(c);
			auto dest = setHLToTileMappingDataPlusATimes8(b);
			auto base = dest;

			// Write tile data
			write4BytesToVRAMLayout(src, dest);

			// Write mapping data
			dest = &vramAttributes[dest - &vramTiles[0]];
			write4BytesToVRAMLayout(src, dest);

			queueTileWriteAtVBlank(varFF8C, base);
		}
	}
	gbc.SVBK = 0;
}

//;;
//; @param	c	Tile index
//; @param[out]	de	Address of tile c's top-left subtile in w3VramTiles
const(ubyte)* getVRAMSubtileAddressOfTile(ubyte index) {
	return &vramTiles[(0x40 * (index >> 4) + (index & 0xF)) * 2];
}

//;;
//; Called from "setInterleavedTile" in bank 0.
//;
//; Mixes two tiles together by using some subtiles from one, and some subtiles from the
//; other. Used for example by shutter doors, which would combine the door and floor tiles
//; for the partway-closed part of the animation.
//;
//; Tile 2 uses its tiles from the same "half" that tile 1 uses. For example, if tile 1 was
//; placed on the right side, both tiles would use the right halves of their subtiles.
//;
//; @param	a	0: Top is tile 2, bottom is tile 1
//;			1: Left is tile 1, right is tile 2
//;			2: Top is tile 1, bottom is tile 2
//;			3: Left is tile 2, right is tile 1
//; @param	hFF8C	Position of tile to change
//; @param	hFF8F	Tile index 1
//; @param	hFF8E	Tile index 2
//setInterleavedTile_body:
//	ldh (<hFF8B),a

//	ld a,($ff00+R_SVBK)
//	push af
//	ld a,:w3TileMappingData
//	ld ($ff00+R_SVBK),a

//	ldh a,(<hFF8F)
//	call setHLToTileMappingDataPlusATimes8
//	ld de,$cec8
//	ld b,$08
//-
//	ldi a,(hl)
//	ld (de),a
//	inc de
//	dec b
//	jr nz,-

//	ldh a,(<hFF8E)
//	call setHLToTileMappingDataPlusATimes8
//	ld de,$cec8
//	ldh a,(<hFF8B)
//	bit 0,a
//	jr nz,@interleaveDiagonally

//	bit 1,a
//	jr nz,+

//	inc hl
//	inc hl
//	call @copy2Bytes
//	jr ++
//+
//	inc de
//	inc de
//	call @copy2Bytes
//++
//	inc hl
//	inc hl
//	inc de
//	inc de
//	call @copy2Bytes
//	jr @queueWrite

//@copy2Bytes:
//	ldi a,(hl)
//	ld (de),a
//	inc de
//	ldi a,(hl)
//	ld (de),a
//	inc de
//	ret

//@interleaveDiagonally:
//	bit 1,a
//	jr nz,+

//	inc de
//	call @copy2BytesSeparated
//	jr ++
//+
//	inc hl
//	call @copy2BytesSeparated
//++
//	inc hl
//	inc de
//	call @copy2BytesSeparated
//	jr @queueWrite

//;;
//@copy2BytesSeparated:
//	ldi a,(hl)
//	ld (de),a
//	inc de
//	inc hl
//	inc de
//	ldi a,(hl)
//	ld (de),a
//	inc de
//	ret

//;;
//; @param	hFF8C	The position of the tile to refresh
//; @param	$cec8	The data to write for that tile
//@queueWrite:
//	ldh a,(<hFF8C)
//	ld hl,$cec8
//	call queueTileWriteAtVBlank
//	pop af
//	ld ($ff00+R_SVBK),a
//	ret

//;;
//; Set wram bank to 3 (or wherever hl is pointing to) before calling this.
//;
//; @param	a	Tile position
//; @param	hl	Pointer to 8 bytes of tile data (usually somewhere in
//;			w3TileMappingData)
void queueTileWriteAtVBlank(ubyte position, const(ubyte)* tileData) {
	assert(0, "NYI");
//	push hl
//	call @getTilePositionInVram
//	add $20
//	ld c,a

//	; Add a command to the vblank queue.
//	ldh a,(<hVBlankFunctionQueueTail)
//	ld l,a
//	ld h,>wVBlankFunctionQueue
//	ld a,(vblankCopyTileFunctionOffset)
//	ldi (hl),a
//	ld (hl),e
//	inc l
//	ld (hl),d
//	inc l

//	ld e,l
//	ld d,h
//	pop hl
//	ld b,$02
//--
//	; Write 2 bytes to the command
//	call @copy2Bytes

//	; Then give it the address for the lower half of the tile
//	ld a,c
//	ld (de),a
//	inc e

//	; Then write the next 2 bytes
//	call @copy2Bytes
//	dec b
//	jr nz,--

//	; Update the tail of the vblank queue
//	ld a,e
//	ldh (<hVBlankFunctionQueueTail),a
//	ret

//;;
//@copy2Bytes:
//	ldi a,(hl)
//	ld (de),a
//	inc e
//	ldi a,(hl)
//	ld (de),a
//	inc e
//	ret
}

//;;
//; @param	a	Tile position
//; @param[out]	a	Same as 'e'
//; @param[out]	de	Somewhere in the vram bg map
//@getTilePositionInVram:
//	ld e,a
//	and $f0
//	swap a
//	ld d,a
//	ld a,e
//	and $0f
//	add a
//	ld e,a
//	ld a,(wScreenOffsetX)
//	swap a
//	add a
//	add e
//	and $1f
//	ld e,a
//	ld a,(wScreenOffsetY)
//	swap a
//	add d
//	and $0f
//	ld hl,vramBgMapTable
//	rst_addDoubleIndex
//	ldi a,(hl)
//	add e
//	ld e,a
//	ld d,(hl)
//	ret