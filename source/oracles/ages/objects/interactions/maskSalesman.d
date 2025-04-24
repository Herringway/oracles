module oracles.ages.objects.interactions.maskSalesman;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_MASK_SALESMAN
//; ==================================================================================================
void interactionCode5C(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@state1

//@state0:
//	call @loadScriptAndInitGraphics
//	call interactionSetAlwaysUpdateBit
//@state1:
//	call interactionRunScript
//	jp c,interactionDelete
//	jp interactionAnimateAsNpc
//	call interactionInitGraphics
//	jp interactionIncState

//@loadScriptAndInitGraphics:
//	call interactionInitGraphics
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
//	.dw mainScripts.maskSalesmanScript
	assert(0, "NYI");
}
