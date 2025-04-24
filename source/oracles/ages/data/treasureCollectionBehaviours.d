module oracles.ages.data.treasureCollectionBehaviours;

import oracles.defs;
import oracles.external;
import oracles.structures;
//; The table below outlines what should happen when Link obtains an item (ie. whether to
//; add ammo to an item, increase an item's level, etc...)
//;
//; See the "applyParameter" subfunction of "giveTreasure_body" for where this is processed.
//;
//; Data format:
//; b0: Low byte of an address in the C6XX block to do something with
//; b1: bit 7:    Set if no sound effect should be played (b2 should be ignored)
//;     bits 0-3: What to do when Link gets the item (ie. add to a quantity, set a weapon's
//;               level, etc). Here are the values:
//;               0: Do nothing extra.
//;               1: Set bit [param] in [b0]. (Essence)
//;               2: Increment [b0]. (Shovel, satchel, heart piece)
//;               3: Increment [b0] as a BCD number. (Slate)
//;               4: Add [param] to [b0] as a BCD number. (Bombchus, gasha seeds)
//;               5: Set [b0] to [param]. (Harp, trade item)
//;               6: Set bit [wDungeonIndex] in [b0]. (Boss key, map, compass)
//;               7: Increment [b0+[wDungeonIndex]] and refresh the small key count.
//;               8: Set [b0] to [param] if [b0]<[param]; update A/B buttons. (Shield,flute)
//;               9: Add [param] to the unappraised ring list.
//;               a: Add [param] to [b0]. (Heart container)
//;               b: Set bit [param] in [wUpgradesObtained]. (0x60-0x67)
//;               c: Add [param] to [b0], using [b0+1] as a cap. (Health refill)
//;                  Also plays the sound effect for regaining hearts if b0 == wLinkHealth.
//;               d: Add [param] to [b0] as BCD, using [b0+1] as a cap. (Bombs)
//;               e: Add rupee value [param] to 2-byte bcd value [b0].
//;                  Also adds the value to wTotalRupeesCollected if b0 == wNumRupees.
//;                  Note: [param] is not the amount of rupees that will be added; instead,
//;                  [param] is passed to the "getRupeeValue" function, which returns the
//;                  actual amount.
//;               f: Add [param] to [b0] as a BCD number, check wSeedSatchelLevel for the
//;                  maximum value. (Seed drops)
//; b2: Sound effect to play when Link gets the item

TreasureBehaviour[] treasureCollectionBehaviourTable = [
	Treasure.none: TreasureBehaviour(TreasureBehaviourVars.none, 0x00, Snd.none),
	Treasure.shield: TreasureBehaviour(TreasureBehaviourVars.shieldLevel, 0x08, Snd.getItem),
	Treasure.punch: TreasureBehaviour(TreasureBehaviourVars.unnamedC608, 0b00000000, Snd.none),
	Treasure.bombs: TreasureBehaviour(TreasureBehaviourVars.numBombs, 0b00001101, Snd.getSeed),
	Treasure.caneOfSomaria: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.sword: TreasureBehaviour(TreasureBehaviourVars.swordLevel, 0b10001000, Snd.getItem),
	Treasure.boomerang: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.rodOfSeasons: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.magnetGloves: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getSeed),
	Treasure.switchHookHelper: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.switchHook: TreasureBehaviour(TreasureBehaviourVars.switchHookLevel, 0b00001000, Snd.getItem),
	Treasure.switchHookChain: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.biggoronSword: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.bombchus: TreasureBehaviour(TreasureBehaviourVars.numBombchus, 0b00000100, Snd.getItem),
	Treasure.flute: TreasureBehaviour(TreasureBehaviourVars.animalCompanion, 0b00001000, Snd.getItem),
	Treasure.shooter: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.unnamed10: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.harp: TreasureBehaviour(TreasureBehaviourVars.selectedHarpSong, 0b00000101, Snd.getItem),
	Treasure.unnamed12: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.slingshot: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getSeed),
	Treasure.unnamed14: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.shovel: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000010, Snd.getItem),
	Treasure.bracelet: TreasureBehaviour(TreasureBehaviourVars.braceletLevel, 0b00001000, Snd.getSeed),
	Treasure.feather: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.unnamed18: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.seedSatchel: TreasureBehaviour(TreasureBehaviourVars.seedSatchelLevel, 0b00000010, Snd.getItem),
	Treasure.unnamed1a: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed1b: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed1c: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.minecartCollision: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.foolsOre: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getSeed),
	Treasure.unnamed1f: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.emberSeeds: TreasureBehaviour(TreasureBehaviourVars.numEmberSeeds, 0b00001111, Snd.getSeed),
	Treasure.scentSeeds: TreasureBehaviour(TreasureBehaviourVars.numScentSeeds, 0b00001111, Snd.getSeed),
	Treasure.pegasusSeeds: TreasureBehaviour(TreasureBehaviourVars.numPegasusSeeds, 0b00001111, Snd.getSeed),
	Treasure.galeSeeds: TreasureBehaviour(TreasureBehaviourVars.numGaleSeeds, 0b00001111, Snd.getSeed),
	Treasure.mysterySeeds: TreasureBehaviour(TreasureBehaviourVars.numMysterySeeds, 0b00001111, Snd.getSeed),
	Treasure.tuneOfEchoes: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.tuneOfCurrents: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.tuneOfAges: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.rupees: TreasureBehaviour(TreasureBehaviourVars.numRupees, 0b00001110, Snd.none),
	Treasure.heartRefill: TreasureBehaviour(TreasureBehaviourVars.linkHealth, 0b00001100, Snd.none),
	Treasure.heartContainer: TreasureBehaviour(TreasureBehaviourVars.linkMaxHealth, 0b10001010, Snd.getItem),
	Treasure.heartPiece: TreasureBehaviour(TreasureBehaviourVars.numHeartPieces, 0b00000010, Snd.getItem),
	Treasure.ringBox: TreasureBehaviour(TreasureBehaviourVars.ringBoxLevel, 0b00001000, Snd.getItem),
	Treasure.ring: TreasureBehaviour(TreasureBehaviourVars.numUnappraisedRingsBCD, 0b00001001, Snd.getSeed),
	Treasure.flippers: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.potion: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.smallKey: TreasureBehaviour(TreasureBehaviourVars.dungeonSmallKeys, 0b10000111, Snd.getSeed),
	Treasure.bossKey: TreasureBehaviour(TreasureBehaviourVars.dungeonBossKeys, 0b10000110, Snd.getItem),
	Treasure.compass: TreasureBehaviour(TreasureBehaviourVars.dungeonCompasses, 0b10000110, Snd.getItem),
	Treasure.map: TreasureBehaviour(TreasureBehaviourVars.dungeonMaps, 0b10000110, Snd.getItem),
	Treasure.gashaSeed: TreasureBehaviour(TreasureBehaviourVars.numGashaSeeds, 0b00000100, Snd.getSeed),
	Treasure.unnamed35: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.makuSeed: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.oreChunks: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed38: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed39: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed3a: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed3b: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed3c: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed3d: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed3e: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed3f: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.essence: TreasureBehaviour(TreasureBehaviourVars.essencesObtained, 0b00000001, Mus.getEssence),
	Treasure.tradeitem: TreasureBehaviour(TreasureBehaviourVars.tradeItem, 0b00000101, Snd.getItem),
	Treasure.graveyardKey: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.crownKey: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.mermaidKey: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.oldMermaidKey: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.libraryKey: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.unnamed47: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.rickyGloves: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.bombFlower: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.mermaidSuit: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.slate: TreasureBehaviour(TreasureBehaviourVars.numSlates, 0b00000011, Snd.getItem),
	Treasure.tuniNut: TreasureBehaviour(TreasureBehaviourVars.tuniNutState, 0b00000101, Snd.getItem),
	Treasure.scentSeedling: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.zoraScale: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.tokayEyeball: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.emptyBottle: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.fairyPowder: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000101, Snd.getItem),
	Treasure.chevalRope: TreasureBehaviour(TreasureBehaviourVars.rememberedCompanionID, 0b00000101, Snd.none),
	Treasure.membersCard: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.islandChart: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.bookOfSeals: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000101, Snd.getItem),
	Treasure.unnamed56: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed57: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.bombFlowerLowerHalf: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.goronLetter: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.lavaJuice: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.brotherEmblem: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.goronVase: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.goronade: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.rockBrisket: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.getItem),
	Treasure.unnamed5f: TreasureBehaviour(TreasureBehaviourVars.none, 0b00000000, Snd.none),
	Treasure.unnamed60: TreasureBehaviour(TreasureBehaviourVars.none, 0b00001011, Snd.getItem),
	Treasure.bombUpgrade: TreasureBehaviour(TreasureBehaviourVars.none, 0b00001011, Snd.getItem),
	Treasure.satchelUpgrade: TreasureBehaviour(TreasureBehaviourVars.seedSatchelLevel, 0b10000011, Snd.getItem),
	Treasure.unnamed63: TreasureBehaviour(TreasureBehaviourVars.none, 0b00001011, Snd.none),
	Treasure.unnamed64: TreasureBehaviour(TreasureBehaviourVars.none, 0b00001011, Snd.none),
	Treasure.unnamed65: TreasureBehaviour(TreasureBehaviourVars.none, 0b00001011, Snd.none),
	Treasure.unnamed66: TreasureBehaviour(TreasureBehaviourVars.none, 0b00001011, Snd.none),
	Treasure.unnamed67: TreasureBehaviour(TreasureBehaviourVars.none, 0b00001011, Snd.none),
];