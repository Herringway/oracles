module oracles.common.objects.parts.bossDeathExplosion;

import oracles.defs;
import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; PART_BOSS_DEATH_EXPLOSION
//; ==================================================================================================
void partCode04(GameObject* part, ubyte status) {
	assert(0, "NYI");
//	ld e,Part.state
//	ld a,(de)
//	or a
//	jr z,@state0

//@state1:
//	ld e,Part.animParameter
//	ld a,(de)
//	inc a
//	jp nz,partAnimate

//	call decNumEnemies
//	jr nz,@delete

//	ld e,Part.subid
//	ld a,(de)
//	or a
//	jr z,@delete

//	xor a
//	call decideItemDrop
//	jr z,@delete
//	ld b,PART_ITEM_DROP
//	jp objectReplaceWithID

//@delete:
//	jp partDelete

//@state0:
//	inc a
//	ld (de),a ; [state] = 1
//	ld e,Part.subid
//	ld a,(de)
//	or a
//	ld a,SND_BIG_EXPLOSION
//	call nz,playSound
//	jp objectSetVisible80
}
