module oracles.common.objects.interactions.gameCompleteDialog;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_GAME_COMPLETE_DIALOG
//; ==================================================================================================
void interactionCodeD1(GameObject* obj) {
//	ld e,Interaction.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw interactionRunScript
	assert(0, "NYI");
}

//@state0:
//	ld a,$01
//	ld (de),a
//	ld c,a
//	callab bank1.loadDeathRespawnBufferPreset
//	ld hl,mainScripts.gameCompleteDialogScript
//	jp interactionSetScript
