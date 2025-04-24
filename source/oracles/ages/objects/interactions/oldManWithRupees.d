module oracles.ages.objects.interactions.oldManWithRupees;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_OLD_MAN_WITH_RUPEES
//; ==================================================================================================
void interactionCode2E(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@state1

//@state0:
//	inc a
//	ld (de),a
//	call interactionInitGraphics
//	ld a,>TX_3300
//	call interactionSetHighTextIndex

//	ld e,Interaction.subid
//	ld a,(de)
//	ld hl,@scriptTable
//	rst_addDoubleIndex
//	ldi a,(hl)
//	ld h,(hl)
//	ld l,a
//	call interactionSetScript

//	ld h,d
//	ld l,Interaction.yh
//	ld (hl),$38
//	ld l,Interaction.xh
//	ld (hl),$28

//@state1:
//	call interactionRunScript
//	jp npcFaceLinkAndAnimate

//@scriptTable:
//	.dw mainScripts.oldManScript_givesRupees
//	.dw mainScripts.oldManScript_takesRupees
	assert(0, "NYI");
}