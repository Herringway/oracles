module oracles.common.objects.items.slingshot;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;
//; In common folder because Ages has a stub

//;;
//; ITEM_SLINGSHOT
void itemCode13(GameObject* item) {
	assert(0, "NYI");

//.ifdef ROM_AGES
//	ret
//.else
//	ld e,Item.state
//	ld a,(de)
//	or a
//	ret nz
//	ld a,UNCMP_GFXH_SEASONS_1d
//	call loadWeaponGfx
//	call loadAttributesAndGraphicsAndIncState
//	ld h,d
//	ld a,(wSlingshotLevel)
//	or $08
//	ld l,Item.oamFlagsBackup
//	ldi (hl),a
//	ld (hl),a
//	jp objectSetVisible81

//foolsOreRet:
//	ret

//.endif
}
