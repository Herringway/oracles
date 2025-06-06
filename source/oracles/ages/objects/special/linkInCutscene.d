module oracles.ages.objects.special.linkInCutscene;

import oracles.bank00;
import oracles.common.objects.special.common;
import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.globals;
import oracles.structures;
import replatform64.gameboy;

import std.logger;
//; TODO: Some of this code is shared with Seasons; merge them where appropriate.

//;;
void specialObjectCodeLinkInCutscene(GameObject* object) {
	switch (object.subid) {
		case 0:
			linkCutscene0(object);
			break;
		case 1:
			linkCutscene1(object);
			break;
		case 2:
			linkCutscene2(object);
			break;
		case 3:
			linkCutscene3(object);
			break;
		case 4:
			linkCutscene4(object);
			break;
		case 5:
			linkCutscene5(object);
			break;
		case 6:
			linkCutscene6(object);
			break;
		case 7:
			linkCutscene7(object);
			break;
		case 8:
			linkCutscene8(object);
			break;
		case 9:
			linkCutscene9(object);
			break;
		case 10:
			linkCutsceneA(object);
			break;
		case 11:
			linkCutsceneB(object);
			break;
		case 12:
			linkCutsceneC(object);
			break;
		default: assert(0);
	}
}

// Opening cutscene with the triforce
void linkCutscene0(GameObject* object) {
	switch (object.state) {
		case 0:
			linkCutsceneInitOAMSetVisibleIncState(object);
			objectSetVisible81(object);
			specialObjectSetAnimation(object, 0);
			break;
		case 1:
			switch (object.substate) {
				case 0:
					if ((linkAngle & 0x80) != 0) {
						specialObjectSetAnimation(object, 0);
					} else {
						if ((gameKeysPressed & Pad.down) != 0) {
							object.yh++;
						}
						if ((gameKeysPressed & Pad.up) != 0) {
							object.yh--;
						}
						if (object.yh >= 64) {
							specialObjectAnimate(object);
						} else {
							intro.triforceState = 1;
							playSound(Snd.dropessence);
							itemIncSubstate(object);
						}
					}
					break;
				case 1:
					if (intro.triforceState == 2) {
						itemIncSubstate(object);
						object.counter1 = func2D48(4);
						specialObjectSetAnimation(object, 4);
					}
					break;
				case 2:
					if (!itemDecCounter1(object)) {
						specialObjectAnimate(object);
					} else {
						object.speed = 20.speed;
						object.counter1 = func2D48(5);
						itemIncSubstate(object);
					}
					break;
				case 3:
					if (itemDecCounter1(object)) {
						itemIncSubstate(object);
						object.counter1 = func2D48(7);
					}
					linkCutsceneOscillateZ(object, &linkCutsceneZOscillation0[0]);
					break;
				case 4:
					if (itemDecCounter1(object)) {
						intro.triforceState = 3;
						itemIncSubstate(object);
					} else {
						linkCutsceneOscillateZ1(object);
					}
					goto case;
				case 5:
					if (intro.triforceState != 6) {
						linkCutsceneOscillateZ1(object);
					}
					goto case;
				case 6:
					linkCutscene0Substate6(object);
					break;
				default: assert(0);
			}
			break;
		default: assert(0);
	}
}

//; Creates the colored orb that appears under Link in the opening cutscene
void linkCutsceneCreateGlowingOrb(GameObject* object) {
//	ldbc INTERAC_SPARKLE, $06
//	call objectCreateInteraction
//	jr nz,+
//	ld l,Interaction.relatedObj1
//	ld a,SpecialObject.start
//	ldi (hl),a
//	ld (hl),d
//+
//	call itemIncSubstate
//	ld a,$05
//	jp specialObjectSetAnimation
	assert(0, "NYI");
}

void linkCutsceneOscillateZ1(GameObject* object) {
	linkCutsceneOscillateZ(object, &linkCutsceneZOscillation1[0]);
}
void linkCutsceneOscillateZ(GameObject* object, const(ubyte)* data) {
	if ((intro.frameCounter & 7) == 0) {
		object.zh += data[(intro.frameCounter & 0x38) >> 3];
	}
	specialObjectAnimate(object);
}

immutable ubyte[] linkCutsceneZOscillation0 = [ 0xFF, 0xFE, 0xFE, 0xFF, 0x00, 0x01, 0x01, 0x00 ];
immutable ubyte[] linkCutsceneZOscillation1 = [ 0xFF, 0xFF, 0xFF, 0x00, 0x01, 0x01, 0x01, 0x00 ];
immutable ubyte[] linkCutsceneZOscillation2 = [ 0x02, 0x03, 0x04, 0x03, 0x02, 0x00, 0xFF, 0x00 ];

void linkCutscene0Substate6(GameObject* object) {
	if (++object.animParameter == 0) {
		intro.triforceState = 7;
	} else {
		specialObjectAnimate(object);
		if ((intro.frameCounter & 1) == 0) {
			objectSetInvisible(object);
		} else {
			objectSetVisible(object);
		}
	}
}


void linkCutscene1(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld e,SpecialObject.counter1
//	ld a,$78
//	ld (de),a
//	xor a
//	ld e,SpecialObject.direction
//	ld (de),a
//	call specialObjectSetAnimation

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1
//	.dw @substate2
//	.dw @substate3
//	.dw linkCutsceneRet

//@substate0:
//	call itemDecCounter1
//	ret nz
//	call itemIncSubstate
//	ld l,SpecialObject.speed
//	ld (hl),SPEED_100
//	ld l,SpecialObject.xh
//	ld a,(hl)
//	cp $48
//	ld a,$00
//	jr z,++
//	ld a,$18
//	jr nc,++
//	ld a,$08
//++
//	ld l,SpecialObject.angle
//	ld (hl),a
//	swap a
//	rlca
//	jp specialObjectSetAnimation

//@substate1:
//	ld e,SpecialObject.xh
//	ld a,(de)
//	cp $48
//	jr nz,++
//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$04
//	ret
//++
//	call objectApplySpeed
//	jp specialObjectAnimate

//@substate2:
//	call itemDecCounter1
//	ret nz
//	ld (hl),$2e
//	call itemIncSubstate
//	ld l,SpecialObject.angle
//	ld (hl),$00
//	xor a
//	jp specialObjectSetAnimation

//@substate3:
//	call specialObjectAnimate
//	call objectApplySpeed
//	call itemDecCounter1
//	ret nz
//	ld hl,$cfd0
//	ld (hl),$01
//	ld a,SND_CLINK
//	call playSound
//	jp itemIncSubstate

//linkCutsceneRet:
//	ret

void linkCutscene2(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld bc,$3838
//	call objectGetRelativeAngle
//	ld e,SpecialObject.angle
//	ld (de),a
//	call convertAngleDeToDirection
//	jp specialObjectSetAnimation

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1
//	.dw @substate2
//	.dw @substate3
//	.dw @substate4
//	.dw @substate5
//	.dw @substate6
//	.dw @substate7
//	.dw @substate8

//@substate0:
//	ld a,($cfd0)
//	cp $02
//	ret nz

//	call itemIncSubstate
//	ld l,SpecialObject.yh
//	ldi a,(hl)
//	cp $48
//	ld a,$18
//	ld b,$04
//	jr z,++
//	ld a,$10
//	jr c,++

//	inc l
//	ld b,$01
//	ld a,(hl)
//	cp $38
//	ld a,$00
//	jr z,++
//	ld a,$18
//	jr nc,++
//	ld a,$08
//++
//	ld l,SpecialObject.substate
//	ld (hl),b
//	ld l,SpecialObject.angle
//	ld (hl),a
//	swap a
//	rlca
//	jp specialObjectSetAnimation

//@substate1:
//	call specialObjectAnimate
//	call linkCutscene_cpxTo38
//	jp nz,objectApplySpeed

//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$08
//	ret

//@substate2:
//	ld b,$00

//@label_72c8:
//	call itemDecCounter1
//	ret nz

//@label_72cc:
//	call itemIncSubstate
//	ld l,SpecialObject.angle
//	ld (hl),b
//	ld a,b
//	swap a
//	rlca
//	jp specialObjectSetAnimation

//@substate3:
//	call specialObjectAnimate
//	call linkCutscene_cpyTo48
//	jp nz,objectApplySpeed

//@gotoState7:
//	ld h,d
//	ld l,SpecialObject.substate
//	ld (hl),$07
//	ld l,SpecialObject.counter1
//	ld (hl),$3c
//	xor a
//	jp specialObjectSetAnimation

//@substate4:
//	call specialObjectAnimate
//	call linkCutscene_cpyTo48
//	jp nz,objectApplySpeed
//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$08
//	ret

//@substate5:
//	ld b,$18
//	jp @label_72c8

//@substate6:
//	call specialObjectAnimate
//	call linkCutscene_cpxTo38
//	jp nz,objectApplySpeed
//	jr @gotoState7

//@substate7:
//	call itemDecCounter1
//	ret nz
//	ld (hl),$10
//	ld b,$00
//	call @label_72cc
//	ld hl,$cfd0
//	ld (hl),$03
//	ret

//@substate8:
//	ret

void linkCutscene3(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld a,$01
//	jp specialObjectSetAnimation

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1
//	.dw @substate2
//	.dw @substate3
//	.dw @substate4
//	.dw @substate5
//	.dw @substate6
//	.dw @substate7
//	.dw @substate8
//	.dw @substate9

//@substate0:
//	ld a,($cfd0)
//	cp $09
//	ret nz

//	call itemIncSubstate
//	ld l,SpecialObject.yh
//	ld a,$30
//	ldi (hl),a
//	inc l
//	ld a,$78
//	ld (hl),a
//	ld a,$01
//	jp specialObjectSetAnimation

//@substate1:
//	ld a,($cfd0)
//	cp $0a
//	ret nz
//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$1e
//	ret

//@substate2:
//	call itemDecCounter1
//	ret nz
//	call itemIncSubstate
//	xor a
//	jp specialObjectSetAnimation

//@substate3:
//	ld b,$0e
//	ld c,$02
//	ld a,($cfd0)
//	cp b
//	ret nz
//	call itemIncSubstate
//	ld a,c
//	jp specialObjectSetAnimation

//@substate4:
//	ld a,($cfd0)
//	cp $11
//	ret nz

//	call itemIncSubstate
//	ld l,SpecialObject.angle
//	ld (hl),$18
//	ld l,SpecialObject.speed
//	ld (hl),SPEED_180
//	ld l,SpecialObject.counter1
//	ld (hl),$16
//	ld a,SND_UNKNOWN5
//	call playSound
//	ld a,$03
//	jp specialObjectSetAnimation

//@substate5:
//	call linkCutscene_animateAndDecCounter1
//	jp nz,objectApplySpeed
//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$06

//@substate9:
//	ret

//@substate6:
//	call itemDecCounter1
//	ret nz
//	ld (hl),$08
//	ld l,SpecialObject.angle
//	ld (hl),$10
//	ld a,$02
//	ld l,SpecialObject.direction
//	ld (hl),a
//	call specialObjectSetAnimation
//	jp itemIncSubstate

//@substate7:
//	call linkCutscene_animateAndDecCounter1
//	jp nz,objectApplySpeed
//	ld a,SND_UNKNOWN5
//	call playSound
//	jp itemIncSubstate

//@substate8:
//	ld a,($cfd2)
//	or a
//	jr z,linkCutsceneFunc_73e8

//	ld a,$03
//	call specialObjectSetAnimation
//	jp itemIncSubstate

//;;
//linkCutsceneFunc_73e8:
//	ld a,(wFrameCounter)
//	and $07
//	ret nz

//	callab agesInteractionsBank0a.func_0a_7877
//	call objectGetRelativeAngle
//	call convertAngleToDirection
//	ld h,d
//	ld l,SpecialObject.direction
//	cp (hl)
//	ret z
//	ld (hl),a
//	jp specialObjectSetAnimation

void linkCutscene4(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld l,SpecialObject.yh
//	ld a,$38
//	ldi (hl),a
//	inc l
//	ld a,$58
//	ld (hl),a
//	xor a
//	jp specialObjectSetAnimation

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1
//	.dw @substate2
//	.dw @substate3
//	.dw @substate4
//	.dw @substate5

//@substate0:
//	ld a,($cfd0)
//	cp $1f
//	ret nz
//	jp itemIncSubstate

//@substate1:
//	ld a,($cfd0)
//	cp $20
//	jp nz,linkCutsceneFunc_73e8
//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$50
//	ret

//@substate2:
//	call itemDecCounter1
//	ret nz
//	ld (hl),$30
//	ld l,SpecialObject.speed
//	ld (hl),SPEED_100
//	ld b,$10
//	jp linkCutscene2@label_72cc

//@substate3:
//	call linkCutscene_animateAndDecCounter1
//	jp nz,objectApplySpeed
//	ld (hl),$08
//	jp itemIncSubstate

//@substate4:
//	call itemDecCounter1
//	ret nz
//	ld (hl),$10
//	ld b,$18
//	jp linkCutscene2@label_72cc

//@substate5:
//	call linkCutscene_animateAndDecCounter1
//	jp nz,objectApplySpeed
//	ld a,$21
//	ld ($cfd0),a
//	ld a,$81
//	ld (wMenuDisabled),a
//	ld (wDisabledObjects),a
//	ld e,SpecialObject.direction
//	ld a,$03
//	ld (de),a
//	lda SPECIALOBJECT_LINK
//	jp setLinkIDOverride

//;;
//linkCutscene_cpyTo48:
//	ld e,SpecialObject.yh
//	ld a,(de)
//	cp $48
//	ret

//;;
//linkCutscene_cpxTo38:
//	ld e,SpecialObject.xh
//	ld a,(de)
//	cp $38
//	ret

void linkCutsceneInitOAMSetVisibleIncState(GameObject* object) {
	specialObjectSetOAMVariables(object);
	objectSetVisibleC1(object);
	itemIncState(object);
}

//;;
//linkCutscene_animateAndDecCounter1:
//	call specialObjectAnimate
//	jp itemDecCounter1

void linkCutscene5(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld l,SpecialObject.speed
//	ld (hl),SPEED_100
//	ld l,SpecialObject.var3d
//	ld (hl),$00
//	ld l,SpecialObject.direction
//	ld (hl),$ff

//@state1:
//	call linkCutscene_updateAngleOnPath
//	jr z,+
//	call specialObjectAnimate
//	jp objectApplySpeed
//+
//	ld a,SPECIALOBJECT_LINK
//	jp setLinkIDOverride

void linkCutscene6(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld l,SpecialObject.speed
//	ld (hl),SPEED_80
//	ld b,$16
//	ld l,SpecialObject.angle
//	ld a,(hl)
//	cp $08
//	jr z,+
//	ld b,$15
//+
//	ld a,b
//	call specialObjectSetAnimation

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1
//	.dw @substate2

//@substate0:
//	call specialObjectAnimate
//	call getThisRoomFlags
//	and $c0
//	jp z,objectApplySpeed
//	jp itemIncSubstate

//@substate1:
//	ld a,($cfd0)
//	cp $07
//	ret nz
//	call itemIncSubstate
//	ld a,$02
//	jp specialObjectSetAnimation

//@substate2:
//	ret

void linkCutscene7(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld l,SpecialObject.counter1
//	ld (hl),$f0
//	ld a,$14
//	jp specialObjectSetAnimation

//@state1:
//	call specialObjectAnimate
//	call itemDecCounter1
//	ret nz
//	lda SPECIALOBJECT_LINK
//	call setLinkIDOverride
//	ld l,SpecialObject.direction
//	ld (hl),$02
//	ld a,$01
//	ld (wUseSimulatedInput),a
//	ld (wMenuDisabled),a
//	ret

void linkCutscene8(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld l,SpecialObject.yh
//	ld (hl),$68
//	ld l,SpecialObject.xh
//	ld (hl),$50
//	ld a,$00
//	call specialObjectSetAnimation
//	jp objectSetInvisible

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1

//@substate0:
//	ld a,($cfd0)
//	cp $03
//	jr z,+
//	ld a,($cfd0)
//	cp $01
//	ret nz
//+
//	call itemIncSubstate
//	jp objectSetVisiblec2

//@substate1:
//	ret

void linkCutscene9(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld a,$02
//	call specialObjectSetAnimation
//	jp objectSetInvisible

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1
//	.dw @substate2
//	.dw @substate3
//	.dw @substate4

//@substate0:
//	ld a,($cfc0)
//	cp $01
//	ret nz
//	call itemIncSubstate
//	jp objectSetVisible82

//@substate1:
//	ld a,($cfc0)
//	cp $03
//	ret nz
//	call itemIncSubstate

//@substate2:
//	ld a,($cfc0)
//	cp $06
//	jp nz,linkCutsceneFunc_73e8

//	call itemIncSubstate
//	ld bc,$fe40
//	call objectSetSpeedZ
//	ld a,$0d
//	jp specialObjectSetAnimation

//@substate3:
//	ld c,$20
//	call objectUpdateSpeedZ_paramC
//	ret nz

//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$78
//	ld l,SpecialObject.animCounter
//	ld (hl),$01
//	ret

//@substate4:
//	call itemDecCounter1
//	jp nz,specialObjectAnimate
//	ld hl,$cfdf
//	ld (hl),$ff
//	ret

//; Link being kissed by Zelda in ending cutscene - cutscene 6 in seasons
void linkCutsceneA(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	call objectSetInvisible

//	call @checkShieldEquipped
//	ld a,$0b
//	jr nz,+
//	ld a,$0f
//+
//	jp specialObjectSetAnimation

//;;
//; @param[out]	zflag	Set if shield equipped
//@checkShieldEquipped:
//	ld hl,wInventoryB
//	ld a,ITEM_SHIELD
//	cp (hl)
//	ret z
//	inc l
//	cp (hl)
//	ret

//@state1:
//	ld e,SpecialObject.substate
//	ld a,(de)
//	rst_jumpTable
//	.dw @substate0
//	.dw @substate1
//	.dw @substate2
//	.dw @substate3

//@substate0:
//	ld a,($cfc0)
//	cp $01
//	ret nz

//	call itemIncSubstate
//.ifdef ROM_AGES
//	jp objectSetVisible82
//.else
//	jp objectSetVisible
//.endif

//@substate1:
//	ld a,($cfc0)
//	cp $07
//	ret nz

//	call itemIncSubstate
//	call @checkShieldEquipped
//	ld a,$10
//	jr nz,+
//	inc a
//+
//	jp specialObjectSetAnimation

//@substate2:
//	ld a,($cfc0)
//	cp $08
//	ret nz

//	call itemIncSubstate
//	ld l,SpecialObject.counter1
//	ld (hl),$68
//	inc l
//	ld (hl),$01
//	ld b,$02
//--
//	call getFreeInteractionSlot
//	jr nz,@@setAnimation
//	ld (hl),INTERAC_KISS_HEART
//	inc l
//	ld a,b
//	dec a
//	ld (hl),a
//	call objectCopyPosition
//	dec b
//	jr nz,--

//@@setAnimation:
//	ld a,$12
//	jp specialObjectSetAnimation

//@substate3:
//	call specialObjectAnimate
//	ld h,d
//	ld l,SpecialObject.counter1
//	call decHlRef16WithCap
//	ret nz

//	ld hl,$cfc0
//	ld (hl),$09
//	ret

//; Cutscene played on starting a new game ("accept our quest, hero") - cutsceneB in seasons
void linkCutsceneB(GameObject* object) {
	switch (object.state) {
		case 0:
			linkCutsceneInitOAMSetVisibleIncState(object);
			objectSetVisible81(object);
			object.counter = 300;
			object.yh = 208;
			object.xh = 80;
			specialObjectSetAnimation(object, 8);

			allCBB9 = 0;

			GameObject* newInteraction;
			if (!objectCreateInteraction(Interaction.sparkle, 0x0D, object, newInteraction)) {
				newInteraction.relatedObj = object;
			}
			goto case;
		case 1:
			intro.frameCounter = frameCounter;
			switch (object.substate) {
				case 0:
					linkCutsceneOscillateZ2(object);
					if (--link.counter == 0) {
						link.counter = 60;
						itemIncSubstate(object);
					}
					break;
				case 1:
					linkCutsceneOscillateZ2(object);
					if (itemDecCounter1(object)) {
						itemIncSubstate(object);
						showText(Text.acceptQuestHero);
					}
					break;
				case 2:
					linkCutsceneOscillateZ(object, &linkCutsceneZOscillation1[0]);
					if (textIsActive == 0) {
						intro.unnamedCBB9 = 6;
						playSound(Snd.fairyCutscene);
						linkCutsceneCreateGlowingOrb(object);
					}
					break;
				case 3:
					if (object.animParameter != 0xFF) {
						specialObjectAnimate(object);
						if ((frameCounter & 1) == 0) {
							objectSetInvisible(object);
						} else {
							objectSetVisible(object);
						}
					} else {
						intro.unnamedCBB9 = 7;
					}
					break;
				default: assert(0);
			}
			break;
		default: assert(0);
	}
}


void linkCutsceneC(GameObject* object) {
//	ld e,SpecialObject.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw linkCutsceneRet
	assert(0, "NYI");
}

//@state0:
//	call linkCutsceneInitOAMSetVisibleIncState
//	ld bc,$f804
//	ld a,$ff
//	call objectCreateExclamationMark
//	ld l,Interaction.subid
//	ld (hl),$01
//	ld a,$06
//	jp specialObjectSetAnimation

void linkCutsceneOscillateZ2(GameObject* object) {
	linkCutsceneOscillateZ(object, &linkCutsceneZOscillation2[0]);
}

//;;
//; Update Link's angle to follow a certain path. Which path it is depends on var03 (value
//; from 0-2).
//;
//; @param[out]	zflag	Set if reached the destination
//linkCutscene_updateAngleOnPath:
//	ld e,SpecialObject.var03
//	ld a,(de)
//	ld hl,@paths
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld h,(hl)
//	ld l,a

//	ld e,SpecialObject.var3d
//	ld a,(de)
//	add a
//	rst_addAToHl
//	ldi a,(hl)
//	cp $ff
//	ret z

//	or a
//	jr nz,@checkX

//	ld e,SpecialObject.yh
//	ld a,(de)
//	sub (hl)
//	ld b,$00
//	jr nc,+
//	ld b,$02
//+
//	jr nz,@updateDirection
//	jr @next

//@checkX:
//	ld e,SpecialObject.xh
//	ld a,(de)
//	sub (hl)
//	ld b,$03
//	jr nc,+
//	ld b,$01
//+
//	jr nz,@updateDirection

//@next:
//	ld h,d
//	ld l,SpecialObject.var3d
//	inc (hl)
//	call @updateDirection
//	jr linkCutscene_updateAngleOnPath

//;;
//; @param	b	Direction value
//; @param[out]	zflag	Unset
//@updateDirection:
//	ld e,SpecialObject.direction
//	ld a,(de)
//	cp b
//	jr z,@ret

//	ld a,b
//	ld (de),a
//	call specialObjectSetAnimation
//	ld e,SpecialObject.direction
//	ld a,(de)
//	swap a
//	rrca
//	ld e,SpecialObject.angle
//	ld (de),a

//@ret:
//	or d
//	ret


//@paths:
//	.dw @@path0
//	.dw @@path1
//	.dw @@path2

//; Data format:
//;  b0: 0 for y, 1 for x
//;  b1: Target position to walk to

//@@path0: ; Just saved the maku sapling, moving toward her
//	.db $00 $38
//	.db $01 $50
//	.db $00 $38
//	.db $ff

//@@path1: ; Just freed the goron elder, moving toward him
//	.db $01 $38
//	.db $00 $60
//	.db $ff

//@@path2: ; Funny joke cutscene in trading sequence
//	.db $00 $48
//	.db $ff