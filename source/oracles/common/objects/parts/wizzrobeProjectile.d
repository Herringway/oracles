module oracles.common.objects.parts.wizzrobeProjectile;

import oracles.defs;
import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; PART_WIZZROBE_PROJECTILE
//; ==================================================================================================
void partCode1F(GameObject* part, ubyte status) {
	assert(0, "NYI");

//	jr nz,@normalStatus
//	ld e,$c4
//	ld a,(de)
//	or a
//	jr z,func_5369
//	call objectCheckWithinScreenBoundary
//	jr nc,@normalStatus
//	call partCommon_checkTileCollisionOrOutOfBounds
//	jp nc,objectApplySpeed
//@normalStatus:
//	jp partDelete

//func_5369:
//	ld h,d
//	ld l,e
//	inc (hl)
//	ld l,$d0
//	ld (hl),$50
//	ld e,$c9
//	ld a,(de)
//	swap a
//	rlca
//	call partSetAnimation
//	jp objectSetVisible81
}
