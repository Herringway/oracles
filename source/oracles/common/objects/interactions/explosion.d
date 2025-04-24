module oracles.common.objects.interactions.explosion;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_EXPLOSION
//; ==================================================================================================
void interactionCode56(GameObject* obj) {
//	call checkInteractionState
//	jr z,@state0

//@state1:
//	ld e,Interaction.animParameter
//	ld a,(de)
//	inc a
//	jp nz,interactionAnimate
//	jp interactionDelete

//@state0:
//	inc a
//	ld (de),a
//	call interactionInitGraphics
//	ld a,SND_EXPLOSION
//	call playSound
//	ld e,Interaction.var03
//	ld a,(de)
//	rrca
//	jp c,objectSetVisible81
//	jp objectSetVisible82
	assert(0, "NYI");
}
