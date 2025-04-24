module oracles.common.objects.items.foolsOre;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;
//; In common folder because Ages has a stub

//;;
//; ITEM_FOOLS_ORE
void itemCode1E(GameObject* item) {
	assert(0, "NYI");

//.ifdef ROM_SEASONS
//	ld e,Item.state
//	ld a,(de)
//	rst_jumpTable
//	.dw @state0
//	.dw foolsOreRet

//@state0:
//	ld a,UNCMP_GFXH_SEASONS_1f
//	call loadWeaponGfx
//	call loadAttributesAndGraphicsAndIncState
//	xor a
//	call itemSetAnimation
//	jp objectSetVisible82
//.endif
}
