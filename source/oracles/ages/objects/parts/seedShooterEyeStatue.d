module oracles.ages.objects.parts.seedShooterEyeStatue;

import oracles.defs;
import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; PART_SEED_SHOOTER_EYE_STATUE
//; ==================================================================================================
void partCode46(GameObject* part, ubyte status) {
	assert(0, "NYI");
//	jr z,@normalStatus
//	ld h,d
//	ld l,$c6
//	ld (hl),$2d
//	ld l,$c2
//	ld a,(hl)
//	and $07
//	ld hl,wActiveTriggers
//	call setFlag
//	call objectSetVisible83
//@normalStatus:
//	ld e,$c4
//	ld a,(de)
//	or a
//	jr z,@state0
//	call partCommon_decCounter1IfNonzero
//	ret nz
//	ld e,$c2
//	ld a,(de)
//	ld hl,wActiveTriggers
//	call unsetFlag
//	jp objectSetInvisible

//@state0:
//	inc a
//	ld (de),a
//	ret
}
