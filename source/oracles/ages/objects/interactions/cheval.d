module oracles.ages.objects.interactions.cheval;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_CHEVAL
//; ==================================================================================================
void interactionCode6A(GameObject* obj) {
//	ld e,Interaction.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
	assert(0, "NYI");
}

//@state0:
//	ld a,$01
//	ld (de),a
//	call interactionInitGraphics
//	call objectSetVisiblec2
//	ld a,>TX_2700
//	call interactionSetHighTextIndex

//	ld e,Interaction.subid
//	ld a,(de)
//	rst_jumpTable
//	.dw @loadScript

//@state1:
//	ld e,Interaction.subid
//	ld a,(de)
//	rst_jumpTable
//	.dw @runSubid00

//@runSubid00:
//	call interactionRunScript
//	jp interactionAnimateAsNpc

//@loadScript:
//	ld e,Interaction.subid
//	ld a,(de)
//	ld hl,@scriptTable
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld h,(hl)
//	ld l,a
//	jp interactionSetScript

//@scriptTable:
//	.dw mainScripts.cheval_subid00Script
