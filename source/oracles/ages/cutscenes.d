module oracles.ages.cutscenes;

import oracles.bank00;
import oracles.bank03;
import oracles.external;

//; CUTSCENE_NAYRU_SINGING
void cutscene06() {
	func1613();
	miscCutsceneHandler(0);
}

//; CUTSCENE_MAKU_TREE_DISAPPEARING
void cutscene07() {
	assert(0, "NYI");
//	ld c,$01
//func_5d5d:
//	ld a,(wWarpTransition2)
//	or a
//	jp nz,applyWarpTransition2
//	jpab bank3Cutscenes.miscCutsceneHandler
}

//; CUTSCENE_BLACK_TOWER_EXPLANATION
void cutscene08() {
	assert(0, "NYI");
//	ld c,$02
//	jr func_5d5d
}

//; CUTSCENE_NAYRU_WARP_TO_MAKU_TREE
void cutscene0C() {
	assert(0, "NYI");
//	call func1613
//	ld c,$03
//	jr func_5d5d
}

//; CUTSCENE_BLACK_TOWER_ESCAPE
void cutscene09() {
	assert(0, "NYI");
//	call func1613
//	ld a,(wCutsceneTrigger)
//	or a
//	jp nz,setCutsceneIndexIfCutsceneTriggerSet

//	ld e,$00
//---
//	call endgameCutsceneHandler
//	ld a,(wWarpTransition2)
//	or a
//	ret z
//	jp applyWarpTransition2
}

//; CUTSCENE_ROOM_OF_RITES_COLLAPSE
void cutscene0F() {
	assert(0, "NYI");
//	call func1613
//	ld e,$02
//	jp endgameCutsceneHandler
}

//; CUTSCENE_CREDITS
void cutscene0A() {
	assert(0, "NYI");
//	ld e,$01
//	jp endgameCutsceneHandler
}

//; CUTSCENE_FLAME_OF_DESPAIR
void cutscene20() {
	assert(0, "NYI");
//	call func1613
//	ld e,$03
//	jr ---
}

//; CUTSCENE_PREGAME_INTRO
void cutscene0D() {
	func1613();
	miscCutsceneHandler(6);
}

//; CUTSCENE_TWINROVA_REVEAL
void cutscene0E() {
	assert(0, "NYI");
//	call func1613
//	ld a,(wWarpTransition2)
//	or a
//	jr nz,applyWarpTransition2

//.ifdef REGION_JP
//	callab animationAndUniqueGfxData.updateAnimations
//.endif

//	ld c,$05
//	jpab bank3Cutscenes.miscCutsceneHandler
}

//; CUTSCENE_BLACK_TOWER_COMPLETE
void cutscene21() {
	assert(0, "NYI");
//	ld a,(wCutsceneTrigger)
//	or a
//	jp nz,setCutsceneIndexIfCutsceneTriggerSet

//	ld c,$07
//	jr func_5d5d
}

//; CUTSCENE_TURN_TO_STONE
void cutscene10() {
	assert(0, "NYI");
//	ld c,$04
//	jr func_5d5d
}

//; CUTSCENE_FLAME_OF_SORROW
void cutscene11() {
	assert(0, "NYI");
//	call func_3ed0
//	jp func_5d41
}

//; CUTSCENE_ZELDA_KIDNAPPED
void cutscene12() {
	assert(0, "NYI");
//	ld a,(wCutsceneTrigger)
//	or a
//	jp nz,setCutsceneIndexIfCutsceneTriggerSet

//	call func_3ee4
//	jp func_5d41
}
