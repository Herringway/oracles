module oracles.ages.data.objectGfxHeaders;

import oracles.data;
import oracles.external;
import oracles.structures;
//; To find which objects are using which of these graphics, look in the files "interactionData.s",
//; "enemyData.s", and "partData.s".

immutable ObjectGFX[] objectGFXHeaderTable = [
	ObjectGFX(0x70, GFXAsset.gfxCapcomNintendo, 0),
	ObjectGFX(0x70, GFXAsset.gfxCapcomNintendo, 0),
	ObjectGFX(0x70, GFXAsset.gfxCapcomNintendo, 0),
	ObjectGFX(0x70, GFXAsset.gfxCapcomNintendo, 0),
	ObjectGFX(0xEB, GFXAsset.sprMakuadultsprites1, 0),
	ObjectGFX(0xEB, GFXAsset.sprMakuadultsprites2, 0),
	ObjectGFX(0x70, GFXAsset.gfxCapcomNintendo, 0),
	ObjectGFX(0x70, GFXAsset.gfxCapcomNintendo, 0),
	ObjectGFX(0x70, GFXAsset.gfxCapcomNintendo, 0),
	ObjectGFX(0x6D, GFXAsset.sprKingmoblin1, 0),
	ObjectGFX(0x6D, GFXAsset.sprKingmoblin2, 0),
	ObjectGFX(0x6D, GFXAsset.sprKingmoblin3, 0),
	ObjectGFX(0xAD, GFXAsset.sprKingmoblin4, 0),
	ObjectGFX(0xEA, GFXAsset.sprBunnyParrot, 0),
	ObjectGFX(0xEA, GFXAsset.sprVasuSnakeDeadbunny, 0),
	ObjectGFX(0xEB, GFXAsset.sprImpa, 0),
	ObjectGFX(0x2B, GFXAsset.sprImpafainted, 0),
	ObjectGFX(0xEB, GFXAsset.sprZelda1, 0),
	ObjectGFX(0x6B, GFXAsset.sprZelda2, 0),
	ObjectGFX(0xEB, GFXAsset.sprDin1, 0),
	ObjectGFX(0x6B, GFXAsset.sprDin2, 0),
	ObjectGFX(0xEB, GFXAsset.sprDin1, 0),
	ObjectGFX(0x2D, GFXAsset.sprGanon1, 0),
	ObjectGFX(0x6D, GFXAsset.sprGanon2, 0),
	ObjectGFX(0x6D, GFXAsset.sprTwinrovaSacrifice1, 0),
	ObjectGFX(0x6D, GFXAsset.sprTwinrovaSacrifice2, 0),
	ObjectGFX(0x6D, GFXAsset.sprTwinrovaSacrifice3, 0),
	ObjectGFX(0x2D, GFXAsset.sprTwinrovaSacrifice4, 0),
	ObjectGFX(0x6D, GFXAsset.sprGanon3, 0),
	ObjectGFX(0x6D, GFXAsset.sprGanon4, 0),
	ObjectGFX(0xAD, GFXAsset.sprGanon5, 0),
	ObjectGFX(0xAD, GFXAsset.sprGanon6, 0),
	ObjectGFX(0xAD, GFXAsset.sprGanon7, 0),
	ObjectGFX(0xAD, GFXAsset.sprGanon8, 0),
	ObjectGFX(0x2D, GFXAsset.sprGanon9, 0),
	ObjectGFX(0xAD, GFXAsset.sprGanon10, 0),
	ObjectGFX(0xEA, GFXAsset.sprRalph1, 0),
	ObjectGFX(0x2A, GFXAsset.sprRalph2, 0),
	ObjectGFX(0xEA, GFXAsset.sprNayru1, 0),
	ObjectGFX(0xEA, GFXAsset.sprNayru2, 0),
	ObjectGFX(0xEB, GFXAsset.sprTokay, 0),
	ObjectGFX(0xEB, GFXAsset.sprKingzoraTokkey, 0),
	ObjectGFX(0xEA, GFXAsset.sprGoron, 0),
	ObjectGFX(0xAA, GFXAsset.sprGorondanceTingleWrite, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova1, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova2, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova3, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova1, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova2, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova3, 0),
	ObjectGFX(0x6B, GFXAsset.sprZelda2, 0),
	ObjectGFX(0x2D, GFXAsset.sprTwinrovamerged1, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova1, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova2, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova3, 0),
	ObjectGFX(0xEC, GFXAsset.sprVeranHuman, 0),
	ObjectGFX(0x6C, GFXAsset.sprVeranbeetleWing, 0),
	ObjectGFX(0x2D, GFXAsset.sprTwinrova5, 0),
	ObjectGFX(0x1A, GFXAsset.sprLink, 0x1C00),
	ObjectGFX(0x1A, GFXAsset.sprLink, 0x1A00),
	ObjectGFX(0xEC, GFXAsset.sprVire, 0),
	ObjectGFX(0xB2, GFXAsset.sprTriforcestone, 0),
	ObjectGFX(0xEA, GFXAsset.sprKids, 0),
	ObjectGFX(0xEA, GFXAsset.sprLadiesAndDiver, 0),
	ObjectGFX(0x6A, GFXAsset.sprGymnastTroyScrub, 0),
	ObjectGFX(0xEA, GFXAsset.sprMailmanWiseman, 0),
	ObjectGFX(0x2A, GFXAsset.sprHobos, 0),
	ObjectGFX(0xEA, GFXAsset.sprMustachemenCat, 0),
	ObjectGFX(0xEA, GFXAsset.sprVillagezoraPlenWhitemustache, 0),
	ObjectGFX(0xEA, GFXAsset.sprZzBubbleExclamationHeartKid, 0),
	ObjectGFX(0xAA, GFXAsset.sprBipinGlassesguy, 0),
	ObjectGFX(0xEA, GFXAsset.sprBlossomOtherlady, 0),
	ObjectGFX(0xEA, GFXAsset.sprBipsom1, 0),
	ObjectGFX(0xAA, GFXAsset.sprBipsom2OldLady, 0),
	ObjectGFX(0x6A, GFXAsset.sprLadyButterflyPickaxeworker, 0),
	ObjectGFX(0x6A, GFXAsset.sprFairyToilethand, 0),
	ObjectGFX(0xEA, GFXAsset.sprChickensDogForestfairyOther, 0),
	ObjectGFX(0xEA, GFXAsset.sprSoldier, 0),
	ObjectGFX(0xEA, GFXAsset.sprBearMonkey, 0),
	ObjectGFX(0xEA, GFXAsset.sprSyrupTeenager, 0),
	ObjectGFX(0xEA, GFXAsset.sprBunnyParrot, 0),
	ObjectGFX(0xEA, GFXAsset.sprVasuSnakeDeadbunny, 0),
	ObjectGFX(0x2A, GFXAsset.sprPatch, 0),
	ObjectGFX(0xEA, GFXAsset.sprMamamuDog, 0),
	ObjectGFX(0xEA, GFXAsset.sprGoron, 0),
	ObjectGFX(0xAA, GFXAsset.sprGorondanceTingleWrite, 0),
	ObjectGFX(0xEA, GFXAsset.sprSeasonfairyAmbi, 0),
	ObjectGFX(0x6A, GFXAsset.sprFarore1, 0),
	ObjectGFX(0xEA, GFXAsset.sprLadyGuitarist, 0),
	ObjectGFX(0xEA, GFXAsset.sprOldzoraCheval, 0),
	ObjectGFX(0xEA, GFXAsset.sprGoronelderRaft, 0),
	ObjectGFX(0xEA, GFXAsset.sprConstructionworkerShootinggalleryguy, 0),
	ObjectGFX(0xEA, GFXAsset.sprPastladyGenericguy, 0),
	ObjectGFX(0xEB, GFXAsset.sprFriendlyghost, 0),
	ObjectGFX(0xEB, GFXAsset.sprMasksalesmanRafton, 0),
	ObjectGFX(0xEB, GFXAsset.sprKingzoraTokkey, 0),
	ObjectGFX(0xEB, GFXAsset.sprCarpenters, 0),
	ObjectGFX(0xEB, GFXAsset.sprPirateship, 0),
	ObjectGFX(0xEB, GFXAsset.sprShopkeeperAdlarVeranmask, 0),
	ObjectGFX(0xEB, GFXAsset.sprPiratians, 0),
	ObjectGFX(0x1A, GFXAsset.sprSwords, 0),
	ObjectGFX(0x1A, GFXAsset.sprSubrosian, 0),
	ObjectGFX(0xEB, GFXAsset.sprJabuchild, 0),
	ObjectGFX(0xEB, GFXAsset.sprMakuChild, 0),
	ObjectGFX(0xAA, GFXAsset.sprGorondanceTingleWrite, 0),
	ObjectGFX(0x6B, GFXAsset.sprMoblinflagBombPortal, 0),
	ObjectGFX(0x6B, GFXAsset.sprTimeportal, 0),
	ObjectGFX(0x6B, GFXAsset.sprTriforceSparkleVineseedBookofseals, 0),
	ObjectGFX(0x6B, GFXAsset.sprMakuflowerBookSeedlingWeirdswirlBlock, 0),
	ObjectGFX(0xEB, GFXAsset.sprLinkstatue, 0),
	ObjectGFX(0xAB, GFXAsset.sprLightning, 0),
	ObjectGFX(0xEB, GFXAsset.sprFountain, 0),
	ObjectGFX(0xEA, GFXAsset.sprPresentPastSymbols, 0),
	ObjectGFX(0xAB, GFXAsset.sprWoodentunnelSeasonsymbols, 0),
	ObjectGFX(0x1A, GFXAsset.sprDungeonSprites, 0),
	ObjectGFX(0x6A, GFXAsset.sprSpinnerSeedbouncer, 0),
	ObjectGFX(0x6A, GFXAsset.sprRollerOwlBarrierOrb, 0),
	ObjectGFX(0xEA, GFXAsset.sprRollingplatformD8stuff, 0),
	ObjectGFX(0x6A, GFXAsset.sprPedestalFlameCrystal, 0),
	ObjectGFX(0xEA, GFXAsset.sprColoredCube, 0),
	ObjectGFX(0x69, GFXAsset.sprCommonItems, 0),
	ObjectGFX(0x69, GFXAsset.sprQuestItems5, 0),
	ObjectGFX(0x69, GFXAsset.sprMapCompassKeysBookofseals, 0),
	ObjectGFX(0x69, GFXAsset.gfxBlank, 0),
	ObjectGFX(0x69, GFXAsset.sprItemIcons1Spr, 0),
	ObjectGFX(0x19, GFXAsset.sprItemIcons2, 0),
	ObjectGFX(0x19, GFXAsset.sprItemIcons3, 0),
	ObjectGFX(0xA9, GFXAsset.sprEssences, 0),
	ObjectGFX(0x69, GFXAsset.sprQuestItems1, 0),
	ObjectGFX(0x69, GFXAsset.sprQuestItems2, 0),
	ObjectGFX(0x69, GFXAsset.sprQuestItems3, 0),
	ObjectGFX(0x69, GFXAsset.sprQuestItems4, 0),
	ObjectGFX(0x1A, GFXAsset.sprBoomerang, 0),
	ObjectGFX(0xB1, GFXAsset.sprObjIntroTree, 0),
	ObjectGFX(0x71, GFXAsset.sprObjIntroClouds, 0),
	ObjectGFX(0x6B, GFXAsset.sprCirclebeads, 0),
	ObjectGFX(0xED, GFXAsset.sprTwinrova4, 0),
	ObjectGFX(0x6B, GFXAsset.sprFlame, 0),
	ObjectGFX(0x6B, GFXAsset.sprEvilflame, 0),
	ObjectGFX(0x77, GFXAsset.sprBoatTheend, 0),
	ObjectGFX(0xEB, GFXAsset.sprPolsvoiceHardhatbeetleSpikedbeetleBeamon, 0),
	ObjectGFX(0xEB, GFXAsset.sprHostilescrub, 0),
	ObjectGFX(0x6C, GFXAsset.sprProjectiles1, 0),
	ObjectGFX(0x1A, GFXAsset.sprOctorokLeeverTektiteZora, 0),
	ObjectGFX(0xEB, GFXAsset.sprMoblinGhini, 0),
	ObjectGFX(0x1A, GFXAsset.sprMoblin, 0),
	ObjectGFX(0x6B, GFXAsset.sprPincerPokeyArmos, 0),
	ObjectGFX(0xEB, GFXAsset.sprCrowsBuzzblob, 0),
	ObjectGFX(0x6B, GFXAsset.sprCrabFishGopongaBeetle, 0),
	ObjectGFX(0xEB, GFXAsset.sprLynel, 0),
	ObjectGFX(0xEB, GFXAsset.sprBoulder, 0),
	ObjectGFX(0x6B, GFXAsset.sprZolPeahatWatertektiteMoldormGel, 0),
	ObjectGFX(0xEB, GFXAsset.sprDarknut, 0),
	ObjectGFX(0x1A, GFXAsset.sprBallandchainLikelike, 0),
	ObjectGFX(0xEB, GFXAsset.sprGiantcucco, 0),
	ObjectGFX(0xAB, GFXAsset.sprGibdoStalfosRopeWhispSparkBubbleBeetle, 0),
	ObjectGFX(0xEB, GFXAsset.sprShroudedstalfosTileCandle, 0),
	ObjectGFX(0x6B, GFXAsset.sprKeeseFirekeeseUnknownbeams, 0),
	ObjectGFX(0xAB, GFXAsset.sprBladetraps, 0),
	ObjectGFX(0x6B, GFXAsset.sprWizzrobe, 0),
	ObjectGFX(0xEB, GFXAsset.sprIronmask, 0),
	ObjectGFX(0xEB, GFXAsset.sprArmmimicSpikedrollerBariBiri, 0),
	ObjectGFX(0xEC, GFXAsset.sprFloormaster, 0),
	ObjectGFX(0x6C, GFXAsset.sprThwomps, 0),
	ObjectGFX(0xEC, GFXAsset.sprFireballCheepcheep, 0),
	ObjectGFX(0x6C, GFXAsset.sprWaterbubble, 0),
	ObjectGFX(0xEC, GFXAsset.sprProjectiles2, 0),
	ObjectGFX(0x6C, GFXAsset.sprProjectiles3, 0),
	ObjectGFX(0x6C, GFXAsset.sprFireballs, 0),
	ObjectGFX(0x6D, GFXAsset.sprKingmoblin2, 0),
	ObjectGFX(0x6D, GFXAsset.sprKingmoblin3, 0),
	ObjectGFX(0xAD, GFXAsset.sprKingmoblin4, 0),
	ObjectGFX(0xAD, GFXAsset.sprKingmoblin5, 0),
	ObjectGFX(0xEC, GFXAsset.sprGiantghini1, 0),
	ObjectGFX(0xEC, GFXAsset.sprGiantghini2, 0),
	ObjectGFX(0xAC, GFXAsset.sprSwoop, 0),
	ObjectGFX(0x6C, GFXAsset.sprPound, 0),
	ObjectGFX(0xEC, GFXAsset.sprSubterror1, 0),
	ObjectGFX(0xEC, GFXAsset.sprSubterror2, 0),
	ObjectGFX(0x6C, GFXAsset.sprSubterror3, 0),
	ObjectGFX(0xEC, GFXAsset.sprArmoswarrior, 0),
	ObjectGFX(0xEC, GFXAsset.sprArmoswarriorshield, 0),
	ObjectGFX(0xEC, GFXAsset.sprArmoswarriorsword, 0),
	ObjectGFX(0xAC, GFXAsset.sprSmasher, 0),
	ObjectGFX(0xAC, GFXAsset.sprAnglerfish, 0),
	ObjectGFX(0x6C, GFXAsset.sprBluestalfos1, 0),
	ObjectGFX(0xAC, GFXAsset.sprBluestalfos2, 0),
	ObjectGFX(0xAC, GFXAsset.sprBluestalfos3, 0),
	ObjectGFX(0x6C, GFXAsset.sprPumpkinhead1, 0),
	ObjectGFX(0x6C, GFXAsset.sprPumpkinhead2, 0),
	ObjectGFX(0xEC, GFXAsset.sprPumpkinhead3, 0),
	ObjectGFX(0xAC, GFXAsset.sprHeadthwomp1, 0),
	ObjectGFX(0xEC, GFXAsset.sprHeadthwomp2, 0),
	ObjectGFX(0x6C, GFXAsset.sprHeadthwomp3, 0),
	ObjectGFX(0xEC, GFXAsset.sprShadowhag1, 0),
	ObjectGFX(0xAC, GFXAsset.sprShadowhag2, 0),
	ObjectGFX(0xEC, GFXAsset.sprSmog1, 0),
	ObjectGFX(0xEC, GFXAsset.sprSmog2, 0),
	ObjectGFX(0xAC, GFXAsset.sprSmog3, 0),
	ObjectGFX(0x6C, GFXAsset.sprSmogProjectiles, 0),
	ObjectGFX(0xEC, GFXAsset.sprOctogon1, 0),
	ObjectGFX(0xAC, GFXAsset.sprOctogon2, 0),
	ObjectGFX(0x6C, GFXAsset.sprOctogon3, 0),
	ObjectGFX(0xEC, GFXAsset.sprPlasmarine1, 0),
	ObjectGFX(0xEC, GFXAsset.sprPlasmarine2, 0),
	ObjectGFX(0x6C, GFXAsset.sprPlasmarine3, 0),
	ObjectGFX(0xEC, GFXAsset.sprRamrock1, 0),
	ObjectGFX(0xEC, GFXAsset.sprRamrock2, 0),
	ObjectGFX(0xEC, GFXAsset.sprNayruAmbiPossessed, 0),
	ObjectGFX(0xEC, GFXAsset.sprVeranHuman, 0),
	ObjectGFX(0xEC, GFXAsset.sprDarklink, 0),
	ObjectGFX(0x6C, GFXAsset.sprVeranbeetleWing, 0),
	ObjectGFX(0xEC, GFXAsset.sprVeranHuman, 0),
	ObjectGFX(0xEC, GFXAsset.sprDarklink, 0),
	ObjectGFX(0xEC, GFXAsset.sprFairyveran1, 0),
	ObjectGFX(0xEC, GFXAsset.sprBeetleveran, 0),
	ObjectGFX(0x6C, GFXAsset.sprSpiderveran, 0),
	ObjectGFX(0xED, GFXAsset.sprSpiderbeeveran1, 0),
	ObjectGFX(0x6D, GFXAsset.sprSpiderbeeveran2, 0),
	ObjectGFX(0x2D, GFXAsset.sprTwinrova6, 0),
	ObjectGFX(0xAD, GFXAsset.sprTwinrova7, 0),
	ObjectGFX(0xAD, GFXAsset.sprTwinrova8, 0),
	ObjectGFX(0x6D, GFXAsset.sprTwinrova9, 0),
	ObjectGFX(0xAD, GFXAsset.sprTwinrovamerged2, 0),
];
