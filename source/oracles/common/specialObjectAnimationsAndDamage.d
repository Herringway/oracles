module oracles.common.specialObjectAnimationsAndDamage;

import oracles.bank00;
import oracles.data;
import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;
import oracles.common.data.specialObjectAnimations;
import std.logger;

//;;
//; Sets the object's animation using Link's animation data tables?
//;
//; @param	a	Animation (value for SpecialObject.animMode)
//specialObjectSetAnimationWithLinkData:
//	ld e,SpecialObject.animMode
//	ld (de),a
//	add a
//	ld c,a
//	ld b,$00
//	ld a,(w1Link.id)
//	jr label_06_032

//;;
//; Same as "specialObjectAnimate" in bank 0, but optimized for this bank?
//specialObjectAnimate_optimized:
//	ld h,d
//	ld l,SpecialObject.animCounter
//	dec (hl)
//	ret nz
//	ld l,SpecialObject.animPointer
//	jr specialObjectNextAnimationFrame

//;;
//; This is called from bank0.specialObjectSetAnimation.
//; Called after changing w1Link.animMode (or w1Companion.AnimMode)
//;
//; @param	bc	Animation index (times 2)
//; @param	d	Object
void specialObjectSetAnimationBody(GameObject* object, ushort animation) {
	label06032(object, object.id);
}

void label06032(GameObject* object, ubyte index) {
	specialObjectNextAnimationFrame(object, &specialObjectAnimationTable[index][0][0]);
}

//; @param	d	Object
//; @param	hl	Address of pointer to animation data
void specialObjectNextAnimationFrame(GameObject* object, const(AnimationData)* animFrame) {
	// Check for loop
	if (animFrame.frameCount == 0xFF) {
		animFrame += animFrame.loopTarget;
	}
	object.animCounter = animFrame.frameCount;
	object.animParameter = animFrame.etc;
	object.animPointer = animFrame + 1;
	object.var31 = animFrame.frameIndex;
}


//	.include {"{GAME_DATA_DIR}/specialObjectAnimationPointers.s"}

//;;
void loadLinkAndCompanionAnimationFrameBody() {
	//;;
	//; @param	a	Frame index?
	//; @param	h	Object (should be LINK_OBJECT_INDEX ($d0) or COMPANION_OBJECT_INDEX ($d1))
	static void loadAnimationFrame(ubyte frame, GameObject* object) {
		if (frame == object.var32) {
			return;
		}
		object.var32 = frame;
		ubyte size;
		ubyte bank;
		const(void)* gfxSource;
		if (getSpecialObjectGraphicsFrame(frame, object, size, bank, gfxSource)) {
			return;
		}
		ushort dest;
		// always uses the 2nd VRAM bank, so switch to it here real quick to get a vram address
		ubyte oldVBK = gbc.VBK;
		gbc.VBK = 1;
		scope(exit) { gbc.VBK = oldVBK; }
		if (object.id < SpecialObject.minecart) {
			dest = 0x8700;
		} else {
			dest = 0x8600 + object.id & 0xFE;
		}
		queueDMATransfer(size, bank, gfxSource[0 .. size * 16], gbc.vram[dest - 0x8000 .. $]);
	}
	// These are animation frame indices; frame indices under the given value don't have link's direction added to them?
	immutable ubyte[] data = [
		SpecialObject.link: 0x54,
		SpecialObject.unnamed01: 0x20,
		SpecialObject.linkAsBaby: 0,
		SpecialObject.linkAsSubrosian: 0,
		SpecialObject.linkAsRetro: 0,
		SpecialObject.linkAsOctorok: 0,
		SpecialObject.linkAsMoblin: 0,
		SpecialObject.linkAsLikeLike: 0,
		SpecialObject.linkCutscene: gameVersion == GameVersion.ages ? 0xFF : 0x40,
		SpecialObject.linkRidingAnimal: 0xFF
	];
	linkPushingDirection = 0xFF;
	if ((link.visible & 0x80) != 0) {
		ubyte b = func4553();
		ubyte frame = b;
		if (b >= data[link.id]) {
			frame = cast(ubyte)(link.direction + b);
		}
		loadAnimationFrame(frame, link);
	} else if ((companion.visible & 0x80) != 0) {
		loadAnimationFrame(companion.var31, companion);
	}
}

//;;
//; Gets size, address of graphics to load.
//; Also sets w1Link.oamDataAddress.
//;
//; @param	a	Index of graphics to load
//; @param[out]	b	Size of graphics
//; @param[out]	c	Bank of graphics
//; @param[out]	hl	Address of graphics
//; @param[out]	zflag	Set if there are no graphics to load.
bool getSpecialObjectGraphicsFrame(ubyte frame, GameObject* object, out ubyte size, out ubyte bank, out const(void)* gfx) {
	auto gfxData = specialObjectGraphicsTable[object.id][frame];

	// Byte 0
	object.oamDataAddress = &specialObjectOAMDataTable[object.id][gfxData.oamIndex];

	// Bytes 1-2: address of graphics
	if (gfxData.source == GFXAsset.none) {
		return true;
	}
	gfx = &gfxAsset(gfxData.source, gfxData.offset)[0];

	// Bit 0: bank select (ignored?)
	//	ld a,l
	//	and $01
	//	add :spr_link
	//	ld c,a

	//	; Bits 1-4: size (divided by 16)
	size = cast(ubyte)(gfxData.size & 0x1E);

	//	; Clear bit 4 (bits 0-3 will be ignored by dma)
	//	res 4,l
	return false;
}

//;;
//; @param[out]	b	Frame index to use (not accounting for direction)
//;
ubyte func4553() {
	if (link.id != 0) {
		return link.var31;
	}
	ubyte c;
	ubyte b;
	for (int i = 2; i < 6; i++) {
		if (itemObjects[i].var3F >= c) {
			c = itemObjects[i].var3F;
			b = itemObjects[i].var31;
		}
	}
	if (link.var3F < c) {
		return b;
	}
	if (link.animMode != LinkAnimMode.walk) {
		return link.var31;
	}

	// double check if this function clobbers the B register
	return cast(ubyte)(getLinkWalkingAnimation() + b);
}

//;;
//; Determines what kind of walking animation link should be doing; whether he's pushing
//; something, has a shield out, etc.
//;
//; @param[out]	a	Value written to w1Link.var34
ubyte getLinkWalkingAnimation() {
//.ifdef ROM_AGES
//	ld c,$0a
//	ld a,(wTilesetFlags)
//	and TILESETFLAG_UNDERWATER
//	jr z,@notUnderwater

//@underwater:
//	call checkLinkPushingAgainstWall
//	jp nc,@animationFound

//	ld a,(w1Link.direction)
//	ld (wLinkPushingDirection),a
//	jr @animationFound
//.endif

//@notUnderwater:
//	ld c,$00
//	ld a,(wLinkGrabState)
//	bit 6,a
//	ret nz

//	; Check if he's holding something
//	or a
//	jr z,+
//	ld c,$02
//+
//	; Check if he's riding a cart / animal
//	ld a,(wLinkObjectIndex)
//	rrca
//	jr nc,+

//	; Check if he's riding a minecart
//	ld a,(w1Companion.id)
//	cp $0a
//	jr nz,+
//	inc c
//+
//	; Done if holding something or riding a minecart (or both)
//	ld a,c
//	or a
//	jr nz,@animationFound

//	; Check if using magnet gloves
//	ld a,(wMagnetGloveState)
//	or a
//	jr z,+

//	ld c,$09
//	jr @animationFound
//+
//	; Check if he's holding out the shield, and what level
//	ld a,(wUsingShield)
//	or a
//	jr z,+

//	ld c,$07
//	cp $02
//	jr c,@animationFound

//	inc c
//	jr @animationFound
//+
//	; Don't do push animation while holding a sword, cane, etc.
//	ld a,(wLinkTurningDisabled)
//	or a
//	jr nz,@standingAnimation

//	; Override to always do push animation?
//	ld a,(wForceLinkPushAnimation)
//	dec a
//	jr z,@pushingAnimation

//	; Override to never do push animation?
//	ld a,(wForceLinkPushAnimation)
//	rlca
//	jr c,@standingAnimation

//	; If link is climbing a vine, he always faces up, so don't do push animation
//	ld a,(wLinkClimbingVine)
//	ld l,a

//	; Also don't while text is active for some reason?
//	ld a,(wTextIsActive)
//	or l
//	jr nz,@standingAnimation

//	call checkLinkPushingAgainstWall
//	jr nc,@standingAnimation

//	; Pushing against a wall
//@pushingAnimation:
//	ld a,(w1Link.direction)
//	ld (wLinkPushingDirection),a
//	ld c,$04
//	jr @animationFound

//	; Standard, just walking or standing animation
//@standingAnimation:
//	ld a,(wInventoryA)
//	cp ITEM_SHIELD
//	jr z,@shieldEquipped

//	ld a,(wInventoryB)
//	cp ITEM_SHIELD
//	jr nz,@animationFound

//	; Walking or standing with shield equipped
//@shieldEquipped:
//	ld c,$05
//	ld a,(wShieldLevel)
//	cp $01
//	jr z,@animationFound
//	ld c,$06

//@animationFound:
//	ld a,(wLinkClimbingVine)
//	or a
//	jr z,+

//	xor a
//	ld (w1Link.direction),a
//+
//	ld a,c
//	add a
//	add a
//	ld (w1Link.var34),a
	assert(0, "NYI");
}

//;;
//; Gets the ID to use for the Link object based on what transformation rings he's wearing
//; (see constants/common/specialObjects.s).
//; Under normal circumstances, this will return 0 (SPECIALOBJECT_LINK).
//; @param[out] b Special object ID to use, based on the ring Link is wearing
//getTransformedLinkID:
//	ld hl,wDisableRingTransformations
//	ld a,(hl)
//	or a
//	jr z,+

//	dec (hl)
//	jr ++

//	; Check whether Link is wearing a ring
//+
//	; Rings do nothing in sidescrolling, underwater areas
//	ld a,(wTilesetFlags)
//.ifdef ROM_AGES
//	and TILESETFLAG_UNDERWATER | TILESETFLAG_SIDESCROLL
//.else
//	and TILESETFLAG_40 | TILESETFLAG_SIDESCROLL
//.endif
//	jr nz,++

//	; Apparently, you can't be transformed when the menu is disabled
//	ld a,(wMenuDisabled)
//	or a
//	jr nz,++

//	; Can't be transformed in a shop or while holding something
//	ld a,(wInShop)
//	ld b,a
//	ld a,(wLinkGrabState)
//	or b
//	jr nz,++

//	ld a,(wActiveRing)
//	ld e,a
//	ld hl,@ringToID
//	call lookupKey
//	ld b,a
//	ret
//++
//	ld b,$00
//	ret

//@ringToID:
//	.db OCTO_RING		SPECIALOBJECT_LINK_AS_OCTOROK
//	.db MOBLIN_RING		SPECIALOBJECT_LINK_AS_MOBLIN
//	.db LIKE_LIKE_RING	SPECIALOBJECT_LINK_AS_LIKELIKE
//	.db SUBROSIAN_RING	SPECIALOBJECT_LINK_AS_SUBROSIAN
//	.db FIRST_GEN_RING	SPECIALOBJECT_LINK_AS_RETRO
//	.db $00

//;;
//; Updates Link's damageToApply variable to account for damage-modifying rings.
//; @param d Link object
//linkUpdateDamageToApplyForRings:
//	ld e,SpecialObject.damageToApply
//	ld a,(de)
//	or a
//	ret z

//	ld b,a
//	ld hl,@ringDamageModifierTable
//	ld a,(wActiveRing)
//	ld e,a
//--
//	ldi a,(hl)
//	or a
//	jr z,@matchingRingNotFound

//	cp e
//	jr z,@matchingRingFound
//	inc hl
//	jr --

//@matchingRingNotFound:
//	ld a,e
//	cp BLUE_RING
//	jr z,@blueRing

//	cp GREEN_RING
//	jr z,@greenRing

//	cp CURSED_RING
//	ret nz

//; Cursed ring: damage *= 2
//	ld a,b
//	add a
//	jr @writeDamageToApply

//; Blue ring: damage /= 2
//@blueRing:
//	ld a,b
//	sra a
//	jr @writeDamageToApply

//; Green ring: damage *= 0.75
//@greenRing:
//	ld a,b
//	cpl
//	inc a
//	add a
//	add a
//	add b
//	sra a
//	sra a
//	cpl
//	inc a
//	jr @writeDamageToApply

//@matchingRingFound:
//	ld a,(hl)
//	add b

//@writeDamageToApply:
//	bit 7,a
//	jr nz,+
//	ld a,$ff
//+
//	ld e,SpecialObject.damageToApply
//	ld (de),a
//	ret

//; This is a table of values to add to any amount of damage that Link takes.
//@ringDamageModifierTable:
//	.db POWER_RING_L1 $fe
//	.db POWER_RING_L2 $fc
//	.db POWER_RING_L3 $f8
//	.db ARMOR_RING_L1 $01
//	.db ARMOR_RING_L2 $02
//	.db ARMOR_RING_L3 $03
//	.db $00

//;;
//; Reads w1Link.damageToApply, and reduces Link's health based on this value.
//; Also triggers the potion if necessary, and accounts for the protection ring.
//; @param d Link object
//linkApplyDamage:
//	ld h,d
//	ld l,SpecialObject.damageToApply
//	ld a,(hl)
//	ld (hl),$00
//	or a
//	jr z,++

//	; Protection ring does fixed damage on each hit
//	ld b,a
//	ld a,PROTECTION_RING
//	call cpActiveRing
//	jr nz,+
//	ld b,$f8
//+
//	; Add the value to w1Link.health. His "real" health variable is at wLinkHealth, so
//	; this appears to be used as part of the calculation to reduce that.
//	ld l,SpecialObject.health
//	ld a,(hl)
//	add b
//	ld (hl),a
//++
//	ld l,SpecialObject.var2a
//	ld a,(hl)
//	or a
//	jr z,+

//	; Steadfast ring halves knockback
//	ld a,STEADFAST_RING
//	call cpActiveRing
//	jr nz,+
//	ld l,SpecialObject.knockbackCounter
//	srl (hl)
//+
//	ld hl,wLinkHealth
//	ld e,SpecialObject.health

//	; Make sure that w1Link.health is negative. At this point, w1Link.health is
//	; actually being used similarly to w1Link.damageToApply, and doesn't reflect his
//	; actual health.
//	ld a,(de)
//	bit 7,a
//	jr z,++

//	; Apply the damage (finally update wLinkHealth)
//	ld a,(de)
//--
//	dec (hl)
//	add $02
//	jr nc,--

//	ld (de),a
//++
//	; Jump if [wLinkHealth] > 0
//	ld a,(hl)
//	dec a
//	rlca
//	jr nc,++

//; Link's health has reached 0.

//	; Replenish health if Link has a potion.
//	ld a,TREASURE_POTION
//	call checkTreasureObtained
//	jr nc,@noPotion

//	; [wLinkHealth] = [wLinkMaxHealth]
//	ld hl,wLinkMaxHealth
//	ldd a,(hl)
//	ld (hl),a

//	; Set w1Link.health to $01 (again, this doesn't represent his actual health)
//	ld a,$01
//	ld (de),a

//	ld a,TREASURE_POTION
//	call loseTreasure
//	jr ++

//; Link is dead, and has no potion.
//@noPotion:
//	; Clear wLinkHealth and w1Link.health
//	xor a
//	ld (de),a
//	ld (hl),a
//	ld (wUsingShield),a

//	ld e,SpecialObject.state
//	ld a,(de)
//	cp LINK_STATE_GRABBED
//	jr z,++

//	ld a,$ff
//	ld (wLinkDeathTrigger),a
//	call clearAllParentItems
//++
//	; Decrement the stun counter every other frame?
//	ld a,(wFrameCounter)
//	rrca
//	jr nc,++

//	ld e,SpecialObject.stunCounter
//	ld a,(de)
//	or a
//	jr z,++

//	dec a
//	ld (de),a
//++
//	ret