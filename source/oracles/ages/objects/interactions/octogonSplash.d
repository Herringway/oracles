module oracles.ages.objects.interactions.octogonSplash;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_OCTOGON_SPLASH
//; ==================================================================================================
void interactionCode8E(GameObject* obj) {
//	ld e,Interaction.state
//	ld a,(de)
//	or a
//	jr z,@state0

//@state1:
//	ld e,Interaction.animParameter
//	ld a,(de)
//	inc a
//	jp nz,interactionAnimate
//	jp interactionDelete

//@state0:
//	call interactionInitGraphics
//	call interactionIncState
//	ld l,Interaction.direction
//	ld a,(hl)
//	rrca
//	rrca
//	call interactionSetAnimation
//	jp objectSetVisible81
	assert(0, "NYI");
}
