module oracles.common.objects.interactions.faroresMemory;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_FARORES_MEMORY
//; ==================================================================================================
void interactionCode1C(GameObject* obj) {
//	call checkInteractionState
//	jp nz,interactionRunScript

//; Initialization

//	ld a,GLOBALFLAG_FINISHEDGAME
//	call checkGlobalFlag
//	jr nz,+
//	call checkIsLinkedGame
//	jp z,interactionDelete
//+
//	call interactionInitGraphics
//	call objectSetVisible83

//	ld hl,mainScripts.faroresMemoryScript
//	call interactionSetScript

//	jp interactionIncState
	assert(0, "NYI");
}
