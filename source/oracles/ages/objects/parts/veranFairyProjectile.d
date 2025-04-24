module oracles.ages.objects.parts.veranFairyProjectile;

import oracles.defs;
import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; PART_VERAN_FAIRY_PROJECTILE
//; ==================================================================================================
void partCode2D(GameObject* part, ubyte status) {
	assert(0, "NYI");
//	jr nz,@notNormalStatus
//	ld a,$29
//	call objectGetRelatedObject1Var
//	ld a,(hl)
//	or a
//	jr z,@noRelatedObj
//	ld e,$c4
//	ld a,(de)
//	or a
//	jr z,@state0
//	call partCommon_checkOutOfBounds
//	jr z,@notNormalStatus
//	call objectApplySpeed
//	jp partAnimate
//@state0:
//	ld h,d
//	ld l,e
//	inc (hl)
//	ld l,$d0
//	ld (hl),$3c
//	call objectGetAngleTowardEnemyTarget
//	ld e,$c9
//	ld (de),a
//	call objectSetVisible82
//	ld a,SND_VERAN_FAIRY_ATTACK
//	jp playSound
//@noRelatedObj:
//	call objectCreatePuff
//@notNormalStatus:
//	jp partDelete
}
