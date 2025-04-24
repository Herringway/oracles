module oracles.ages.objects.interactions.postman;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_POSTMAN
//; ==================================================================================================
void interactionCode55(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@state1
	assert(0, "NYI");
}

//@state0:
//	call @loadScriptAndInitGraphics
//@state1:
//	call interactionRunScript
//	jp c,interactionDelete

//	ld e,Interaction.var3f
//	ld a,(de)
//	or a
//	jp z,npcFaceLinkAndAnimate
//	call interactionAnimateBasedOnSpeed
//	jp objectSetPriorityRelativeToLink_withTerrainEffects

//@unusedFunc_690b:
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
//	.dw mainScripts.postmanScript
