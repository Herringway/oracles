module oracles.ages.objects.interactions.childJabu;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_CHILD_JABU
//; ==================================================================================================
void interactionCodeBA(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@state0
	assert(0, "NYI");
}

//@state1:
//	call interactionInitGraphics
//	call interactionSetAlwaysUpdateBit
//	call interactionIncState
//	ld bc,$0e06
//	call objectSetCollideRadii
//	ld hl,mainScripts.childJabuScript
//	call interactionSetScript
//	jp objectSetVisible82

//@state0:
//	call interactionAnimateAsNpc
//	jp interactionRunScript
