module oracles.common.objects.items.minecartCollision;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;
//;;
//; ITEM_MINECART_COLLISION
void itemCode1D(GameObject* item) {
	assert(0, "NYI");
//	ld e,Item.state
//	ld a,(de)
//	or a
//	ret nz

//	call itemLoadAttributesAndGraphics
//	call itemIncState
//	ld l,Item.enabled
//	set 1,(hl)

//@ret:
//	ret
}
//;;
//; ITEM_MINECART_COLLISION
void itemCode1DPost(GameObject* item) {
	assert(0, "NYI");
//	ld hl,w1Companion.id
//	ld a,(hl)
//	cp SPECIALOBJECT_MINECART
//	jp z,objectTakePosition
//	jp itemDelete
}
