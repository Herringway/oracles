module oracles.ages.objects.interactions.dumbellMan;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_DUMBBELL_MAN
//; ==================================================================================================
void interactionCode51(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@state1

//@state0:
//	call @initialize
//	call interactionSetAlwaysUpdateBit

//@state1:
//	call interactionRunScript
//	jp c,interactionDelete
//	jp interactionAnimateAsNpc
//	call interactionInitGraphics
//	jp interactionIncState

//@initialize:
//	call interactionInitGraphics
//	ld a,>TX_0b00
//	call interactionSetHighTextIndex
//	ld e,Interaction.subid
//	ld a,(de)
//	ld hl,@scriptTable
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld h,(hl)
//	ld l,a
//	call interactionSetScript
//	jp interactionIncState

//@scriptTable:
//	.dw mainScripts.dumbbellManScript
	assert(0, "NYI");
}
