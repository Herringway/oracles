module oracles.ages.objects.interactions.rickysGloveSpawner;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_RICKYS_GLOVE_SPAWNER
//; ==================================================================================================
void interactionCode74(GameObject* obj) {
//	; Delete self if already returned gloves, haven't talked to Ricky, or already got
//	; gloves
//	ld a,(wRickyState)
//	bit 5,a
//	jr nz,@delete
//	and $01
//	jr z,@delete
//	ld a,TREASURE_RICKY_GLOVES
//	call checkTreasureObtained
//	jr c,@delete

//	ldbc INTERAC_TREASURE, TREASURE_RICKY_GLOVES
//	call objectCreateInteraction
//	ret nz
//@delete:
//	jp interactionDelete
	assert(0, "NYI");
}
