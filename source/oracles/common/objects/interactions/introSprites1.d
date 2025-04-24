module oracles.common.objects.interactions.introSprites1;

import oracles.bank00;
import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.globals;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_INTRO_SPRITES_1
//; ==================================================================================================
void interactionCode4A(GameObject* object) {
	final switch (cast(InteractionState4A)object.state) {
		case InteractionState4A.unknown0:
			introSpriteIncStateAndLoadGraphics(object);
			switch (object.subid) {
				case 0:
				case 1:
				case 2: // Triforce pieces
					GameObject* newObject;
					if (getFreeInteractionSlot(newObject)) {
						// Create the "glow" behind the triforce
						newObject.id = Interaction.introSprites1;
						newObject.subid = 4;
						newObject.var03 = cast(ubyte)(object.subid + 1);
						introSpriteSetChildRelatedObject1ToSelf(object, newObject);
					}
					objectSetVisible82(object);
					break;
				case 3:
				case 7:
				case 10:
					object.animCounter += object.var03 * 4;
					interactionSetAlwaysUpdateBit(object);
					introSpriteFunc461A(object);
					objectSetVisible80(object);
					break;
				case 4:
					objectSetVisible83(object);
					object.visible ^= 0x80;
					break;
				case 5:
				case 6:
					introSpriteIncStateAndLoadGraphics(object);
					break;
				case 8:
					objectSetVisible82(object);
					break;
				case 9:
					static immutable ubyte[2][] data = [[0x40, 0x78], [0x40, 0x48], [0x18, 0x60]];
					object.yh = data[object.var03][0];
					object.xh = data[object.var03][1];
					for (ubyte i = 3; i != 0; i--) {
						GameObject* newObject;
						if (!getFreeInteractionSlot(newObject)) {
							break;
						}
						newObject.id = Interaction.introSprites1;
						newObject.subid = 10;
						newObject.var03 = cast(ubyte)(i - 1);
						introSpriteSetChildRelatedObject1ToSelf(object, newObject);
					}
					objectSetVisible82(object);
					break;
				default: assert(0);
			}
			break;
		case InteractionState4A.unknown1:
			introSpritesState1(object);
			break;
	}
}


void introSpriteIncStateAndLoadGraphics(GameObject* object) {
	object.state++;
	interactionInitGraphics(object);
}

//;;
//; Sets up X and Y positions with some slight random variance?
void introSpriteFunc461A(GameObject* object) {
	assert(0, "NYI");
	//objectTakePosition(object, objectGetRelatedObject1Var(object));
//	push bc
//	ld e,Interaction.subid
//	ld a,(de)
//	ld hl,@data_4660
//	cp $03
//	jr z,@label_09_043
//	cp $0a
//	jr z,@label_09_043

//	ld hl,@data_4666
//	ld e,Interaction.counter2
//	ld a,(de)
//	inc a
//	ld (de),a
//	and $03
//	ld c,a
//	add a
//	add c
//	rst_addDoubleIndex

//@label_09_043:
//	ld e,Interaction.var03
//	ld a,(de)
//	rst_addDoubleIndex

//	ldi a,(hl)
//	call @addRandomVariance
//	ld b,a
//	ld e,Interaction.yh
//	ld a,(de)
//	add b
//	ld (de),a

//	ld a,(hl)
//	call @addRandomVariance
//	ld h,d
//	ld l,Interaction.xh
//	add (hl)
//	ld (hl),a
//	pop bc
}

//; Adds a random value between -2 and +1 to the given number.
ubyte addRandomVariance(ubyte value) {
	return cast(ubyte)((getRandomNumber() & 3) - 2 + value);
}

//@data_4660:
//	.db $fc $fc
//	.db $07 $ff
//	.db $ff $06

//@data_4666:
//	.db $f4 $f4
//	.db $0e $fe
//	.db $fa $09

//	.db $fb $f0
//	.db $09 $ff
//	.db $04 $0e

//	.db $06 $f8
//	.db $f4 $08
//	.db $0a $07

//	.db $0b $fa
//	.db $f4 $00
//	.db $03 $0a


void introSpritesState1(GameObject* object) {
	// For subids 0-4 (triforce objects): watch for signal to delete self
	if ((object.subid < 5) && (intro.triforceState == 4)) {
		interactionDelete(object);
		return;
	}
	switch (object.subid) {
		case 0:
		case 1:
		case 2: // Triforce pieces
			switch (object.substate) {
				case 0:
					if (intro.triforceState == 1) {
						ubyte b = (object.subid == 1) ? 1 : 0;
						object.counter1 = func2D48(b);
						interactionIncSubstate(object);
						goto case;
					} else {
						interactionAnimate(object);
					}
					break;
				case 1:
					if (interactionDecCounter1(object)) {
						ubyte b;
						if (object.subid == 1) {
							object.angle = 0;
							object.speed = 20.speed;
							b = 1;
						} else {
							object.angle = object.subid == 0 ? 24 : 8;
							object.speed = 20.speed;
							b = 11;
						}
						object.counter1 = func2D48(b);
						interactionIncSubstate(object);
						goto case;
					} else {
						interactionAnimate(object);
					}
					break;
				case 2:
					if (interactionDecCounter1(object)) {
						object.counter1 = func2D48(2);
						interactionIncSubstate(object);
					}
					objectApplySpeed(object);
					interactionAnimate(object);
					break;
				case 3:
					if (interactionDecCounter1(object)) {
						object.counter1 = func2D48(3);
						interactionIncSubstate(object);
						if (object.subid == 1) {
							playSound(Snd.energything);
						} else {
							interactionIncSubstate(object);
						}
					} else {
						interactionAnimate(object);
					}
					break;
				case 4:
					interactionAnimate(object);
					if (interactionDecCounter1(object)) {
						interactionIncSubstate(object);
						intro.triforceState = 2;
						playSound(Snd.aquamentusHover);
					}
					break;
				case 5:
					interactionAnimate(object);
					break;
				default: assert(0);
			}
			break;
		case 3:
		case 10:
			if (++object.animParameter == 0) {
				introSpriteFunc461A(object);
			}
			interactionAnimate(object);
			break;
		case 4:
		case 5:
		case 6:
			interactionAnimate(object);
			objectTakePosition(object.relatedObj, object);
			if (object.relatedObj.animCounter == object.var03) {
				object.visible |= 0x80;
			} else {
				object.visible &= ~0x80;
			}
			break;
		case 7:
			//	call objectSetVisible
			//	ld e,Interaction.var03
			//	ld a,(de)
			//	and $01
			//	ld b,a
			//	ld a,(wIntro.frameCounter)
			//	and $01
			//	xor b
			//	call z,objectSetInvisible
			assert(0, "NYI");
			goto case;
		case 8: // Extra tree branches in intro
			//	ld a,(wGfxRegs1.SCY)
			//	or a
			//	jp z,interactionDelete

			//	ld b,a
			//	ld e,Interaction.y
			//	ld a,(de)
			//	sub b
			//	inc e
			//	ld (de),a
			//	ret
			assert(0, "NYI");
			break;
		case 9:
			interactionAnimate(object);
			break;
		default: assert(0);
	}
}

// Sets relatedObj of object 'h' to object 'd' (self).
void introSpriteSetChildRelatedObject1ToSelf(GameObject* parent, GameObject* child) {
	child.relatedObj = parent;
}
