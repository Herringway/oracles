module oracles.ages.objects.interactions.oldZora;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_OLD_ZORA
//; ==================================================================================================
void interactionCode5A(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@state1

//@state0:
//	call @loadScriptAndInitGraphics
//	call interactionSetAlwaysUpdateBit
//@state1:
//	call interactionRunScript
//	jp c,interactionDelete
//	jp interactionAnimateAsNpc

//@unusedFunc_6c34:
//	call interactionInitGraphics
//	jp interactionIncState

//@loadScriptAndInitGraphics:
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
//	.dw mainScripts.oldZoraScript
	assert(0, "NYI");
}
