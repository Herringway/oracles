module oracles.ages.data.partCodeTable;

import oracles.bank00;
import oracles.common.objects.parts.beam;
import oracles.common.objects.parts.blueEnergyBead;
import oracles.common.objects.parts.bossDeathExplosion;
import oracles.common.objects.parts.bridgeSpawner;
import oracles.common.objects.parts.button;
import oracles.common.objects.parts.cuccoAttacker;
import oracles.common.objects.parts.darkRoomHandler;
import oracles.common.objects.parts.dekuScrubProjectile;
import oracles.common.objects.parts.detectionHelper;
import oracles.common.objects.parts.enemyArrow;
import oracles.common.objects.parts.enemyDestroyed;
import oracles.common.objects.parts.enemySword;
import oracles.common.objects.parts.fallingFire;
import oracles.common.objects.parts.fire;
import oracles.common.objects.parts.fireProjectiles;
import oracles.common.objects.parts.flame;
import oracles.common.objects.parts.ganonTrident;
import oracles.common.objects.parts.gashaTree;
import oracles.common.objects.parts.greatFairyHeart;
import oracles.common.objects.parts.itemDrop;
import oracles.common.objects.parts.itemFromMaple;
import oracles.common.objects.parts.lightableTorch;
import oracles.common.objects.parts.lighting;
import oracles.common.objects.parts.lynelBeam;
import oracles.common.objects.parts.moblinBoomerang;
import oracles.common.objects.parts.movingOrb;
import oracles.common.objects.parts.octorokProjectile;
import oracles.common.objects.parts.orb;
import oracles.common.objects.parts.owlStatue;
import oracles.common.objects.parts.part51;
import oracles.common.objects.parts.part52;
import oracles.common.objects.parts.respawnableBush;
import oracles.common.objects.parts.seedOnTree;
import oracles.common.objects.parts.shadow;
import oracles.common.objects.parts.smallFairy;
import oracles.common.objects.parts.spikedBall;
import oracles.common.objects.parts.stalfosBone;
import oracles.common.objects.parts.switchObject;
import oracles.common.objects.parts.twinrovaFlame;
import oracles.common.objects.parts.twinrovaProjectile;
import oracles.common.objects.parts.twinrovaSnowball;
import oracles.common.objects.parts.vireProjectile;
import oracles.common.objects.parts.volcanoRock;
import oracles.common.objects.parts.wizzrobeProjectile;
import oracles.ages.objects.parts.babyBall;
import oracles.ages.objects.parts.ball;
import oracles.ages.objects.parts.bigBangBombSpawner;
import oracles.ages.objects.parts.blackTowerMovingFlames;
import oracles.ages.objects.parts.blueStalfosProjectile;
import oracles.ages.objects.parts.bomb;
import oracles.ages.objects.parts.candleFlame;
import oracles.ages.objects.parts.donkeyKongFlame;
import oracles.ages.objects.parts.fallingBoulderSpawner;
import oracles.ages.objects.parts.grottoCrystal;
import oracles.ages.objects.parts.headThwompBombDropper;
import oracles.ages.objects.parts.headThwompCircularProjectile;
import oracles.ages.objects.parts.headThwompFireball;
import oracles.ages.objects.parts.jabuJabusBubbles;
import oracles.ages.objects.parts.kingMoblinBomb;
import oracles.ages.objects.parts.octogonBubble;
import oracles.ages.objects.parts.octogonDepthCharge;
import oracles.ages.objects.parts.part3B;
import oracles.ages.objects.parts.part3E;
import oracles.ages.objects.parts.plasmarineProjectile;
import oracles.ages.objects.parts.pumpkinHeadProjectile;
import oracles.ages.objects.parts.ramrockGloveFormArm;
import oracles.ages.objects.parts.ramrockSeedFormLaser;
import oracles.ages.objects.parts.ramrockSeedFormOrb;
import oracles.ages.objects.parts.roomOfRitesFallingBoulder;
import oracles.ages.objects.parts.rotatableSeedThing;
import oracles.ages.objects.parts.seaEffects;
import oracles.ages.objects.parts.seedShooterEyeStatue;
import oracles.ages.objects.parts.shadowHagShadow;
import oracles.ages.objects.parts.smogProjectile;
import oracles.ages.objects.parts.sparkle;
import oracles.ages.objects.parts.subterrorDirt;
import oracles.ages.objects.parts.timewarpAnimation;
import oracles.ages.objects.parts.tingleBalloon;
import oracles.ages.objects.parts.triforceStone;
import oracles.ages.objects.parts.veranAcidPool;
import oracles.ages.objects.parts.veranBeeProjectile;
import oracles.ages.objects.parts.veranFairyProjectile;
import oracles.ages.objects.parts.veranProjectile;
import oracles.ages.objects.parts.veranSpiderweb;
import oracles.ages.objects.parts.wallArrowShooter;

import oracles.external;
import oracles.structures;

immutable partCodeTable = [
	&partCode00,
	&partCode01,
	&partCode02,
	&partCode03,
	&partCode04,
	&partCode05,
	&partCode06,
	&partCode07,
	&partCode08,
	&partCode09,
	&partCodeNil,
	&partCode0B,
	&partCode0C,
	&partCodeNil,
	&partCode0E,
	&partCode0F,
	&partCode10,
	&partCode11,
	&partCode12,
	&partCode13,
	&partCode14,
	&partCode15,
	&partCode16,
	&partCode17,
	&partCode18,
	&partCode19,
	&partCode1A,
	&partCode1B,
	&partCode1C,
	&partCode1D,
	&partCode1E,
	&partCode1F,
	&partCode20,
	&partCode21,
	&partCode22,
	&partCode23,
	&partCode24,
	&partCode25,
	&partCode26,
	&partCode27,
	&partCode28,
	&partCode29,
	&partCode2A,
	&partCode2B,
	&partCode2C,
	&partCode2D,
	&partCode2E,
	&partCode2F,
	&partCode30,
	&partCode31,
	&partCode32,
	&partCode33,
	&partCode34,
	&partCode35,
	&partCode36,
	&partCode37,
	&partCode38,
	&partCode39,
	&partCode3A,
	&partCode3B,
	&partCode3C,
	&partCode3D,
	&partCode3E,
	&partCode3F,
	&partCode40,
	&partCode41,
	&partCode42,
	&partCode43,
	&partCode44,
	&partCode45,
	&partCode46,
	&partCode47,
	&partCode48,
	&partCode49,
	&partCode4A,
	&partCode4B,
	&partCode4C,
	&partCode4D,
	&partCode4E,
	&partCode4F,
	&partCode50,
	&partCode51,
	&partCode52,
	&partCode53,
	&partCode54,
	&partCode55,
	&partCode56,
	&partCode57,
	&partCode58,
	&partCode59,
	&partCode5A,
];

void partCodeNil(GameObject*, ubyte) {}

void partCode00(GameObject* part, ubyte status) {
	partDelete(part);
}
