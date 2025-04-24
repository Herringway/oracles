module oracles.ages.objects.interactions.screenDistortion;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_SCREEN_DISTORTION
//; ==================================================================================================
void interactionCode7C(GameObject* obj) {
//	call checkInteractionState
//	jr z,@state0

//@state1:
//	ld a,$01
//	jp loadBigBufferScrollValues

//@state0:
//	call interactionSetAlwaysUpdateBit
//	call interactionIncState
//	ld a,$10
//	ld (wGfxRegs2.LYC),a
//	ld a,$02
//	ldh (<hNextLcdInterruptBehaviour),a
//	ld a,SND_WARP_START
//	call playSound
//	ld a,$ff
//	jp initWaveScrollValues
	assert(0, "NYI");
}
