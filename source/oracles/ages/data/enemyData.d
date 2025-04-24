module oracles.ages.data.enemyData;

import oracles.defs;
import oracles.external;

//; Data format:
//;   b0: object gfx header to use (see data/objectGfxHeaders.s)
//;   b1: Value for Enemy.enemyCollisionMode (bit 7 must be set for collisions to work)
//;   b2: Bits 0-6 are an index for the extraEnemyData table below.
//;   b3: bits 4-7: palette + bank bit
//;       bits 0-3: oamTileIndexBase/2
//;
//;   Or, parameters 2/3 can be replaced with a pointer to subid data (see below).

struct EnemyDefinition {
	ubyte objectGFX;
	ubyte collision;
	ubyte extraIndex;
	ubyte flags;
	EnemySubIDDefinition[] subIDDefs;
	this(ubyte objectGFX, ubyte collision, ubyte extraIndex, ubyte flags) {
		this.objectGFX = objectGFX;
		this.collision = collision;
		this.extraIndex = extraIndex;
		this.flags = flags;
	}
	this(ubyte objectGFX, ubyte collision, EnemySubIDDefinition[] subidDefs) {
		this.objectGFX = objectGFX;
		this.collision = collision;
		subIDDefs = subidDefs;
	}
}

//; Each 2 bytes are for a particular subID.
//; The two bytes are the same as bytes 2 & 3 documented at the top of the file.
//; The difference is that if subid tables are used, bytes 2 & 3 are specified differently for
//; different enemy subid values.
struct EnemySubIDDefinition {
	ubyte a;
	ubyte b;
}

immutable EnemyDefinition[] enemyData = [
	Enemy.stub00: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.mergedTwinrova: EnemyDefinition(0xDB, 0x08, 0x34, 0x00),
	Enemy.veranFinalForm: EnemyDefinition(0xD7, 0xEA, 0x30, 0x60),
	Enemy.twinrova: EnemyDefinition(0x33, 0x8A, 0x33, 0x00),
	Enemy.ganon: EnemyDefinition(0x16, 0x8B, 0x35, 0x10),
	Enemy.ramrockArms: EnemyDefinition(0xCF, 0x8C, 0x02, 0x60),
	Enemy.veranFairy: EnemyDefinition(0xD4, 0x8D, 0x2F, 0x10),
	Enemy.ramrock: EnemyDefinition(0xCE, 0x8E, 0x2B, 0x60),
	Enemy.riverZora: EnemyDefinition(0x8F, 0x0F, 0x0C, 0x2D),
	Enemy.octorok: EnemyDefinition(0x8F, 0x90, [
		EnemySubIDDefinition(0x08, 0x20),
		EnemySubIDDefinition(0x08, 0x20),
		EnemySubIDDefinition(0x0C, 0x10),
		EnemySubIDDefinition(0x0C, 0x10),
		EnemySubIDDefinition(0x3F, 0x30),
	]),
	Enemy.boomerangMoblin: EnemyDefinition(0x91, 0x91, [
		EnemySubIDDefinition(0x0C, 0x20),
		EnemySubIDDefinition(0x11, 0x10),
	]),
	Enemy.leever: EnemyDefinition(0x8F, 0x10, [
		EnemySubIDDefinition(0x0C, 0x27),
		EnemySubIDDefinition(0x0E, 0x17),
		EnemySubIDDefinition(0x0C, 0x37),
	]),
	Enemy.arrowMoblin: EnemyDefinition(0x91, 0x91, [
		EnemySubIDDefinition(0x0C, 0x20),
		EnemySubIDDefinition(0x11, 0x10),
		EnemySubIDDefinition(0x3F, 0x30),
	]),
	Enemy.lynel: EnemyDefinition(0x95, 0x92, [
		EnemySubIDDefinition(0x17, 0x20),
		EnemySubIDDefinition(0x1B, 0x10),
		EnemySubIDDefinition(0x3F, 0x30),
	]),
	Enemy.bladeTrap: EnemyDefinition(0x9E, 0x93, [
		EnemySubIDDefinition(0x02, 0x20),
		EnemySubIDDefinition(0x02, 0x10),
		EnemySubIDDefinition(0x02, 0x30),
		EnemySubIDDefinition(0x02, 0x00),
		EnemySubIDDefinition(0x02, 0x00),
		EnemySubIDDefinition(0x02, 0x00),
	]),
	Enemy.veranSpider: EnemyDefinition(0xD3, 0x10, 0x0E, 0x75),
	Enemy.rope: EnemyDefinition(0x9B, 0x14, 0x0A, 0x06),
	Enemy.eyesoarChild: EnemyDefinition(0xC4, 0x95, 0x2D, 0x39),
	Enemy.gibdo: EnemyDefinition(0x9B, 0x96, 0x17, 0x20),
	Enemy.spark: EnemyDefinition(0x9B, 0x97, 0x03, 0x0A),
	Enemy.spikedBeetle: EnemyDefinition(0x8C, 0x98, 0x0A, 0x14),
	Enemy.bubble: EnemyDefinition(0x9B, 0x99, 0x01, 0x2B),
	Enemy.beamos: EnemyDefinition(0x8C, 0x00, 0x00, 0x18),
	Enemy.ghini: EnemyDefinition(0x90, 0x9A, [
		EnemySubIDDefinition(0x1A, 0x2B),
		EnemySubIDDefinition(0x14, 0x2B),
		EnemySubIDDefinition(0x16, 0x2B),
	]),
	Enemy.buzzblob: EnemyDefinition(0x93, 0x9B, 0x0A, 0x08),
	Enemy.whisp: EnemyDefinition(0x9B, 0x9C, 0x03, 0x09),
	Enemy.sandCrab: EnemyDefinition(0x94, 0x90, 0x0A, 0x30),
	Enemy.spinyBeetle: EnemyDefinition(0x94, 0x90, 0x0A, 0x2C),
	Enemy.ironMask: EnemyDefinition(0xA0, 0x9D, 0x0A, 0x20),
	Enemy.armos: EnemyDefinition(0x92, 0x82, 0x40, 0x09),
	Enemy.piranha: EnemyDefinition(0x94, 0x84, 0x0C, 0x32),
	Enemy.veranChildBee: EnemyDefinition(0xDA, 0x9F, 0x0E, 0x68),
	Enemy.maskedMoblin: EnemyDefinition(0x90, 0x91, [
		EnemySubIDDefinition(0x0A, 0x20),
		EnemySubIDDefinition(0x0C, 0x10),
	]),
	Enemy.arrowDarknut: EnemyDefinition(0x98, 0xA0, [
		EnemySubIDDefinition(0x14, 0x20),
		EnemySubIDDefinition(0x19, 0x10),
		EnemySubIDDefinition(0x3F, 0x30),
	]),
	Enemy.arrowShroudedStalfos: EnemyDefinition(0x9C, 0x91, 0x0E, 0x00),
	Enemy.polsVoice: EnemyDefinition(0x8C, 0xA1, 0x0C, 0x30),
	Enemy.likeLike: EnemyDefinition(0x99, 0x22, 0x11, 0x36),
	Enemy.gopongaFlower: EnemyDefinition(0x94, 0xA3, 0x0A, 0x28),
	Enemy.anglerFishBubble: EnemyDefinition(0xA5, 0xA4, 0x02, 0x28),
	Enemy.dekuScrub: EnemyDefinition(0x8D, 0x80, 0x3B, 0x50),
	Enemy.wallmaster: EnemyDefinition(0xA0, 0x25, 0x11, 0x2C),
	Enemy.podoboo: EnemyDefinition(0xA4, 0x04, 0x03, 0x20),
	Enemy.giantBladeTrap: EnemyDefinition(0x9E, 0xA6, [
		EnemySubIDDefinition(0x38, 0x08),
		EnemySubIDDefinition(0x38, 0x18),
		EnemySubIDDefinition(0x38, 0x28),
		EnemySubIDDefinition(0x38, 0x38),
	]),
	Enemy.enableSidescrollDownTransition: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.cheepCheep: EnemyDefinition(0xA4, 0x94, 0x0A, 0x33),
	Enemy.podobooTower: EnemyDefinition(0xA4, 0x0F, 0x11, 0x50),
	Enemy.thwimp: EnemyDefinition(0xA3, 0xA7, 0x03, 0x1D),
	Enemy.thwomp: EnemyDefinition(0xA3, 0xA8, 0x3C, 0x40),
	Enemy.tektite: EnemyDefinition(0x8F, 0x91, [
		EnemySubIDDefinition(0x0A, 0x3B),
		EnemySubIDDefinition(0x0C, 0x1B),
	]),
	Enemy.stalfos: EnemyDefinition(0x9B, 0x90, [
		EnemySubIDDefinition(0x0A, 0x12),
		EnemySubIDDefinition(0x0C, 0x22),
		EnemySubIDDefinition(0x0E, 0x32),
		EnemySubIDDefinition(0x0E, 0x02),
	]),
	Enemy.keese: EnemyDefinition(0x9D, 0x9F, 0x07, 0x00),
	Enemy.babyCucco: EnemyDefinition(0x4C, 0x00, 0x01, 0x37),
	Enemy.zol: EnemyDefinition(0x97, 0x29, [
		EnemySubIDDefinition(0x0A, 0x00),
		EnemySubIDDefinition(0x0C, 0x20),
	]),
	Enemy.floormaster: EnemyDefinition(0xA2, 0x25, 0x11, 0x10),
	Enemy.cucco: EnemyDefinition(0x4C, 0xAA, 0x41, 0x20),
	Enemy.butterfly: EnemyDefinition(0x4A, 0x00, 0x00, 0x14),
	Enemy.greatFairy: EnemyDefinition(0x4B, 0x00, 0x00, 0x20),
	Enemy.fireKeese: EnemyDefinition(0x9D, 0xAB, 0x09, 0x50),
	Enemy.waterTektite: EnemyDefinition(0x97, 0x94, 0x0C, 0x05),
	Enemy.giantCucco: EnemyDefinition(0x9A, 0xAC, 0x3E, 0x20),
	Enemy.bari: EnemyDefinition(0xA1, 0xAD, [
		EnemySubIDDefinition(0x0E, 0x1C),
		EnemySubIDDefinition(0x43, 0x1C),
	]),
	Enemy.swordMoblin: EnemyDefinition(0x91, 0x91, [
		EnemySubIDDefinition(0x0D, 0x20),
		EnemySubIDDefinition(0x12, 0x10),
	]),
	Enemy.peahat: EnemyDefinition(0x97, 0xD8, 0x0C, 0x23),
	Enemy.giantGhiniChild: EnemyDefinition(0xAD, 0xAF, 0x44, 0x50),
	Enemy.wizzrobe: EnemyDefinition(0x9F, 0x30, [
		EnemySubIDDefinition(0x0E, 0x00),
		EnemySubIDDefinition(0x11, 0x20),
		EnemySubIDDefinition(0x15, 0x10),
	]),
	Enemy.crow: EnemyDefinition(0x93, 0x31, 0x3D, 0x30),
	Enemy.shadowHagBug: EnemyDefinition(0xC3, 0xB2, 0x08, 0x2A),
	Enemy.gel: EnemyDefinition(0x97, 0xB3, 0x06, 0x20),
	Enemy.stub44: EnemyDefinition(0xA5, 0x00, 0x00, 0x10),
	Enemy.pincer: EnemyDefinition(0x92, 0x34, 0x11, 0x20),
	Enemy.stub46: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.colourChangingEel: EnemyDefinition(0x97, 0xEE, 0x06, 0x2E),
	Enemy.swordDarknut: EnemyDefinition(0x98, 0xA0, [
		EnemySubIDDefinition(0x14, 0x20),
		EnemySubIDDefinition(0x19, 0x10),
		EnemySubIDDefinition(0x3F, 0x30),
	]),
	Enemy.swordShroudedStalfos: EnemyDefinition(0x9C, 0x91, 0x0E, 0x00),
	Enemy.swordMaskedMoblin: EnemyDefinition(0x90, 0xB6, [
		EnemySubIDDefinition(0x0A, 0x20),
		EnemySubIDDefinition(0x0C, 0x10),
	]),
	Enemy.ballAndChainSoldier: EnemyDefinition(0x99, 0xB7, 0x16, 0x20),
	Enemy.blueCrow: EnemyDefinition(0x93, 0x31, 0x11, 0x14),
	Enemy.hardhatBeetle: EnemyDefinition(0x8C, 0xB8, 0x0E, 0x32),
	Enemy.armMimic: EnemyDefinition(0xA1, 0xB9, 0x13, 0x30),
	Enemy.moldorm: EnemyDefinition(0x97, 0xBA, 0x16, 0x07),
	Enemy.fireballShooter: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.beetle: EnemyDefinition(0x9B, 0x3B, 0x07, 0x0D),
	Enemy.flyingTile: EnemyDefinition(0x9C, 0x3C, 0x0A, 0x5B),
	Enemy.dragonfly: EnemyDefinition(0x4A, 0x00, 0x00, 0x26),
	Enemy.ambiGuard: EnemyDefinition(0x4D, 0xDA, 0x1A, 0x00),
	Enemy.candle: EnemyDefinition(0x9C, 0xBE, 0x17, 0x1D),
	Enemy.kingMoblinMinion: EnemyDefinition(0x90, 0x00, 0x00, 0x30),
	Enemy.stub57: EnemyDefinition(0x00, 0x3F, 0x00, 0x00),
	Enemy.bushOrRock: EnemyDefinition(0x00, 0xC0, 0x0A, 0x00),
	Enemy.itemDropProducer: EnemyDefinition(0x00, 0x00, 0x00, 0x88),
	Enemy.seedsOnTree: EnemyDefinition(0x00, 0x00, 0x01, 0x00),
	Enemy.stub5B: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub5C: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.twinrovaIce: EnemyDefinition(0xDE, 0x8E, 0x0A, 0x16),
	Enemy.twinrovaBat: EnemyDefinition(0x9D, 0xC1, 0x42, 0x20),
	Enemy.harmlessHardhatBeetle: EnemyDefinition(0x8C, 0xC2, 0x0E, 0x62),
	Enemy.ganonRevivalCutscene: EnemyDefinition(0xA7, 0x00, 0x00, 0x02),
	Enemy.veranPossessionBoss: EnemyDefinition(0xD0, 0x43, 0x2E, 0x60),
	Enemy.vineSprout: EnemyDefinition(0x6B, 0x90, 0x2C, 0x09),
	Enemy.targetCartCrystal: EnemyDefinition(0x78, 0x82, 0x01, 0x46),
	Enemy.linkMimic: EnemyDefinition(0xD5, 0xB9, 0x1B, 0x66),
	Enemy.stub65: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub66: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub67: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub68: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub69: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub6a: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub6b: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub6c: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub6d: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub6e: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.stub6f: EnemyDefinition(0x00, 0x00, 0x00, 0x00),
	Enemy.giantGhini: EnemyDefinition(0xAD, 0xC4, 0x1C, 0x50),
	Enemy.swoop: EnemyDefinition(0xAF, 0xC4, 0x1D, 0x20),
	Enemy.subterror: EnemyDefinition(0xB1, 0xC4, 0x1E, 0x10),
	Enemy.armosWarrior: EnemyDefinition(0xB4, 0xC4, [
		EnemySubIDDefinition(0x1A, 0x10),
		EnemySubIDDefinition(0x1A, 0x10),
		EnemySubIDDefinition(0x31, 0x20),
		EnemySubIDDefinition(0x32, 0x30),
	]),
	Enemy.smasher: EnemyDefinition(0xB7, 0xC5, 0x20, 0x30),
	Enemy.vire: EnemyDefinition(0x3C, 0x46, 0x21, 0x20),
	Enemy.anglerFish: EnemyDefinition(0xB8, 0xE4, 0x22, 0x10),
	Enemy.blueStalfos: EnemyDefinition(0xB9, 0xC8, 0x23, 0x10),
	Enemy.pumpkinHead: EnemyDefinition(0xBC, 0xC9, 0x24, 0x30),
	Enemy.headThwomp: EnemyDefinition(0xBF, 0xCA, 0x25, 0x00),
	Enemy.shadowHag: EnemyDefinition(0xC2, 0x4B, 0x26, 0x30),
	Enemy.eyesoar: EnemyDefinition(0xC4, 0xED, 0x27, 0x10),
	Enemy.smog: EnemyDefinition(0xC5, 0xCD, 0x28, 0x30),
	Enemy.octogon: EnemyDefinition(0xC8, 0xCE, 0x29, 0x20),
	Enemy.plasmarine: EnemyDefinition(0xCB, 0x4F, 0x2A, 0x10),
	Enemy.kingMoblin: EnemyDefinition(0xA9, 0xD0, 0x36, 0x00),
];


// Unused data?
//	EnemySubIDDefinition(0x00, 0x1B),
//	EnemySubIDDefinition(0x00, 0x1B),

//; Data format:
//;   b0: value for Enemy.collisionRadiusY
//;   b1: value for Enemy.collisionRadiusX
//;   b2: value for Enemy.damage (how much damage it deals)
//;   b3: value for Enemy.health

//extraEnemyData:
//	.db $00 $00 $00 $7f ; 0x00
//	.db $06 $06 $00 $7f ; 0x01
//	.db $04 $04 $fc $7f ; 0x02
//	.db $06 $06 $fc $7f ; 0x03
//	.db $04 $04 $f8 $7f ; 0x04
//	.db $06 $06 $f8 $7f ; 0x05
//	.db $02 $02 $fc $01 ; 0x06
//	.db $04 $06 $fc $01 ; 0x07
//	.db $06 $06 $fe $02 ; 0x08
//	.db $04 $06 $fc $02 ; 0x09
//	.db $06 $06 $fc $02 ; 0x0a
//	.db $04 $06 $fc $03 ; 0x0b
//	.db $06 $06 $fc $03 ; 0x0c
//	.db $06 $06 $fa $03 ; 0x0d
//	.db $06 $06 $fc $04 ; 0x0e
//	.db $06 $06 $f8 $04 ; 0x0f
//	.db $04 $04 $fc $05 ; 0x10
//	.db $06 $06 $fc $05 ; 0x11
//	.db $06 $06 $fa $05 ; 0x12
//	.db $06 $06 $f8 $05 ; 0x13
//	.db $06 $06 $fc $06 ; 0x14
//	.db $06 $06 $fc $07 ; 0x15
//	.db $06 $06 $fc $08 ; 0x16
//	.db $06 $06 $f8 $08 ; 0x17
//	.db $06 $06 $fa $09 ; 0x18
//	.db $06 $06 $f8 $09 ; 0x19
//	.db $06 $06 $fc $0a ; 0x1a
//	.db $06 $06 $f8 $0c ; 0x1b
//	.db $0a $0a $fe $0c ; 0x1c
//	.db $0a $0a $fc $14 ; 0x1d
//	.db $06 $06 $fc $14 ; 0x1e
//	.db $08 $0a $fc $0c ; 0x1f
//	.db $06 $06 $fc $05 ; 0x20
//	.db $06 $06 $fe $12 ; 0x21
//	.db $0c $0c $fc $1e ; 0x22
//	.db $08 $08 $fa $12 ; 0x23
//	.db $06 $0c $fc $08 ; 0x24
//	.db $12 $0f $fc $04 ; 0x25
//	.db $09 $09 $fa $0c ; 0x26
//	.db $06 $06 $f8 $14 ; 0x27
//	.db $0a $0a $fc $06 ; 0x28
//	.db $06 $06 $fa $14 ; 0x29
//	.db $0a $08 $fc $07 ; 0x2a
//	.db $04 $0a $fc $04 ; 0x2b
//	.db $06 $06 $00 $80 ; 0x2c
//	.db $04 $04 $fe $04 ; 0x2d
//	.db $08 $06 $f8 $80 ; 0x2e
//	.db $0c $06 $f8 $27 ; 0x2f
//	.db $08 $0a $f8 $18 ; 0x30
//	.db $0c $06 $fc $03 ; 0x31
//	.db $00 $00 $fc $7f ; 0x32
//	.db $06 $06 $fc $03 ; 0x33
//	.db $0e $07 $f8 $14 ; 0x34
//	.db $12 $12 $f4 $64 ; 0x35
//	.db $0a $0c $00 $06 ; 0x36
//	.db $03 $02 $00 $01 ; 0x37
//	.db $0d $0d $f8 $7f ; 0x38
//	.db $06 $06 $fc $14 ; 0x39
//	.db $04 $04 $00 $01 ; 0x3a
//	.db $08 $08 $fc $7f ; 0x3b
//	.db $0f $0c $f8 $7f ; 0x3c
//	.db $06 $06 $fc $01 ; 0x3d
//	.db $07 $0c $fc $02 ; 0x3e
//	.db $06 $06 $f8 $34 ; 0x3f
//	.db $07 $07 $f8 $04 ; 0x40
//	.db $06 $06 $00 $20 ; 0x41
//	.db $04 $06 $f8 $06 ; 0x42
//	.db $04 $02 $fc $01 ; 0x43
//	.db $02 $02 $00 $02 ; 0x44
