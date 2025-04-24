module oracles.common.objects.parts.greatFairyHeart;

import oracles.defs;
import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; PART_GREAT_FAIRY_HEART
//; ==================================================================================================
void partCode30(GameObject* part, ubyte status) {
	assert(0, "NYI");

//	ld e,$c4
//	ld a,(de)
//	or a
//	jr nz,+
//	ld h,d
//	ld l,e
//	inc (hl)
//	ld l,$c6
//	ld (hl),$03
//	call objectSetVisible81
//+
//	ldh a,(<hEnemyTargetY)
//	ld b,a
//	ldh a,(<hEnemyTargetX)
//	ld c,a
//	ld a,$20
//	ld e,$c9
//	call objectSetPositionInCircleArc
//	call partCommon_decCounter1IfNonzero
//	ret nz
//	ld (hl),$03
//	ld l,$c9
//	ld a,(hl)
//	dec a
//	and $1f
//	ld (hl),a
//	ret nz
//	ld hl,wLinkMaxHealth
//	ld a,(wDisplayedHearts)
//	cp (hl)
//	ret nz
//	ld a,$31
//	call objectGetRelatedObject1Var
//	dec (hl)
//	jp partDelete
}
