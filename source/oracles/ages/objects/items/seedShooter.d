module oracles.ages.objects.items.seedShooter;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;
//;;
//; ITEM_SHOOTER
void itemCode0F(GameObject* item) {
	assert(0, "NYI");
//	ld e,Item.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw @state1
}
//@state0:
//	ld a,UNCMP_GFXH_AGES_1d
//	call loadWeaponGfx
//	call loadAttributesAndGraphicsAndIncState
//	ld e,Item.var30
//	ld a,$ff
//	ld (de),a
//	jp objectSetVisible81

//@state1:
//	ret


//;;
//; ITEM_SHOOTER
void itemCode0FPost(GameObject* item) {
	assert(0, "NYI");
//	call cpRelatedObject1ID
//	jp nz,itemDelete

//	ld hl,@data
//	call itemInitializeFromLinkPosition

//	; Copy link Z position
//	ld h,d
//	ld a,(w1Link.zh)
//	ld l,Item.zh
//	ld (hl),a

//	; Check if angle has changed
//	ld l,Item.var30
//	ld a,(w1ParentItem2.angle)
//	cp (hl)
//	ld (hl),a
//	ret z
//	jp itemSetAnimation
}

//; b0/b1: collisionRadiusY/X
//; b2/b3: Y/X offsets relative to Link
//@data:
//	.db $00 $00 $00 $00
