module oracles.ages.objects.interactions.mamamuYan;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_MAMAMU_YAN
//; ==================================================================================================
void interactionCode53(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@state1

//@state0:
//	call @initGraphicsLoadScriptAndIncState

//@state1:
//	call interactionRunScript
//	jp c,interactionDelete
//	jp npcFaceLinkAndAnimate


//@initGraphicsAncIncState: ; Unused?
//	call interactionInitGraphics
//	jp interactionIncState


//@initGraphicsLoadScriptAndIncState:
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
//	.dw mainScripts.mamamuYanScript
	assert(0, "NYI");
}
