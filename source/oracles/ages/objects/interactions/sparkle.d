module oracles.ages.objects.interactions.sparkle;

import oracles.bank00;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_SPARKLE
//; ==================================================================================================
void interactionCode84(GameObject* obj) {
	void flicker(ubyte a) {
		if ((a & 1) != 0) {
			objectSetInvisible(obj);
		} else {
			objectSetVisible(obj);
		}
	}
	void case136Common() {
		interactionAnimate(obj);
		objectTakePosition(link, obj);
		flicker(intro.frameCounter);
	}
	if (!checkInteractionState(obj)) {
		switch (obj.subid) {
			case 2:
			case 3:
			case 11:
				objectApplyComponentSpeed(obj);
				goto case;
			case 0:
			case 1:
			case 9:
				//	ld e,Interaction.animParameter
				//	ld a,(de)
				//	cp $ff
				//	jp z,interactionDelete
				//	jp interactionAnimate
				assert(0, "NYI");
				break;
			case 4:
				//@animateAndFlickerAndDeleteWhenCounter1Zero:
				//	call interactionDecCounter1
				//	jp z,interactionDelete
				assert(0, "NYI");
				break;
			case 5:
				//	ld a,Object.yh
				//	call objectGetRelatedObject1Var
				//	ld bc,$0800
				//	call objectTakePositionWithOffset
				//	jr @animateAndFlickerAndDeleteWhenCounter1Zero
				assert(0, "NYI");
				break;
			case 6:
				if (intro.unnamedCBB6 == 7) {
					interactionDelete(obj);
				} else {
					case136Common();
				}
				break;
			case 7:
			case 15:
				//	ld a,Object.yh
				//	call objectGetRelatedObject1Var
				//	call objectTakePosition
				assert(0, "NYI");
				goto case;
			case 14:
				//	ld a,(wTmpcfc0.bombUpgradeCutscene.state)
				//	bit 0,a
				//	jp nz,interactionDelete
				assert(0, "NYI");
				goto case 8;
			case 8:
				interactionAnimate(obj);
				flicker(frameCounter);
				break;
			case 10:
				//@runSubid0a:
				//	call objectApplySpeed
				//	call objectCheckWithinScreenBoundary
				//	jp c,interactionAnimate
				//	jp interactionDelete
				assert(0, "NYI");
				break;
			case 12:
				//@runSubid0c:
				//	ld a,Object.id
				//	call objectGetRelatedObject1Var
				//	ld e,Interaction.var38
				//	ld a,(de)
				//	cp (hl)
				//	jp nz,interactionDelete

				//	call objectTakePosition
				//	ld a,($cfc0)
				//	bit 0,a
				//	jp nz,interactionDelete
				assert(0, "NYI");
				goto case 8;
			case 13:
				if (intro.unnamedCBB6 == 6) {
					interactionDelete(obj);
				} else {
					case136Common();
				}
				break;
			default: assert(0);
		}
	} else {
		interactionInitGraphics(obj);
		interactionSetAlwaysUpdateBit(obj);
		obj.state++;
		switch (obj.subid) {
			case 10:
				if (obj.speed == 0) {
					obj.speed = 120;
				}
				goto case;
			case 0:
			case 1:
			case 9:
				if (obj.var03 != 0) {
					objectSetVisible81(obj);
					break;
				} else {
					goto case;
				}
			case 2:
			case 3:
			case 7:
				objectSetVisible82(obj);
				break;
			case 11:
				obj.speedY = cast(ushort)-64;
				objectSetVisible81(obj);
				break;
			case 12:
				obj.var38 = obj.id;
				objectSetVisible82(obj);
				break;
			case 4:
			case 5:
			case 6:
			case 8:
			case 13:
			case 14:
			case 15:
				objectSetVisible80(obj);
				break;
			default: assert(0);
		}
	}
}
