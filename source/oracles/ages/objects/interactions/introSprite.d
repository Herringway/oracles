module oracles.ages.objects.interactions.introSprite;

import oracles.bank00;
import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.globals;
import oracles.structures;

import std.logger;

void interactionCode75(GameObject* obj) {
	final switch (cast(InteractionState75)obj.state) {
		case InteractionState75.initializing:
			interactionIncState(obj);
			interactionInitGraphics(obj);
			objectSetVisible82(obj);
			final switch (cast(InteractionSubID75)obj.subid) {
				case InteractionSubID75.linkHorseSilhouette:
				case InteractionSubID75.oceanShimmer:
					break;
				case InteractionSubID75.cliffHorse:
					obj.counter1 = 5;
					obj.angle = Angle.left;
					obj.speed = 20.speed;
					interactionSetPosition(obj, 0x7080);
					break;
				case InteractionSubID75.cliff:
					objectSetVisible82(obj);
					obj.angle = Angle.left;
					obj.speed = 20.speed;
					interactionSetPosition(obj, 0x7080);
					break;
				case InteractionSubID75.unnamed03:
					interactionSetPosition(obj, 0x4C6C);
					obj.angle = 0x19;
					obj.speed = 40.speed;
					break;
				case InteractionSubID75.unnamed04:
					interactionSetPosition(obj, 0x1838);
					break;
				case InteractionSubID75.birds:
					obj.angle = 0x1A;
					obj.speed = 60.speed;
					break;
			}
			break;
		case InteractionState75.running:
			final switch (cast(InteractionSubID75)obj.subid) {
				case InteractionSubID75.linkHorseSilhouette:
				case InteractionSubID75.oceanShimmer:
					if (intro.unnamedCBBA == 0) {
						interactionAnimate(obj);
					} else {
						interactionDelete(obj);
					}
					break;
				case InteractionSubID75.cliffHorse:
					if (!checkInteractionSubstate(obj)) {
						goto case InteractionSubID75.cliff;
					}
					interactionAnimate(obj);
					if (obj.animParameter == 0) {
						goto case InteractionSubID75.cliff;
					}
					if (--obj.counter1 != 0) {
						goto case InteractionSubID75.cliff;
					}
					obj.substate++;
					interactionSetAnimation(obj, 4);
					break;
				case InteractionSubID75.cliff:
					if (intro.unnamedCBB6 != 0) {
						objectApplySpeed(obj);
					}
					break;
				case InteractionSubID75.unnamed03:
					interactionAnimate(obj);
					if ((intro.frameCounter & 3) == 0) {
						objectApplySpeed(obj);
					}
					break;
				case InteractionSubID75.unnamed04:
					interactionAnimate(obj);
					break;
				case InteractionSubID75.birds:
					if (intro.unnamedCBBA != 0) {
						interactionDelete(obj);
					} else if (paletteThreadMode == 0) {
						interactionAnimate(obj);
						objectApplySpeed(obj);
					}
					break;
			}
			break;
	}
}
