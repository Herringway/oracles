module oracles.common.objects.interactions.shopItem;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_SHOP_ITEM
//;
//; Variables:
//;   var30/31: Y/X position where the item rests in the selection area
//; ==================================================================================================
void interactionCode47(GameObject* obj) {
//	ld e,Interaction.state
//	ld a,(de)
//	rst_jumpTable
//	.dw shopItemState0
//	.dw objectAddToGrabbableObjectBuffer
//	.dw shopItemState2
//	.dw shopItemState3
//	.dw shopItemState4
//	.dw shopItemState5
	assert(0, "NYI");
}


//shopItemState0:
//	; Check that we're actually in a shop
//	ld a,(wInShop)
//	and $02
//	ret z

//	ld a,$01
//	ld (de),a

//.ifdef ROM_AGES
//	; If this is the ring box upgrade, check whether to change it to the L3 box
//	ld e,Interaction.subid
//	ld a,(de)
//	cp $00
//	jr nz,++

//	ld a,TREASURE_RING_BOX
//	call checkTreasureObtained
//	jr nc,++

//	ld a,(wRingBoxLevel)
//	dec a
//	jr z,++
//	ld a,$14
//	ld (de),a
//++
//	; If this is 10 bombs, delete self if Link doesn't have bombs
//	ld a,(de)
//	cp $04
//	jr nz,++
//	ld a,TREASURE_BOMBS
//	call checkTreasureObtained
//	jp nc,shopItemPopStackAndDeleteSelf
//	jr @checkFlutePurchasable
//++
//.else
//	ld a,TREASURE_SWORD
//	call checkTreasureObtained
//	jp nc,shopItemPopStackAndDeleteSelf
//	ld e,Interaction.subid
//	ld a,(de)
//.endif

//	; If this is the shield, check whether to replace it with a gasha seed (linked)
//	cp $03
//	jr nz,@checkFlutePurchasable
//	call checkIsLinkedGame
//	jr z,@checkFlutePurchasable

//	; Replace with gasha seed
//	ld a,$13
//	ld (de),a

//@checkFlutePurchasable:
//	; Decide whether the flute is purchasable (update bit 3 of wBoughtShopItems2)
//	ld a,TREASURE_FLUTE
//	call checkTreasureObtained
//	jr c,@fluteNotPurchasable

//.ifdef ROM_AGES
//	ld a,GLOBALFLAG_CAN_BUY_FLUTE
//	call checkGlobalFlag
//	jr z,@fluteNotPurchasable
//.else
//	ld a,(wRickyState)
//	bit 5,a
//	jr nz,@fluteNotPurchasable
//	ld a,(wEssencesObtained)
//	bit 1,a
//	jr z,@fluteNotPurchasable
//	call checkIsLinkedGame
//	jr nz,@fluteNotPurchasable
//.endif

//	; Flute purchasable
//	ld c,$08
//	jr ++

//@fluteNotPurchasable:
//	ld c,$00
//++
//	ld a,(wBoughtShopItems2)
//	and $f7
//	or c
//	ld (wBoughtShopItems2),a

//	; Update bits in wBoughtShopItems2 based on if Link has bombchus?
//	ld a,TREASURE_BOMBCHUS
//	call checkTreasureObtained
//	ld c,$10
//	jr c,+
//	ld c,$20
//+
//	ld a,(wBoughtShopItems2)
//	and $cf
//	or c
//	ld (wBoughtShopItems2),a

//	; Check whether the item can be sold by reading from "shopItemReplacementTable".
//	; This checks for particular bits in memory to see if an item is purchasable. If
//	; it's not, it may be replaced with a different item.
//@checkReplaceItem:
//	ld e,Interaction.subid
//	ld a,(de)
//	add a
//	ld hl,shopItemReplacementTable
//	rst_addDoubleIndex

//	; Check the bit in memory stating if the item should be replaced with another
//	ldi a,(hl)
//	ld c,a
//	ld b,>wc600Block
//	ld a,(bc)
//	and (hl)
//	jr z,@itemOK

//	; The item should be replaced. Check if the next byte is a valid item index.
//	inc hl
//	ldi a,(hl)
//	bit 7,a
//	jr nz,shopItemPopStackAndDeleteSelf

//	; Try this item. Need to run the above checks again.
//	ld (de),a
//	ld e,Interaction.xh
//	ld a,(de)
//	add (hl)
//	ld (de),a
//	jr @checkReplaceItem

//@itemOK:
//	call interactionInitGraphics
//	ld a,$07
//	call objectSetCollideRadius

//	ld l,Interaction.var30
//	ld e,Interaction.yh
//	ld a,(de)
//	ldi (hl),a
//	ld e,Interaction.xh
//	ld a,(de)
//	ldi (hl),a

//	call objectSetVisible83
//	jr shopItemUpdateRupeeDisplay

//shopItemState5:
//	call retIfTextIsActive
//	xor a
//	ld (wDisabledObjects),a
//	ld (wMenuDisabled),a


//;;
//; The fact that this pops the stack means that it will return one level higher than it's
//; supposed to? This ultimately isn't a big deal, it just means that other interactions
//; won't be updated until next frame, but it's probably unintentional...
//shopItemPopStackAndDeleteSelf:
//	pop af
//	jp interactionDelete


//; State 2: item picked up by Link
//shopItemState2:
//	ld e,Interaction.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1

//@substate0:
//	ld a,$01
//	ld (de),a

//	; Item should be fully lifted instantly
//	ld a,$08
//	ld (wLinkGrabState2),a

//	call objectSetVisible80
//	jr shopItemClearRupeeDisplay

//@substate1:
//	call shopItemCheckGrabbed
//	ret nz

//	; Fall through to state 4 if Link pressed the button near the selection area


//; State 4: Return to selection area
//shopItemState4:
//	; Set Y/X to selection area
//	ld h,d
//	ld e,Interaction.yh
//	ld l,Interaction.var30
//	ldi a,(hl)
//	ld (de),a
//	ld e,Interaction.xh
//	ld a,(hl)
//	ld (de),a

//	ld l,Interaction.zh
//	ld (hl),$00

//	ld l,Interaction.state
//	ld (hl),$01

//	call shopItemUpdateRupeeDisplay
//	call objectSetVisible83
//	jp dropLinkHeldItem

//;;
//; Clears the tiles in w3VramLayout corresponding to item price, and sets bit 2 of wInShop
//; in order to request a tilemap update.
//;
//shopItemClearRupeeDisplay:
//	call shopItemGetTilesForRupeeDisplay
//	ret nc

//	; Replace the tiles generated by above function call with spaces
//	push hl
//	ld a,$03
//	rst_addAToHl
//	ld a,$20
//	ldi (hl),a
//	inc l
//	ldi (hl),a
//	inc l
//	ldi (hl),a
//	pop hl
//	jr ++

//;;
//; Updates the tiles in w3VramLayout corresponding to item price, and sets bit 2 of wInShop
//; in order to request a tilemap update.
//;
//shopItemUpdateRupeeDisplay:
//	call shopItemGetTilesForRupeeDisplay
//	ret nc
//++
//	ld a,($ff00+R_SVBK)
//	push af
//	ld a,:w3VramTiles
//	ld ($ff00+R_SVBK),a
//	push de
//	ldi a,(hl)
//	ld e,a
//	ldi a,(hl)
//	ld d,a
//	ldi a,(hl)
//	ld b,a

//@nextTile:
//	ldi a,(hl)
//	ld (de),a
//	set 2,d
//	ldi a,(hl)
//	ld (de),a
//	res 2,d
//	inc de
//	dec b
//	jr nz,@nextTile

//	pop de
//	pop af
//	ld ($ff00+R_SVBK),a
//	ld hl,wInShop
//	set 2,(hl)
//	ret


//; State 3: Link obtains the item (he just bought it, the shopkeeper set the state to this)
//shopItemState3:
//	; Take rupees
//	ld e,Interaction.subid
//	ld a,(de)
//	ld hl,shopItemPrices
//	rst_addAToHl
//	ldi a,(hl)
//	call removeRupeeValue

//	; Determine what the treasure is, give it to him
//	ld e,Interaction.subid
//	ld a,(de)
//	ld hl,shopItemTreasureToGive
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld c,(hl)
//	cp $00
//	jr nz,+
//	call getRandomRingOfGivenTier
//+
//	call giveTreasure

//.ifdef ROM_SEASONS
//	ld e,Interaction.subid
//	ld a,(de)
//	or a
//	call z,refillSeedSatchel
//.endif

//	ld e,Interaction.state
//	ld a,$05
//	ld (de),a

//	ld a,LINK_STATE_04
//	ld (wLinkForceState),a
//	ld a,$01
//	ld (wcc50),a

//	; Show text for the item
//	ld e,Interaction.subid
//	ld a,(de)
//	ld hl,shopItemTextTable
//	rst_addAToHl
//	ld a,(hl)
//	ld c,a
//	or a
//	ld b,>TX_0000
//	jp nz,showText
//	ret

//;;
//; Gets the tiles to replace in the rupee display.
//;
//; @param[out]	hl	Pointer to tile data (always at wTmpcec0). Data format:
//;			* Destination in w3VramTiles to write to (word)
//;			* Number of tiles to write (byte)
//;			* For each tile:
//;				* Tile index (byte)
//;				* Tile attribute (byte
//; @param[out]	cflag	nc if nothing to do?
//shopItemGetTilesForRupeeDisplay:
//	ld e,Interaction.subid
//	ld a,(de)
//	ld c,a
//	ld hl,@itemPricePositions
//	rst_addDoubleIndex
//	ldi a,(hl)
//	cp $ff
//	ret z

//	push de
//	ld e,a
//	ld d,(hl)

//	ld a,c
//	ld hl,shopItemPrices
//	rst_addAToHl
//	ld a,(hl)
//	call getRupeeValue

//	ld hl,wTmpcec0
//	ld (hl),e
//	inc l
//	ld (hl),d
//	inc l

//.ifdef ROM_AGES
//	ld e,$06 ; Attribute value to use
//.else
//	ld e,$03 ; Attribute value to use
//.endif
//	ld d,$30 ; Tile index "base" (digit 0 is tile $30)
//	ld a,$02 ; Number of tiles to write
//	ldi (hl),a
//	ld a,b
//	or a
//	jr z,+

//	; If this is a 3 digit number, go back, increment the size, and draw the first
//	; digit.
//	dec l
//	inc (hl)
//	inc l
//	call @drawDigit
//+
//	ld a,c
//	swap a
//	call @drawDigit

//	ld a,c
//	call @drawDigit

//	ld hl,wTmpcec0
//	pop de
//	scf
//	ret

//@drawDigit:
//	and $0f
//	add d
//	ldi (hl),a
//	ld (hl),e
//	inc l
//	ret

//@itemPricePositions:
//	.dw w3VramTiles+$66
//	.dw w3VramTiles+$6f
//	.dw w3VramTiles+$6a
//	.dw w3VramTiles+$6c
//	.dw w3VramTiles+$69
//	.dw w3VramTiles+$6e
//	.dw w3VramTiles+$6a
//	.dw w3VramTiles+$68
//	.dw w3VramTiles+$6d
//	.dw w3VramTiles+$6b
//	.dw w3VramTiles+$6f
//	.dw w3VramTiles+$67
//	.dw $ffff
//	.dw w3VramTiles+$6f
//	.dw w3VramTiles+$67
//	.dw w3VramTiles+$6b
//	.dw w3VramTiles+$6f
//	.dw w3VramTiles+$6c
//	.dw w3VramTiles+$6c
//	.dw w3VramTiles+$6c
//.ifdef ROM_AGES
//	.dw w3VramTiles+$66
//	.dw w3VramTiles+$6e
//.endif

//shopItemPrices:
//	/* $00 */ .db RUPEEVAL_300
//	/* $01 */ .db RUPEEVAL_010
//	/* $02 */ .db RUPEEVAL_300
//	/* $03 */ .db RUPEEVAL_030
//	/* $04 */ .db RUPEEVAL_020
//.ifdef ROM_AGES
//	/* $05 */ .db RUPEEVAL_300
//.else
//	/* $05 */ .db RUPEEVAL_200
//.endif
//	/* $06 */ .db RUPEEVAL_500
//	/* $07 */ .db RUPEEVAL_300
//	/* $08 */ .db RUPEEVAL_300
//	/* $09 */ .db RUPEEVAL_300
//	/* $0a */ .db RUPEEVAL_300
//	/* $0b */ .db RUPEEVAL_100
//	/* $0c */ .db RUPEEVAL_010
//	/* $0d */ .db RUPEEVAL_150
//	/* $0e */ .db RUPEEVAL_100
//	/* $0f */ .db RUPEEVAL_100
//	/* $10 */ .db RUPEEVAL_100
//	/* $11 */ .db RUPEEVAL_050
//	/* $12 */ .db RUPEEVAL_080
//	/* $13 */ .db RUPEEVAL_030
//.ifdef ROM_AGES
//	/* $14 */ .db RUPEEVAL_300
//	/* $15 */ .db RUPEEVAL_500
//.endif

//;;
//; @param[out]	zflag	z if Link should grab or release the item
//shopItemCheckGrabbed:
//	ld a,(wGameKeysJustPressed)
//	and (BTN_A|BTN_B)
//	jr z,@dontGrab

//	; Check Link's close enough to the selection area (horizontally)
//	ld e,Interaction.var31
//	ld a,(de)
//	sub $0d
//	ld b,a
//	add $1a
//	ld hl,w1Link.xh
//	cp (hl)
//	jr c,@dontGrab

//	ld a,b
//	cp (hl)
//	jr nc,@dontGrab

//	; Check Link's close enough to the selection area (vertically)
//	ld l,<w1Link.yh
//	ld a,(hl)
//	cp $3d
//	jr nc,@dontGrab

//	; Check that Link's facing the selection area (DIR_UP)
//	ld l,<w1Link.direction
//	ld a,(hl)
//	or a
//	ret

//@dontGrab:
//	or d
//	ret


//; These are the treasures that Link receives when he buys a shop item.
//;   b0: Treasure index to give (if $00, it's a random ring)
//;   b1: Treasure parameter (if it's random ring, this is the tier of the ring)
//shopItemTreasureToGive:
//.ifdef ROM_AGES
//	/* $00 */ .db  TREASURE_RING_BOX      $02
//.else
//	/* $00 */ .db  TREASURE_SEED_SATCHEL  $01
//.endif
//	/* $01 */ .db  TREASURE_HEART_REFILL  $0c
//	/* $02 */ .db  TREASURE_GASHA_SEED    $01
//	/* $03 */ .db  TREASURE_SHIELD        $01
//	/* $04 */ .db  TREASURE_BOMBS         $10
//.ifdef ROM_AGES
//	/* $05 */ .db  $00                    $03
//.else
//	/* $05 */ .db  TREASURE_TREASURE_MAP  $01
//.endif
//	/* $06 */ .db  TREASURE_GASHA_SEED    $01
//	/* $07 */ .db  TREASURE_POTION        $01
//	/* $08 */ .db  TREASURE_GASHA_SEED    $01
//	/* $09 */ .db  TREASURE_POTION        $01
//	/* $0a */ .db  TREASURE_GASHA_SEED    $01
//	/* $0b */ .db  TREASURE_BOMBCHUS      $05
//	/* $0c */ .db  $00                    $00
//.ifdef ROM_AGES
//	/* $0d */ .db  TREASURE_FLUTE         SPECIALOBJECT_DIMITRI
//	/* $0e */ .db  TREASURE_GASHA_SEED    $01
//	/* $0f */ .db  TREASURE_RING          GBA_TIME_RING
//.else
//	/* $0d */ .db  TREASURE_FLUTE         SPECIALOBJECT_MOOSH
//	/* $0e */ .db  TREASURE_GASHA_SEED    $01
//	/* $0f */ .db  TREASURE_RING          GBA_NATURE_RING
//.endif
//	/* $10 */ .db  $00                    $01
//	/* $11 */ .db  TREASURE_SHIELD        $02
//	/* $12 */ .db  TREASURE_SHIELD        $03
//	/* $13 */ .db  TREASURE_GASHA_SEED    $01
//.ifdef ROM_AGES
//	/* $14 */ .db  TREASURE_RING_BOX      $03
//	/* $15 */ .db  TREASURE_HEART_PIECE   $01
//.endif


//; This lists conditions where a shop item may be replaced with something else.
//;   b0: Low byte of an address in $c6xx block
//;   b1: Bitmask to check at that address. If result is 0, the item can be sold.
//;       If the result is nonzero, a different item is sold instead based on b2.
//;   b2: Item to sell if the first one is unavailable (or $ff to sell nothing)
//;   b3: Value to add to x position if the first item was sold out
//shopItemReplacementTable:
//	/* $00 */ .db <wBoughtShopItems1  $01 $ff $00
//	/* $01 */ .db <wBoughtShopItems2  $08 $0d $04
//	/* $02 */ .db <wBoughtShopItems1  $02 $06 $00
//	/* $03 */ .db <wShieldLevel       $02 $11 $00
//	/* $04 */ .db <wBoughtShopItems1  $00 $ff $00
//	/* $05 */ .db <wBoughtShopItems1  $08 $ff $00
//	/* $06 */ .db <wBoughtShopItems1  $04 $ff $00
//	/* $07 */ .db <wBoughtShopItems2  $10 $09 $18
//	/* $08 */ .db <wBoughtShopItems2  $10 $0a $10
//	/* $09 */ .db <wBoughtShopItems1  $00 $ff $00
//	/* $0a */ .db <wBoughtShopItems1  $40 $ff $00
//	/* $0b */ .db <wBoughtShopItems2  $20 $ff $00
//	/* $0c */ .db <wBoughtShopItems1  $00 $ff $00
//	/* $0d */ .db <wBoughtShopItems2  $00 $ff $00
//	/* $0e */ .db <wBoughtShopItems2  $01 $ff $00
//	/* $0f */ .db <wBoughtShopItems2  $02 $ff $00
//	/* $10 */ .db <wBoughtShopItems2  $04 $ff $00
//	/* $11 */ .db <wShieldLevel       $01 $12 $00
//	/* $12 */ .db <wShieldLevel       $00 $ff $00
//	/* $13 */ .db <wBoughtShopItems1  $20 $03 $00
//.ifdef ROM_AGES
//	/* $14 */ .db <wBoughtShopItems1  $01 $ff $00
//	/* $15 */ .db <wBoughtShopItems2  $40 $05 $00
//.endif


//; Text to show upon buying a shop item (or $00 for no text)
//shopItemTextTable:
//.ifdef ROM_AGES
//	/* $00 */ .db <TX_0058
//.else
//	/* $00 */ .db <TX_0046
//.endif
//	/* $01 */ .db <TX_004c
//	/* $02 */ .db <TX_004b
//	/* $03 */ .db <TX_001f
//	/* $04 */ .db <TX_004d
//.ifdef ROM_AGES
//	/* $05 */ .db <TX_0054
//.else
//	/* $05 */ .db <TX_006c
//.endif
//	/* $06 */ .db <TX_004b
//	/* $07 */ .db <TX_006d
//	/* $08 */ .db <TX_004b
//	/* $09 */ .db <TX_006d
//	/* $0a */ .db <TX_004b
//	/* $0b */ .db <TX_0032
//	/* $0c */ .db $00
//	/* $0d */ .db <TX_003b
//	/* $0e */ .db <TX_004b
//	/* $0f */ .db <TX_0054
//	/* $10 */ .db <TX_0054
//	/* $11 */ .db <TX_0020
//	/* $12 */ .db <TX_0021
//	/* $13 */ .db <TX_004b
//.ifdef ROM_AGES
//	/* $14 */ .db <TX_0059
//	/* $15 */ .db <TX_0017
//.endif
