module oracles.common.data.terrainEffects;

import oracles.external;
import oracles.structures;

import replatform64.gameboy;

//shadowAnimation:
//	.db $01
//	.db $13 $04 $20 $08

//greenGrassAnimationFrame0:
//	.db $02
//	.db $11 $01 $24 $08
//	.db $11 $07 $24 $08

//blueGrassAnimationFrame0:
//	.db $02
//	.db $11 $01 $24 $09
//	.db $11 $07 $24 $09

//orangeGrassAnimationFrame0:
//	.db $02
//	.db $11 $01 $24 $0b
//	.db $11 $07 $24 $0b

//greenGrassAnimationFrame1:
//	.db $02
//	.db $11 $01 $24 $28
//	.db $11 $07 $24 $28

//blueGrassAnimationFrame1:
//	.db $02
//	.db $11 $01 $24 $29
//	.db $11 $07 $24 $29

//orangeGrassAnimationFrame1:
//	.db $02
//	.db $11 $01 $24 $2b
//	.db $11 $07 $24 $2b

immutable Animation[] puddleAnimationFrames = [
	Animation(0x02, [
		OAMEntry(0x16, 0x03, 0x22, 0x08),
		OAMEntry(0x16, 0x05, 0x22, 0x28),
	]),
	Animation(0x02, [
		OAMEntry(0x16, 0x02, 0x22, 0x08),
		OAMEntry(0x16, 0x06, 0x22, 0x28),
	]),
	Animation(0x02, [
		OAMEntry(0x17, 0x01, 0x22, 0x08),
		OAMEntry(0x17, 0x07, 0x22, 0x28),
	]),
	Animation(0x02, [
		OAMEntry(0x18, 0x00, 0x22, 0x08),
		OAMEntry(0x18, 0x08, 0x22, 0x28),
	]),
];
