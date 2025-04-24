module oracles.common.specialObjects;

import oracles.bank00;
import oracles.common.objects.special.common;
import oracles.common.objects.special.companionCutscene;
import oracles.common.objects.special.dimitri;
public import oracles.common.objects.special.link;
import oracles.common.objects.special.linkInCutscene;
import oracles.common.objects.special.linkRidingAnimal;
import oracles.common.objects.special.maple;
import oracles.common.objects.special.minecart;
import oracles.common.objects.special.moosh;
import oracles.common.objects.special.ricky;
import oracles.common.objects.special.transformedLink;
import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.globals;
import oracles.structures;

import replatform64.gameboy;
import std.logger;

//;;
void updateSpecialObjects() {
	//; @param hl Object to update (w1Link or w1Companion)
	static void updateSpecialObject(GameObject* object) {
		if (!object.enabled) {
			return;
		}
		activeObjectType = cast(ubyte)(getType(object) * 0x40);
		activeObject = cast(ubyte)(getSlot(object) + 0xD0);
		final switch (cast(SpecialObject)object.id) {
			case SpecialObject.link:
				specialObjectCodeLink(object);
				break;
			case SpecialObject.unnamed01:
				static if(gameVersion == GameVersion.ages) {
					specialObjectCodeTransformedLink(object);
				} else {
					specialObjectCodeSubrosiaDanceLink(object);
				}
				break;
			case SpecialObject.linkAsBaby:
				specialObjectCodeTransformedLink(object);
				break;
			case SpecialObject.linkAsSubrosian:
				specialObjectCodeTransformedLink(object);
				break;
			case SpecialObject.linkAsRetro:
				specialObjectCodeTransformedLink(object);
				break;
			case SpecialObject.linkAsOctorok:
				specialObjectCodeTransformedLink(object);
				break;
			case SpecialObject.linkAsMoblin:
				specialObjectCodeTransformedLink(object);
				break;
			case SpecialObject.linkAsLikeLike:
				specialObjectCodeTransformedLink(object);
				break;
			case SpecialObject.linkCutscene:
				specialObjectCodeLinkInCutscene(object);
				break;
			case SpecialObject.linkRidingAnimal:
				specialObjectCodeLinkRidingAnimal(object);
				break;
			case SpecialObject.minecart:
				specialObjectCodeMinecart(object);
				break;
			case SpecialObject.ricky:
				specialObjectCodeRicky(object);
				break;
			case SpecialObject.dimitri:
				specialObjectCodeDimitri(object);
				break;
			case SpecialObject.moosh:
				specialObjectCodeMoosh(object);
				break;
			case SpecialObject.maple:
				specialObjectCodeMaple(object);
				break;
			case SpecialObject.rickyCutscene:
				specialObjectCodeCompanionCutscene(object);
				break;
			case SpecialObject.dimitriCutscene:
				specialObjectCodeCompanionCutscene(object);
				break;
			case SpecialObject.mooshCutscene:
				specialObjectCodeCompanionCutscene(object);
				break;
			case SpecialObject.mapleCutscene:
				specialObjectCodeCompanionCutscene(object);
				break;
			case SpecialObject.raft:
				specialObjectCodeRaft(object);
				break;
		}
	}
	auto a = linkIDOverride;
	linkIDOverride = 0;
	if (a != 0) {
		link.id = a & 0x7F;
	}
	static if (gameVersion == GameVersion.ages) {
		link.var2F &= 0x3F;
		ubyte level;
		if (checkTreasureObtained(Treasure.mermaidSuit, level)) {
			link.var2F |= 0b0100_0000;
		}
		if ((tilesetFlags & TilesetFlag.underwater) != 0) {
			link.var2F |= 0b1000_0000;
		}
	}
	braceletGrabbingNothing = 0;
	unnamedCC92 = 0;
	forceLinkPushAnimation = 0;
	unnamedCC95 |= 0x7F;
	linkTurningDisabled &= 0x7F;
	updateGameKeysPressed();
	updateSpecialObject(companion);
	linkClimbingVine = 0;
	static if (gameVersion == GameVersion.ages) {
		disallowMountingCompanion = 0;
	}
	updateSpecialObject(link);
	updateLinkInvincibilityCounter();
	linkRidingObject = linkPlayingInstrument;
	linkImmobilized &= 0xF;
	unnamedCC67 = 0;
	link.var2A = 0;
	unnamedCCD8 = 0;
	if (instrumentsDisabledCounter != 0) {
		instrumentsDisabledCounter--;
	}
	grabbableObjectBuffer[] = 0;
}

//;;
//; Updates wGameKeysPressed based on wKeysPressed, and updates wLinkAngle based on
//; direction buttons pressed.
void updateGameKeysPressed() {
	//; Index is direction buttons pressed, value is the corresponding angle.
	static immutable ubyte[] directionButtonToAngle = [
		0xFF, 0x08, 0x18, 0xFF, 0x00, 0x04, 0x1C, 0xFF, 0x10, 0x0C, 0x14, 0xFF, 0xFF, 0xFF, 0xFF,
	];
	ubyte input = keysPressed;

	if (useSimulatedInput) {
		if (useSimulatedInput == 2) {
			// This code is used in the Ganon fight where he reverses Link's movement?
			useSimulatedInput = 0;
			ubyte b = ((Pad.down | Pad.left) & input) >> 1;
			ubyte b2 = ((Pad.up | Pad.right) & input) << 1;
			input = (input & 0xF) | b | b2;
		} else {
			input = getSimulatedInput();
		}
	}
	if (linkDeathTrigger) {
		gameKeysPressed = 0;
		gameKeysJustPressed = 0;
		linkAngle = 0xFF;
	} else {
		//	ld hl,wGameKeysPressed
		ubyte lastPressed = cast(ubyte)~gameKeysPressed;
		gameKeysPressed = input;
		gameKeysJustPressed = input & lastPressed;
		linkAngle = directionButtonToAngle[input >> 4];
	}
}


//; This is called when Link is riding something (wLinkObjectIndex == $d1).
void func410D() {
	//; @param	bc	Position offset relative to companion to place Link at
	static void companionCommon(ushort position) {
		objectCopyPositionWithOffset(companion, link, position);
		link.direction = companion.direction;
		disableWarpTiles = 1;

		if (((link.var2A | link.invincibilityCounter | link.knockbackCounter) == 0) && (companion.damageToApply != 0)) {
			link.damageToApply = companion.damageToApply;
			// Copy health, var2a, invincibilityCounter, knockbackAngle, knockbackCounter, stunCounter from companion to Link.
			link.health = companion.health;
			link.var2A = companion.var2A;
			link.invincibilityCounter = companion.invincibilityCounter;
			link.knockbackAngle = companion.knockbackAngle;
			link.knockbackCounter = companion.knockbackCounter;
			link.stunCounter = companion.stunCounter;
		} else {
			companion.damageToApply = link.damageToApply;
			// Copy health, var2a, invincibilityCounter, knockbackAngle, knockbackCounter, stunCounter from Link to companion.
			companion.health = link.health;
			companion.var2A = link.var2A;
			companion.invincibilityCounter = link.invincibilityCounter;
			companion.knockbackAngle = link.knockbackAngle;
			companion.knockbackCounter = link.knockbackCounter;
			companion.stunCounter = link.stunCounter;
		}
		ubyte flags = link.oamFlags;
		if (link.oamFlags == link.oamFlagsBackup) {
			flags = companion.oamFlagsBackup;
		}
		companion.oamFlags = flags;
		link.visible = companion.visible & 0x83;
	}
	static immutable ushort[] linkOffsets = [
		// --Up--   --Right-- --Down-- --Left--
		0xF700, 0xF700, 0xF700, 0xF700,
		0xF7FF, 0xF800, 0xF7FF, 0xF800,
	];
	activeObjectType = 0;
	activeObject = 1;
	switch (companion.id - SpecialObject.minecart) {
		case 0:
			objectCopyPositionWithOffset(companion, link, linkOffsets[companion.direction + companion.animParameter]);
			link.visible &= ~0b01000000;
			break;
		case 1:
			companionCommon(0);
			break;
		case 2:
			if ((companion.direction & 0x80) == 0) {
				companionCommon(0xF600);
			} else if ((companion.direction & 0x40) == 0) {
				companionCommon(0xF6FB);
			} else {
				companionCommon(0xF605);
			}
			break;
		case 3:
			if ((companion.direction & 0x80) == 0) {
				companionCommon(0xF200);
			} else {
				companionCommon(0xF000);
			}
			break;
		case 4:
			break;
		case 5:
			break;
		case 6:
			break;
		case 7:
			break;
		case 8:
			break;
		case 9:
			static if (gameVersion == GameVersion.ages) {
				if (linkForceState == LinkState.respawning) {
					break;
				}
				if ((link.state == LinkState.respawning) && (link.substate < 3)) {
					break;
				}
				// Disable terrain effects on Link
				link.visible &= ~0b01000000;

				// Set Link's position to be 5 or 6 pixels above the raft, depending on the frame of animation
				ushort offset = 0xFB00;
				if (companion.animParameter != 0) {
					offset = 0xFA00;
				}
				objectCopyPositionWithOffset(companion, link, offset);
				objectSetVisibleC3(companion);
			}
			break;
		default: assert(0);
	}
}

//;;

void specialObjectCodeMinecart(GameObject* object) {
	oracles.common.objects.special.minecart.specialObjectCodeMinecart(object);
}


void specialObjectCodeRaft(GameObject* object) {
	static if (gameVersion == GameVersion.ages) {
		static import oracles.ages.objects.special.raft;
		oracles.ages.objects.special.raft.specialObjectCodeRaft(object);
	}
}
