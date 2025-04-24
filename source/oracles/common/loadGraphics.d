module oracles.common.loadGraphics;

import oracles.bank00;
import oracles.common.data.enemyData;
import oracles.common.data.interactionData;
import oracles.common.data.itemData;
import oracles.common.data.objectGfxHeaders;
import oracles.common.data.partData;
import oracles.common.data.treeGfxHeaders;
import oracles.external;
import oracles.globals;
import oracles.structures;

void initGBAModePaletteData() {
	ubyte oldBank = getWRAMBank();
	selectWRAMBank(2);
	gbaModePaletteData[] = gbaModePaletteDataLoadable;
	selectWRAMBank(oldBank);
}

//;;
//; Redraw dirty palettes
void refreshDirtyPalettes() {
	static void gbaBrightenPalette(ref const(ubyte)* src, ref ubyte* dest) {
		assert(0, "NYI");
		//	ldi a,(hl)
		//	ld c,a
		//	and $e0
		//	ld b,a
		//	ld a,(hl)
		//	and $03
		//	or b
		//	swap a
		//	ld b,a
		//	ldd a,(hl)
		//	and $7c
		//	rrca
		//	rrca
		//	push hl
		//	ld hl,w2GbaModePaletteData+$60
		//	rst_addAToHl
		//	ld a,b
		//	ld b,(hl)
		//	ld hl,w2GbaModePaletteData+$21
		//	rst_addAToHl
		//	ldd a,(hl)
		//	or b
		//	ld b,a
		//	ld a,c
		//	and $1f
		//	ld c,(hl)
		//	ld hl,w2GbaModePaletteData
		//	rst_addAToHl
		//	ld a,(hl)
		//	or c
		//	pop hl
		//	ld c,h
		//	res 7,l
		//	ld h,$df
		//	ldi (hl),a
		//	ld a,b
		//	ldi (hl),a
		//	set 7,l
		//	ld h,c
	}
//; @param d Bitset of dirty palettes
//; @param e Bitset of where to get the palettes from
//; @param l $80 for background, $c0 for sprites
	static void refresh(ubyte dirtyBitset, ubyte srcBitset, bool sprPalette) {
		uint offset = 0;
		while (true) {
			if (dirtyBitset == 0) {
				return;
			}
			const c = !!(dirtyBitset & 1);
			dirtyBitset >>= 1;
			if (!c) {
				offset += 8;
				srcBitset >>= 1;
				continue;
			}
			const(ubyte)* src = (sprPalette ? &tilesetSpritePalettes[0] : &tilesetBGPalettes[0]) + offset;
			const srcC = !!(srcBitset & 1);
			srcBitset >>= 1;
			if (srcC) {
				src = (sprPalette ? &fadingSpritePalettes[0] : &fadingBGPalettes[0]) + offset;
			}
			ubyte* dest = (sprPalette ? &spritePalettesBuffer[0] : &bgPalettesBuffer[0]) + offset;
			if (gameboyType == 0xFF) {
				gbaBrightenPalette(src, dest);
				gbaBrightenPalette(src, dest);
				gbaBrightenPalette(src, dest);
				gbaBrightenPalette(src, dest);
			} else {
				for (uint i = 8; i > 0; i--) {
					(dest++)[0] = (src++)[0];
				}
			}
			offset += 8;
		}
	}
	gbc.SVBK = 2;
	refresh(dirtyBGPalettes, bgPaletteSources, false);
	refresh(dirtySpritePalettes, spritePaletteSources, true);
}

immutable ubyte[] gbaModePaletteDataLoadable = [
	0x00, 0x05, 0x07, 0x08, 0x0A, 0x0B, 0x0C, 0x0E,
	0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
	0x18, 0x19, 0x1A, 0x1B, 0x1B, 0x1C, 0x1C, 0x1D,
	0x1D, 0x1E, 0x1E, 0x1E, 0x1F, 0x1F, 0x1F, 0x1F,
	0x00, 0x00, 0xA0, 0x00, 0xE0, 0x00, 0x00, 0x01,
	0x40, 0x01, 0x60, 0x01, 0x80, 0x01, 0xC0, 0x01,
	0x00, 0x02, 0x20, 0x02, 0x40, 0x02, 0x60, 0x02,
	0x80, 0x02, 0xA0, 0x02, 0xC0, 0x02, 0xE0, 0x02,
	0x00, 0x03, 0x20, 0x03, 0x40, 0x03, 0x60, 0x03,
	0x60, 0x03, 0x80, 0x03, 0x80, 0x03, 0xA0, 0x03,
	0xA0, 0x03, 0xC0, 0x03, 0xC0, 0x03, 0xC0, 0x03,
	0xE0, 0x03, 0xE0, 0x03, 0xE0, 0x03, 0xE0, 0x03,
	0x00, 0x14, 0x1C, 0x20, 0x28, 0x2C, 0x30, 0x38,
	0x40, 0x44, 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C,
	0x60, 0x64, 0x68, 0x6C, 0x6C, 0x70, 0x70, 0x74,
	0x74, 0x78, 0x78, 0x78, 0x7C, 0x7C, 0x7C, 0x7C,
];

void resumeThreadNextFrameIfLcdIsOn() {
	if ((gbc.LCDC & 0x80) == 0) {
		return;
	}
	resumeThreadNextFrameAndSaveBank();
}

//;;
//; Goes through wLoadedObjectGfx, and reloads each entry. This is called when closing
//; the inventory screen and things like that.
//reloadObjectGfx:
//	ld a,(wLoadedItemGraphic1)
//	or a
//	call nz,loadUncompressedGfxHeader

//	ld a,(wLoadedItemGraphic2)
//	or a
//	call nz,loadUncompressedGfxHeader
//agesFunc_3f_4133:
//	ld hl,wLoadedObjectGfx
//--
//	ldi a,(hl)
//	ld e,a
//	ld d,(hl)
//	dec l
//	or a
//	jr z,+

//	call insertIndexIntoLoadedObjectGfx
//	call resumeThreadNextFrameIfLcdIsOn
//+
//	inc l
//	ld (hl),d
//	inc l
//	ld a,l
//	cp <wLoadedObjectGfxEnd
//	jr c,--

//	; Also reload the tree graphics

//	ld hl,wLoadedTreeGfxActive
//	ld e,(hl)
//	ld (hl),$00
//	jp loadTreeGfx_body

//;;
void refreshObjectGFXBody() {
	markAllLoadedObjectGfxUnused();

	// Re-check which object gfx indices are in use by checking all objects of all types.

	// Check enemies
	foreach (ref enemy; enemies) {
		markLoadedObjectGfxUsed(enemyGetObjectGfxIndex(&enemy));
	}
	// Check parts
	foreach (ref part; parts) {
		markLoadedObjectGfxUsed(partGetObjectGfxIndex(&part));
	}
	// Check interactions
	foreach (ref interaction; interactions) {
		const(InteractionData)* _;
		markLoadedObjectGfxUsed(interactionGetObjectGfxIndex(&interaction, _));
	}
	// Check items
	foreach (ref item; itemObjects[6 .. $]) {
		markLoadedObjectGfxUsed(itemGetObjectGfxIndex(&item));
	}

	// Now check whether to load extra gfx for an interaction or enemy.

	ubyte index;
	if (enemyIDToLoadExtraGFX != 0) {
		index = getObjectGfxIndexForEnemy(enemyIDToLoadExtraGFX);
	} else if (interactionIDToLoadExtraGFX != 0) {
		auto interaction = &interactions[interactionIDToLoadExtraGFX];
		auto tmp = interaction.subid;
		interaction.subid = 0;
		index = getDataForInteraction(interaction.id, tmp).objectGFX;
	} else {
		return;
	}
	ubyte _;
	addIndexToLoadedObjectGfx(index, _);
	resumeThreadNextFrameIfLcdIsOn();
//	ld a,e
//	call findIndexInLoadedObjectGfx
//	ld a,l
//	sub <wLoadedObjectGfx
//	srl a

//@nextExtraGfxIndex:
//	inc a
//	and $07
//	ld b,a
//	ld hl,wLoadedObjectGfx+1
//	rst_addDoubleIndex

//	; Remember old values, they may need to be moved to another spot
//	ldd a,(hl)
//	ld d,a
//	ld c,(hl)
//	inc e

//	; Load the next gfx index
//	call insertIndexIntoLoadedObjectGfx

//	; If there was something here before, reload it into another slot
//	ld a,d
//	or a
//	jr z,+
//	ld a,c
//	push de
//	call addIndexToLoadedObjectGfx
//	pop de
//+
//	call updateTileIndexBaseForAllObjects

//	; Check if bit 7 in the second parameter of objectGfxHeaderTable is set (indicating
//	; the end of the data)
//	ld d,$00
//	ld hl,objectGfxHeaderTable+1
//	add hl,de
//	add hl,de
//	add hl,de
//	bit 7,(hl)
//	ld a,b
//	jr z,@nextExtraGfxIndex

//	ld (wLoadedObjectGfxIndex),a
//	xor a
//	ld (wEnemyIDToLoadExtraGfx),a
//	ld (wInteractionIDToLoadExtraGfx),a
//	jp incLoadedObjectGfxIndex

//;;
//; Forces an object gfx header to be loaded into slot 4 (address 0:8800). Handy way to load
//; extra graphics, but uses up object slots. Used by the pirate ship and various things in
//; seasons, but apparently unused in ages.
//;
//; @param	e	Object gfx header (minus 1)
//loadObjectGfxHeaderToSlot4_body:
//	push de
//	call refreshObjectGfx_body
//	pop de
//	ld a,$03
//	jr refreshObjectGfx_body@nextExtraGfxIndex

//;;
//; @param	e	Tree gfx index
//loadTreeGfx_body:
//	ld hl,wLoadedTreeGfxActive
//	ld a,e
//	cp (hl)
//	ret z

//	call insertIndexIntoLoadedObjectGfx
//	jp resumeThreadNextFrameIfLcdIsOn

//;;
//updateTileIndexBaseForAllObjects:
//	push bc
//	push de
//	push hl

//	; Enemies
//	ld a,Enemy.enabled
//	ldh (<hActiveObjectType),a
//	ld d,FIRST_ENEMY_INDEX
//@nextEnemy:
//	call enemyGetObjectGfxIndex
//	call @updateTileIndexBase
//	inc d
//	ld a,d
//	cp LAST_ENEMY_INDEX+1
//	jr c,@nextEnemy

//	; Parts
//	ld a,Part.enabled
//	ldh (<hActiveObjectType),a
//	ld d,FIRST_PART_INDEX
//@nextPart:
//	call partGetObjectGfxIndex
//	call @updateTileIndexBase
//	inc d
//	ld a,d
//	cp LAST_PART_INDEX+1
//	jr c,@nextPart

//	; Interactions
//	ld a,Interaction.enabled
//	ldh (<hActiveObjectType),a
//	ld d,FIRST_DYNAMIC_INTERACTION_INDEX
//@nextInteraction:
//	call interactionGetObjectGfxIndex
//	call @updateTileIndexBase
//	inc d
//	ld a,d
//	cp LAST_INTERACTION_INDEX+1
//	jr c,@nextInteraction

//	; Items
//	ld a,Item.enabled
//	ldh (<hActiveObjectType),a
//	ld d,FIRST_ITEM_INDEX
//@nextItem:
//	call itemGetObjectGfxIndex
//	call @updateTileIndexBase
//	inc d
//	ld a,d
//	cp LAST_ITEM_INDEX+1
//	jr c,@nextItem

//	call drawAllSpritesUnconditionally
//	call resumeThreadNextFrameIfLcdIsOn
//	pop hl
//	pop de
//	pop bc
	assert(0);
}

//;;
//; Updates the oamTileIndexBase for an object (after graphics may have changed places).
//;
//; @param	a	Object gfx index
//; @param	d	Object index
//@updateTileIndexBase:
//	or a
//	ret z

//	call findIndexInLoadedObjectGfx
//	ldh a,(<hActiveObjectType)
//	ld e,a
//	ld a,(de)
//	or a
//	ret z

//	; If sprite uses vram bank 1, don't readjust oamTileIndexBase
//	ld a,e
//	add Object.oamFlags
//	ld e,a
//	ld a,(de)
//	bit 3,a
//	ret nz

//	; e = Object.oamTileIndexBase
//	inc e
//	ld a,(de)
//	and $1f
//	add c
//	ld (de),a
//	ret

//; Finds the given object gfx index in wLoadedObjectGfx and marks it as in use, or
//; sets the carry flag if it's not found.
//;
//; @param	a	Object gfx index
//; @param[out]	c
//; @param[out]	hl	Address where gfx is loaded (if it is loaded)
//; @param[out]	cflag	nc if index is loaded
bool findIndexInLoadedObjectGfx(ubyte index, out ubyte pos, out LoadedObjectGFX* foundPos) {
	if (index == 0) {
		return false;
	}
	for (int i = 0; i < loadedObjectGFX.length; i++) {
		if (loadedObjectGFX[i].index == index) {
			foundPos = &loadedObjectGFX[i];
			foundPos.active = 1;
			pos = cast(ubyte)((foundPos - &loadedObjectGFX[0]) << 5);
			return false;
		}
	}
	pos = 1;
	return true;
}
unittest {
	ubyte pos;
	LoadedObjectGFX* found;
	assert(findIndexInLoadedObjectGfx(1, pos, found));
	assert(pos == 1);
	assert(found is null);
	loadedObjectGFX[0].index = 1;
	assert(!findIndexInLoadedObjectGfx(1, pos, found));
	assert(pos == 0);
	assert(found == &loadedObjectGFX[0]);

	assert(findIndexInLoadedObjectGfx(2, pos, found));
	assert(pos == 1);

	loadedObjectGFX[1].index = 2;
	assert(!findIndexInLoadedObjectGfx(2, pos, found));
	assert(pos == 0x20);
	assert(found == &loadedObjectGFX[1]);
}

//; Gets the first unused entry of wLoadedObjectGfx it finds?
//; @param[out]	c	Relative position in wLoadedObjectGfx which is free
//; @param[out]	hl
//; @param[out]	cflag	Set on failure.
bool findUnusedIndexInLoadedObjectGfx(out ubyte pos, out LoadedObjectGFX* foundPos) {
	for (int i = 0; i < loadedObjectGFX.length; i++) {
		auto addr = getAddressOfLoadedObjectGfxIndex();
		if (addr.active == 0) {
			foundPos = addr;
			pos = cast(ubyte)((foundPos - &loadedObjectGFX[0]) << 5);
			return false;
		}
		incLoadedObjectGfxIndex();
	}
	pos = 1;
	return true;
}

void incLoadedObjectGfxIndex() {
	loadedObjectGFXIndex = (loadedObjectGFXIndex + 1) % loadedObjectGFX.length;
}

//; Gets an address in wLoadedObjectGfx based on wLoadedObjectGfxIndex.
LoadedObjectGFX* getAddressOfLoadedObjectGfxIndex() {
	return &loadedObjectGFX[loadedObjectGFXIndex];
}

//;;
//; Adds the given index into wLoadedObjectGfx if it's not in there already.
//;
//; @param	a	Object gfx index
//; @param[out]	a	Relative position where it's placed in wLoadedObjectGfx
//; @param[out]	cflag	Set if graphics were queued to be loaded and lcd is
//;			currently on
bool addIndexToLoadedObjectGfx(ubyte index, out ubyte relativePosition) {
	if (index == 0) {
		return false;
	}
	ubyte pos;
	bool result;
	LoadedObjectGFX* found;
	if (findIndexInLoadedObjectGfx(index, pos, found)) {
		result = findUnusedIndexInLoadedObjectGfx(pos, found);
		if (!result) {
			result = insertIndexIntoLoadedObjectGfx(index, found);
		}
	}
	relativePosition = pos;
	return result;
}

//;;
//; Adds index "e" into the wLoadedObjectGfx buffer at the specified position, or into
//; wLoadedTreeGfx if that's what hl is pointing to.
//;
//; Also performs the actual loading of the gfx, and removes any duplicates in
//; the list.
//;
//; @param	e	Object gfx index
//; @param	hl	Address in wLoadedObjectGfx?
bool insertIndexIntoLoadedObjectGfx(ubyte index, LoadedObjectGFX* addr) {
	if (addr != &loadedTreeGFX) {
		// First, remove any references to it if it's already loaded (to prevent redundancy)
		for (int i = 0; i < loadedObjectGFX.length; i++) {
			if (loadedObjectGFX[i].index == index) {
				loadedObjectGFX[i].active = 0;
				loadedObjectGFX[i].index = 0;
			}
		}
	}
	addr.index = index;
	addr.active = 1;
	ubyte destination;
	const(ObjectGFX)* src;
	if (addr == &loadedTreeGFX) {
		destination = 0x92;
		src = &treeGFXHeaderTable[0];
	} else {
		destination = cast(ubyte)(0x80 | ((addr - &loadedObjectGFX[0]) * 2));
		src = &objectGFXHeaderTable[0];
	}
	return loadObjectGFX(destination, &src[index]);
}

//; Mark a particular object gfx index as used. This doesn't insert the index into
//; wLoadedObjectGfx if it's not found, though.
//; @param a Object gfx index to mark as used
void markLoadedObjectGfxUsed(ubyte gfxObject) {
	if (gfxObject == 0) {
		return;
	}
	foreach (ref objectGFX; loadedObjectGFX) {
		if (objectGFX.index == gfxObject) {
			objectGFX.active = 1;
			return;
		}
	}
}

// Sets the 2nd byte of every entry in the wLoadedObjectGfx buffer to $00, indicating that they are not being used.
void markAllLoadedObjectGfxUnused() {
	foreach (ref objectGFX; loadedObjectGFX) {
		objectGFX.active = 0;
	}
}

//;;
//; Get an enemy's gfx index, as well as a pointer to the rest of its data.
//; @param[out]	a	Object gfx index
//; @param[out]	hl	Pointer to 3 more bytes of enemy data
ubyte enemyGetObjectGfxIndex(GameObject* obj) {
	return getObjectGfxIndexForEnemy(obj.id);
}

//;;
//; @param	a	Enemy ID
ubyte getObjectGfxIndexForEnemy(ubyte id) {
	return enemyData[id].objectGFX;
}

//; @param[out]	a	Object gfx index
//; @param[out]	hl	Pointer to 7 more bytes of part data
ubyte partGetObjectGfxIndex(GameObject* obj) {
	return partData[obj.id].objectGFX;
}

ubyte interactionGetObjectGfxIndex(GameObject* obj, out const(InteractionData)* interactionData) {
	interactionData = interactionGetData(obj);
	return interactionData.objectGFX;
}

ubyte itemGetObjectGfxIndex(GameObject* obj) {
	const(ItemDef)* _;
	return itemGetObjectGfxIndex(obj, _);
}
ubyte itemGetObjectGfxIndex(GameObject* obj, out const(ItemDef)* data) {
	data = &itemData[obj.id];
	return data.objectGFX;
}

//;;
//; Loading an enemy?
//enemyLoadGraphicsAndProperties:
//	call enemyGetObjectGfxIndex
//	call addIndexToLoadedObjectGfx
//	ld c,a
//	call c,resumeThreadNextFrameIfLcdIsOn
//	ld e,Enemy.id
//	ld a,(de)
//	ld e,Enemy.collisionType
//	bit 7,(hl)
//	jr z,+
//	set 7,a
//+
//	ld (de),a

//	; e = Enemy.enemyCollisionMode
//	inc e
//	ldi a,(hl)
//	and $7f
//	ld (de),a
//	bit 7,(hl)
//	jr z,+

//	; If bit 7 is set, read the next 2 bytes as the address of a table.
//	; Each entry in the table is for a particular subID. hl will be set to
//	; [the table's start address] + (subID*2), or the first entry without
//	; bit 7 set, whichever comes first.
//	ldi a,(hl)
//	and $7f
//	ld l,(hl)
//	ld h,a
//	ld e,Enemy.subid
//	ld a,(de)
//	ld b,a
//	ld e,$00
//-
//	bit 7,(hl)
//	jr z,+

//	ld a,e
//	cp b
//	jr z,+

//	inc hl
//	inc hl
//	inc e
//	jr -
//+
//	ldi a,(hl)
//	push hl
//	add a
//	ld hl,extraEnemyData
//	rst_addDoubleIndex
//	ld e,$a6
//	ldi a,(hl)
//	ld (de),a
//	inc e
//	ldi a,(hl)
//	ld (de),a
//	inc e
//	ldi a,(hl)
//	ld (de),a
//	inc e
//	ldi a,(hl)
//	ld (de),a
//	pop hl
//	ld a,(hl)
//	and $0f
//	add a
//	add c
//	ld e,Enemy.oamTileIndexBase
//	ld (de),a
//	ld a,(hl)
//	swap a
//	and $0f
//	dec e
//	ld (de),a
//	dec e
//	ld (de),a
//	xor a
//	jp enemySetAnimation

//;;
//; Loading a part?
//partLoadGraphicsAndProperties:
//	call partGetObjectGfxIndex
//	call addIndexToLoadedObjectGfx
//	ld c,a
//	call c,resumeThreadNextFrameIfLcdIsOn
//	ld e,Part.id
//	ld a,(de)
//	bit 7,(hl)
//	jr z,+
//	set 7,a
//+
//	ld e,Part.collisionType
//	ld (de),a

//	; e = Part.enemyCollisionMode
//	inc e
//	ldi a,(hl)
//	and $7f
//	ld (de),a

//	; e = Part.collisionRadiusY
//	inc e
//	ld a,(hl)
//	swap a
//	and $0f
//	ld (de),a

//	; e = Part.collisionRadiusX
//	inc e
//	ldi a,(hl)
//	and $0f
//	ld (de),a

//	; e = Part.damage
//	inc e
//	ldi a,(hl)
//	ld (de),a

//	; e = Part.health
//	inc e
//	ldi a,(hl)
//	ld (de),a

//	ld e,Part.oamTileIndexBase
//	ldi a,(hl)
//	add c
//	ld (de),a

//	; e = Part.oamFlags
//	dec e
//	ldi a,(hl)
//	ld (de),a

//	; Also write to Part.oamFlagsBackup
//	dec e
//	ld (de),a

//	xor a
//	jp partSetAnimation

//;;
//; Load the object gfx index for an interaction, and get the values for the
//; Interaction.oam variables.
//;
//; @param	d	Interaction index
//; @param[out]	a	Initial animation index to use
ubyte interactionLoadGraphics(GameObject* obj) {
	ubyte pos; //  in c reg
	const(InteractionData)* interaction;
	if (addIndexToLoadedObjectGfx(interactionGetObjectGfxIndex(obj, interaction), pos)) {
		// If LCD is on and graphics are queued, wait until they're loaded
		resumeThreadNextFrameIfLcdIsOn();
	}

	// Calculate Interaction.oamTileIndexBase, which is the offset to add to the tile index of all sprites in its animation. "c" currently contains the offset where the graphics are loaded.
	obj.oamTileIndexBase = cast(ubyte)((interaction.oamTileBase & 0x7F) + pos);
	obj.oamFlagsBackup = obj.oamFlags = interaction.oamFlags >> 4;

	// Return the animation index to start on
	return interaction.oamFlags & 0xF;
}

//;;
//; Same as above function, but for items.
//; @param d Item index
void itemLoadGraphics(GameObject* obj) {
	ubyte pos;
	const(ItemDef)* item;
	if (addIndexToLoadedObjectGfx(itemGetObjectGfxIndex(obj, item), pos)) {
		// If LCD is on and graphics are queued, wait until they're loaded
		resumeThreadNextFrameIfLcdIsOn();
	}

	// Calculate Item.oamTileIndexBase
	obj.oamTileIndexBase = cast(ubyte)(item.oamTileBase + pos);

	// Write palette / flags into Item.oamFlags & oamFlagsBackup
	obj.oamFlagsBackup = obj.oamFlags = item.oamFlags;
}

const(InteractionData)* interactionGetData(GameObject* obj) {
	return getDataForInteraction(obj.id, obj.subid);
}

//; @param	a	Interaction ID
//; @param	e	Interaction subID
const(InteractionData)* getDataForInteraction(ubyte id, ubyte subid) {
	return &interactionData[id][(subid >= $) ? ($ - 1) : subid];
}

//;;
//; @param e Uncompressed gfx header to load
//loadWeaponGfx:
//	ld hl,wLoadedItemGraphic1
//	ld a,e
//	cp UNCMP_GFXH_1a
//	jr nc,+
//	inc l
//+
//	cp (hl)
//	ret z

//	ld (hl),a
//	push de
//	call loadUncompressedGfxHeader
//	pop de
//	ret
