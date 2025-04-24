module oracles.data.gfx;

import oracles.external;
import replatform64.gameboy;

import std.traits;

static if (gameVersion == GameVersion.ages) {
	enum GFXAsset {
		none,
		flgAncientTombWallRetraction,
		flgAppraisedRingList,
		flgBlackTowerBase,
		flgBlackTowerMiddle,
		flgBlackTowerStage1,
		flgBlackTowerStage2,
		flgBlackTowerStage3Middle,
		flgBlackTowerStage3Top,
		flgCapcomNintendo,
		flgCreditsBg,
		flgCreditsGametitle,
		flgCreditsImage1,
		flgCreditsImage2,
		flgCreditsImage3,
		flgCreditsImage4,
		flgCreditsLinkedImage1,
		flgCreditsLinkedImage2,
		flgCreditsLinkedImage3,
		flgCreditsLinkedImage4,
		flgCreditsLinkedScene1,
		flgCreditsLinkedScene2,
		flgCreditsLinkedScene3,
		flgCreditsLinkedScene4,
		flgCreditsLinkedTheend,
		flgCreditsLinkedWavingGoodbye1,
		flgCreditsLinkedWavingGoodbye2,
		flgCreditsMakuPastTopRows,
		flgCreditsMakutree,
		flgCreditsScene1TopRows,
		flgCreditsScene2,
		flgCreditsScene3TopRows,
		flgCreditsScene4TopRows,
		flgCreditsTheend,
		flgDungeonMinimap,
		flgFileMenuBottom,
		flgFileMenuCopy,
		flgFileMenuMessageSpeed,
		flgFileMenuMiddle,
		flgFileMenuTop,
		flgHudBiggoronSword,
		flgHudExtraHearts,
		flgHudNormal,
		flgIntroBar,
		flgIntroLinkFaceShot,
		flgIntroLinkOnHorseFar,
		flgIntroLinkOnHorseFrontBg,
		flgIntroLinkOnHorseFrontGround,
		flgIntroOutsideCastle,
		flgIntroTriforceRoom,
		flgInventoryScreen1,
		flgInventoryScreen2,
		flgInventoryScreen3,
		flgInventoryTextbar,
		flgJabuOpening1,
		flgJabuOpening2,
		flgLinkOnHorseCloseup,
		flgLinkWithOracle,
		flgLinkWithOracleAndTwinrova1,
		flgLinkWithOracleAndTwinrova2,
		flgMermaidsCaveWallRetraction,
		flgNameEntryBottom,
		flgNameEntryMiddle,
		flgNameEntryTop,
		flgNayruSingingCutscene,
		flgPastMinimap,
		flgPresentMinimap,
		flgSaveMenuBottom,
		flgSaveMenuMiddle,
		flgSecretEntryBottom,
		flgSecretEntryError,
		flgSecretEntryMiddle,
		flgSecretEntryTop,
		flgSecretForLinkedGame,
		flgSecretListMenu,
		flgTitlescreen,
		flgTitlescreenScroll1,
		flgTitlescreenScroll2,
		flgTobecontinued,
		flgTwinrovaCloseup,
		flgUnappraisedRingList,
		gfxAnimations1,
		gfxAnimations2,
		gfxAnimations3,
		gfxBlackTowerScene1,
		gfxBlackTowerScene2,
		gfxBlackTowerScene3,
		gfxBlackTowerScene4,
		gfxBlank,
		gfxBlank2,
		gfxBlank3,
		gfxBlank4,
		gfxBlurbBlacktowerturret,
		gfxBlurbD1,
		gfxBlurbD2,
		gfxBlurbD3,
		gfxBlurbD4,
		gfxBlurbD5,
		gfxBlurbD6,
		gfxBlurbD7,
		gfxBlurbD8,
		gfxBlurbHeroscave,
		gfxBlurbMakupath,
		gfxBlurbRoomofrites,
		gfxCapcomNintendo,
		gfxCopy,
		gfxCopywhatwhere,
		gfxCreditsBg1,
		gfxCreditsBg2,
		gfxCreditsBg3,
		gfxCreditsGametitle,
		gfxCreditsImage11,
		gfxCreditsImage12,
		gfxCreditsImage21,
		gfxCreditsImage22,
		gfxCreditsImage31,
		gfxCreditsImage32,
		gfxCreditsImage41,
		gfxCreditsImage42,
		gfxCreditsLinkedImage11,
		gfxCreditsLinkedImage12,
		gfxCreditsLinkedImage21,
		gfxCreditsLinkedImage22,
		gfxCreditsLinkedImage31,
		gfxCreditsLinkedImage32,
		gfxCreditsLinkedImage41,
		gfxCreditsLinkedImage42,
		gfxCreditsLinkedTheend1,
		gfxCreditsLinkedTheend2,
		gfxCreditsLinkedWavingGoodbye1,
		gfxCreditsLinkedWavingGoodbye2,
		gfxCreditsLinkedWavingGoodbye3,
		gfxCreditsLinkedWavingGoodbye4,
		gfxCreditsMakutree1,
		gfxCreditsMakutree2,
		gfxCreditsTheend1,
		gfxCreditsTheend2,
		gfxDirt,
		gfxDMGGametitle,
		gfxDMGText,
		gfxDone,
		gfxErase,
		gfxError,
		gfxFileselect,
		gfxGameover,
		gfxGashaTree,
		gfxHerossecret,
		gfxHud,
		gfxIntroLinkFaceShot,
		gfxIntroLinkOnHorseFarBg1,
		gfxIntroLinkOnHorseFarBg2,
		gfxIntroLinkOnHorseFrontBg,
		gfxIntroOutsideCastle1,
		gfxIntroOutsideCastle2,
		gfxIntroOutsideCastle3,
		gfxInventoryHud1,
		gfxInventoryHud2,
		gfxLinking,
		gfxLinkOnHorseCloseup1,
		gfxLinkOnHorseCloseup2,
		gfxLinkOnHorseCloseup3,
		gfxLinkOnHorseCloseup4,
		gfxLinkWithOracle1,
		gfxLinkWithOracle2,
		gfxLinkWithOracle3,
		gfxLinkWithOracleAndTwinrova1,
		gfxLinkWithOracleAndTwinrova2,
		gfxLinkWithOracleAndTwinrova3,
		gfxMessagespeed,
		gfxMinimapTilesCommon,
		gfxMinimapTilesDungeon,
		gfxMinimapTilesPast1,
		gfxMinimapTilesPast2,
		gfxMinimapTilesPresent1,
		gfxMinimapTilesPresent2,
		gfxName,
		gfxNayruSingingCutscene1,
		gfxNayruSingingCutscene2,
		gfxNayruSingingCutscene3,
		gfxNewfilescreen,
		gfxPickafile,
		gfxPickafile2,
		gfxQuit,
		gfxQuit2,
		gfxRings,
		gfxSand,
		gfxSave,
		gfxSavescreen,
		gfxSecretListMenu,
		gfxSecretThatswrong,
		gfxSecrettoholodrum,
		gfxTilesetAmbisPalace1,
		gfxTilesetAmbisPalace2,
		gfxTilesetAmbisPalace3,
		gfxTilesetAncientTomb,
		gfxTilesetBlackTower,
		gfxTilesetBlackTowerOutside1,
		gfxTilesetBlackTowerOutside2,
		gfxTilesetBlackTowerOutside3,
		gfxTilesetBlackTowerTop,
		gfxTilesetCave1,
		gfxTilesetCave2,
		gfxTilesetCaveReplacement1,
		gfxTilesetCaveReplacement2,
		gfxTilesetCredits,
		gfxTilesetCrownDungeon,
		gfxTilesetDungeonStandard1,
		gfxTilesetDungeonStandard2,
		gfxTilesetEyeglassLibrary1,
		gfxTilesetEyeglassLibrary2,
		gfxTilesetEyeglassLibrary3,
		gfxTilesetFairyForest1,
		gfxTilesetFairyForest2,
		gfxTilesetFairyForest3,
		gfxTilesetForestOfTime1,
		gfxTilesetForestOfTime2,
		gfxTilesetForestOfTime3,
		gfxTilesetGoronCave,
		gfxTilesetIndoors1,
		gfxTilesetIndoorsRafton,
		gfxTilesetJabuJabuOutside1,
		gfxTilesetJabuJabuOutside2,
		gfxTilesetJabuJabuOutside3,
		gfxTilesetJabuJabusBelly,
		gfxTilesetLynnaCity1,
		gfxTilesetLynnaCity2,
		gfxTilesetLynnaCity3,
		gfxTilesetMakuPath,
		gfxTilesetMakuTreeBottom,
		gfxTilesetMakuTreeCommon,
		gfxTilesetMakuTreeTop,
		gfxTilesetMermaidsCave,
		gfxTilesetMinecartTrack,
		gfxTilesetMoblinFortress,
		gfxTilesetMoonlitGrotto,
		gfxTilesetNuunHighlands1,
		gfxTilesetNuunHighlands2,
		gfxTilesetNuunHighlands3,
		gfxTilesetOverworldPast,
		gfxTilesetOverworldPresent,
		gfxTilesetOverworldStandard,
		gfxTilesetRollingRidgePast1,
		gfxTilesetRollingRidgePast2,
		gfxTilesetRollingRidgePast3,
		gfxTilesetRollingRidgePresent1,
		gfxTilesetRollingRidgePresent2,
		gfxTilesetRollingRidgePresent3,
		gfxTilesetRoomOfRites,
		gfxTilesetSeaOfNoReturn1,
		gfxTilesetSeaOfNoReturn2,
		gfxTilesetSeaOfNoReturn3,
		gfxTilesetSidescroll1,
		gfxTilesetSidescroll2,
		gfxTilesetSkullDungeon,
		gfxTilesetSpiritsGrave,
		gfxTilesetSymmetryCityRestored1,
		gfxTilesetSymmetryCityRestored2,
		gfxTilesetSymmetryCityRestored3,
		gfxTilesetSymmetryCityRuined1,
		gfxTilesetSymmetryCityRuined2,
		gfxTilesetSymmetryCityRuined3,
		gfxTilesetTalusPeaks1,
		gfxTilesetTalusPeaks2,
		gfxTilesetTalusPeaks3,
		gfxTilesetTalusPeaksPast1,
		gfxTilesetTalusPeaksPast2,
		gfxTilesetTalusPeaksPast3,
		gfxTilesetTokayIsland1,
		gfxTilesetTokayIsland2,
		gfxTilesetTokayIsland3,
		gfxTilesetUnderwaterCommon1,
		gfxTilesetUnderwaterCommon2,
		gfxTilesetUnderwaterCommon3,
		gfxTilesetUnderwaterPast,
		gfxTilesetUnderwaterPresent,
		gfxTilesetWingDungeon,
		gfxTilesetYollGraveyard1,
		gfxTilesetYollGraveyard2,
		gfxTilesetYollGraveyard3,
		gfxTilesetZoraPalace,
		gfxTilesetZoraPalaceReplacement1,
		gfxTilesetZoraPalaceReplacement2,
		gfxTitlescreen1,
		gfxTitlescreen2,
		gfxTitlescreen3,
		gfxTitlescreen4,
		gfxTitlescreen5,
		gfxTitlescreen6,
		gfxTitlescreen7,
		gfxTitlescreenTree1,
		gfxTitlescreenTree2,
		gfxTobecontinued,
		gfxTwinrovaCloseup1,
		gfxTwinrovaCloseup2,
		mapAncientTombWallRetraction,
		mapAppraisedRingList,
		mapBlackTowerBase,
		mapBlackTowerMiddle,
		mapBlackTowerStage1,
		mapBlackTowerStage2,
		mapBlackTowerStage3Middle,
		mapBlackTowerStage3Top,
		mapCapcomNintendo,
		mapCreditsBg,
		mapCreditsGametitle,
		mapCreditsImage1,
		mapCreditsImage2,
		mapCreditsImage3,
		mapCreditsImage4,
		mapCreditsLinkedImage1,
		mapCreditsLinkedImage2,
		mapCreditsLinkedImage3,
		mapCreditsLinkedImage4,
		mapCreditsLinkedScene1,
		mapCreditsLinkedScene2,
		mapCreditsLinkedScene3,
		mapCreditsLinkedScene4,
		mapCreditsLinkedTheend,
		mapCreditsLinkedWavingGoodbye1,
		mapCreditsLinkedWavingGoodbye2,
		mapCreditsMakuPastTopRows,
		mapCreditsMakutree,
		mapCreditsScene1TopRows,
		mapCreditsScene2,
		mapCreditsScene3TopRows,
		mapCreditsScene4TopRows,
		mapCreditsTheend,
		mapDMGMessage,
		mapDungeonMinimap,
		mapFileMenuBottom,
		mapFileMenuCopy,
		mapFileMenuMessageSpeed,
		mapFileMenuMiddle,
		mapFileMenuTop,
		mapHudBiggoronSword,
		mapHudExtraHearts,
		mapHudNormal,
		mapIntroBar,
		mapIntroLinkFaceShot,
		mapIntroLinkOnHorseFar,
		mapIntroLinkOnHorseFrontBg,
		mapIntroLinkOnHorseFrontGround,
		mapIntroOutsideCastle,
		mapIntroTriforceRoom,
		mapInventoryScreen1,
		mapInventoryScreen2,
		mapInventoryScreen3,
		mapInventoryTextbar,
		mapJabuOpening1,
		mapJabuOpening2,
		mapLinkOnHorseCloseup,
		mapLinkWithOracle,
		mapLinkWithOracleAndTwinrova1,
		mapLinkWithOracleAndTwinrova2,
		mapMermaidsCaveWallRetraction,
		mapNameEntryBottom,
		mapNameEntryMiddle,
		mapNameEntryTop,
		mapNayruSingingCutscene,
		mapPastMinimap,
		mapPresentMinimap,
		mapSaveMenuBottom,
		mapSaveMenuMiddle,
		mapSecretEntryBottom,
		mapSecretEntryError,
		mapSecretEntryMiddle,
		mapSecretEntryTop,
		mapSecretForLinkedGame,
		mapSecretListMenu,
		mapTitlescreen,
		mapTitlescreenScroll1,
		mapTitlescreenScroll2,
		mapTobecontinued,
		mapTwinrovaCloseup,
		mapUnappraisedRingList,
		mapWingDungeonCollapsed,
		mapWingDungeonCollapsing1,
		mapWingDungeonCollapsing2,
		mapWingDungeonCollapsing3,
		othTwinrovaLavaLayout,
		othTwinrovaNormalLayout,
		paletteData4000,
		paletteData4008,
		paletteData4018,
		paletteData4058,
		paletteData4098,
		paletteData40D8,
		paletteData4118,
		paletteData4138,
		paletteData4178,
		paletteData4180,
		paletteData41B0,
		paletteData41C0,
		paletteData41D0,
		paletteData41E0,
		paletteData4218,
		paletteData4250,
		paletteData4288,
		paletteData4298,
		paletteData42D8,
		paletteData4318,
		paletteData4358,
		paletteData4398,
		paletteData43D8,
		paletteData43F0,
		paletteData43F8,
		paletteData4428,
		paletteData4430,
		paletteData4470,
		paletteData44A8,
		paletteData44D8,
		paletteData44E8,
		paletteData44F0,
		paletteData44F8,
		paletteData4500,
		paletteData4530,
		paletteData4550,
		paletteData4570,
		paletteData4590,
		paletteData45C8,
		paletteData4600,
		paletteData4640,
		paletteData4648,
		paletteData4668,
		paletteData46A8,
		paletteData46C0,
		paletteData46E0,
		paletteData46F0,
		paletteData4730,
		paletteData4770,
		paletteData4798,
		paletteData47A8,
		paletteData47C0,
		paletteData47F0,
		paletteData4830,
		paletteData4870,
		paletteData4890,
		paletteData48B0,
		paletteData48E0,
		paletteData4920,
		paletteData4928,
		paletteData4930,
		paletteData4938,
		paletteData4940,
		paletteData4948,
		paletteData4950,
		paletteData4958,
		paletteData4960,
		paletteData4968,
		paletteData4970,
		paletteData4978,
		paletteData4988,
		paletteData4990,
		paletteData4998,
		paletteData49A0,
		paletteData49A8,
		paletteData49B0,
		paletteData49F0,
		paletteData4A30,
		paletteData4A60,
		paletteData4A90,
		paletteData4AC0,
		paletteData4AF0,
		paletteData4B20,
		paletteData4B50,
		paletteData4B80,
		paletteData4BB0,
		paletteData4BE0,
		paletteData4C10,
		paletteData4C40,
		paletteData4C70,
		paletteData4CA0,
		paletteData4CD0,
		paletteData4D00,
		paletteData4D30,
		paletteData4D60,
		paletteData4D90,
		paletteData4DC0,
		paletteData4DF0,
		paletteData4E20,
		paletteData4E50,
		paletteData4E80,
		paletteData4EB0,
		paletteData4EE0,
		paletteData4F10,
		paletteData4F40,
		paletteData4F70,
		paletteData4FA0,
		paletteData4FD0,
		paletteData5000,
		paletteData5030,
		paletteData5060,
		paletteData5090,
		paletteData50C0,
		paletteData50F0,
		paletteData5120,
		paletteData5150,
		paletteData5180,
		paletteData51B0,
		paletteData51E0,
		paletteData5210,
		paletteData5240,
		paletteData52A0,
		paletteData52D0,
		paletteData5300,
		paletteData5330,
		paletteData5360,
		paletteData5390,
		paletteData5398,
		paletteData53A0,
		paletteData53A8,
		paletteData53B0,
		paletteData53B8,
		paletteData53C0,
		paletteData53C8,
		paletteData53D0,
		paletteData53D8,
		paletteData53E0,
		paletteData53E8,
		paletteData53F0,
		paletteData5420,
		paletteData5450,
		paletteData5480,
		paletteData54B0,
		paletteData54E0,
		paletteData5510,
		paletteData5540,
		paletteData5570,
		paletteData55A0,
		paletteData55D0,
		paletteData5600,
		paletteData5630,
		paletteData5660,
		paletteData5690,
		paletteData56C0,
		paletteData56F0,
		paletteData5720,
		paletteData5750,
		paletteData5780,
		paletteData57B0,
		paletteData57E0,
		paletteData5818,
		paletteData5858,
		paletteData5878,
		paletteData58A0,
		paletteData58C8,
		paletteData58F0,
		paletteData5900,
		paletteData5908,
		paletteData5910,
		paletteData5918,
		paletteData5920,
		paletteData5928,
		paletteData5930,
		paletteData5940,
		paletteData5948,
		paletteData5950,
		paletteData5958,
		paletteData5960,
		paletteDataDEB0,
		sprAnglerfish,
		sprArmmimicSpikedrollerBariBiri,
		sprArmoswarrior,
		sprArmoswarriorshield,
		sprArmoswarriorsword,
		sprBallandchainLikelike,
		sprBearMonkey,
		sprBeetleveran,
		sprBiggoronSwordIcon,
		sprBipinGlassesguy,
		sprBipsom1,
		sprBipsom2OldLady,
		sprBlackTowerScene,
		sprBladetraps,
		sprBlossomOtherlady,
		sprBluestalfos1,
		sprBluestalfos2,
		sprBluestalfos3,
		sprBoatTheend,
		sprBoulder,
		sprBoomerang,
		sprBunnyParrot,
		sprCarpenters,
		sprChickensDogForestfairyOther,
		sprCirclebeads,
		sprColoredCube,
		sprCommonItems,
		sprCommonSprites,
		sprConstructionworkerShootinggalleryguy,
		sprCrabFishGopongaBeetle,
		sprCreditsFont,
		sprCreditsFontMusic,
		sprCreditsFontNakanowatari,
		sprCreditsFontObjectDesigners,
		sprCreditsFontPlanners,
		sprCreditsFontProgrammers,
		sprCreditsLinkedWavingGoodbye,
		sprCreditsMakutree,
		sprCreditsSprites1,
		sprCreditsSprites2,
		sprCrowsBuzzblob,
		sprDarklink,
		sprDarknut,
		sprDimitri,
		sprDin1,
		sprDin2,
		sprDungeonSprites,
		sprEssences,
		sprEvilflame,
		sprFairyToilethand,
		sprFairyveran1,
		sprFarore1,
		sprFileselectDecorations,
		sprFireballCheepcheep,
		sprFireballs,
		sprFlame,
		sprFloormaster,
		sprFountain,
		sprFriendlyghost,
		sprGanon1,
		sprGanon10,
		sprGanon2,
		sprGanon3,
		sprGanon4,
		sprGanon5,
		sprGanon6,
		sprGanon7,
		sprGanon8,
		sprGanon9,
		sprGiantcucco,
		sprGiantghini1,
		sprGiantghini2,
		sprGibdoStalfosRopeWhispSparkBubbleBeetle,
		sprGoron,
		sprGorondanceTingleWrite,
		sprGoronelderRaft,
		sprGrassTuft,
		sprGymnastTroyScrub,
		sprHeadthwomp1,
		sprHeadthwomp2,
		sprHeadthwomp3,
		sprHobos,
		sprHostilescrub,
		sprImpa,
		sprImpafainted,
		sprIntroLinkCloseFrame1,
		sprIntroLinkCloseFrame2,
		sprIntroLinkCloseFrame3,
		sprIntroLinkCloseFrame4,
		sprIntroLinkCloseFrame5,
		sprIntroLinkFaceShotSparkle,
		sprIntroLinkMidFrame1,
		sprIntroLinkMidFrame2,
		sprIntroLinkMidFrame3,
		sprIntroLinkMidFrame4,
		sprIntroLinkMidFrame5,
		sprIntroLinkOnHorseFar,
		sprIntroLinkOnHorseFront,
		sprIntroOutsideCastleSprites,
		sprIronmask,
		sprItemIcons1Spr,
		sprItemIcons2,
		sprItemIcons3,
		sprJabuchild,
		sprKeeseFirekeeseUnknownbeams,
		sprKids,
		sprKingmoblin1,
		sprKingmoblin2,
		sprKingmoblin3,
		sprKingmoblin4,
		sprKingmoblin5,
		sprKingzoraTokkey,
		sprLadiesAndDiver,
		sprLadyButterflyPickaxeworker,
		sprLadyGuitarist,
		sprLightning,
		sprLink,
		sprLinkBaby,
		sprLinkOnHorseCloseup,
		sprLinkRetro,
		sprLinkstatue,
		sprLinkWithOracle,
		sprLinkWithOracleAndTwinrova,
		sprLynel,
		sprMailmanWiseman,
		sprMakuadultsprites1,
		sprMakuadultsprites2,
		sprMakuChild,
		sprMakuflowerBookSeedlingWeirdswirlBlock,
		sprMamamuDog,
		sprMapCompassKeysBookofseals,
		sprMaple,
		sprMasksalesmanRafton,
		sprMinimapIcons,
		sprMoblin,
		sprMoblinflagBombPortal,
		sprMoblinGhini,
		sprMoosh,
		sprMustachemenCat,
		sprNayru1,
		sprNayru2,
		sprNayruAmbiPossessed,
		sprNayruSingingCutscene,
		sprObjIntroClouds,
		sprObjIntroTree,
		sprOctogon1,
		sprOctogon2,
		sprOctogon3,
		sprOctorokLeeverTektiteZora,
		sprOldzoraCheval,
		sprPastladyGenericguy,
		sprPatch,
		sprPedestalFlameCrystal,
		sprPincerPokeyArmos,
		sprPirateship,
		sprPiratians,
		sprPlasmarine1,
		sprPlasmarine2,
		sprPlasmarine3,
		sprPolsvoiceHardhatbeetleSpikedbeetleBeamon,
		sprPound,
		sprPresentPastSymbols,
		sprProjectiles1,
		sprProjectiles2,
		sprProjectiles3,
		sprPumpkinhead1,
		sprPumpkinhead2,
		sprPumpkinhead3,
		sprQuestItems1,
		sprQuestItems2,
		sprQuestItems3,
		sprQuestItems4,
		sprQuestItems5,
		sprRaft,
		sprRalph1,
		sprRalph2,
		sprRamrock1,
		sprRamrock2,
		sprRicky,
		sprRodOfSeasons,
		sprRollerOwlBarrierOrb,
		sprRollingplatformD8stuff,
		sprSeasonfairyAmbi,
		sprSeaweedCut,
		sprShadowhag1,
		sprShadowhag2,
		sprShopkeeperAdlarVeranmask,
		sprShroudedstalfosTileCandle,
		sprSmasher,
		sprSmog1,
		sprSmog2,
		sprSmog3,
		sprSmogProjectiles,
		sprSoldier,
		sprSpiderbeeveran1,
		sprSpiderbeeveran2,
		sprSpiderveran,
		sprSpinnerSeedbouncer,
		sprSubrosian,
		sprSubterror1,
		sprSubterror2,
		sprSubterror3,
		sprSwoop,
		sprSwords,
		sprSyrupTeenager,
		sprThwomps,
		sprTimeportal,
		sprTitlescreenSprites,
		sprTokay,
		sprTriforceSparkleVineseedBookofseals,
		sprTriforcestone,
		sprTwinrova1,
		sprTwinrova2,
		sprTwinrova3,
		sprTwinrova4,
		sprTwinrova5,
		sprTwinrova6,
		sprTwinrova7,
		sprTwinrova8,
		sprTwinrova9,
		sprTwinrovamerged1,
		sprTwinrovamerged2,
		sprTwinrovaSacrifice1,
		sprTwinrovaSacrifice2,
		sprTwinrovaSacrifice3,
		sprTwinrovaSacrifice4,
		sprVasuSnakeDeadbunny,
		sprVeranbeetleWing,
		sprVeranHuman,
		sprVillagezoraPlenWhitemustache,
		sprVire,
		sprWaterbubble,
		sprWizzrobe,
		sprWoodentunnelSeasonsymbols,
		sprZelda1,
		sprZelda2,
		sprZolPeahatWatertektiteMoldormGel,
		sprZzBubbleExclamationHeartKid,
		standardSpritePaletteData,
		tileMap, // WRAM
		statusBarAttributeMap, // WRAM
		statusBarTileMap, // WRAM
		attributeMap, // WRAM
		vramTiles, // WRAM
		tileMappingIndices, // WRAM
		nameEntryCharacterGFX, // WRAM
		gfxBuf, // WRAM
	}
} else {
	enum GFXAsset {
		gfxDMGText,
		gfxDMGGametitle,
		mapDMGMessage,
		flgCapcomNintendo,
		mapCapcomNintendo,
		gfxCapcomNintendo,
		sprTitlescreenSprites,
		gfxTitlescreen1,
		gfxTitlescreen2,
		gfxTitlescreen3,
		gfxTitlescreen4,
		gfxTitlescreen5,
		gfxTitlescreen6,
		mapTitlescreen,
		flgTitlescreen,
		gfxDone,
		flgJpIntroScreen1,
		mapJpIntroScreen1,
		gfxJpIntroScreen1,
		gfxJpIntroScreen2,
		sprMinimapIcons,
		gfxSecretListMenu,
		mapSecretListMenu,
		flgSecretListMenu,
		gfxError,
		gfxInventoryHud1,
		sprSeasonSymbols,
		sprQuestItems5,
		sprMapCompassKeys,
		gfxSave,
		gfxBlank,
		gfxRings,
		gfxInventoryHud2,
		sprItemIcons1Spr,
		sprItemIcons2,
		sprItemIcons3,
		sprEssences,
		sprQuestItems1,
		sprQuestItems2,
		sprQuestItems3,
		sprQuestItems4,
		mapInventoryTextbar,
		flgInventoryTextbar,
		mapInventoryScreen1,
		flgInventoryScreen1,
		mapInventoryScreen2,
		flgInventoryScreen2,
		mapInventoryScreen3,
		flgInventoryScreen3,
		sprDinDanceCutscene,
		gfxDinDanceCutscene1,
		gfxDinDanceCutscene2,
		gfxDinDanceCutscene3,
		mapDinDanceCutscene,
		flgDinDanceCutscene,
		gfxMinimapTilesHolodrum1,
		gfxMinimapTilesHolodrum2,
		gfxMinimapTilesDungeon,
		mapHolodrumMinimap,
		flgHolodrumMinimap,
		gfxMinimapTilesSubrosia,
		mapSubrosiaMinimap,
		flgSubrosiaMinimap,
		mapDungeonMinimap,
		flgDungeonMinimap,
		gfxBlurbHeroscave,
		gfxBlurbD1,
		gfxBlurbD2,
		gfxBlurbD3,
		gfxBlurbD4,
		gfxBlurbD5,
		gfxBlurbD6,
		gfxBlurbD7,
		gfxBlurbD8,
		gfxBlurbOnoxcastle,
		gfxBlurbRoomofrites,
		gfxHud,
		mapHudNormal,
		flgHudNormal,
		mapHudExtraHearts,
		flgHudExtraHearts,
		mapHudBiggoronSword,
		flgHudBiggoronSword,
		sprBiggoronSwordIcon,
		sprTemplefall,
		gfxTemplefallBackground1,
		gfxTemplefallBackground2,
		mapTemplefallMainScene1,
		flgTemplefallMainScene1,
		gfxTempleOfSeasons,
		mapTemplefallMainScene2,
		flgTemplefallMainScene2,
		gfxTilesetSubrosia1,
		gfxTilesetTempleOfSeasonsOutside1,
		gfxTilesetTempleOfSeasonsOutside2,
		gfxTilesetTempleOfSeasonsOutside3,
		gfxTilesetTempleOfSeasonsOutside4,
		mapTemplefallScene2,
		flgTemplefallScene2,
		mapTemplefallScene3,
		flgTemplefallScene3,
		mapTemplefallScene4,
		flgTemplefallScene4,
		gfxTilesetOverworldStandard1,
		gfxTilesetOverworldStandard2,
		gfxTilesetSummerStandard,
		gfxTilesetHoronVillage,
		mapTemplefallScene5,
		flgTemplefallScene5,
		gfxTilesetWinterStandard,
		gfxTilesetWinterTreeReplacement,
		mapTemplefallScene6,
		flgTemplefallScene6,
		gfxTilesetAutumnStandard,
		gfxTilesetClockHouse,
		mapTemplefallScene7,
		flgTemplefallScene7,
		sprLinkWithOracle,
		gfxLinkWithOracle1,
		gfxLinkWithOracle2,
		gfxLinkWithOracle3,
		mapLinkWithOracle,
		flgLinkWithOracle,
		sprLinkWithOracleAndTwinrova,
		gfxLinkWithOracleAndTwinrova1,
		gfxLinkWithOracleAndTwinrova2,
		gfxLinkWithOracleAndTwinrova3,
		mapLinkWithOracleAndTwinrova1,
		flgLinkWithOracleAndTwinrova1,
		mapLinkWithOracleAndTwinrova2,
		flgLinkWithOracleAndTwinrova2,
		gfxTwinrovaCloseup1,
		gfxTwinrovaCloseup2,
		gfxCreditsGametitle,
		mapTwinrovaCloseup,
		flgTwinrovaCloseup,
		mapCreditsGametitle,
		flgCreditsGametitle,
		gfxTilesetDungeonStandard2,
		gfxTilesetDungeonStandard1,
		gfxTilesetSnakesRemains,
		mapInsideOnoxCastle,
		flgInsideOnoxCastle,
		gfxTilesetOnoxCastleOutside2,
		gfxTilesetOnoxCastleOutside1,
		mapOutsideOnoxCastle,
		flgOutsideOnoxCastle,
		sprIntroLinkMidFrame1,
		sprIntroLinkMidFrame2,
		sprIntroLinkMidFrame3,
		sprIntroLinkMidFrame4,
		sprIntroLinkMidFrame5,
		sprIntroLinkCloseFrame1,
		sprIntroLinkCloseFrame2,
		sprIntroLinkCloseFrame3,
		sprIntroLinkCloseFrame4,
		sprIntroLinkCloseFrame5,
		mapUnappraisedRingList,
		flgUnappraisedRingList,
		mapAppraisedRingList,
		flgAppraisedRingList,
		sprCreditsMakutree,
		gfxCreditsMakutree1,
		gfxCreditsMakutree2,
		mapCreditsMakutree,
		flgCreditsMakutree,
		gfxGashaTree,
		sprGrassTuft,
		gfxSand,
		gfxDirt,
		gfxTilesetSpringStandard,
		gfxTilesetBiggoron,
		gfxTilesetCastle1,
		gfxTilesetCastle2,
		gfxTilesetCastleSpring,
		gfxTilesetTempleRemains,
		gfxTilesetCastleSummer,
		gfxTilesetCastleAutumn,
		gfxTilesetCastleWinter,
		gfxTilesetCastleWinterTreeReplacement,
		gfxTilesetNatzuPrairie,
		gfxTilesetNatzu,
		gfxTilesetNatzuRiver,
		gfxTilesetNatzuWasteland,
		gfxTilesetTarmRuinsPedestal,
		gfxTilesetSubrosia2,
		gfxTilesetSubrosia3,
		gfxTilesetSubrosia4,
		gfxTilesetSubrosia5,
		mapPirateShipLeavingSubrosia,
		flgPirateShipLeavingSubrosia,
		mapPirateShipLeavingDesert,
		flgPirateShipLeavingDesert,
		mapPirateShipBody,
		flgPirateShipBody,
		gfxTilesetPirateShipMovingExtraTiles,
		mapPirateShipBow,
		flgPirateShipBow,
		gfxTilesetHerosCave,
		gfxTilesetGnarledRootDungeon,
		gfxTilesetPoisonMothsLair,
		gfxTilesetDancingDragonDungeon,
		gfxTilesetUnicornsCave,
		gfxTilesetTarmRuins,
		gfxTilesetExplorersCrypt,
		gfxTilesetSwordAndShieldMazeIce,
		gfxTilesetOnoxCastle,
		gfxTilesetRoomOfRites,
		gfxTilesetSwordAndShieldMazeFire,
		gfxTilesetSidescroll1,
		gfxTilesetSidescroll2,
		gfxTilesetMakuTreeBackground,
		gfxTilesetMakuTree1,
		gfxTilesetMakuTreeSmall1,
		gfxTilesetMakuTreeSmall2,
		gfxTilesetIndoors1,
		gfxTilesetIndoors2,
		gfxTilesetVases,
		gfxTilesetCave1,
		gfxTilesetCave2,
		gfxTilesetCaveReplacement,
		gfxTilesetSubrosiaIndoors1,
		gfxTilesetSubrosiaIndoors2,
		gfxTilesetSubrosiaIndoorsReplacement,
		gfxTobecontinued,
		mapTobecontinued,
		flgTobecontinued,
		sprCommonSprites,
		gfxHerossecret,
		mapCreditsScene1TopRows,
		flgCreditsScene1TopRows,
		sprCreditsFont,
		sprCreditsFontPlanners,
		gfxCreditsImage11,
		gfxCreditsImage12,
		mapCreditsImage1,
		flgCreditsImage1,
		mapCreditsScene2,
		flgCreditsScene2,
		sprCreditsFontNakanowatari,
		sprCreditsFontProgrammers,
		gfxCreditsImage21,
		gfxCreditsImage22,
		mapCreditsImage2,
		flgCreditsImage2,
		mapCreditsScene3TopRows,
		flgCreditsScene3TopRows,
		sprCreditsFontObjectDesigners,
		gfxCreditsImage31,
		gfxCreditsImage32,
		mapCreditsImage3,
		flgCreditsImage3,
		mapCreditsScene4TopRows,
		flgCreditsScene4TopRows,
		sprCreditsFontMusic,
		gfxCreditsImage41,
		gfxCreditsImage42,
		mapCreditsImage4,
		flgCreditsImage4,
		mapCreditsLinkedScene1,
		flgCreditsLinkedScene1,
		gfxCreditsLinkedImage21,
		gfxCreditsLinkedImage22,
		mapCreditsLinkedImage2,
		flgCreditsLinkedImage2,
		mapCreditsLinkedScene2,
		flgCreditsLinkedScene2,
		gfxCreditsLinkedImage11,
		gfxCreditsLinkedImage12,
		mapCreditsLinkedImage1,
		flgCreditsLinkedImage1,
		mapCreditsLinkedScene3,
		flgCreditsLinkedScene3,
		gfxCreditsLinkedImage31,
		gfxCreditsLinkedImage32,
		mapCreditsLinkedImage3,
		flgCreditsLinkedImage3,
		mapCreditsLinkedScene4,
		flgCreditsLinkedScene4,
		gfxCreditsLinkedImage41,
		gfxCreditsLinkedImage42,
		mapCreditsLinkedImage4,
		flgCreditsLinkedImage4,
		sprCreditsSprites1,
		sprCreditsSprites2,
		sprTriforceSparkle,
		gfxCreditsBg1,
		gfxCreditsBg2,
		gfxCreditsBg3,
		mapCreditsBg,
		flgCreditsBg,
		gfxDragononox1,
		gfxDragononox2,
		mapDragononox1,
		flgDragononox1,
		mapDragononox2,
		flgDragononox2,
		sprFileselectDecorations,
		gfxFileselect,
		gfxSecrettolabrynna,
		mapFileMenuTop,
		flgFileMenuTop,
		mapSecretForLinkedGame,
		flgSecretForLinkedGame,
		mapSaveMenuBottom,
		flgSaveMenuBottom,
		gfxCreditsTheend1,
		gfxCreditsTheend2,
		mapCreditsTheend,
		flgCreditsTheend,
		gfxCreditsLinkedTheend1,
		gfxCreditsLinkedTheend2,
		mapCreditsLinkedTheend,
		flgCreditsLinkedTheend,
		sprCreditsLinkedWavingGoodbye,
		gfxCreditsLinkedWavingGoodbye1,
		gfxCreditsLinkedWavingGoodbye2,
		gfxCreditsLinkedWavingGoodbye3,
		gfxCreditsLinkedWavingGoodbye4,
		mapCreditsLinkedWavingGoodbye1,
		flgCreditsLinkedWavingGoodbye1,
		mapCreditsLinkedWavingGoodbye2,
		flgCreditsLinkedWavingGoodbye2,
		sprIntroHorseClose,
		sprIntroHorseMid,
		gfxIntroLinkRidingHorse1,
		gfxIntroLinkRidingHorse2,
		mapIntroLinkRidingHorse1,
		flgIntroLinkRidingHorse1,
		sprIntroLinkRidingHorse,
		gfxIntroLinkRidingHorse3,
		mapIntroLinkRidingHorse2,
		flgIntroLinkRidingHorse2,
		mapIntroBar,
		flgIntroBar,
		mapLinkOnHorseCloseup,
		flgLinkOnHorseCloseup,
		sprLinkOnHorseCloseup,
		gfxLinkOnHorseCloseup1,
		gfxLinkOnHorseCloseup2,
		gfxLinkOnHorseCloseup3,
		gfxLinkOnHorseCloseup4,
		sprIntroOutsideCastleSprites,
		gfxIntroOutsideCastle1,
		gfxIntroOutsideCastle2,
		gfxIntroOutsideCastle3,
		mapIntroOutsideCastle,
		flgIntroOutsideCastle,
		mapIntroTriforceRoom,
		flgIntroTriforceRoom,
		gfxTitlescreen7,
		gfxTitlescreenTree1,
		gfxTitlescreenTree2,
		mapTitlescreenScroll2,
		flgTitlescreenScroll2,
		mapTitlescreenScroll1,
		flgTitlescreenScroll1,
		sprLink,
		sprRodOfSeasons,
		mapFileMenuMessageSpeed,
		flgFileMenuMessageSpeed,
		sprDin1,
		sprNayru,
		gfxMessagespeed,
		gfxPickafile2,
		gfxCopy,
		gfxErase,
		mapFileMenuMiddle,
		flgFileMenuMiddle,
		mapFileMenuBottom,
		flgFileMenuBottom,
		gfxCopywhatwhere,
		gfxQuit2,
		mapFileMenuCopy,
		flgFileMenuCopy,
		gfxPickafile,
		gfxName,
		mapNameEntryTop,
		flgNameEntryTop,
		mapNameEntryMiddle,
		flgNameEntryMiddle,
		mapNameEntryBottom,
		flgNameEntryBottom,
		mapSaveMenuMiddle,
		flgSaveMenuMiddle,
		gfxNewfilescreen,
		gfxSavescreen,
		gfxGameover,
		gfxSecretThatswrong,
		mapSecretEntryMiddle,
		flgSecretEntryMiddle,
		mapSecretEntryBottom,
		flgSecretEntryBottom,
		mapSecretEntryTop,
		flgSecretEntryTop,
		mapSecretEntryError,
		flgSecretEntryError,
		gfxLinking,
		gfxQuit,
		sprGanon1,
		sprTwinrovaSacrifice1,
		sprTwinrovaSacrifice2,
		sprTwinrovaSacrifice3,
		sprTwinrovaSacrifice4,
		sprGanon2,
		sprGanon5,
		sprGanon6,
		sprGanon7,
		sprGanon8,
		sprGanon9,
		sprGanon10,
		othTwinrovaLavaLayout,
		othTwinrovaNormalLayout,
		sprPresentPastSymbols,
		sprMapCompassKeysBookofseals,
		sprNayruSingingCutscene,
		gfxNayruSingingCutscene1,
		gfxNayruSingingCutscene2,
		gfxNayruSingingCutscene3,
		mapNayruSingingCutscene,
		flgNayruSingingCutscene,
		gfxMinimapTilesPresent1,
		gfxMinimapTilesCommon,
		gfxMinimapTilesPresent2,
		mapPresentMinimap,
		flgPresentMinimap,
		gfxMinimapTilesPast1,
		gfxMinimapTilesPast2,
		mapPastMinimap,
		flgPastMinimap,
		gfxBlurbMakupath,
		gfxBlurbBlacktowerturret,
		mapBlackTowerMiddle,
		flgBlackTowerMiddle,
		mapBlackTowerBase,
		flgBlackTowerBase,
		sprBlackTowerScene,
		gfxBlackTowerScene1,
		gfxBlackTowerScene2,
		gfxBlackTowerScene3,
		gfxBlackTowerScene4,
		gfxTilesetOverworldStandard,
		gfxTilesetOverworldPresent,
		gfxTilesetLynnaCity1,
		gfxTilesetLynnaCity2,
		gfxTilesetLynnaCity3,
		gfxTilesetOverworldPast,
		gfxTilesetUnderwaterPresent,
		gfxTilesetUnderwaterCommon1,
		gfxTilesetUnderwaterCommon2,
		gfxTilesetUnderwaterCommon3,
		gfxTilesetUnderwaterPast,
		sprSeaweedCut,
		gfxTilesetMakuPath,
		gfxTilesetSpiritsGrave,
		gfxTilesetWingDungeon,
		gfxTilesetMoonlitGrotto,
		gfxTilesetSkullDungeon,
		gfxTilesetCrownDungeon,
		gfxTilesetMermaidsCave,
		gfxTilesetJabuJabusBelly,
		gfxTilesetAncientTomb,
		gfxTilesetMinecartTrack,
		gfxTilesetBlackTowerTop,
		gfxTilesetBlackTower,
		gfxTilesetMakuTreeCommon,
		gfxTilesetMakuTreeBottom,
		gfxTilesetMakuTreeTop,
		mapMermaidsCaveWallRetraction,
		flgMermaidsCaveWallRetraction,
		mapAncientTombWallRetraction,
		flgAncientTombWallRetraction,
		mapJabuOpening1,
		flgJabuOpening1,
		mapJabuOpening2,
		flgJabuOpening2,
		gfxTilesetIndoorsRafton,
		gfxTilesetCaveReplacement1,
		gfxTilesetCaveReplacement2,
		gfxTilesetGoronCave,
		gfxTilesetMoblinFortress,
		gfxTilesetZoraPalace,
		gfxTilesetZoraPalaceReplacement1,
		gfxTilesetZoraPalaceReplacement2,
		mapBlackTowerStage3Top,
		flgBlackTowerStage3Top,
		mapBlackTowerStage3Middle,
		flgBlackTowerStage3Middle,
		mapBlackTowerStage2,
		flgBlackTowerStage2,
		mapBlackTowerStage1,
		flgBlackTowerStage1,
		mapCreditsMakuPastTopRows,
		flgCreditsMakuPastTopRows,
		gfxTilesetCredits,
		sprTriforceSparkleVineseedBookofseals,
		gfxSecrettoholodrum,
		sprIntroLinkOnHorseFront,
		gfxIntroLinkOnHorseFrontBg,
		gfxIntroLinkFaceShot,
		sprIntroLinkOnHorseFar,
		sprIntroLinkFaceShotSparkle,
		gfxIntroLinkOnHorseFarBg1,
		gfxIntroLinkOnHorseFarBg2,
		mapIntroLinkOnHorseFar,
		flgIntroLinkOnHorseFar,
		mapIntroLinkFaceShot,
		flgIntroLinkFaceShot,
		mapIntroLinkOnHorseFrontGround,
		flgIntroLinkOnHorseFrontGround,
		mapIntroLinkOnHorseFrontBg,
		flgIntroLinkOnHorseFrontBg,
		sprNayru1,
	}
}
@ROMSource([0xAF2A6, 0xB4735][gameVersion], 0x1C6)
@Asset("data/gfx/common/spr_kingmoblin_3.bin", DataType.raw)
immutable(ubyte)[] sprKingmoblin3;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBF514, 0x2AC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_mermaids_cave.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMermaidsCave;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA9CB4, 0x1D2)
	@Asset("data/gfx/" ~ game ~ "/spr_bipsom_2_old_lady.bin", DataType.raw)
	immutable(ubyte)[] sprBipsom2OldLady;
}

@ROMSource([0xC7AB7, 0xC8419][gameVersion], 0x6EE)
@Asset("data/gfx/common/gfx_titlescreen_tree_2.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreenTree2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBCDAA, 0x2A6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosian_smithy_outside.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosianSmithyOutside;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBAAA2, 0x1F3)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_symmetry_city_ruined_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSymmetryCityRuined2;
}

@ROMSource([0xDCE59, 0xDCF5D][gameVersion], 0x334)
@Asset("data/gfx/common/gfx_credits_theend_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsTheend2;

@ROMSource([0xE2490, 0xE2589][gameVersion], 0x1B)
@Asset("data/gfx/common/flg_name_entry_middle.bin", DataType.raw)
immutable(ubyte)[] flgNameEntryMiddle;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBA017, 0x13D)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_tarm_ruins_north.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTarmRuinsNorth;
}

@ROMSource([0xD7621, 0xD8225][gameVersion], [0xDF, 0x7F][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_linked_scene1.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedScene1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB78E4, 0x1C6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_temple_remains.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTempleRemains;
}

@ROMSource([0xDECBC, 0xDEDC0][gameVersion], 0x164)
@Asset("data/gfx/common/spr_boat_theend.bin", DataType.raw)
immutable(ubyte)[] sprBoatTheend;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBD455, 0x183)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_pirate_ship_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosiaPirateShip2;
}

@ROMSource([0xA1528, 0xA5A37][gameVersion], 0x1A)
@Asset("data/gfx/common/flg_dungeon_minimap.bin", DataType.raw)
immutable(ubyte)[] flgDungeonMinimap;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC3281, 0x3E4)
	@Asset("data/gfx/" ~ game ~ "/gfx_jp_intro_screen_2.bin", DataType.raw)
	immutable(ubyte)[] gfxJpIntroScreen2;
}

@ROMSource([0x6AF40, 0x6AF60][gameVersion], 0xA0)
@Asset("data/gfx/common/spr_rod_of_seasons.bin", DataType.raw)
immutable(ubyte)[] sprRodOfSeasons;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB11D, 0xF3)
	@Asset("data/gfx/" ~ game ~ "/spr_goriyabros.bin", DataType.raw)
	immutable(ubyte)[] sprGoriyabros;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA6F67, 0x433)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_common.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesCommon;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB0A9, 0x80)
	@Asset("data/gfx/" ~ game ~ "/map_pirate_ship_leaving_subrosia.bin", DataType.raw)
	immutable(ubyte)[] mapPirateShipLeavingSubrosia;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9F82, 0x4C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_forest_of_time_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetForestOfTime3;
}

@ROMSource([0xDF440, 0xDF544][gameVersion], [0x5DC, 0x5D6][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tobecontinued.bin", DataType.raw)
immutable(ubyte)[] gfxTobecontinued;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB786, 0xFE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_rolling_ridge_present_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetRollingRidgePresent3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB40F0, 0x1D7)
	@Asset("data/gfx/" ~ game ~ "/spr_spiderbeeveran_1.bin", DataType.raw)
	immutable(ubyte)[] sprSpiderbeeveran1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA5B40, 0x179)
	@Asset("data/gfx/" ~ game ~ "/spr_syrup.bin", DataType.raw)
	immutable(ubyte)[] sprSyrup;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA9E35, 0x155)
	@Asset("data/gfx/" ~ game ~ "/spr_shroudedstalfos_floortile.bin", DataType.raw)
	immutable(ubyte)[] sprShroudedstalfosFloortile;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBCF33, 0x100)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_underwater_common_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetUnderwaterCommon3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xABB46, 0x161)
	@Asset("data/gfx/" ~ game ~ "/spr_syger_3.bin", DataType.raw)
	immutable(ubyte)[] sprSyger3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBE226, 0x1DC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_gnarled_root_dungeon.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetGnarledRootDungeon;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB7AAA, 0x2FE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_castle_summer.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCastleSummer;
}

@ROMSource([0xC83E9, 0xC8D4E][gameVersion], 0x29)
@Asset("data/gfx/common/flg_titlescreen_scroll_2.bin", DataType.raw)
immutable(ubyte)[] flgTitlescreenScroll2;

@ROMSource([0x6AC40, 0x6ACA0][gameVersion], 0x100)
@Asset("data/gfx/common/spr_link_baby.bin", DataType.raw)
immutable(ubyte)[] sprLinkBaby;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE731, 0x1E)
	@Asset("data/gfx/" ~ game ~ "/flg_black_tower_stage_3_top.bin", DataType.raw)
	immutable(ubyte)[] flgBlackTowerStage3Top;
}

@ROMSource([0xA8AD3, 0xAE673][gameVersion], 0x8D)
@Asset("data/gfx/common/spr_circlebeads.bin", DataType.raw)
immutable(ubyte)[] sprCirclebeads;

@ROMSource([0xCA8C0, 0xC9EC0][gameVersion], 0x143)
@Asset("data/gfx/common/spr_intro_link_close_frame_5.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkCloseFrame5;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCBEC1, 0x551)
	@Asset("data/gfx/" ~ game ~ "/gfx_nayru_singing_cutscene_2.bin", DataType.raw)
	immutable(ubyte)[] gfxNayruSingingCutscene2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA455C, 0x17F)
	@Asset("data/gfx/" ~ game ~ "/spr_sokra_masterdiver.bin", DataType.raw)
	immutable(ubyte)[] sprSokraMasterdiver;
}

@ROMSource([0xD40EC, 0xD3DAD][gameVersion], [0x569, 0x4F5][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image1_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage12;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE555, 0x44)
	@Asset("data/gfx/" ~ game ~ "/flg_black_tower_middle.bin", DataType.raw)
	immutable(ubyte)[] flgBlackTowerMiddle;
}

@ROMSource([0xDC0F0, 0xDC1F4][gameVersion], 0x628)
@Asset("data/gfx/common/gfx_credits_bg_3.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsBg3;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCD303, 0x1B0)
	@Asset("data/gfx/" ~ game ~ "/map_din_dance_cutscene.bin", DataType.raw)
	immutable(ubyte)[] mapDinDanceCutscene;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA5159, 0x165)
	@Asset("data/gfx/" ~ game ~ "/spr_blossom.bin", DataType.raw)
	immutable(ubyte)[] sprBlossom;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA74FF, 0x53A)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_present_1.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesPresent1;
}

@ROMSource([0xA12CF, 0xA57E2][gameVersion], 0x0F)
@Asset("data/gfx/common/flg_inventory_screen_2.bin", DataType.raw)
immutable(ubyte)[] flgInventoryScreen2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBA7C8, 0xFE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_tokay_island_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTokayIsland3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB2AD5, 0x15D)
	@Asset("data/gfx/" ~ game ~ "/spr_smog_3.bin", DataType.raw)
	immutable(ubyte)[] sprSmog3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB3ED, 0x1CC)
	@Asset("data/gfx/" ~ game ~ "/spr_agahnim_1.bin", DataType.raw)
	immutable(ubyte)[] sprAgahnim1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA9848, 0x1C0)
	@Asset("data/gfx/" ~ game ~ "/spr_blaino_tornado.bin", DataType.raw)
	immutable(ubyte)[] sprBlainoTornado;
}

@ROMSource([0xA02D7, 0xA4715][gameVersion], 0x06)
@Asset("data/gfx/common/gfx_blank.bin", DataType.raw)
immutable(ubyte)[] gfxBlank;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB41B6, 0x2A8)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_top_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeTop3;
}

@ROMSource([0xA7B60, 0xAD875][gameVersion], [0x1B2, 0xD7][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_din_2.bin", DataType.raw)
immutable(ubyte)[] sprDin2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xD6E32, 0x0C)
	@Asset("data/gfx/" ~ game ~ "/flg_credits_maku_past_top_rows.bin", DataType.raw)
	immutable(ubyte)[] flgCreditsMakuPastTopRows;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB967C, 0x1FD)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_yoll_graveyard_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetYollGraveyard2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB1342, 0x19D)
	@Asset("data/gfx/" ~ game ~ "/spr_armoswarriorshield.bin", DataType.raw)
	immutable(ubyte)[] sprArmoswarriorshield;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAEDF2, 0x132)
	@Asset("data/gfx/" ~ game ~ "/spr_medusahead_3.bin", DataType.raw)
	immutable(ubyte)[] sprMedusahead3;
}

@ROMSource([0xE0372, 0xE0470][gameVersion], 0xFA)
@Asset("data/gfx/common/gfx_messagespeed.bin", DataType.raw)
immutable(ubyte)[] gfxMessagespeed;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD592, 0x05)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_nuun_highlands_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetNuunHighlands3;
}

@ROMSource([0xCFA64, 0xCF804][gameVersion], [0x172, 0x18A][gameVersion])
@Asset("data/gfx/"~ game ~"/map_link_with_oracle.bin", DataType.raw)
immutable(ubyte)[] mapLinkWithOracle;

@ROMSource([0xA72BA, 0xAD0F1][gameVersion], 0x1DC)
@Asset("data/gfx/common/spr_impa.bin", DataType.raw)
immutable(ubyte)[] sprImpa;

@ROMSource([0xAA240, 0xAFB9D][gameVersion], 0xCE)
@Asset("data/gfx/common/spr_wizzrobe.bin", DataType.raw)
immutable(ubyte)[] sprWizzrobe;

@ROMSource([0xE16D4, 0xE17CD][gameVersion], 0x1B5)
@Asset("data/gfx/common/gfx_herossecret.bin", DataType.raw)
immutable(ubyte)[] gfxHerossecret;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA64DF, 0xE7)
	@Asset("data/gfx/" ~ game ~ "/spr_bluecucco.bin", DataType.raw)
	immutable(ubyte)[] sprBluecucco;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xACA23, 0x1CA)
	@Asset("data/gfx/" ~ game ~ "/spr_shopkeeper_adlar_veranmask.bin", DataType.raw)
	immutable(ubyte)[] sprShopkeeperAdlarVeranmask;
}

@ROMSource([0xB18D7, 0xB64F8][gameVersion], 0xD8)
@Asset("data/gfx/common/spr_ganon_3.bin", DataType.raw)
immutable(ubyte)[] sprGanon3;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC3F45, 0x8A)
	@Asset("data/gfx/" ~ game ~ "/flg_intro_link_on_horse_far.bin", DataType.raw)
	immutable(ubyte)[] flgIntroLinkOnHorseFar;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB3EB, 0x28E)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosia1;
}

@ROMSource([0xE20B7, 0xE21B0][gameVersion], 0x18)
@Asset("data/gfx/common/flg_save_menu_middle.bin", DataType.raw)
immutable(ubyte)[] flgSaveMenuMiddle;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBBE97, 0x192)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_eyeglass_library_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetEyeglassLibrary2;
}

@ROMSource([0xE2374, 0xE246D][gameVersion], 0x20)
@Asset("data/gfx/common/flg_name_entry_top.bin", DataType.raw)
immutable(ubyte)[] flgNameEntryTop;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xE1543, 0x191)
	@Asset("data/gfx/" ~ game ~ "/gfx_secrettolabrynna.bin", DataType.raw)
	immutable(ubyte)[] gfxSecrettolabrynna;
}

@ROMSource([0xA1268, 0xA577B][gameVersion], 0x10)
@Asset("data/gfx/common/map_hud_normal.bin", DataType.raw)
immutable(ubyte)[] mapHudNormal;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB3B03, 0x38C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTree3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67EC0, 0x15)
	@Asset("data/gfx/" ~ game ~ "/map_ancient_tomb_wall_retraction.bin", DataType.raw)
	immutable(ubyte)[] mapAncientTombWallRetraction;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xE1641, 0x18C)
	@Asset("data/gfx/" ~ game ~ "/gfx_secrettoholodrum.bin", DataType.raw)
	immutable(ubyte)[] gfxSecrettoholodrum;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBF139, 0x217)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_skull_dungeon.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSkullDungeon;
}

@ROMSource([0xDEC70, 0xDED74][gameVersion], 0x4C)
@Asset("data/gfx/common/flg_credits_linked_theend.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedTheend;

@ROMSource([0xA009D, 0xA440A][gameVersion], [0x11C, 0x18E][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_quest_items_5.bin", DataType.raw)
immutable(ubyte)[] sprQuestItems5;

@ROMSource([0xA1646, 0xA5B5F][gameVersion], [0x18C, 0x14A][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d1.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB1CE, 0x22)
	@Asset("data/gfx/" ~ game ~ "/flg_pirate_ship_leaving_desert.bin", DataType.raw)
	immutable(ubyte)[] flgPirateShipLeavingDesert;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB129, 0x26)
	@Asset("data/gfx/" ~ game ~ "/flg_pirate_ship_leaving_subrosia.bin", DataType.raw)
	immutable(ubyte)[] flgPirateShipLeavingSubrosia;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB7621, 0x2C3)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_castle_spring.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCastleSpring;
}

@ROMSource([0xAF60B, 0xB4A9A][gameVersion], [0x1B2, 0x17A][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_kingmoblin_5.bin", DataType.raw)
immutable(ubyte)[] sprKingmoblin5;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBE402, 0x2CC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_snakes_remains.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSnakesRemains;
}

@ROMSource([0xE2167, 0xE2260][gameVersion], 0x1D)
@Asset("data/gfx/common/flg_secret_entry_top.bin", DataType.raw)
immutable(ubyte)[] flgSecretEntryTop;

@ROMSource([0xC870B, 0xC9070][gameVersion], 0x247)
@Asset("data/gfx/common/map_link_on_horse_closeup.bin", DataType.raw)
immutable(ubyte)[] mapLinkOnHorseCloseup;

@ROMSource([0xB14A3, 0xB60C4][gameVersion], 0xFD)
@Asset("data/gfx/common/spr_twinrova_sacrifice_2.bin", DataType.raw)
immutable(ubyte)[] sprTwinrovaSacrifice2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA8C0D, 0x1A6)
	@Asset("data/gfx/" ~ game ~ "/spr_ladies_and_diver.bin", DataType.raw)
	immutable(ubyte)[] sprLadiesAndDiver;
}

@ROMSource([0xD017A, 0xCFD18][gameVersion], 0x33B)
@Asset("data/gfx/common/spr_link_with_oracle_and_twinrova.bin", DataType.raw)
immutable(ubyte)[] sprLinkWithOracleAndTwinrova;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB2C32, 0xCC)
	@Asset("data/gfx/" ~ game ~ "/spr_smog_projectiles.bin", DataType.raw)
	immutable(ubyte)[] sprSmogProjectiles;
}

@ROMSource([0xB1324, 0xB5F45][gameVersion], 0x17F)
@Asset("data/gfx/common/spr_twinrova_sacrifice_1.bin", DataType.raw)
immutable(ubyte)[] sprTwinrovaSacrifice1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xE29A9, 0x761)
	@Asset("data/gfx/" ~ game ~ "/gfx_dragononox_1.bin", DataType.raw)
	immutable(ubyte)[] gfxDragononox1;
}

@ROMSource([0xE201A, 0xE2113][gameVersion], 0x9D)
@Asset("data/gfx/common/map_save_menu_middle.bin", DataType.raw)
immutable(ubyte)[] mapSaveMenuMiddle;

@ROMSource([0xD496F, 0xD4400][gameVersion], [0x25, 0x30][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_image2.bin", DataType.raw)
immutable(ubyte)[] flgCreditsImage2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB95A7, 0xD5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_yoll_graveyard_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetYollGraveyard1;
}

@ROMSource([0xA2881, 0xA6DD7][gameVersion], 0x190)
@Asset("data/gfx/common/gfx_minimap_tiles_dungeon.bin", DataType.raw)
immutable(ubyte)[] gfxMinimapTilesDungeon;

@ROMSource([0xCBD2D, 0xCA003][gameVersion], 0x57C)
@Asset("data/gfx/common/spr_intro_outside_castle_sprites.bin", DataType.raw)
immutable(ubyte)[] sprIntroOutsideCastleSprites;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBA37C, 0x79)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_fairy_forest_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetFairyForest3;
}

@ROMSource([0xA65C6, 0xACBED][gameVersion], [0x19D, 0x162][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_piratians.bin", DataType.raw)
immutable(ubyte)[] sprPiratians;

@ROMSource([0xE20CF, 0xE21C8][gameVersion], 0x22)
@Asset("data/gfx/common/map_save_menu_bottom.bin", DataType.raw)
immutable(ubyte)[] mapSaveMenuBottom;

@ROMSource([0xC81A5, 0xC8B07][gameVersion], [0xF6, 0xFC][gameVersion])
@Asset("data/gfx/"~ game ~"/map_intro_triforce_room.bin", DataType.raw)
immutable(ubyte)[] mapIntroTriforceRoom;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB30AC, 0xF7)
	@Asset("data/gfx/" ~ game ~ "/spr_octogon_3.bin", DataType.raw)
	immutable(ubyte)[] sprOctogon3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBC0F7, 0xB7)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_sea_of_no_return_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSeaOfNoReturn3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67EAB, 0x15)
	@Asset("data/gfx/" ~ game ~ "/flg_mermaids_cave_wall_retraction.bin", DataType.raw)
	immutable(ubyte)[] flgMermaidsCaveWallRetraction;
}

@ROMSource([0xAAFA9, 0xB0806][gameVersion], 0xF9)
@Asset("data/gfx/common/spr_projectiles_3.bin", DataType.raw)
immutable(ubyte)[] sprProjectiles3;

@ROMSource([0xAC3CD, 0xB16F8][gameVersion], 0xE5)
@Asset("data/gfx/common/spr_vire.bin", DataType.raw)
immutable(ubyte)[] sprVire;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBC81D, 0x22B)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_5.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosia5;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB8C32, 0x1F7)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_gate.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeGate;
}

@ROMSource([0xDDC22, 0xDDD26][gameVersion], 0xBE)
@Asset("data/gfx/common/gfx_credits_linked_waving_goodbye_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedWavingGoodbye2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB8837, 0x490)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_overworld_present.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOverworldPresent;
}

@ROMSource([0xDFA1C, 0xDFB1A][gameVersion], 0x9F)
@Asset("data/gfx/common/map_tobecontinued.bin", DataType.raw)
immutable(ubyte)[] mapTobecontinued;

@ROMSource([0xC6513, 0xC6E75][gameVersion], 0x18C)
@Asset("data/gfx/common/spr_obj_intro_tree.bin", DataType.raw)
immutable(ubyte)[] sprObjIntroTree;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC1622, 0x60)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_vases.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetVases;
}

@ROMSource([0xAAC5C, 0xB03AB][gameVersion], 0xBF)
@Asset("data/gfx/common/spr_fireball_cheepcheep.bin", DataType.raw)
immutable(ubyte)[] sprFireballCheepcheep;

@ROMSource([0xA13BC, 0xA58CB][gameVersion], 0x4A)
@Asset("data/gfx/common/spr_biggoron_sword_icon.bin", DataType.raw)
immutable(ubyte)[] sprBiggoronSwordIcon;

@ROMSource([0xD47AF, 0xD42C2][gameVersion], [0x9C, 0x1A][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_scene2.bin", DataType.raw)
immutable(ubyte)[] flgCreditsScene2;

@ROMSource([0xAEF24, 0xB43DB][gameVersion], [0x196, 0x16D][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_kingmoblin_1.bin", DataType.raw)
immutable(ubyte)[] sprKingmoblin1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBEAC9, 0x321)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_unicorns_cave.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetUnicornsCave;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB1CD, 0xA2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_symmetry_city_restored_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSymmetryCityRestored1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE6A1, 0x5F)
	@Asset("data/gfx/" ~ game ~ "/flg_black_tower_stage_3_middle.bin", DataType.raw)
	immutable(ubyte)[] flgBlackTowerStage3Middle;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3DD2, 0x16B)
	@Asset("data/gfx/" ~ game ~ "/spr_beetleveran.bin", DataType.raw)
	immutable(ubyte)[] sprBeetleveran;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67EE5, 0x49)
	@Asset("data/gfx/" ~ game ~ "/map_jabu_opening_1.bin", DataType.raw)
	immutable(ubyte)[] mapJabuOpening1;
}

@ROMSource([0xD52E0, 0xD4D08][gameVersion], [0x582, 0x4D2][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image2_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage22;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xABF5F, 0x1CE)
	@Asset("data/gfx/" ~ game ~ "/spr_frypolar_1.bin", DataType.raw)
	immutable(ubyte)[] sprFrypolar1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB6BF1, 0xD5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_winter_tree_replacement.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetWinterTreeReplacement;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD94C, 0x12E)
	@Asset("data/gfx/" ~ game ~ "/spr_moblinflag_bomb_portal.bin", DataType.raw)
	immutable(ubyte)[] sprMoblinflagBombPortal;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC22A5, 0x60)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_cave_replacement.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCaveReplacement;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAA65D, 0x1D9)
	@Asset("data/gfx/" ~ game ~ "/spr_syrup_teenager.bin", DataType.raw)
	immutable(ubyte)[] sprSyrupTeenager;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA36CE, 0xA7)
	@Asset("data/gfx/" ~ game ~ "/flg_holodrum_minimap.bin", DataType.raw)
	immutable(ubyte)[] flgHolodrumMinimap;
}

@ROMSource([0xB055C, 0xB517D][gameVersion], 0x99)
@Asset("data/gfx/common/spr_twinrova_4.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova4;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCC630, 0x1BB)
	@Asset("data/gfx/" ~ game ~ "/map_nayru_singing_cutscene.bin", DataType.raw)
	immutable(ubyte)[] mapNayruSingingCutscene;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA978B, 0x1C9)
	@Asset("data/gfx/" ~ game ~ "/spr_bipin_glassesguy.bin", DataType.raw)
	immutable(ubyte)[] sprBipinGlassesguy;
}

@ROMSource([0xC0B45, 0xC0DDF][gameVersion], [0x4E8, 0x666][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tileset_indoors_1.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetIndoors1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA5FD3, 0x1A8)
	@Asset("data/gfx/" ~ game ~ "/spr_ingo.bin", DataType.raw)
	immutable(ubyte)[] sprIngo;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC4681, 0x42C)
	@Asset("data/gfx/" ~ game ~ "/gfx_intro_link_riding_horse_1.bin", DataType.raw)
	immutable(ubyte)[] gfxIntroLinkRidingHorse1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBA336, 0x1ED)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_samasa_desert.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSamasaDesert;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9965, 0xDA)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_black_tower_outside_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetBlackTowerOutside1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA42B0, 0x129)
	@Asset("data/gfx/" ~ game ~ "/spr_season_symbols.bin", DataType.raw)
	immutable(ubyte)[] sprSeasonSymbols;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAABA5, 0x1E0)
	@Asset("data/gfx/" ~ game ~ "/spr_patch.bin", DataType.raw)
	immutable(ubyte)[] sprPatch;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD6F4, 0x06)
	@Asset("data/gfx/" ~ game ~ "/gfx_blank_4.bin", DataType.raw)
	immutable(ubyte)[] gfxBlank4;
}

@ROMSource([0xDFD5F, 0xDFE5D][gameVersion], 0x82)
@Asset("data/gfx/common/gfx_copy.bin", DataType.raw)
immutable(ubyte)[] gfxCopy;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE338, 0x3C)
	@Asset("data/gfx/" ~ game ~ "/flg_black_tower_base.bin", DataType.raw)
	immutable(ubyte)[] flgBlackTowerBase;
}

@ROMSource([0xA1295, 0xA57A8][gameVersion], 0x0B)
@Asset("data/gfx/common/flg_hud_extra_hearts.bin", DataType.raw)
immutable(ubyte)[] flgHudExtraHearts;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC2305, 0x539)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_indoors_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosiaIndoors1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB21C8, 0x163)
	@Asset("data/gfx/" ~ game ~ "/spr_headthwomp_1.bin", DataType.raw)
	immutable(ubyte)[] sprHeadthwomp1;
}

@ROMSource([0xAA30E, 0xAFC6B][gameVersion], 0x1CA)
@Asset("data/gfx/common/spr_ironmask.bin", DataType.raw)
immutable(ubyte)[] sprIronmask;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA898E, 0x105)
	@Asset("data/gfx/" ~ game ~ "/spr_colored_cube.bin", DataType.raw)
	immutable(ubyte)[] sprColoredCube;
}

@ROMSource([0xA12AF, 0xA57C2][gameVersion], 0x0D)
@Asset("data/gfx/common/flg_hud_biggoron_sword.bin", DataType.raw)
immutable(ubyte)[] flgHudBiggoronSword;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD1CF, 0x182)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_jabu_jabu_outside_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetJabuJabuOutside2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xADDFC, 0x118)
	@Asset("data/gfx/" ~ game ~ "/spr_gohma_3.bin", DataType.raw)
	immutable(ubyte)[] sprGohma3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB2950, 0x185)
	@Asset("data/gfx/" ~ game ~ "/spr_smog_2.bin", DataType.raw)
	immutable(ubyte)[] sprSmog2;
}

@ROMSource([0xA690B, 0xAB495][gameVersion], [0x145, 0x16A][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_seasonfairy_ambi.bin", DataType.raw)
immutable(ubyte)[] sprSeasonfairyAmbi;

@ROMSource([0xAFFF3, 0xB4C14][gameVersion], 0x100)
@Asset("data/gfx/common/spr_twinrovamerged_1.bin", DataType.raw)
immutable(ubyte)[] sprTwinrovamerged1;

@ROMSource([0xD5862, 0xD51DA][gameVersion], [0x1D, 0x20][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_scene3_top_rows.bin", DataType.raw)
immutable(ubyte)[] mapCreditsScene3TopRows;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB1627, 0xD1)
	@Asset("data/gfx/" ~ game ~ "/spr_smasher.bin", DataType.raw)
	immutable(ubyte)[] sprSmasher;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3A2B, 0x198)
	@Asset("data/gfx/" ~ game ~ "/spr_darklink.bin", DataType.raw)
	immutable(ubyte)[] sprDarklink;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAE5FD, 0x184)
	@Asset("data/gfx/" ~ game ~ "/spr_manhandla_2.bin", DataType.raw)
	immutable(ubyte)[] sprManhandla2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB3D5, 0xC0)
	@Asset("data/gfx/" ~ game ~ "/spr_ralph_2.bin", DataType.raw)
	immutable(ubyte)[] sprRalph2;
}

@ROMSource([0xC70A8, 0xC7A0A][gameVersion], 0xD5)
@Asset("data/gfx/common/gfx_titlescreen_7.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreen7;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB5CD, 0x1B9)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_rolling_ridge_present_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetRollingRidgePresent2;
}

@ROMSource([0xD9491, 0xD90BD][gameVersion], 0xAF)
@Asset("data/gfx/common/map_credits_linked_scene4.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedScene4;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD2CD, 0x40)
	@Asset("data/gfx/" ~ game ~ "/spr_impafainted.bin", DataType.raw)
	immutable(ubyte)[] sprImpafainted;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAE93E, 0x140)
	@Asset("data/gfx/" ~ game ~ "/spr_gleeok_2.bin", DataType.raw)
	immutable(ubyte)[] sprGleeok2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA7E3A, 0x16A)
	@Asset("data/gfx/" ~ game ~ "/spr_biggoron_dustcloud_subrosiaportal.bin", DataType.raw)
	immutable(ubyte)[] sprBiggoronDustcloudSubrosiaportal;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA87AD, 0xF7)
	@Asset("data/gfx/" ~ game ~ "/spr_pedestal_flame_crystal.bin", DataType.raw)
	immutable(ubyte)[] sprPedestalFlameCrystal;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE92B, 0x3C)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_scene3.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallScene3;
}

@ROMSource([0x6A480, 0x6A4E0][gameVersion], 0x200)
@Asset("data/gfx/common/spr_subrosian.bin", DataType.raw)
immutable(ubyte)[] sprSubrosian;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBCA48, 0x362)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_village.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosiaVillage;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC2722, 0x23F)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_moblin_fortress.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMoblinFortress;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD829, 0xC5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_ambis_palace_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetAmbisPalace3;
}

@ROMSource([0xB0E00, 0xB5A21][gameVersion], 0x1A6)
@Asset("data/gfx/common/spr_twinrovamerged_2.bin", DataType.raw)
immutable(ubyte)[] sprTwinrovamerged2;

@ROMSource([0xE2556, 0xE264F][gameVersion], 0x259)
@Asset("data/gfx/common/gfx_secret_list_menu.bin", DataType.raw)
immutable(ubyte)[] gfxSecretListMenu;

@ROMSource([0xB1DBB, 0xB69DC][gameVersion], 0x15E)
@Asset("data/gfx/common/spr_ganon_7.bin", DataType.raw)
immutable(ubyte)[] sprGanon7;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB445E, 0x6F0)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_small_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeSmall1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBC035, 0xC2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_sea_of_no_return_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSeaOfNoReturn2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67E7C, 0x15)
	@Asset("data/gfx/" ~ game ~ "/map_wing_dungeon_collapsed.bin", DataType.raw)
	immutable(ubyte)[] mapWingDungeonCollapsed;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB3411, 0x32C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTree1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC2D31, 0x40)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_zora_palace_replacement_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetZoraPalaceReplacement1;
}

@ROMSource([0xA8914, 0xAE4B4][gameVersion], 0x1BF)
@Asset("data/gfx/common/spr_evilflame.bin", DataType.raw)
immutable(ubyte)[] sprEvilflame;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB5021, 0xC3)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_natzu_river.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetNatzuRiver;
}

@ROMSource([0xAF0BA, 0xB4548][gameVersion], [0x1EC, 0x1ED][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_kingmoblin_2.bin", DataType.raw)
immutable(ubyte)[] sprKingmoblin2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA94E1, 0xE4)
	@Asset("data/gfx/" ~ game ~ "/spr_evilfairy_unused.bin", DataType.raw)
	immutable(ubyte)[] sprEvilfairyUnused;
}

@ROMSource([0xD671E, 0xD6047][gameVersion], [0x19, 0x24][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_scene4_top_rows.bin", DataType.raw)
immutable(ubyte)[] mapCreditsScene4TopRows;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB080, 0x07)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_talus_peaks_past_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTalusPeaksPast1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB9CB7, 0x1FE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_unicorns_cave_entrance.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetUnicornsCaveEntrance;
}

@ROMSource([0xB022E, 0xB4E4F][gameVersion], 0x169)
@Asset("data/gfx/common/spr_twinrova_2.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova2;

@ROMSource([0xD2880, 0xD2448][gameVersion], [0x6EE, 0x755][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_makutree_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsMakutree2;

@ROMSource([0xA8E7A, 0xAEA1A][gameVersion], 0x1DC)
@Asset("data/gfx/common/spr_crows_buzzblob.bin", DataType.raw)
immutable(ubyte)[] sprCrowsBuzzblob;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAAF04, 0x165)
	@Asset("data/gfx/" ~ game ~ "/spr_goron.bin", DataType.raw)
	immutable(ubyte)[] sprGoron;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB2CFE, 0x1E6)
	@Asset("data/gfx/" ~ game ~ "/spr_octogon_1.bin", DataType.raw)
	immutable(ubyte)[] sprOctogon1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAC3FD, 0x17B)
	@Asset("data/gfx/" ~ game ~ "/spr_kingzora_tokkey.bin", DataType.raw)
	immutable(ubyte)[] sprKingzoraTokkey;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC1445, 0x572)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_indoors_rafton.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetIndoorsRafton;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67F7F, 0x26)
	@Asset("data/gfx/" ~ game ~ "/flg_jabu_opening_1.bin", DataType.raw)
	immutable(ubyte)[] flgJabuOpening1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xADA82, 0x196)
	@Asset("data/gfx/" ~ game ~ "/spr_gohma_1.bin", DataType.raw)
	immutable(ubyte)[] sprGohma1;
}

@ROMSource([0xDD39A, 0xDD49E][gameVersion], 0xAA)
@Asset("data/gfx/common/flg_credits_linked_waving_goodbye_1.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedWavingGoodbye1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xABDB3, 0x1EE)
	@Asset("data/gfx/" ~ game ~ "/spr_constructionworker_shootinggalleryguy.bin", DataType.raw)
	immutable(ubyte)[] sprConstructionworkerShootinggalleryguy;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAC14E, 0x14C)
	@Asset("data/gfx/" ~ game ~ "/spr_friendlyghost.bin", DataType.raw)
	immutable(ubyte)[] sprFriendlyghost;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCACEB, 0x618)
	@Asset("data/gfx/" ~ game ~ "/gfx_din_dance_cutscene_1.bin", DataType.raw)
	immutable(ubyte)[] gfxDinDanceCutscene1;
}

@ROMSource([0xD04B5, 0xD0053][gameVersion], [0x6E7, 0x701][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_link_with_oracle_and_twinrova_2.bin", DataType.raw)
immutable(ubyte)[] gfxLinkWithOracleAndTwinrova2;

@ROMSource([0xE1E9F, 0xE1F98][gameVersion], 0x32)
@Asset("data/gfx/common/flg_file_menu_middle.bin", DataType.raw)
immutable(ubyte)[] flgFileMenuMiddle;

@ROMSource([0xDA349, 0xD9F61][gameVersion], 0x26)
@Asset("data/gfx/common/flg_credits_linked_image3.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedImage3;

@ROMSource([0xE2274, 0xE236D][gameVersion], 0x23)
@Asset("data/gfx/common/flg_secret_entry_middle.bin", DataType.raw)
immutable(ubyte)[] flgSecretEntryMiddle;

@ROMSource([0xA1425, 0xA5934][gameVersion], 0x18)
@Asset("data/gfx/common/flg_unappraised_ring_list.bin", DataType.raw)
immutable(ubyte)[] flgUnappraisedRingList;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAD965, 0x11D)
	@Asset("data/gfx/" ~ game ~ "/spr_mothula_child.bin", DataType.raw)
	immutable(ubyte)[] sprMothulaChild;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC442C, 0x271)
	@Asset("data/gfx/" ~ game ~ "/gfx_intro_link_on_horse_far_bg_1.bin", DataType.raw)
	immutable(ubyte)[] gfxIntroLinkOnHorseFarBg1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBE8EC, 0x1DD)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_dancing_dragon_dungeon.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetDancingDragonDungeon;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCB9C3, 0x36A)
	@Asset("data/gfx/" ~ game ~ "/gfx_din_dance_cutscene_3.bin", DataType.raw)
	immutable(ubyte)[] gfxDinDanceCutscene3;
}

@ROMSource([0xE1176, 0xE1274][gameVersion], 0x1B2)
@Asset("data/gfx/common/gfx_gameover.bin", DataType.raw)
immutable(ubyte)[] gfxGameover;

@ROMSource([0xDEE20, 0xDEF24][gameVersion], 0x395)
@Asset("data/gfx/common/gfx_credits_linked_theend_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedTheend1;

@ROMSource([0xB2CB5, 0xB7102][gameVersion], 0x439)
@Asset("data/gfx/common/gfx_gasha_tree.bin", DataType.raw)
immutable(ubyte)[] gfxGashaTree;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAC851, 0x1A6)
	@Asset("data/gfx/" ~ game ~ "/spr_aquamentus_3.bin", DataType.raw)
	immutable(ubyte)[] sprAquamentus3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67E39, 0x26)
	@Asset("data/gfx/" ~ game ~ "/map_wing_dungeon_collapsing_2.bin", DataType.raw)
	immutable(ubyte)[] mapWingDungeonCollapsing2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC4E1A, 0x111)
	@Asset("data/gfx/" ~ game ~ "/map_intro_link_riding_horse_1.bin", DataType.raw)
	immutable(ubyte)[] mapIntroLinkRidingHorse1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCC412, 0x21E)
	@Asset("data/gfx/" ~ game ~ "/gfx_nayru_singing_cutscene_3.bin", DataType.raw)
	immutable(ubyte)[] gfxNayruSingingCutscene3;
}

@ROMSource([0xBDEE6, 0xBE4B9][gameVersion], [0x340, 0x345][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tileset_dungeon_standard_2.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetDungeonStandard2;

@ROMSource([0xB15A0, 0xB61C1][gameVersion], 0x157)
@Asset("data/gfx/common/spr_twinrova_sacrifice_3.bin", DataType.raw)
immutable(ubyte)[] sprTwinrovaSacrifice3;

@ROMSource([0xC8952, 0xC92B7][gameVersion], [0xED, 0xFF][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_link_on_horse_closeup.bin", DataType.raw)
immutable(ubyte)[] flgLinkOnHorseCloseup;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA4FF0, 0x169)
	@Asset("data/gfx/" ~ game ~ "/spr_bipin.bin", DataType.raw)
	immutable(ubyte)[] sprBipin;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAC578, 0x1BE)
	@Asset("data/gfx/" ~ game ~ "/spr_tokay.bin", DataType.raw)
	immutable(ubyte)[] sprTokay;
}

@ROMSource([0xE2536, 0xE262F][gameVersion], 0x20)
@Asset("data/gfx/common/flg_secret_for_linked_game.bin", DataType.raw)
immutable(ubyte)[] flgSecretForLinkedGame;

@ROMSource([0xC1BE6, 0xC241D][gameVersion], [0x6BF, 0x1F4][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tileset_cave_2.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetCave2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE2FF, 0x39)
	@Asset("data/gfx/" ~ game ~ "/flg_black_tower_stage_1.bin", DataType.raw)
	immutable(ubyte)[] flgBlackTowerStage1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB0E17, 0x1A2)
	@Asset("data/gfx/" ~ game ~ "/spr_subterror_1.bin", DataType.raw)
	immutable(ubyte)[] sprSubterror1;
}

@ROMSource([0xB0AB4, 0xB56D5][gameVersion], 0x1C4)
@Asset("data/gfx/common/spr_twinrova_8.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova8;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA9107, 0x200)
	@Asset("data/gfx/" ~ game ~ "/spr_hobos.bin", DataType.raw)
	immutable(ubyte)[] sprHobos;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB20B, 0x1CA)
	@Asset("data/gfx/" ~ game ~ "/spr_ralph_1.bin", DataType.raw)
	immutable(ubyte)[] sprRalph1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA5A51, 0x10E)
	@Asset("data/gfx/" ~ game ~ "/gfx_blurb_makupath.bin", DataType.raw)
	immutable(ubyte)[] gfxBlurbMakupath;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAD7D5, 0x190)
	@Asset("data/gfx/" ~ game ~ "/spr_mothula_2.bin", DataType.raw)
	immutable(ubyte)[] sprMothula2;
}

@ROMSource([0xA1224, 0xA5737][gameVersion], 0x35)
@Asset("data/gfx/common/map_inventory_textbar.bin", DataType.raw)
immutable(ubyte)[] mapInventoryTextbar;

@ROMSource([0xCA473, 0xC9A73][gameVersion], 0x185)
@Asset("data/gfx/common/spr_intro_link_close_frame_2.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkCloseFrame2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB046A, 0xF4)
	@Asset("data/gfx/" ~ game ~ "/spr_waterbubble.bin", DataType.raw)
	immutable(ubyte)[] sprWaterbubble;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE840, 0x28)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_scene2.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallScene2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB683B, 0x3B6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_winter_standard.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetWinterStandard;
}

@ROMSource([0xD0B9C, 0xD0754][gameVersion], [0x6F5, 0x6E8][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_link_with_oracle_and_twinrova_3.bin", DataType.raw)
immutable(ubyte)[] gfxLinkWithOracleAndTwinrova3;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBCB51, 0x1E2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_underwater_common_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetUnderwaterCommon1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB6CC6, 0x7A6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_castle_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCastle1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB0DB6, 0x61)
	@Asset("data/gfx/" ~ game ~ "/spr_pound.bin", DataType.raw)
	immutable(ubyte)[] sprPound;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xE39DC, 0xC9)
	@Asset("data/gfx/" ~ game ~ "/flg_dragononox_1.bin", DataType.raw)
	immutable(ubyte)[] flgDragononox1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC47BF, 0xAF)
	@Asset("data/gfx/" ~ game ~ "/map_intro_link_on_horse_front_bg.bin", DataType.raw)
	immutable(ubyte)[] mapIntroLinkOnHorseFrontBg;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB884, 0x1BE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_rolling_ridge_past_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetRollingRidgePast1;
}

@ROMSource([0xA1406, 0xA5915][gameVersion], 0x1F)
@Asset("data/gfx/common/map_unappraised_ring_list.bin", DataType.raw)
immutable(ubyte)[] mapUnappraisedRingList;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC3FCF, 0x45D)
	@Asset("data/gfx/" ~ game ~ "/spr_intro_link_on_horse_far.bin", DataType.raw)
	immutable(ubyte)[] sprIntroLinkOnHorseFar;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBAE0D, 0x17E)
	@Asset("data/gfx/" ~ game ~ "/gfx_pirate_ship_tiles_2.bin", DataType.raw)
	immutable(ubyte)[] gfxPirateShipTiles2;
}

@ROMSource([0xA1C23, 0xA6071][gameVersion], [0x133, 0x13B][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d5.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD5;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA352F, 0x19F)
	@Asset("data/gfx/" ~ game ~ "/map_holodrum_minimap.bin", DataType.raw)
	immutable(ubyte)[] mapHolodrumMinimap;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB3150, 0x2C1)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_background.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeBackground;
}

@ROMSource([0xA12DE, 0xA57F1][gameVersion], 0x93)
@Asset("data/gfx/common/map_inventory_screen_3.bin", DataType.raw)
immutable(ubyte)[] mapInventoryScreen3;

@ROMSource([0xE2394, 0xE248D][gameVersion], 0x2B)
@Asset("data/gfx/common/map_name_entry_bottom.bin", DataType.raw)
immutable(ubyte)[] mapNameEntryBottom;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB808E, 0x3BC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_castle_winter.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCastleWinter;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD5BB, 0x139)
	@Asset("data/gfx/" ~ game ~ "/spr_maku_child.bin", DataType.raw)
	immutable(ubyte)[] sprMakuChild;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBC466, 0x1E1)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosia3;
}

@ROMSource([0xA0C09, 0xA5048][gameVersion], [0x14E, 0x1CE][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_quest_items_3.bin", DataType.raw)
immutable(ubyte)[] sprQuestItems3;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE29B, 0x64)
	@Asset("data/gfx/" ~ game ~ "/map_black_tower_base.bin", DataType.raw)
	immutable(ubyte)[] mapBlackTowerBase;
}

@ROMSource([0xC9549, 0xC47BB][gameVersion], [0x1E, 0x04][gameVersion])
@Asset("data/gfx/"~ game ~"/map_intro_bar.bin", DataType.raw)
immutable(ubyte)[] mapIntroBar;

@ROMSource([0xCA1AC, 0xC97AC][gameVersion], 0xA2)
@Asset("data/gfx/common/spr_intro_link_mid_frame_4.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkMidFrame4;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB9664, 0x1D3)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_sunken_city.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSunkenCity;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBAD92, 0x1F0)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_talus_peaks_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTalusPeaks2;
}

@ROMSource([0xC9567, 0xC4899][gameVersion], [0x0E, 0x04][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_intro_bar.bin", DataType.raw)
immutable(ubyte)[] flgIntroBar;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB33B5, 0xAD)
	@Asset("data/gfx/" ~ game ~ "/spr_plasmarine_3.bin", DataType.raw)
	immutable(ubyte)[] sprPlasmarine3;
}

@ROMSource([0xB0397, 0xB4FB8][gameVersion], 0x1C5)
@Asset("data/gfx/common/spr_twinrova_3.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova3;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBD327, 0x12E)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_pirate_ship_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosiaPirateShip1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC102D, 0x5F5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_indoors_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetIndoors2;
}

@ROMSource([0xCA2F4, 0xC98F4][gameVersion], 0x17F)
@Asset("data/gfx/common/spr_intro_link_close_frame_1.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkCloseFrame1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD30D, 0x15B)
	@Asset("data/gfx/" ~ game ~ "/spr_makuadultsprites_1.bin", DataType.raw)
	immutable(ubyte)[] sprMakuadultsprites1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA8640, 0x16D)
	@Asset("data/gfx/" ~ game ~ "/spr_rollingplatform_d8stuff.bin", DataType.raw)
	immutable(ubyte)[] sprRollingplatformD8stuff;
}

@ROMSource([0x6AD40, 0x6ADA0][gameVersion], [0x80, 0x40][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_boomerang.bin", DataType.raw)
immutable(ubyte)[] sprBoomerang;

@ROMSource([0xD6737, 0xD606B][gameVersion], [0x15, 0x1B][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_scene4_top_rows.bin", DataType.raw)
immutable(ubyte)[] flgCreditsScene4TopRows;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBAAA4, 0x200)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_black_beast.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetBlackBeast;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBE6CE, 0x21E)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_poison_moths_lair.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetPoisonMothsLair;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3BC3, 0x9B)
	@Asset("data/gfx/" ~ game ~ "/spr_veranbeetle_wing.bin", DataType.raw)
	immutable(ubyte)[] sprVeranbeetleWing;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBC189, 0x2DD)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosia2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBBBF7, 0xFE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_rolling_ridge_past_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetRollingRidgePast3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB62AF, 0x2E6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_summer_standard.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSummerStandard;
}

@ROMSource([0xD9540, 0xD916C][gameVersion], [0x65, 0x62][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_linked_scene4.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedScene4;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC520F, 0x2A)
	@Asset("data/gfx/" ~ game ~ "/flg_intro_link_face_shot.bin", DataType.raw)
	immutable(ubyte)[] flgIntroLinkFaceShot;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB746C, 0x1B5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_castle_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCastle2;
}

@ROMSource([0xCFC68, 0xCFA28][gameVersion], [0x512, 0x2F0][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_link_with_oracle_and_twinrova_1.bin", DataType.raw)
immutable(ubyte)[] gfxLinkWithOracleAndTwinrova1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA9630, 0x15B)
	@Asset("data/gfx/" ~ game ~ "/spr_zz_bubble_exclamation_heart_kid.bin", DataType.raw)
	immutable(ubyte)[] sprZzBubbleExclamationHeartKid;
}

@ROMSource([0xE046C, 0xE056A][gameVersion], 0x1A3)
@Asset("data/gfx/common/gfx_pickafile.bin", DataType.raw)
immutable(ubyte)[] gfxPickafile;

@ROMSource([0xC2E3D, 0xC2DEC][gameVersion], 0xDC)
@Asset("data/gfx/common/gfx_dmg_text.bin", DataType.raw)
immutable(ubyte)[] gfxDMGText;

@ROMSource([0x6AAE0, 0x6AB40][gameVersion], 0x160)
@Asset("data/gfx/common/spr_ballandchain_likelike.bin", DataType.raw)
immutable(ubyte)[] sprBallandchainLikelike;

@ROMSource([0xC580D, 0xC616F][gameVersion], 0x5C4)
@Asset("data/gfx/common/gfx_link_on_horse_closeup_2.bin", DataType.raw)
immutable(ubyte)[] gfxLinkOnHorseCloseup2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCB303, 0x6C0)
	@Asset("data/gfx/" ~ game ~ "/gfx_din_dance_cutscene_2.bin", DataType.raw)
	immutable(ubyte)[] gfxDinDanceCutscene2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAC736, 0x1AB)
	@Asset("data/gfx/" ~ game ~ "/spr_carpenters.bin", DataType.raw)
	immutable(ubyte)[] sprCarpenters;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA6A50, 0x17B)
	@Asset("data/gfx/" ~ game ~ "/spr_nayru.bin", DataType.raw)
	immutable(ubyte)[] sprNayru;
}

@ROMSource([0xC3E3E, 0xC363A][gameVersion], 0x24B)
@Asset("data/gfx/common/spr_titlescreen_sprites.bin", DataType.raw)
immutable(ubyte)[] sprTitlescreenSprites;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC940A, 0xD1)
	@Asset("data/gfx/" ~ game ~ "/map_intro_link_riding_horse_2.bin", DataType.raw)
	immutable(ubyte)[] mapIntroLinkRidingHorse2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAA4D8, 0xF8)
	@Asset("data/gfx/" ~ game ~ "/spr_armmimic_spikedroller.bin", DataType.raw)
	immutable(ubyte)[] sprArmmimicSpikedroller;
}

@ROMSource([0x6DE20, 0x6DE20][gameVersion], 0xC00)
@Asset("data/gfx/common/spr_moosh.bin", DataType.raw)
immutable(ubyte)[] sprMoosh;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBA3F5, 0x1D3)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_tokay_island_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTokayIsland1;
}

@ROMSource([0xCA5F8, 0xC9BF8][gameVersion], 0x17E)
@Asset("data/gfx/common/spr_intro_link_close_frame_3.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkCloseFrame3;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBEB71, 0x215)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_spirits_grave.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSpiritsGrave;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB2823, 0x12D)
	@Asset("data/gfx/" ~ game ~ "/spr_smog_1.bin", DataType.raw)
	immutable(ubyte)[] sprSmog1;
}

@ROMSource([0xDB17F, 0xDAD97][gameVersion], 0x7D)
@Asset("data/gfx/common/flg_credits_bg.bin", DataType.raw)
immutable(ubyte)[] flgCreditsBg;

@ROMSource([0xCFBD6, 0xCF98E][gameVersion], [0x92, 0x9A][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_link_with_oracle.bin", DataType.raw)
immutable(ubyte)[] flgLinkWithOracle;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB99F, 0x1A7)
	@Asset("data/gfx/" ~ game ~ "/spr_syger_2.bin", DataType.raw)
	immutable(ubyte)[] sprSyger2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB2E7, 0x57)
	@Asset("data/gfx/" ~ game ~ "/flg_pirate_ship_body.bin", DataType.raw)
	immutable(ubyte)[] flgPirateShipBody;
}

@ROMSource([0xE20F5, 0xE21EE][gameVersion], 0x72)
@Asset("data/gfx/common/map_secret_entry_top.bin", DataType.raw)
immutable(ubyte)[] mapSecretEntryTop;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB9184, 0x1E4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_spool_swamp_south.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSpoolSwampSouth;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB17DD, 0x1DD)
	@Asset("data/gfx/" ~ game ~ "/spr_anglerfish.bin", DataType.raw)
	immutable(ubyte)[] sprAnglerfish;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC1A6B, 0x49A)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_cave_replacement_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCaveReplacement2;
}

@ROMSource([0xDFE64, 0xDFF62][gameVersion], 0x50E)
@Asset("data/gfx/common/gfx_fileselect.bin", DataType.raw)
immutable(ubyte)[] gfxFileselect;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xACB98, 0x1CB)
	@Asset("data/gfx/" ~ game ~ "/spr_aquamentus_5.bin", DataType.raw)
	immutable(ubyte)[] sprAquamentus5;
}

@ROMSource([0xB210D, 0xB6D2E][gameVersion], 0x200)
@Asset("data/gfx/common/spr_ganon_9.bin", DataType.raw)
immutable(ubyte)[] sprGanon9;

@ROMSource([0xA9F8A, 0xAF8E7][gameVersion], 0x137)
@Asset("data/gfx/common/spr_keese_firekeese_unknownbeams.bin", DataType.raw)
immutable(ubyte)[] sprKeeseFirekeeseUnknownbeams;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB069, 0x1A2)
	@Asset("data/gfx/" ~ game ~ "/spr_gorondance_tingle_write.bin", DataType.raw)
	immutable(ubyte)[] sprGorondanceTingleWrite;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE50A, 0x4B)
	@Asset("data/gfx/" ~ game ~ "/flg_black_tower_stage_2.bin", DataType.raw)
	immutable(ubyte)[] flgBlackTowerStage2;
}

@ROMSource([0xE060F, 0xE070D][gameVersion], 0x1A8)
@Asset("data/gfx/common/gfx_copywhatwhere.bin", DataType.raw)
immutable(ubyte)[] gfxCopywhatwhere;

@ROMSource([0xA1371, 0xA5884][gameVersion], [0x4B, 0x47][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_inventory_screen_3.bin", DataType.raw)
immutable(ubyte)[] flgInventoryScreen3;

@ROMSource([0xD84FD, 0xD717A][gameVersion], [0xE5, 0x124][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_linked_scene2.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedScene2;

@ROMSource([0xCEB44, 0xCE74F][gameVersion], [0x310, 0x285][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_link_with_oracle.bin", DataType.raw)
immutable(ubyte)[] sprLinkWithOracle;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9A3F, 0x15B)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_black_tower_outside_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetBlackTowerOutside2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC48E9, 0x4D6)
	@Asset("data/gfx/" ~ game ~ "/spr_intro_link_on_horse_front.bin", DataType.raw)
	immutable(ubyte)[] sprIntroLinkOnHorseFront;
}

@ROMSource([0xB11A6, 0xB5DC7][gameVersion], 0x17E)
@Asset("data/gfx/common/spr_ganon_2.bin", DataType.raw)
immutable(ubyte)[] sprGanon2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBF020, 0x232)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_explorers_crypt.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetExplorersCrypt;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC3E4B, 0xFA)
	@Asset("data/gfx/" ~ game ~ "/map_intro_link_on_horse_far.bin", DataType.raw)
	immutable(ubyte)[] mapIntroLinkOnHorseFar;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA3DA2, 0xA0)
	@Asset("data/gfx/" ~ game ~ "/flg_subrosia_minimap.bin", DataType.raw)
	immutable(ubyte)[] flgSubrosiaMinimap;
}

@ROMSource([0xDD18D, 0xDD291][gameVersion], 0x20D)
@Asset("data/gfx/common/map_credits_linked_waving_goodbye_1.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedWavingGoodbye1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB2EE4, 0x1C8)
	@Asset("data/gfx/" ~ game ~ "/spr_octogon_2.bin", DataType.raw)
	immutable(ubyte)[] sprOctogon2;
}

@ROMSource([0xD5B05, 0xD5488][gameVersion], [0x750, 0x6CE][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image3_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage31;

@ROMSource([0xB230D, 0xB6F2E][gameVersion], 0x1D4)
@Asset("data/gfx/common/spr_ganon_10.bin", DataType.raw)
immutable(ubyte)[] sprGanon10;

@ROMSource([0xC4619, 0xC3DE1][gameVersion], [0x68, 0x6A][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_titlescreen.bin", DataType.raw)
immutable(ubyte)[] flgTitlescreen;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC4F2B, 0x52)
	@Asset("data/gfx/" ~ game ~ "/flg_intro_link_riding_horse_1.bin", DataType.raw)
	immutable(ubyte)[] flgIntroLinkRidingHorse1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA40E0, 0xD1)
	@Asset("data/gfx/" ~ game ~ "/spr_conveyorplatform.bin", DataType.raw)
	immutable(ubyte)[] sprConveyorplatform;
}

@ROMSource([0xDDCE0, 0xDDDE4][gameVersion], 0x754)
@Asset("data/gfx/common/gfx_credits_linked_waving_goodbye_3.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedWavingGoodbye3;

@ROMSource([0xD6255, 0xD5B56][gameVersion], [0x4C9, 0x4F1][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image3_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage32;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA41B1, 0xFF)
	@Asset("data/gfx/" ~ game ~ "/spr_pedestal_ice.bin", DataType.raw)
	immutable(ubyte)[] sprPedestalIce;
}

@ROMSource([0xC5DD1, 0xC6733][gameVersion], 0x542)
@Asset("data/gfx/common/gfx_link_on_horse_closeup_3.bin", DataType.raw)
immutable(ubyte)[] gfxLinkOnHorseCloseup3;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB7DA8, 0x2E6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_castle_autumn.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCastleAutumn;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB251E, 0x1C)
	@Asset("data/gfx/" ~ game ~ "/spr_headthwomp_3.bin", DataType.raw)
	immutable(ubyte)[] sprHeadthwomp3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC8F00, 0x50A)
	@Asset("data/gfx/" ~ game ~ "/gfx_intro_link_riding_horse_3.bin", DataType.raw)
	immutable(ubyte)[] gfxIntroLinkRidingHorse3;
}

@ROMSource([0x63980, 0xDBD08][gameVersion], [0x4680, 0x4EC][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_credits_sprites_2.bin", DataType.raw)
immutable(ubyte)[] sprCreditsSprites2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAF7BD, 0x1E9)
	@Asset("data/gfx/" ~ game ~ "/spr_onox_1.bin", DataType.raw)
	immutable(ubyte)[] sprOnox1;
}

@ROMSource([0xE1ED1, 0xE1FCA][gameVersion], 0x35)
@Asset("data/gfx/common/map_file_menu_bottom.bin", DataType.raw)
immutable(ubyte)[] mapFileMenuBottom;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB652, 0x184)
	@Asset("data/gfx/" ~ game ~ "/spr_nayru_1.bin", DataType.raw)
	immutable(ubyte)[] sprNayru1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD351, 0xE7)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_jabu_jabu_outside_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetJabuJabuOutside3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA81ED, 0x165)
	@Asset("data/gfx/" ~ game ~ "/map_past_minimap.bin", DataType.raw)
	immutable(ubyte)[] mapPastMinimap;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB91C, 0x1C8)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_temple_of_seasons_outside_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTempleOfSeasonsOutside2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0x62400, 0x340)
	@Asset("data/gfx/" ~ game ~ "/gfx_animations_1.bin", DataType.raw)
	immutable(ubyte)[] gfxAnimations1;
}

@ROMSource([0xAF46C, 0xB48FB][gameVersion], 0x19F)
@Asset("data/gfx/common/spr_kingmoblin_4.bin", DataType.raw)
immutable(ubyte)[] sprKingmoblin4;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD597, 0x10E)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_ambis_palace_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetAmbisPalace1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD01C, 0xD5)
	@Asset("data/gfx/" ~ game ~ "/spr_jabuchild.bin", DataType.raw)
	immutable(ubyte)[] sprJabuchild;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB0A2, 0x7B)
	@Asset("data/gfx/" ~ game ~ "/spr_gleeok_flames.bin", DataType.raw)
	immutable(ubyte)[] sprGleeokFlames;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB09E8, 0x154)
	@Asset("data/gfx/" ~ game ~ "/spr_giantghini_1.bin", DataType.raw)
	immutable(ubyte)[] sprGiantghini1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB210, 0x18E)
	@Asset("data/gfx/" ~ game ~ "/spr_omuai_1.bin", DataType.raw)
	immutable(ubyte)[] sprOmuai1;
}

@ROMSource([0xD168D, 0xD12AB][gameVersion], 0x579)
@Asset("data/gfx/common/gfx_twinrova_closeup_1.bin", DataType.raw)
immutable(ubyte)[] gfxTwinrovaCloseup1;

@ROMSource([0xC4089, 0xC3885][gameVersion], [0x319, 0x2E5][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_titlescreen_1.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreen1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBED86, 0x1D7)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_wing_dungeon.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetWingDungeon;
}

@ROMSource([0xD6885, 0xD61DB][gameVersion], 0x9E)
@Asset("data/gfx/common/spr_credits_font_music.bin", DataType.raw)
immutable(ubyte)[] sprCreditsFontMusic;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB8FCF, 0x1B5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_poison_moths_lair_entrance.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetPoisonMothsLairEntrance;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBD5D8, 0x277)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_heros_cave.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetHerosCave;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67ED5, 0x10)
	@Asset("data/gfx/" ~ game ~ "/flg_ancient_tomb_wall_retraction.bin", DataType.raw)
	immutable(ubyte)[] flgAncientTombWallRetraction;
}

@ROMSource([0xE1D98, 0xE1E91][gameVersion], 0x6D)
@Asset("data/gfx/common/map_file_menu_top.bin", DataType.raw)
immutable(ubyte)[] mapFileMenuTop;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB8CC7, 0x4EC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_overworld_past.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOverworldPast;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA2A11, 0x5C5)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_holodrum_2.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesHolodrum2;
}

@ROMSource([0xB00F3, 0xB4D14][gameVersion], 0x13B)
@Asset("data/gfx/common/spr_twinrova_1.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova1;

@ROMSource([0xE0832, 0xE0930][gameVersion], 0x4DA)
@Asset("data/gfx/common/gfx_newfilescreen.bin", DataType.raw)
immutable(ubyte)[] gfxNewfilescreen;

@ROMSource([0xDFDE1, 0xDFEDF][gameVersion], 0x83)
@Asset("data/gfx/common/gfx_erase.bin", DataType.raw)
immutable(ubyte)[] gfxErase;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB9368, 0x13B)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_tarm_ruins_entrance.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTarmRuinsEntrance;
}

@ROMSource([0xE22D6, 0xE23CF][gameVersion], 0x2C)
@Asset("data/gfx/common/map_secret_entry_error.bin", DataType.raw)
immutable(ubyte)[] mapSecretEntryError;

@ROMSource([0xD7FBE, 0xD7C23][gameVersion], 0x53F)
@Asset("data/gfx/common/gfx_credits_linked_image2_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage22;

@ROMSource([0xA1FEB, 0xA644D][gameVersion], [0x199, 0x13C][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d8.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD8;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA3E42, 0x12E)
	@Asset("data/gfx/" ~ game ~ "/spr_spinner_trampoline.bin", DataType.raw)
	immutable(ubyte)[] sprSpinnerTrampoline;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBA8C6, 0x1DC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_symmetry_city_ruined_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSymmetryCityRuined1;
}

@ROMSource([0xDA36F, 0xD9F87][gameVersion], 0x704)
@Asset("data/gfx/common/gfx_credits_linked_image3_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage31;

@ROMSource([0xD74FD, 0xD8162][gameVersion], [0x124, 0xC3][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_linked_scene1.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedScene1;

@ROMSource([0xD3A32, 0xD365E][gameVersion], [0x6BA, 0x74F][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image1_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage11;

@ROMSource([0xD148A, 0xD1061][gameVersion], [0x175, 0x191][gameVersion])
@Asset("data/gfx/"~ game ~"/map_link_with_oracle_and_twinrova_2.bin", DataType.raw)
immutable(ubyte)[] mapLinkWithOracleAndTwinrova2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67E0A, 0x2F)
	@Asset("data/gfx/" ~ game ~ "/map_wing_dungeon_collapsing_1.bin", DataType.raw)
	immutable(ubyte)[] mapWingDungeonCollapsing1;
}

@ROMSource([0xC8323, 0xC8C88][gameVersion], 0xC6)
@Asset("data/gfx/common/map_titlescreen_scroll_2.bin", DataType.raw)
immutable(ubyte)[] mapTitlescreenScroll2;

@ROMSource([0xC6801, 0xC7163][gameVersion], 0x3C1)
@Asset("data/gfx/common/gfx_titlescreen_5.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreen5;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAE781, 0x1BD)
	@Asset("data/gfx/" ~ game ~ "/spr_gleeok_1.bin", DataType.raw)
	immutable(ubyte)[] sprGleeok1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA4598, 0x17D)
	@Asset("data/gfx/" ~ game ~ "/spr_map_compass_keys_bookofseals.bin", DataType.raw)
	immutable(ubyte)[] sprMapCompassKeysBookofseals;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB4F9A, 0x87)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_natzu_prairie.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetNatzuPrairie;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB3E8F, 0x45)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_top_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeTop1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB08FF, 0xE9)
	@Asset("data/gfx/" ~ game ~ "/spr_fireballs.bin", DataType.raw)
	immutable(ubyte)[] sprFireballs;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA75DD, 0x181)
	@Asset("data/gfx/" ~ game ~ "/spr_maku_tree_2.bin", DataType.raw)
	immutable(ubyte)[] sprMakuTree2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA95C5, 0x161)
	@Asset("data/gfx/" ~ game ~ "/spr_zol_peahat_watertektite_moldorm.bin", DataType.raw)
	immutable(ubyte)[] sprZolPeahatWatertektiteMoldorm;
}

@ROMSource([0x6A2E0, 0x6A2E0][gameVersion], [0x1A0, 0x200][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_dungeon_sprites.bin", DataType.raw)
immutable(ubyte)[] sprDungeonSprites;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB2AB5, 0x200)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_gnarled_root_entrance_opened.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetGnarledRootEntranceOpened;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB4B4E, 0x44C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_small_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeSmall2;
}

@ROMSource([0xC9FC0, 0xC95C0][gameVersion], 0xA0)
@Asset("data/gfx/common/spr_intro_link_mid_frame_1.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkMidFrame1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCB866, 0x65B)
	@Asset("data/gfx/" ~ game ~ "/gfx_nayru_singing_cutscene_1.bin", DataType.raw)
	immutable(ubyte)[] gfxNayruSingingCutscene1;
}

@ROMSource([0xB3110, 0xB755D][gameVersion], 0x2B)
@Asset("data/gfx/common/gfx_sand.bin", DataType.raw)
immutable(ubyte)[] gfxSand;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB0B3C, 0x132)
	@Asset("data/gfx/" ~ game ~ "/spr_giantghini_2.bin", DataType.raw)
	immutable(ubyte)[] sprGiantghini2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB24E1, 0x165)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_gnarled_root_entrance_closed.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetGnarledRootEntranceClosed;
}

@ROMSource([0xE1328, 0xE1426][gameVersion], 0x195)
@Asset("data/gfx/common/gfx_secret_thatswrong.bin", DataType.raw)
immutable(ubyte)[] gfxSecretThatswrong;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAC4B2, 0x1C1)
	@Asset("data/gfx/" ~ game ~ "/spr_aquamentus_1.bin", DataType.raw)
	immutable(ubyte)[] sprAquamentus1;
}

@ROMSource([0xCF178, 0xCF09D][gameVersion], [0x5D3, 0x538][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_link_with_oracle_2.bin", DataType.raw)
immutable(ubyte)[] gfxLinkWithOracle2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xABDD5, 0x18A)
	@Asset("data/gfx/" ~ game ~ "/spr_poe_sisters_2.bin", DataType.raw)
	immutable(ubyte)[] sprPoeSisters2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCC7EB, 0xBF)
	@Asset("data/gfx/" ~ game ~ "/flg_nayru_singing_cutscene.bin", DataType.raw)
	immutable(ubyte)[] flgNayruSingingCutscene;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xE3AA5, 0x94)
	@Asset("data/gfx/" ~ game ~ "/map_dragononox_2.bin", DataType.raw)
	immutable(ubyte)[] mapDragononox2;
}

@ROMSource([0x6FA20, 0x64400][gameVersion], 0x200)
@Asset("data/gfx/common/spr_item_icons_3.bin", DataType.raw)
immutable(ubyte)[] sprItemIcons3;

@ROMSource([0x62940, 0x64600][gameVersion], [0x1000, 0x400][gameVersion])
@Asset("data/gfx/" ~ game ~ "/gfx_animations_3.bin", DataType.raw)
immutable(ubyte)[] gfxAnimations3;

@ROMSource([0xB06D5, 0xB52F6][gameVersion], 0x200)
@Asset("data/gfx/common/spr_twinrova_6.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova6;

@ROMSource([0xB1CAA, 0xB68CB][gameVersion], 0x111)
@Asset("data/gfx/common/spr_ganon_6.bin", DataType.raw)
immutable(ubyte)[] sprGanon6;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE967, 0xCC)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_scene4.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallScene4;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA5CB9, 0x185)
	@Asset("data/gfx/" ~ game ~ "/spr_guruguru.bin", DataType.raw)
	immutable(ubyte)[] sprGuruguru;
}

@ROMSource([0xCCE70, 0xCB146][gameVersion], 0x493)
@Asset("data/gfx/common/gfx_intro_outside_castle_3.bin", DataType.raw)
immutable(ubyte)[] gfxIntroOutsideCastle3;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBF8E8, 0x331)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_onox_castle.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOnoxCastle;
}

@ROMSource([0xDA05D, 0xD9C86][gameVersion], [0x103, 0xFD][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_linked_scene3.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedScene3;

@ROMSource([0xE24AB, 0xE25A4][gameVersion], 0x8B)
@Asset("data/gfx/common/map_secret_for_linked_game.bin", DataType.raw)
immutable(ubyte)[] mapSecretForLinkedGame;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBCD33, 0x200)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_underwater_common_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetUnderwaterCommon2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3720, 0x1A8)
	@Asset("data/gfx/" ~ game ~ "/spr_nayru_ambi_possessed.bin", DataType.raw)
	immutable(ubyte)[] sprNayruAmbiPossessed;
}

@ROMSource([0xA9056, 0xAEBF6][gameVersion], 0x1A8)
@Asset("data/gfx/common/spr_crab_fish_goponga_beetle.bin", DataType.raw)
immutable(ubyte)[] sprCrabFishGopongaBeetle;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCDB76, 0x63E)
	@Asset("data/gfx/" ~ game ~ "/gfx_black_tower_scene_4.bin", DataType.raw)
	immutable(ubyte)[] gfxBlackTowerScene4;
}

@ROMSource([0xD7824, 0xD7489][gameVersion], 0x2F)
@Asset("data/gfx/common/flg_credits_linked_image2.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedImage2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAA8CF, 0x150)
	@Asset("data/gfx/" ~ game ~ "/spr_facade.bin", DataType.raw)
	immutable(ubyte)[] sprFacade;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB1B16, 0x18D)
	@Asset("data/gfx/" ~ game ~ "/spr_bluestalfos_2.bin", DataType.raw)
	immutable(ubyte)[] sprBluestalfos2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB5CD1, 0x1C0)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_overworld_standard_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOverworldStandard2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBAC95, 0xE2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_symmetry_city_ruined_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSymmetryCityRuined3;
}

@ROMSource([0xA8769, 0xAE309][gameVersion], 0x1AB)
@Asset("data/gfx/common/spr_flame.bin", DataType.raw)
immutable(ubyte)[] sprFlame;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB26EE, 0x135)
	@Asset("data/gfx/" ~ game ~ "/spr_shadowhag_2.bin", DataType.raw)
	immutable(ubyte)[] sprShadowhag2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD6A5, 0x184)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_ambis_palace_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetAmbisPalace2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xABCA7, 0x12E)
	@Asset("data/gfx/" ~ game ~ "/spr_poe_sisters_1.bin", DataType.raw)
	immutable(ubyte)[] sprPoeSisters1;
}

@ROMSource([0x6F820, 0x64200][gameVersion], 0x200)
@Asset("data/gfx/common/spr_item_icons_2.bin", DataType.raw)
immutable(ubyte)[] sprItemIcons2;

@ROMSource([0xDEB50, 0xDEC54][gameVersion], 0x120)
@Asset("data/gfx/common/map_credits_linked_theend.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedTheend;

@ROMSource([0xDB9E6, 0xDB5FE][gameVersion], 0x70A)
@Asset("data/gfx/common/gfx_credits_bg_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsBg2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC977F, 0x547)
	@Asset("data/gfx/" ~ game ~ "/spr_intro_horse_close.bin", DataType.raw)
	immutable(ubyte)[] sprIntroHorseClose;
}

@ROMSource([0xD313A, 0xD2D67][gameVersion], [0xA0, 0x9B][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_gametitle.bin", DataType.raw)
immutable(ubyte)[] mapCreditsGametitle;

@ROMSource([0xE1C0E, 0xE1D07][gameVersion], 0x18A)
@Asset("data/gfx/common/gfx_error.bin", DataType.raw)
immutable(ubyte)[] gfxError;

@ROMSource([0xA1215, 0xA5728][gameVersion], 0x0F)
@Asset("data/gfx/common/flg_inventory_screen_1.bin", DataType.raw)
immutable(ubyte)[] flgInventoryScreen1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB1D70, 0x19E)
	@Asset("data/gfx/" ~ game ~ "/spr_pumpkinhead_1.bin", DataType.raw)
	immutable(ubyte)[] sprPumpkinhead1;
}

@ROMSource([0xA9A08, 0xAF31B][gameVersion], 0xF7)
@Asset("data/gfx/common/spr_giantcucco.bin", DataType.raw)
immutable(ubyte)[] sprGiantcucco;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC3910, 0x101)
	@Asset("data/gfx/" ~ game ~ "/map_jp_intro_screen_1.bin", DataType.raw)
	immutable(ubyte)[] mapJpIntroScreen1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA84F5, 0x161)
	@Asset("data/gfx/" ~ game ~ "/spr_pirate_ship.bin", DataType.raw)
	immutable(ubyte)[] sprPirateShip;
}

@ROMSource([0xDE434, 0xDE538][gameVersion], 0x71C)
@Asset("data/gfx/common/gfx_credits_linked_waving_goodbye_4.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedWavingGoodbye4;

@ROMSource([0xA1278, 0xA578B][gameVersion], 0x0D)
@Asset("data/gfx/common/flg_hud_normal.bin", DataType.raw)
immutable(ubyte)[] flgHudNormal;

@ROMSource([0xE1889, 0xE1982][gameVersion], 0x190)
@Asset("data/gfx/common/gfx_linking.bin", DataType.raw)
immutable(ubyte)[] gfxLinking;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC94DB, 0x6E)
	@Asset("data/gfx/" ~ game ~ "/flg_intro_link_riding_horse_2.bin", DataType.raw)
	immutable(ubyte)[] flgIntroLinkRidingHorse2;
}

@ROMSource([0xDC820, 0xDC924][gameVersion], 0x49)
@Asset("data/gfx/common/flg_credits_theend.bin", DataType.raw)
immutable(ubyte)[] flgCreditsTheend;

@ROMSource([0xD879C, 0xD83C8][gameVersion], 0x24)
@Asset("data/gfx/common/flg_credits_linked_image1.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedImage1;

@ROMSource([0xC8657, 0xC8FBC][gameVersion], 0xB4)
@Asset("data/gfx/common/flg_titlescreen_scroll_1.bin", DataType.raw)
immutable(ubyte)[] flgTitlescreenScroll1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA8F39, 0x1CE)
	@Asset("data/gfx/" ~ game ~ "/spr_mailman_wiseman.bin", DataType.raw)
	immutable(ubyte)[] sprMailmanWiseman;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAD670, 0x165)
	@Asset("data/gfx/" ~ game ~ "/spr_mothula_1.bin", DataType.raw)
	immutable(ubyte)[] sprMothula1;
}

@ROMSource([0xD378D, 0xD33C1][gameVersion], [0x18, 0x28][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_scene1_top_rows.bin", DataType.raw)
immutable(ubyte)[] mapCreditsScene1TopRows;

@ROMSource([0xD21D5, 0xD1DA4][gameVersion], [0x6AB, 0x6A4][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_makutree_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsMakutree1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB43D, 0x05)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_symmetry_city_restored_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSymmetryCityRestored3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCD466, 0x710)
	@Asset("data/gfx/" ~ game ~ "/gfx_black_tower_scene_3.bin", DataType.raw)
	immutable(ubyte)[] gfxBlackTowerScene3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA7D12, 0x128)
	@Asset("data/gfx/" ~ game ~ "/spr_windmill_l2sword.bin", DataType.raw)
	immutable(ubyte)[] sprWindmillL2sword;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA6589, 0x143)
	@Asset("data/gfx/" ~ game ~ "/gfx_blurb_blacktowerturret.bin", DataType.raw)
	immutable(ubyte)[] gfxBlurbBlacktowerturret;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB2911, 0x1A4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_gnarled_root_entrance_opening_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetGnarledRootEntranceOpening3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBC647, 0x1D6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_4.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosia4;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBBE5A, 0x32F)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_temple_of_seasons_outside_4.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTempleOfSeasonsOutside4;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB26F, 0x1CE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_symmetry_city_restored_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSymmetryCityRestored2;
}

@ROMSource([0xC74D8, 0xC7E3A][gameVersion], 0x5DF)
@Asset("data/gfx/common/gfx_titlescreen_tree_1.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreenTree1;

@ROMSource([0xDB1FC, 0xDAE14][gameVersion], 0x11D)
@Asset("data/gfx/common/spr_credits_sprites_1.bin", DataType.raw)
immutable(ubyte)[] sprCreditsSprites1;

@ROMSource([0xE1F7D, 0xE2076][gameVersion], 0x78)
@Asset("data/gfx/common/map_file_menu_copy.bin", DataType.raw)
immutable(ubyte)[] mapFileMenuCopy;

@ROMSource([0xA14A0, 0xA59AF][gameVersion], 0x36)
@Asset("data/gfx/common/flg_appraised_ring_list.bin", DataType.raw)
immutable(ubyte)[] flgAppraisedRingList;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAAA16, 0x18F)
	@Asset("data/gfx/" ~ game ~ "/spr_vasu_snake_deadbunny.bin", DataType.raw)
	immutable(ubyte)[] sprVasuSnakeDeadbunny;
}

@ROMSource([0xA0786, 0xA4B90][gameVersion], [0x174, 0x169][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_essences.bin", DataType.raw)
immutable(ubyte)[] sprEssences;

@ROMSource([0xA08FA, 0xA4CF9][gameVersion], [0x14D, 0x189][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_quest_items_1.bin", DataType.raw)
immutable(ubyte)[] sprQuestItems1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA5E3E, 0x195)
	@Asset("data/gfx/" ~ game ~ "/spr_vasu_floodgatekeeper.bin", DataType.raw)
	immutable(ubyte)[] sprVasuFloodgatekeeper;
}

@ROMSource([0xA52BE, 0xA9AFD][gameVersion], [0x1B9, 0x1B7][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_bipsom_1.bin", DataType.raw)
immutable(ubyte)[] sprBipsom1;

@ROMSource([0xD1C06, 0xD1824][gameVersion], 0x26C)
@Asset("data/gfx/common/gfx_twinrova_closeup_2.bin", DataType.raw)
immutable(ubyte)[] gfxTwinrovaCloseup2;

@ROMSource([0xAAB5A, 0xB02A9][gameVersion], 0x102)
@Asset("data/gfx/common/spr_thwomps.bin", DataType.raw)
immutable(ubyte)[] sprThwomps;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA739A, 0x165)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_present_2.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesPresent2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA9E86, 0x195)
	@Asset("data/gfx/" ~ game ~ "/spr_lady_butterfly_pickaxeworker.bin", DataType.raw)
	immutable(ubyte)[] sprLadyButterflyPickaxeworker;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE374, 0xCB)
	@Asset("data/gfx/" ~ game ~ "/map_black_tower_stage_2.bin", DataType.raw)
	immutable(ubyte)[] mapBlackTowerStage2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB028, 0x81)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_pirate_ship_moving_extra_tiles.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetPirateShipMovingExtraTiles;
}

@ROMSource([0xE07B7, 0xE08B5][gameVersion], 0x7B)
@Asset("data/gfx/common/gfx_quit_2.bin", DataType.raw)
immutable(ubyte)[] gfxQuit2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAEA7E, 0x1B6)
	@Asset("data/gfx/" ~ game ~ "/spr_medusahead_1.bin", DataType.raw)
	immutable(ubyte)[] sprMedusahead1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xADA7A, 0x10E)
	@Asset("data/gfx/" ~ game ~ "/spr_timeportal.bin", DataType.raw)
	immutable(ubyte)[] sprTimeportal;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB605, 0x4D)
	@Asset("data/gfx/" ~ game ~ "/spr_farore_1.bin", DataType.raw)
	immutable(ubyte)[] sprFarore1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA6BCB, 0x16F)
	@Asset("data/gfx/" ~ game ~ "/spr_farore_ralph.bin", DataType.raw)
	immutable(ubyte)[] sprFaroreRalph;
}

@ROMSource([0xD8678, 0xD82A4][gameVersion], 0x124)
@Asset("data/gfx/common/map_credits_linked_image1.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedImage1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBA154, 0x1E2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_ancient_ruins_entrance.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetAncientRuinsEntrance;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCD636, 0x12C)
	@Asset("data/gfx/" ~ game ~ "/map_outside_onox_castle.bin", DataType.raw)
	immutable(ubyte)[] mapOutsideOnoxCastle;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCD5E2, 0x54)
	@Asset("data/gfx/" ~ game ~ "/flg_inside_onox_castle.bin", DataType.raw)
	immutable(ubyte)[] flgInsideOnoxCastle;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE7CC, 0x74)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_scene2.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallScene2;
}

@ROMSource([0xD96E4, 0xD930D][gameVersion], 0x587)
@Asset("data/gfx/common/gfx_credits_linked_image4_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage41;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA775E, 0xA9)
	@Asset("data/gfx/" ~ game ~ "/spr_maku_tree_3.bin", DataType.raw)
	immutable(ubyte)[] sprMakuTree3;
}

@ROMSource([0xD59B7, 0xD5330][gameVersion], [0x2B, 0x35][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_image3.bin", DataType.raw)
immutable(ubyte)[] flgCreditsImage3;

@ROMSource([0xA7191, 0xACEF3][gameVersion], 0x129)
@Asset("data/gfx/common/spr_zelda_2.bin", DataType.raw)
immutable(ubyte)[] sprZelda2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCDD79, 0x2BA)
	@Asset("data/gfx/" ~ game ~ "/gfx_templefall_background_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTemplefallBackground2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA8188, 0x1D0)
	@Asset("data/gfx/" ~ game ~ "/spr_lightning_moblincannon_makubranch.bin", DataType.raw)
	immutable(ubyte)[] sprLightningMoblincannonMakubranch;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCAA03, 0x2E8)
	@Asset("data/gfx/" ~ game ~ "/spr_din_dance_cutscene.bin", DataType.raw)
	immutable(ubyte)[] sprDinDanceCutscene;
}

@ROMSource([0xA11FE, 0xA5711][gameVersion], 0x17)
@Asset("data/gfx/common/map_inventory_screen_1.bin", DataType.raw)
immutable(ubyte)[] mapInventoryScreen1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA3775, 0x52F)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_subrosia.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesSubrosia;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE700, 0x31)
	@Asset("data/gfx/" ~ game ~ "/map_black_tower_stage_3_top.bin", DataType.raw)
	immutable(ubyte)[] mapBlackTowerStage3Top;
}

@ROMSource([0xD13E5, 0xD0FA2][gameVersion], [0xA5, 0xBF][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_link_with_oracle_and_twinrova_1.bin", DataType.raw)
immutable(ubyte)[] flgLinkWithOracleAndTwinrova1;

@ROMSource([0xC3E20, 0xC361C][gameVersion], 0x1E)
@Asset("data/gfx/common/flg_capcom_nintendo.bin", DataType.raw)
immutable(ubyte)[] flgCapcomNintendo;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xABC32, 0x181)
	@Asset("data/gfx/" ~ game ~ "/spr_goronelder_raft.bin", DataType.raw)
	immutable(ubyte)[] sprGoronelderRaft;
}

@ROMSource([0xC0644, 0xC093A][gameVersion], [0x501, 0x4A5][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tileset_sidescroll_2.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetSidescroll2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB88C3, 0x1CD)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_onox_castle_outside_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOnoxCastleOutside2;
}

@ROMSource([0xA193E, 0xA5DE7][gameVersion], [0x15D, 0x14C][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d3.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD3;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB50E4, 0x100)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_natzu_wasteland.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetNatzuWasteland;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB19BA, 0x15C)
	@Asset("data/gfx/" ~ game ~ "/spr_bluestalfos_1.bin", DataType.raw)
	immutable(ubyte)[] sprBluestalfos1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB0CF, 0xFE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_talus_peaks_past_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTalusPeaksPast3;
}

@ROMSource([0xD1FA2, 0xD1BC0][gameVersion], 0x43)
@Asset("data/gfx/common/flg_twinrova_closeup.bin", DataType.raw)
immutable(ubyte)[] flgTwinrovaCloseup;

@ROMSource([0xA0A47, 0xA4E82][gameVersion], [0x1C2, 0x1C6][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_quest_items_2.bin", DataType.raw)
immutable(ubyte)[] sprQuestItems2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAD2C2, 0x1E8)
	@Asset("data/gfx/" ~ game ~ "/spr_king_dodongo_4.bin", DataType.raw)
	immutable(ubyte)[] sprKingDodongo4;
}

@ROMSource([0xB313B, 0xB7588][gameVersion], 0x15)
@Asset("data/gfx/common/gfx_dirt.bin", DataType.raw)
immutable(ubyte)[] gfxDirt;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCCF44, 0x2E1)
	@Asset("data/gfx/" ~ game ~ "/gfx_black_tower_scene_2.bin", DataType.raw)
	immutable(ubyte)[] gfxBlackTowerScene2;
}

@ROMSource([0xC3A19, 0xC3215][gameVersion], 0x392)
@Asset("data/gfx/common/gfx_capcom_nintendo.bin", DataType.raw)
immutable(ubyte)[] gfxCapcomNintendo;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB253A, 0x1B4)
	@Asset("data/gfx/" ~ game ~ "/spr_shadowhag_1.bin", DataType.raw)
	immutable(ubyte)[] sprShadowhag1;
}

@ROMSource([0xA79E5, 0xAD6FA][gameVersion], 0x17B)
@Asset("data/gfx/common/spr_din_1.bin", DataType.raw)
immutable(ubyte)[] sprDin1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xABA61, 0x1D1)
	@Asset("data/gfx/" ~ game ~ "/spr_oldzora_cheval.bin", DataType.raw)
	immutable(ubyte)[] sprOldzoraCheval;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBF350, 0x1C4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_crown_dungeon.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCrownDungeon;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB42C7, 0x114)
	@Asset("data/gfx/" ~ game ~ "/spr_spiderbeeveran_2.bin", DataType.raw)
	immutable(ubyte)[] sprSpiderbeeveran2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB7D6, 0x176)
	@Asset("data/gfx/" ~ game ~ "/spr_nayru_2.bin", DataType.raw)
	immutable(ubyte)[] sprNayru2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC2D71, 0x7B)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_zora_palace_replacement_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetZoraPalaceReplacement2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAA836, 0x1E0)
	@Asset("data/gfx/" ~ game ~ "/spr_bunny_parrot.bin", DataType.raw)
	immutable(ubyte)[] sprBunnyParrot;
}

@ROMSource([0xD674C, 0xD6086][gameVersion], [0x124, 0x11F][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_image4.bin", DataType.raw)
immutable(ubyte)[] mapCreditsImage4;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB844A, 0xD5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_castle_winter_tree_replacement.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCastleWinterTreeReplacement;
}

@ROMSource([0xE1F13, 0xE200C][gameVersion], 0x51)
@Asset("data/gfx/common/map_file_menu_message_speed.bin", DataType.raw)
immutable(ubyte)[] mapFileMenuMessageSpeed;

@ROMSource([0xD7853, 0xD74B8][gameVersion], 0x76B)
@Asset("data/gfx/common/gfx_credits_linked_image2_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage21;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9879, 0xEC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_yoll_graveyard_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetYollGraveyard3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC48D2, 0x17)
	@Asset("data/gfx/" ~ game ~ "/flg_intro_link_on_horse_front_ground.bin", DataType.raw)
	immutable(ubyte)[] flgIntroLinkOnHorseFrontGround;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAC673, 0x1DE)
	@Asset("data/gfx/" ~ game ~ "/spr_aquamentus_2.bin", DataType.raw)
	immutable(ubyte)[] sprAquamentus2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE43F, 0xCB)
	@Asset("data/gfx/" ~ game ~ "/map_black_tower_middle.bin", DataType.raw)
	immutable(ubyte)[] mapBlackTowerMiddle;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBC1AE, 0x4B8)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_underwater_present.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetUnderwaterPresent;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xE3828, 0x1B4)
	@Asset("data/gfx/" ~ game ~ "/map_dragononox_1.bin", DataType.raw)
	immutable(ubyte)[] mapDragononox1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCB62E, 0x238)
	@Asset("data/gfx/" ~ game ~ "/spr_nayru_singing_cutscene.bin", DataType.raw)
	immutable(ubyte)[] sprNayruSingingCutscene;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xADF14, 0x197)
	@Asset("data/gfx/" ~ game ~ "/spr_digdogger_1.bin", DataType.raw)
	immutable(ubyte)[] sprDigdogger1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB77F, 0x91)
	@Asset("data/gfx/" ~ game ~ "/spr_agahnim_3.bin", DataType.raw)
	immutable(ubyte)[] sprAgahnim3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB8E29, 0x1A6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_snakes_remains_entrance.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSnakesRemainsEntrance;
}

@ROMSource([0xA23A0, 0xA6919][gameVersion], [0x4E1, 0x4BE][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_minimap_icons.bin", DataType.raw)
immutable(ubyte)[] sprMinimapIcons;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB7DF4, 0x48F)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_top.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeTop;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB11BE, 0x184)
	@Asset("data/gfx/" ~ game ~ "/spr_armoswarrior.bin", DataType.raw)
	immutable(ubyte)[] sprArmoswarrior;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAE101, 0xFF)
	@Asset("data/gfx/" ~ game ~ "/spr_fountain.bin", DataType.raw)
	immutable(ubyte)[] sprFountain;
}

@ROMSource([0x9FBF2, 0xA3F3B][gameVersion], 0x377)
@Asset("data/gfx/common/spr_common_sprites.bin", DataType.raw)
immutable(ubyte)[] sprCommonSprites;

@ROMSource([0xD1E72, 0xD1A90][gameVersion], 0x130)
@Asset("data/gfx/common/map_twinrova_closeup.bin", DataType.raw)
immutable(ubyte)[] mapTwinrovaCloseup;

@ROMSource([0xA1285, 0xA5798][gameVersion], 0x10)
@Asset("data/gfx/common/map_hud_extra_hearts.bin", DataType.raw)
immutable(ubyte)[] mapHudExtraHearts;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB5B9, 0x1C6)
	@Asset("data/gfx/" ~ game ~ "/spr_agahnim_2.bin", DataType.raw)
	immutable(ubyte)[] sprAgahnim2;
}

@ROMSource([0x68000, 0x68000][gameVersion], 0x22E0)
@Asset("data/gfx/common/spr_link.bin", DataType.raw)
immutable(ubyte)[] sprLink;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCD7DE, 0x59B)
	@Asset("data/gfx/" ~ game ~ "/gfx_templefall_background_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTemplefallBackground1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBEF5D, 0x1DC)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_moonlit_grotto.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMoonlitGrotto;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA6763, 0x1A8)
	@Asset("data/gfx/" ~ game ~ "/spr_troupe.bin", DataType.raw)
	immutable(ubyte)[] sprTroupe;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC469D, 0x11E)
	@Asset("data/gfx/" ~ game ~ "/gfx_intro_link_on_horse_far_bg_2.bin", DataType.raw)
	immutable(ubyte)[] gfxIntroLinkOnHorseFarBg2;
}

@ROMSource([0xD30C3, 0xD2CF8][gameVersion], [0x77, 0x6F][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_makutree.bin", DataType.raw)
immutable(ubyte)[] flgCreditsMakutree;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9330, 0x1B2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_lynna_city_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetLynnaCity2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB1F0E, 0x198)
	@Asset("data/gfx/" ~ game ~ "/spr_pumpkinhead_2.bin", DataType.raw)
	immutable(ubyte)[] sprPumpkinhead2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCEAE9, 0x36)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_scene7.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallScene7;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB555D, 0x774)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_overworld_standard_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOverworldStandard1;
}

@ROMSource([0xDFBBC, 0xDFCBA][gameVersion], 0x1A3)
@Asset("data/gfx/common/gfx_pickafile_2.bin", DataType.raw)
immutable(ubyte)[] gfxPickafile2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBA6E7, 0x1D7)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_western_coast.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetWesternCoast;
}

@ROMSource([0xB05F5, 0xB5216][gameVersion], 0xE0)
@Asset("data/gfx/common/spr_twinrova_5.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova5;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC2DDD, 0x60)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_indoors_replacement.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosiaIndoorsReplacement;
}

@ROMSource([0xD4994, 0xD4430][gameVersion], 0xE8)
@Asset("data/gfx/common/spr_credits_font_nakanowatari.bin", DataType.raw)
immutable(ubyte)[] sprCreditsFontNakanowatari;

@ROMSource([0xD37BA, 0xD33F9][gameVersion], [0x12B, 0x123][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_image1.bin", DataType.raw)
immutable(ubyte)[] mapCreditsImage1;

@ROMSource([0xB0FA6, 0xB5BC7][gameVersion], 0x200)
@Asset("data/gfx/common/spr_ganon_1.bin", DataType.raw)
immutable(ubyte)[] sprGanon1;

@ROMSource([0xCA060, 0xC9660][gameVersion], 0xA5)
@Asset("data/gfx/common/spr_intro_link_mid_frame_2.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkMidFrame2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3F3D, 0x1B3)
	@Asset("data/gfx/" ~ game ~ "/spr_spiderveran.bin", DataType.raw)
	immutable(ubyte)[] sprSpiderveran;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB1127, 0x97)
	@Asset("data/gfx/" ~ game ~ "/spr_subterror_3.bin", DataType.raw)
	immutable(ubyte)[] sprSubterror3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBA8BE, 0x1E6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_explorers_crypt_entrance.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetExplorersCryptEntrance;
}

@ROMSource([0xC3199, 0xC312B][gameVersion], [0xE8, 0xEA][gameVersion])
@Asset("data/gfx/"~ game ~"/map_dmg_message.bin", DataType.raw)
immutable(ubyte)[] mapDMGMessage;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB94E2, 0xC5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_lynna_city_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetLynnaCity3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xACF05, 0x1C9)
	@Asset("data/gfx/" ~ game ~ "/spr_king_dodongo_2.bin", DataType.raw)
	immutable(ubyte)[] sprKingDodongo2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAEC34, 0x1BE)
	@Asset("data/gfx/" ~ game ~ "/spr_medusahead_2.bin", DataType.raw)
	immutable(ubyte)[] sprMedusahead2;
}

@ROMSource([0xBFC19, 0xBFF4B][gameVersion], 0x3D6)
@Asset("data/gfx/common/gfx_tileset_room_of_rites.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetRoomOfRites;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA8352, 0x7F)
	@Asset("data/gfx/" ~ game ~ "/flg_past_minimap.bin", DataType.raw)
	immutable(ubyte)[] flgPastMinimap;
}

@ROMSource([0xD4B14, 0xD45B0][gameVersion], [0x7CC, 0x758][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image2_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage21;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA617B, 0x1C4)
	@Asset("data/gfx/" ~ game ~ "/spr_talon_sunkencitygirl.bin", DataType.raw)
	immutable(ubyte)[] sprTalonSunkencitygirl;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD033, 0x19C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_jabu_jabu_outside_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetJabuJabuOutside1;
}

@ROMSource([0x9FF69, 0xA42C1][gameVersion], [0x134, 0x149][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_common_items.bin", DataType.raw)
immutable(ubyte)[] sprCommonItems;

@ROMSource([0xBD84F, 0xBDE39][gameVersion], [0x697, 0x680][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tileset_dungeon_standard_1.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetDungeonStandard1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9DE6, 0x19C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_forest_of_time_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetForestOfTime2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC4DBF, 0x3CC)
	@Asset("data/gfx/" ~ game ~ "/gfx_intro_link_on_horse_front_bg.bin", DataType.raw)
	immutable(ubyte)[] gfxIntroLinkOnHorseFrontBg;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD438, 0x132)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_nuun_highlands_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetNuunHighlands1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA8DB3, 0x186)
	@Asset("data/gfx/" ~ game ~ "/spr_gymnast_troy_scrub.bin", DataType.raw)
	immutable(ubyte)[] sprGymnastTroyScrub;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB759D, 0x1FD)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_common.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeCommon;
}

@ROMSource([0xC4470, 0xC3C38][gameVersion], 0x42)
@Asset("data/gfx/common/gfx_titlescreen_6.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreen6;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA6E78, 0x175)
	@Asset("data/gfx/" ~ game ~ "/spr_subrosian_2.bin", DataType.raw)
	immutable(ubyte)[] sprSubrosian2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xACD63, 0x1A2)
	@Asset("data/gfx/" ~ game ~ "/spr_king_dodongo_1.bin", DataType.raw)
	immutable(ubyte)[] sprKingDodongo1;
}

@ROMSource([0xDAF77, 0xDAB8F][gameVersion], 0x208)
@Asset("data/gfx/common/map_credits_bg.bin", DataType.raw)
immutable(ubyte)[] mapCreditsBg;

@ROMSource([0xD5893, 0xD520C][gameVersion], 0x124)
@Asset("data/gfx/common/map_credits_image3.bin", DataType.raw)
immutable(ubyte)[] mapCreditsImage3;

@ROMSource([0xA93AE, 0xAEF4E][gameVersion], 0x133)
@Asset("data/gfx/common/spr_boulder.bin", DataType.raw)
immutable(ubyte)[] sprBoulder;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAD4AA, 0x1C6)
	@Asset("data/gfx/" ~ game ~ "/spr_king_dodongo_5.bin", DataType.raw)
	immutable(ubyte)[] sprKingDodongo5;
}

@ROMSource([0x6EA20, 0x6EA20][gameVersion], 0xC00)
@Asset("data/gfx/common/spr_maple.bin", DataType.raw)
immutable(ubyte)[] sprMaple;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB9EB5, 0x162)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_tarm_ruins_pedestal.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTarmRuinsPedestal;
}

@ROMSource([0xB08D5, 0xB54F6][gameVersion], 0x1DF)
@Asset("data/gfx/common/spr_twinrova_7.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova7;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBC666, 0x4EB)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_underwater_past.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetUnderwaterPast;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA56BC, 0x192)
	@Asset("data/gfx/" ~ game ~ "/spr_fairy_artist.bin", DataType.raw)
	immutable(ubyte)[] sprFairyArtist;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAA01B, 0x167)
	@Asset("data/gfx/" ~ game ~ "/spr_fairy_toilethand.bin", DataType.raw)
	immutable(ubyte)[] sprFairyToilethand;
}

@ROMSource([0xA9726, 0xAF1F9][gameVersion], 0x122)
@Asset("data/gfx/common/spr_darknut.bin", DataType.raw)
immutable(ubyte)[] sprDarknut;

@ROMSource([0xD9C6B, 0xD9894][gameVersion], 0x3F2)
@Asset("data/gfx/common/gfx_credits_linked_image4_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage42;

@ROMSource([0xCA105, 0xC9705][gameVersion], 0xA7)
@Asset("data/gfx/common/spr_intro_link_mid_frame_3.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkMidFrame3;

@ROMSource([0xC9575, 0xC93B6][gameVersion], 0x193)
@Asset("data/gfx/common/map_intro_outside_castle.bin", DataType.raw)
immutable(ubyte)[] mapIntroOutsideCastle;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCEACE, 0x1B)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_scene6.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallScene6;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB442, 0x18B)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_rolling_ridge_present_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetRollingRidgePresent1;
}

@ROMSource([0xD8EE3, 0xD8B0F][gameVersion], 0x5AE)
@Asset("data/gfx/common/gfx_credits_linked_image1_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage12;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB679, 0x2A3)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_temple_of_seasons_outside_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTempleOfSeasonsOutside1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA7A39, 0x190)
	@Asset("data/gfx/" ~ game ~ "/map_present_minimap.bin", DataType.raw)
	immutable(ubyte)[] mapPresentMinimap;
}

@ROMSource([0xA91FE, 0xAED9E][gameVersion], 0x1B0)
@Asset("data/gfx/common/spr_lynel.bin", DataType.raw)
immutable(ubyte)[] sprLynel;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA4DB1, 0x1A5)
	@Asset("data/gfx/" ~ game ~ "/spr_mrsruul_villagers.bin", DataType.raw)
	immutable(ubyte)[] sprMrsruulVillagers;
}

@ROMSource([0xE1E05, 0xE1EFE][gameVersion], 0x1B)
@Asset("data/gfx/common/flg_file_menu_top.bin", DataType.raw)
immutable(ubyte)[] flgFileMenuTop;

@ROMSource([0xA143D, 0xA594C][gameVersion], 0x63)
@Asset("data/gfx/common/map_appraised_ring_list.bin", DataType.raw)
immutable(ubyte)[] mapAppraisedRingList;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xADE8A, 0x17F)
	@Asset("data/gfx/" ~ game ~ "/spr_linkstatue.bin", DataType.raw)
	immutable(ubyte)[] sprLinkstatue;
}

@ROMSource([0xA228F, 0xA66CC][gameVersion], 0x111)
@Asset("data/gfx/common/gfx_blurb_roomofrites.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbRoomofrites;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA83D1, 0x12D)
	@Asset("data/gfx/" ~ game ~ "/spr_spinner_seedbouncer.bin", DataType.raw)
	immutable(ubyte)[] sprSpinnerSeedbouncer;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB94A3, 0x1C1)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_dancing_dragon_dungeon_entrance.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetDancingDragonDungeonEntrance;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE599, 0x108)
	@Asset("data/gfx/" ~ game ~ "/map_black_tower_stage_3_middle.bin", DataType.raw)
	immutable(ubyte)[] mapBlackTowerStage3Middle;
}

@ROMSource([0xE23BF, 0xE24B8][gameVersion], 0x11)
@Asset("data/gfx/common/flg_name_entry_bottom.bin", DataType.raw)
immutable(ubyte)[] flgNameEntryBottom;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC571E, 0x1C1)
	@Asset("data/gfx/" ~ game ~ "/spr_intro_link_face_shot_sparkle.bin", DataType.raw)
	immutable(ubyte)[] sprIntroLinkFaceShotSparkle;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xADB88, 0x136)
	@Asset("data/gfx/" ~ game ~ "/spr_triforce_sparkle_vineseed_bookofseals.bin", DataType.raw)
	immutable(ubyte)[] sprTriforceSparkleVineseedBookofseals;
}

@ROMSource([0xE2302, 0xE23FB][gameVersion], 0x0E)
@Asset("data/gfx/common/flg_secret_entry_error.bin", DataType.raw)
immutable(ubyte)[] flgSecretEntryError;

@ROMSource([0xD87C0, 0xD83EC][gameVersion], 0x723)
@Asset("data/gfx/common/gfx_credits_linked_image1_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage11;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xE310A, 0x71E)
	@Asset("data/gfx/" ~ game ~ "/gfx_dragononox_2.bin", DataType.raw)
	immutable(ubyte)[] gfxDragononox2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA7DCC, 0x421)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_past_1.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesPast1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCEA93, 0x09)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_scene5.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallScene5;
}

@ROMSource([0xD85E2, 0xD729E][gameVersion], [0x96, 0xC7][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_linked_scene2.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedScene2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA7807, 0x1DE)
	@Asset("data/gfx/" ~ game ~ "/spr_din_crystal.bin", DataType.raw)
	immutable(ubyte)[] sprDinCrystal;
}

@ROMSource([0xE0D0C, 0xE0E0A][gameVersion], 0x46A)
@Asset("data/gfx/common/gfx_savescreen.bin", DataType.raw)
immutable(ubyte)[] gfxSavescreen;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA4A42, 0x19D)
	@Asset("data/gfx/" ~ game ~ "/spr_oldshopkeeper_gardener_villager.bin", DataType.raw)
	immutable(ubyte)[] sprOldshopkeeperGardenerVillager;
}

@ROMSource([0xC669F, 0xC7001][gameVersion], 0x162)
@Asset("data/gfx/common/spr_obj_intro_clouds.bin", DataType.raw)
immutable(ubyte)[] sprObjIntroClouds;

@ROMSource([0xDD444, 0xDD548][gameVersion], 0x5F)
@Asset("data/gfx/common/map_credits_linked_waving_goodbye_2.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedWavingGoodbye2;

@ROMSource([0xCA24E, 0xC984E][gameVersion], 0xA6)
@Asset("data/gfx/common/spr_intro_link_mid_frame_5.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkMidFrame5;

@ROMSource([0xC6BC2, 0xC7524][gameVersion], 0x4E6)
@Asset("data/gfx/common/gfx_titlescreen_2.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreen2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBC02E, 0x07)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_sea_of_no_return_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSeaOfNoReturn1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCE1B4, 0xE7)
	@Asset("data/gfx/" ~ game ~ "/map_black_tower_stage_1.bin", DataType.raw)
	immutable(ubyte)[] mapBlackTowerStage1;
}

@ROMSource([0xDC718, 0xDC81C][gameVersion], 0x108)
@Asset("data/gfx/common/map_credits_theend.bin", DataType.raw)
immutable(ubyte)[] mapCreditsTheend;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA59F7, 0x149)
	@Asset("data/gfx/" ~ game ~ "/spr_drleft_clockman.bin", DataType.raw)
	immutable(ubyte)[] sprDrleftClockman;
}

@ROMSource([0xA1199, 0xA56AC][gameVersion], 0x65)
@Asset("data/gfx/common/gfx_save.bin", DataType.raw)
immutable(ubyte)[] gfxSave;

@ROMSource([0xD6923, 0xD6279][gameVersion], [0x71E, 0x713][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image4_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage41;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD56A, 0x28)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_nuun_highlands_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetNuunHighlands2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCC8AA, 0x69A)
	@Asset("data/gfx/" ~ game ~ "/gfx_black_tower_scene_1.bin", DataType.raw)
	immutable(ubyte)[] gfxBlackTowerScene1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA42B2, 0x0F)
	@Asset("data/gfx/" ~ game ~ "/spr_seaweed_cut.bin", DataType.raw)
	immutable(ubyte)[] sprSeaweedCut;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAE25C, 0x1BA)
	@Asset("data/gfx/" ~ game ~ "/spr_digdogger_3.bin", DataType.raw)
	immutable(ubyte)[] sprDigdogger3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA7BC9, 0x83)
	@Asset("data/gfx/" ~ game ~ "/flg_present_minimap.bin", DataType.raw)
	immutable(ubyte)[] flgPresentMinimap;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC4AAD, 0x36D)
	@Asset("data/gfx/" ~ game ~ "/gfx_intro_link_riding_horse_2.bin", DataType.raw)
	immutable(ubyte)[] gfxIntroLinkRidingHorse2;
}

@ROMSource([0x6A680, 0x6A6E0][gameVersion], 0x100)
@Asset("data/gfx/common/spr_link_retro.bin", DataType.raw)
immutable(ubyte)[] sprLinkRetro;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB8283, 0x5B4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_overworld_standard.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOverworldStandard;
}

@ROMSource([0xE2310, 0xE2409][gameVersion], 0x64)
@Asset("data/gfx/common/map_name_entry_top.bin", DataType.raw)
immutable(ubyte)[] mapNameEntryTop;

@ROMSource([0xD1291, 0xD0E3C][gameVersion], [0x154, 0x166][gameVersion])
@Asset("data/gfx/"~ game ~"/map_link_with_oracle_and_twinrova_1.bin", DataType.raw)
immutable(ubyte)[] mapLinkWithOracleAndTwinrova1;

@ROMSource([0xDA225, 0xD9E3D][gameVersion], 0x124)
@Asset("data/gfx/common/map_credits_linked_image3.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedImage3;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA6D3A, 0x13E)
	@Asset("data/gfx/" ~ game ~ "/spr_villagezora.bin", DataType.raw)
	immutable(ubyte)[] sprVillagezora;
}

@ROMSource([0xDC869, 0xDC96D][gameVersion], 0x5F0)
@Asset("data/gfx/common/gfx_credits_theend_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsTheend1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA8358, 0x19D)
	@Asset("data/gfx/" ~ game ~ "/spr_moblinflag_fountain_orb.bin", DataType.raw)
	immutable(ubyte)[] sprMoblinGhini;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE17C, 0x443)
	@Asset("data/gfx/" ~ game ~ "/gfx_temple_of_seasons.bin", DataType.raw)
	immutable(ubyte)[] gfxTempleOfSeasons;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE5BF, 0x7D)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_main_scene_2.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallMainScene2;
}

@ROMSource([0xD31E5, 0xD2E0D][gameVersion], [0x401, 0x40D][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_gametitle.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsGametitle;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3462, 0xEF)
	@Asset("data/gfx/" ~ game ~ "/spr_ramrock_1.bin", DataType.raw)
	immutable(ubyte)[] sprRamrock1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA9954, 0x1A9)
	@Asset("data/gfx/" ~ game ~ "/spr_blossom_otherlady.bin", DataType.raw)
	immutable(ubyte)[] sprBlossomOtherlady;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3C5E, 0x174)
	@Asset("data/gfx/" ~ game ~ "/spr_fairyveran_1.bin", DataType.raw)
	immutable(ubyte)[] sprFairyveran1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC9CC6, 0x2FA)
	@Asset("data/gfx/" ~ game ~ "/spr_intro_horse_mid.bin", DataType.raw)
	immutable(ubyte)[] sprIntroHorseMid;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBE7FE, 0x373)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_path.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuPath;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAFD6C, 0x1C7)
	@Asset("data/gfx/" ~ game ~ "/spr_dragononox_1.bin", DataType.raw)
	immutable(ubyte)[] sprDragononox1;
}

@ROMSource([0xA9CC6, 0xAF5D9][gameVersion], 0x16F)
@Asset("data/gfx/common/spr_polsvoice_hardhatbeetle_spikedbeetle_beamon.bin", DataType.raw)
immutable(ubyte)[] sprPolsvoiceHardhatbeetleSpikedbeetleBeamon;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB5E91, 0x2C1)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_spring_standard.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSpringStandard;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBAF82, 0xFE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_talus_peaks_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTalusPeaks3;
}

@ROMSource([0xC3DAB, 0xC35A7][gameVersion], 0x75)
@Asset("data/gfx/common/map_capcom_nintendo.bin", DataType.raw)
immutable(ubyte)[] mapCapcomNintendo;

@ROMSource([0xC2F19, 0xC2EC8][gameVersion], [0x280, 0x263][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_dmg_gametitle.bin", DataType.raw)
immutable(ubyte)[] gfxDMGGametitle;

@ROMSource([0xD31DA, 0xD2E02][gameVersion], 0x0B)
@Asset("data/gfx/common/flg_credits_gametitle.bin", DataType.raw)
immutable(ubyte)[] flgCreditsGametitle;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB3ED4, 0x2E2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_top_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeTop2;
}

@ROMSource([0xA1259, 0xA576C][gameVersion], 0x0F)
@Asset("data/gfx/common/flg_inventory_textbar.bin", DataType.raw)
immutable(ubyte)[] flgInventoryTextbar;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAF081, 0x178)
	@Asset("data/gfx/" ~ game ~ "/spr_zol_peahat_watertektite_moldorm_gel.bin", DataType.raw)
	immutable(ubyte)[] sprZolPeahatWatertektiteMoldormGel;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xE3B39, 0x2C)
	@Asset("data/gfx/" ~ game ~ "/flg_dragononox_2.bin", DataType.raw)
	immutable(ubyte)[] flgDragononox2;
}

@ROMSource([0xA0D57, 0xA5216][gameVersion], [0x154, 0x14D][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_quest_items_4.bin", DataType.raw)
immutable(ubyte)[] sprQuestItems4;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA633F, 0x1A0)
	@Asset("data/gfx/" ~ game ~ "/spr_goron_parrot.bin", DataType.raw)
	immutable(ubyte)[] sprGoronParrot;
}

@ROMSource([0xA0637, 0xA4A75][gameVersion], [0x14F, 0x11B][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_item_icons_1_spr.bin", DataType.raw)
immutable(ubyte)[] sprItemIcons1Spr;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAFB35, 0xEE)
	@Asset("data/gfx/" ~ game ~ "/spr_onox_3.bin", DataType.raw)
	immutable(ubyte)[] sprOnox3;
}

@ROMSource([0xDD4A3, 0xDD5A7][gameVersion], 0x22)
@Asset("data/gfx/common/flg_credits_linked_waving_goodbye_2.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedWavingGoodbye2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBF252, 0x306)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_sword_and_shield_maze_ice.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSwordAndShieldMazeIce;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xD6E1F, 0x13)
	@Asset("data/gfx/" ~ game ~ "/map_credits_maku_past_top_rows.bin", DataType.raw)
	immutable(ubyte)[] mapCreditsMakuPastTopRows;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB0FB9, 0x16E)
	@Asset("data/gfx/" ~ game ~ "/spr_subterror_2.bin", DataType.raw)
	immutable(ubyte)[] sprSubterror2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBD8EE, 0x54B)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_black_tower.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetBlackTower;
}

@ROMSource([0xD2F6E, 0xD2B9D][gameVersion], [0x155, 0x15B][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_makutree.bin", DataType.raw)
immutable(ubyte)[] mapCreditsMakutree;

@ROMSource([0xA8656, 0xAE200][gameVersion], [0x113, 0x109][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_woodentunnel_seasonsymbols.bin", DataType.raw)
immutable(ubyte)[] sprWoodentunnelSeasonsymbols;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBA5C8, 0x200)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_tokay_island_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTokayIsland2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA8036, 0x152)
	@Asset("data/gfx/" ~ game ~ "/spr_springflower_makuleaf_farorebook.bin", DataType.raw)
	immutable(ubyte)[] sprSpringflowerMakuleafFarorebook;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x6ADE0, 0x180)
	@Asset("data/gfx/" ~ game ~ "/spr_swords.bin", DataType.raw)
	immutable(ubyte)[] sprSwords;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAE416, 0x1E7)
	@Asset("data/gfx/" ~ game ~ "/spr_manhandla_1.bin", DataType.raw)
	immutable(ubyte)[] sprManhandla1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCEA33, 0x3C)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_scene4.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallScene4;
}

@ROMSource([0xCC2A9, 0xCA57F][gameVersion], 0x573)
@Asset("data/gfx/common/gfx_intro_outside_castle_1.bin", DataType.raw)
immutable(ubyte)[] gfxIntroOutsideCastle1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE143, 0x39)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_main_scene_1.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallMainScene1;
}

@ROMSource([0xE20F1, 0xE21EA][gameVersion], 0x04)
@Asset("data/gfx/common/flg_save_menu_bottom.bin", DataType.raw)
immutable(ubyte)[] flgSaveMenuBottom;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE65B, 0x171)
	@Asset("data/gfx/" ~ game ~ "/spr_templefall.bin", DataType.raw)
	immutable(ubyte)[] sprTemplefall;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBF7C0, 0x1ED)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_jabu_jabus_belly.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetJabuJabusBelly;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB38C8, 0x163)
	@Asset("data/gfx/" ~ game ~ "/spr_veran_human.bin", DataType.raw)
	immutable(ubyte)[] sprVeranHuman;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAAA1F, 0x13B)
	@Asset("data/gfx/" ~ game ~ "/spr_magunesu.bin", DataType.raw)
	immutable(ubyte)[] sprMagunesu;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAA33C, 0x144)
	@Asset("data/gfx/" ~ game ~ "/spr_soldier.bin", DataType.raw)
	immutable(ubyte)[] sprSoldier;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB0C6E, 0x148)
	@Asset("data/gfx/" ~ game ~ "/spr_swoop.bin", DataType.raw)
	immutable(ubyte)[] sprSwoop;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAC29A, 0x163)
	@Asset("data/gfx/" ~ game ~ "/spr_masksalesman_rafton.bin", DataType.raw)
	immutable(ubyte)[] sprMasksalesmanRafton;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBFCC5, 0x286)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_black_tower_top.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetBlackTowerTop;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD5B5, 0x06)
	@Asset("data/gfx/" ~ game ~ "/gfx_blank_3.bin", DataType.raw)
	immutable(ubyte)[] gfxBlank3;
}

@ROMSource([0xE27AF, 0xE28A8][gameVersion], 0x1AF)
@Asset("data/gfx/common/map_secret_list_menu.bin", DataType.raw)
immutable(ubyte)[] mapSecretListMenu;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAE0AB, 0x1B1)
	@Asset("data/gfx/" ~ game ~ "/spr_digdogger_2.bin", DataType.raw)
	immutable(ubyte)[] sprDigdogger2;
}

@ROMSource([0x6A780, 0x6A7E0][gameVersion], 0x200)
@Asset("data/gfx/common/spr_octorok_leever_tektite_zora.bin", DataType.raw)
immutable(ubyte)[] sprOctorokLeeverTektiteZora;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBF9AD, 0x2EE)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_ancient_tomb.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetAncientTomb;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCEB1F, 0x25)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_scene7.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallScene7;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBFC9B, 0x2A)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_minecart_track.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMinecartTrack;
}

@ROMSource([0xDA160, 0xD9D83][gameVersion], [0xC5, 0xBA][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_linked_scene3.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedScene3;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB91B3, 0x17D)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_lynna_city_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetLynnaCity1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0x62740, 0x200)
	@Asset("data/gfx/" ~ game ~ "/gfx_animations_2.bin", DataType.raw)
	immutable(ubyte)[] gfxAnimations2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB373D, 0x3C6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTree2;
}

@ROMSource([0xB16F7, 0xB6318][gameVersion], 0x1E0)
@Asset("data/gfx/common/spr_twinrova_sacrifice_4.bin", DataType.raw)
immutable(ubyte)[] sprTwinrovaSacrifice4;

@ROMSource([0xA0FA0, 0xA5469][gameVersion], [0xE3, 0x12C][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_inventory_hud_1.bin", DataType.raw)
immutable(ubyte)[] gfxInventoryHud1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAFC23, 0x149)
	@Asset("data/gfx/" ~ game ~ "/spr_onox_4.bin", DataType.raw)
	immutable(ubyte)[] sprOnox4;
}

@ROMSource([0xC43A2, 0xC3B6A][gameVersion], 0xCE)
@Asset("data/gfx/common/gfx_titlescreen_3.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreen3;

@ROMSource([0xA1542, 0xA67DD][gameVersion], [0x104, 0x13C][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_heroscave.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbHeroscave;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBBAE4, 0x376)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_temple_of_seasons_outside_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTempleOfSeasonsOutside3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE63C, 0x1F)
	@Asset("data/gfx/" ~ game ~ "/flg_templefall_main_scene_2.bin", DataType.raw)
	immutable(ubyte)[] flgTemplefallMainScene2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAF9A6, 0x18F)
	@Asset("data/gfx/" ~ game ~ "/spr_onox_2.bin", DataType.raw)
	immutable(ubyte)[] sprOnox2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA01B9, 0x11E)
	@Asset("data/gfx/" ~ game ~ "/spr_map_compass_keys.bin", DataType.raw)
	immutable(ubyte)[] sprMapCompassKeys;
}

@ROMSource([0xB30EE, 0xB753B][gameVersion], 0x22)
@Asset("data/gfx/common/spr_grass_tuft.bin", DataType.raw)
immutable(ubyte)[] sprGrassTuft;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB31A3, 0x139)
	@Asset("data/gfx/" ~ game ~ "/spr_plasmarine_1.bin", DataType.raw)
	immutable(ubyte)[] sprPlasmarine1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA7496, 0x11)
	@Asset("data/gfx/" ~ game ~ "/spr_blank.bin", DataType.raw)
	immutable(ubyte)[] sprBlank;
}

@ROMSource([0xCF74B, 0xCF5D5][gameVersion], [0x319, 0x22F][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_link_with_oracle_3.bin", DataType.raw)
immutable(ubyte)[] gfxLinkWithOracle3;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA2FD6, 0x559)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_holodrum_1.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesHolodrum1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAFE35, 0x175)
	@Asset("data/gfx/" ~ game ~ "/spr_armmimic_spikedroller_bari_biri.bin", DataType.raw)
	immutable(ubyte)[] sprArmmimicSpikedrollerBariBiri;
}

@ROMSource([0xA1083, 0xA5595][gameVersion], [0x116, 0x117][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_inventory_hud_2.bin", DataType.raw)
immutable(ubyte)[] gfxInventoryHud2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA5477, 0x18E)
	@Asset("data/gfx/" ~ game ~ "/spr_bipsom_2.bin", DataType.raw)
	immutable(ubyte)[] sprBipsom2;
}

@ROMSource([0xE295E, 0xE2A57][gameVersion], 0x4B)
@Asset("data/gfx/common/flg_secret_list_menu.bin", DataType.raw)
immutable(ubyte)[] flgSecretListMenu;

@ROMSource([0xA8B60, 0xAE700][gameVersion], 0x1A5)
@Asset("data/gfx/common/spr_moblin_ghini.bin", DataType.raw)
immutable(ubyte)[] sprMoblinGhini;

@ROMSource([0xDAA73, 0xDA68B][gameVersion], 0x504)
@Asset("data/gfx/common/gfx_credits_linked_image3_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedImage32;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA88A4, 0xEA)
	@Asset("data/gfx/" ~ game ~ "/spr_present_past_symbols.bin", DataType.raw)
	immutable(ubyte)[] sprPresentPastSymbols;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBF558, 0x390)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_sword_and_shield_maze_fire.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSwordAndShieldMazeFire;
}

@ROMSource([0xE1FF5, 0xE20EE][gameVersion], 0x25)
@Asset("data/gfx/common/flg_file_menu_copy.bin", DataType.raw)
immutable(ubyte)[] flgFileMenuCopy;

@ROMSource([0xAAE1F, 0xB0662][gameVersion], [0x18A, 0x1A4][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_projectiles_2.bin", DataType.raw)
immutable(ubyte)[] sprProjectiles2;

@ROMSource([0xC4F7D, 0xC58DF][gameVersion], 0x25C)
@Asset("data/gfx/common/spr_link_on_horse_closeup.bin", DataType.raw)
immutable(ubyte)[] sprLinkOnHorseCloseup;

@ROMSource([0xC9708, 0xC9549][gameVersion], 0x77)
@Asset("data/gfx/common/flg_intro_outside_castle.bin", DataType.raw)
immutable(ubyte)[] flgIntroOutsideCastle;

@ROMSource([0xB19AF, 0xB65D0][gameVersion], 0x11A)
@Asset("data/gfx/common/spr_ganon_4.bin", DataType.raw)
immutable(ubyte)[] sprGanon4;

@ROMSource([0x6A980, 0x6A9E0][gameVersion], 0x160)
@Asset("data/gfx/common/spr_moblin.bin", DataType.raw)
immutable(ubyte)[] sprMoblin;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC2611, 0x111)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_goron_cave.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetGoronCave;
}

@ROMSource([0xA9AFF, 0xAF412][gameVersion], 0x1C7)
@Asset("data/gfx/common/spr_gibdo_stalfos_rope_whisp_spark_bubble_beetle.bin", DataType.raw)
immutable(ubyte)[] sprGibdoStalfosRopeWhispSparkBubbleBeetle;

@ROMSource([0xAA0C1, 0xAFA1E][gameVersion], 0x17F)
@Asset("data/gfx/common/spr_bladetraps.bin", DataType.raw)
immutable(ubyte)[] sprBladetraps;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB5FF, 0x06)
	@Asset("data/gfx/" ~ game ~ "/gfx_blank_2.bin", DataType.raw)
	immutable(ubyte)[] gfxBlank2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB232B, 0x1F3)
	@Asset("data/gfx/" ~ game ~ "/spr_headthwomp_2.bin", DataType.raw)
	immutable(ubyte)[] sprHeadthwomp2;
}

@ROMSource([0xDD4C5, 0xDD5C9][gameVersion], 0x18F)
@Asset("data/gfx/common/spr_credits_linked_waving_goodbye.bin", DataType.raw)
immutable(ubyte)[] sprCreditsLinkedWavingGoodbye;

@ROMSource([0xB1AC9, 0xB66EA][gameVersion], 0x1E1)
@Asset("data/gfx/common/spr_ganon_5.bin", DataType.raw)
immutable(ubyte)[] sprGanon5;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB33E, 0x6F)
	@Asset("data/gfx/" ~ game ~ "/map_pirate_ship_bow.bin", DataType.raw)
	immutable(ubyte)[] mapPirateShipBow;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAD0CE, 0x1F4)
	@Asset("data/gfx/" ~ game ~ "/spr_king_dodongo_3.bin", DataType.raw)
	immutable(ubyte)[] sprKingDodongo3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA5605, 0xB7)
	@Asset("data/gfx/" ~ game ~ "/spr_secretnpcs_butterfly_dragonfly.bin", DataType.raw)
	immutable(ubyte)[] sprSecretnpcsButterflyDragonfly;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB9AD3, 0x1E4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_syrups_hut.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSyrupsHut;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67F2E, 0x51)
	@Asset("data/gfx/" ~ game ~ "/map_jabu_opening_2.bin", DataType.raw)
	immutable(ubyte)[] mapJabuOpening2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAA182, 0x1BA)
	@Asset("data/gfx/" ~ game ~ "/spr_chickens_dog_forestfairy_other.bin", DataType.raw)
	immutable(ubyte)[] sprChickensDogForestfairyOther;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAB94C, 0x115)
	@Asset("data/gfx/" ~ game ~ "/spr_lady_guitarist.bin", DataType.raw)
	immutable(ubyte)[] sprLadyGuitarist;
}

@ROMSource([0xCC81C, 0xCAAF2][gameVersion], 0x654)
@Asset("data/gfx/common/gfx_intro_outside_castle_2.bin", DataType.raw)
immutable(ubyte)[] gfxIntroOutsideCastle2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAE009, 0xF8)
	@Asset("data/gfx/" ~ game ~ "/spr_lightning.bin", DataType.raw)
	immutable(ubyte)[] sprLightning;
}

@ROMSource([0xAA5D0, 0xAFFAA][gameVersion], 0x168)
@Asset("data/gfx/common/spr_hostilescrub.bin", DataType.raw)
immutable(ubyte)[] sprHostilescrub;

@ROMSource([0xD95A5, 0xD91CE][gameVersion], 0x123)
@Asset("data/gfx/common/map_credits_linked_image4.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedImage4;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA2184, 0x10B)
	@Asset("data/gfx/" ~ game ~ "/gfx_blurb_onoxcastle.bin", DataType.raw)
	immutable(ubyte)[] gfxBlurbOnoxcastle;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCD575, 0x6D)
	@Asset("data/gfx/" ~ game ~ "/map_inside_onox_castle.bin", DataType.raw)
	immutable(ubyte)[] mapInsideOnoxCastle;
}

@ROMSource([0xB1F19, 0xB6B3A][gameVersion], 0x1F4)
@Asset("data/gfx/common/spr_ganon_8.bin", DataType.raw)
immutable(ubyte)[] sprGanon8;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB6595, 0x2A6)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_autumn_standard.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetAutumnStandard;
}

@ROMSource([0xCEE54, 0xCE9D4][gameVersion], [0x324, 0x6C9][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_link_with_oracle_1.bin", DataType.raw)
immutable(ubyte)[] gfxLinkWithOracle1;

@ROMSource([0xE2184, 0xE227D][gameVersion], 0xF0)
@Asset("data/gfx/common/map_secret_entry_middle.bin", DataType.raw)
immutable(ubyte)[] mapSecretEntryMiddle;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAC8E1, 0x142)
	@Asset("data/gfx/" ~ game ~ "/spr_pirateship.bin", DataType.raw)
	immutable(ubyte)[] sprPirateship;
}

@ROMSource([0xE1A97, 0xE1B90][gameVersion], 0x177)
@Asset("data/gfx/common/gfx_done.bin", DataType.raw)
immutable(ubyte)[] gfxDone;

@ROMSource([0xD96C8, 0xD92F1][gameVersion], 0x1C)
@Asset("data/gfx/common/flg_credits_linked_image4.bin", DataType.raw)
immutable(ubyte)[] flgCreditsLinkedImage4;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB27A5, 0x16C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_gnarled_root_entrance_opening_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetGnarledRootEntranceOpening2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCB5D9, 0x55)
	@Asset("data/gfx/" ~ game ~ "/spr_triforcestone.bin", DataType.raw)
	immutable(ubyte)[] sprTriforcestone;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xADC18, 0x1E4)
	@Asset("data/gfx/" ~ game ~ "/spr_gohma_2.bin", DataType.raw)
	immutable(ubyte)[] sprGohma2;
}

@ROMSource([0xC829B, 0xC8C03][gameVersion], [0x88, 0x85][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_intro_triforce_room.bin", DataType.raw)
immutable(ubyte)[] flgIntroTriforceRoom;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB3AD, 0x3E)
	@Asset("data/gfx/" ~ game ~ "/flg_pirate_ship_bow.bin", DataType.raw)
	immutable(ubyte)[] flgPirateShipBow;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9C5F, 0x187)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_forest_of_time_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetForestOfTime1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAAD85, 0x17F)
	@Asset("data/gfx/" ~ game ~ "/spr_mamamu_dog.bin", DataType.raw)
	immutable(ubyte)[] sprMamamuDog;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE868, 0xC3)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_scene3.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallScene3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA74A7, 0x136)
	@Asset("data/gfx/" ~ game ~ "/spr_maku_tree_1.bin", DataType.raw)
	immutable(ubyte)[] sprMakuTree1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAF748, 0x19F)
	@Asset("data/gfx/" ~ game ~ "/spr_shroudedstalfos_tile_candle.bin", DataType.raw)
	immutable(ubyte)[] sprShroudedstalfosTileCandle;
}

@ROMSource([0xC51D9, 0xC5B3B][gameVersion], 0x634)
@Asset("data/gfx/common/gfx_link_on_horse_closeup_1.bin", DataType.raw)
immutable(ubyte)[] gfxLinkOnHorseCloseup1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBD050, 0x2D7)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosian_market_outside.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosianMarketOutside;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA9307, 0x160)
	@Asset("data/gfx/" ~ game ~ "/spr_mustachemen_cat.bin", DataType.raw)
	immutable(ubyte)[] sprMustachemenCat;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB32DC, 0xD9)
	@Asset("data/gfx/" ~ game ~ "/spr_plasmarine_2.bin", DataType.raw)
	immutable(ubyte)[] sprPlasmarine2;
}

@ROMSource([0xA8D05, 0xAE8A5][gameVersion], 0x175)
@Asset("data/gfx/common/spr_pincer_pokey_armos.bin", DataType.raw)
immutable(ubyte)[] sprPincerPokeyArmos;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67E91, 0x1A)
	@Asset("data/gfx/" ~ game ~ "/map_mermaids_cave_wall_retraction.bin", DataType.raw)
	immutable(ubyte)[] mapMermaidsCaveWallRetraction;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA8A93, 0x17A)
	@Asset("data/gfx/" ~ game ~ "/spr_kids.bin", DataType.raw)
	immutable(ubyte)[] sprKids;
}

@ROMSource([0x6D220, 0x6D220][gameVersion], 0xC00)
@Asset("data/gfx/common/spr_dimitri.bin", DataType.raw)
immutable(ubyte)[] sprDimitri;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA487A, 0x1C8)
	@Asset("data/gfx/" ~ game ~ "/spr_ruul_wiseman.bin", DataType.raw)
	immutable(ubyte)[] sprRuulWiseman;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC283E, 0x59F)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_subrosia_indoors_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSubrosiaIndoors2;
}

@ROMSource([0xD15FF, 0xD11F2][gameVersion], [0x8E, 0xB9][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_link_with_oracle_and_twinrova_2.bin", DataType.raw)
immutable(ubyte)[] flgLinkWithOracleAndTwinrova2;

@ROMSource([0xE22C7, 0xE23C0][gameVersion], 0x0F)
@Asset("data/gfx/common/flg_secret_entry_bottom.bin", DataType.raw)
immutable(ubyte)[] flgSecretEntryBottom;

@ROMSource([0xE1F64, 0xE205D][gameVersion], 0x19)
@Asset("data/gfx/common/flg_file_menu_message_speed.bin", DataType.raw)
immutable(ubyte)[] flgFileMenuMessageSpeed;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC486E, 0x2B)
	@Asset("data/gfx/" ~ game ~ "/map_intro_link_on_horse_front_ground.bin", DataType.raw)
	immutable(ubyte)[] mapIntroLinkOnHorseFrontGround;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9B9A, 0xC5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_black_tower_outside_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetBlackTowerOutside3;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBA19F, 0x1DD)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_fairy_forest_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetFairyForest2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB810, 0x18F)
	@Asset("data/gfx/" ~ game ~ "/spr_syger_1.bin", DataType.raw)
	immutable(ubyte)[] sprSyger1;
}

@ROMSource([0xD7700, 0xD7365][gameVersion], 0x124)
@Asset("data/gfx/common/map_credits_linked_image2.bin", DataType.raw)
immutable(ubyte)[] mapCreditsLinkedImage2;

@ROMSource([0xDFABB, 0xDFBB9][gameVersion], 0x2B)
@Asset("data/gfx/common/flg_tobecontinued.bin", DataType.raw)
immutable(ubyte)[] flgTobecontinued;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC3665, 0x2AB)
	@Asset("data/gfx/" ~ game ~ "/gfx_jp_intro_screen_1.bin", DataType.raw)
	immutable(ubyte)[] gfxJpIntroScreen1;
}

@ROMSource([0xA1E99, 0xA62FF][gameVersion], [0x152, 0x14E][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d7.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD7;

@ROMSource([0xD1FE5, 0xD1C03][gameVersion], [0x1F0, 0x1A1][gameVersion])
@Asset("data/gfx/"~ game ~"/spr_credits_makutree.bin", DataType.raw)
immutable(ubyte)[] sprCreditsMakutree;

@ROMSource([0xA12A0, 0xA57B3][gameVersion], 0x0F)
@Asset("data/gfx/common/map_hud_biggoron_sword.bin", DataType.raw)
immutable(ubyte)[] mapHudBiggoronSword;

@ROMSource([0xAAD1B, 0xB055E][gameVersion], 0x104)
@Asset("data/gfx/common/spr_projectiles_1.bin", DataType.raw)
immutable(ubyte)[] sprProjectiles1;

@ROMSource([0xD3909, 0xD3535][gameVersion], 0x129)
@Asset("data/gfx/common/spr_credits_font_planners.bin", DataType.raw)
immutable(ubyte)[] sprCreditsFontPlanners;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA4BDF, 0x1D2)
	@Asset("data/gfx/" ~ game ~ "/spr_mittens_malon.bin", DataType.raw)
	immutable(ubyte)[] sprMittensMalon;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB1CA3, 0xCD)
	@Asset("data/gfx/" ~ game ~ "/spr_bluestalfos_3.bin", DataType.raw)
	immutable(ubyte)[] sprBluestalfos3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA4F56, 0x9A)
	@Asset("data/gfx/" ~ game ~ "/spr_zz_bubble_exclamation_heart.bin", DataType.raw)
	immutable(ubyte)[] sprZzBubbleExclamationHeart;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB3551, 0x1CF)
	@Asset("data/gfx/" ~ game ~ "/spr_ramrock_2.bin", DataType.raw)
	immutable(ubyte)[] sprRamrock2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA46DB, 0x19F)
	@Asset("data/gfx/" ~ game ~ "/spr_shopkeeper_dekuscrub.bin", DataType.raw)
	immutable(ubyte)[] sprShopkeeperDekuscrub;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCD4B3, 0xC2)
	@Asset("data/gfx/" ~ game ~ "/flg_din_dance_cutscene.bin", DataType.raw)
	immutable(ubyte)[] flgDinDanceCutscene;
}

@ROMSource([0xE1F06, 0xE1FFF][gameVersion], 0x0D)
@Asset("data/gfx/common/flg_file_menu_bottom.bin", DataType.raw)
immutable(ubyte)[] flgFileMenuBottom;

@ROMSource([0xDB319, 0xDAF31][gameVersion], 0x6CD)
@Asset("data/gfx/common/gfx_credits_bg_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsBg1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA7C4C, 0x180)
	@Asset("data/gfx/" ~ game ~ "/gfx_minimap_tiles_past_2.bin", DataType.raw)
	immutable(ubyte)[] gfxMinimapTilesPast2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67FA5, 0x2A)
	@Asset("data/gfx/" ~ game ~ "/flg_jabu_opening_2.bin", DataType.raw)
	immutable(ubyte)[] flgJabuOpening2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCE033, 0x110)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_main_scene_1.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallMainScene1;
}

@ROMSource([0xA0EAB, 0xA5363][gameVersion], [0xF5, 0x106][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_hud.bin", DataType.raw)
immutable(ubyte)[] gfxHud;

@ROMSource([0xD6870, 0xD61A5][gameVersion], [0x15, 0x36][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_image4.bin", DataType.raw)
immutable(ubyte)[] flgCreditsImage4;

@ROMSource([0xE23D0, 0xE24C9][gameVersion], 0xC0)
@Asset("data/gfx/common/map_name_entry_middle.bin", DataType.raw)
immutable(ubyte)[] mapNameEntryMiddle;

@ROMSource([0xE3B9A, 0xE2AD7][gameVersion], [0x15, 0x00][gameVersion])
@Asset("data/gfx/"~ game ~"/oth_twinrova_normal_layout.bin", DataType.raw)
immutable(ubyte)[] othTwinrovaNormalLayout;

@ROMSource([0xE1A19, 0xE1B12][gameVersion], 0x7E)
@Asset("data/gfx/common/gfx_quit.bin", DataType.raw)
immutable(ubyte)[] gfxQuit;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBBA42, 0x1B5)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_rolling_ridge_past_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetRollingRidgePast2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB2646, 0x15F)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_gnarled_root_entrance_opening_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetGnarledRootEntranceOpening1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA3CA4, 0xFE)
	@Asset("data/gfx/" ~ game ~ "/map_subrosia_minimap.bin", DataType.raw)
	immutable(ubyte)[] mapSubrosiaMinimap;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB51E4, 0x379)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_natzu.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetNatzu;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA584E, 0x1A9)
	@Asset("data/gfx/" ~ game ~ "/spr_chickens_dog_malenpc.bin", DataType.raw)
	immutable(ubyte)[] sprChickensDogMalenpc;
}

@ROMSource([0xC717D, 0xC7ADF][gameVersion], 0x35B)
@Asset("data/gfx/common/gfx_titlescreen_4.bin", DataType.raw)
immutable(ubyte)[] gfxTitlescreen4;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x67E5F, 0x1D)
	@Asset("data/gfx/" ~ game ~ "/map_wing_dungeon_collapsing_3.bin", DataType.raw)
	immutable(ubyte)[] mapWingDungeonCollapsing3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB1F0, 0xF7)
	@Asset("data/gfx/" ~ game ~ "/map_pirate_ship_body.bin", DataType.raw)
	immutable(ubyte)[] mapPirateShipBody;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA43D9, 0x183)
	@Asset("data/gfx/" ~ game ~ "/spr_boy.bin", DataType.raw)
	immutable(ubyte)[] sprBoy;
}

@ROMSource([0xD4A7C, 0xD4518][gameVersion], 0x98)
@Asset("data/gfx/common/spr_credits_font_programmers.bin", DataType.raw)
immutable(ubyte)[] sprCreditsFontProgrammers;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB14DF, 0x148)
	@Asset("data/gfx/" ~ game ~ "/spr_armoswarriorsword.bin", DataType.raw)
	immutable(ubyte)[] sprArmoswarriorsword;
}

@ROMSource([0xCA776, 0xC9D76][gameVersion], 0x14A)
@Asset("data/gfx/common/spr_intro_link_close_frame_4.bin", DataType.raw)
immutable(ubyte)[] sprIntroLinkCloseFrame4;

@ROMSource([0x62400, 0x6B200][gameVersion], [0x340, 0xCC0][gameVersion])
@Asset("data/gfx/" ~ game ~ "/gfx_animations_1.bin", DataType.raw)
immutable(ubyte)[] gfxAnimations1;

@ROMSource([0x6C000, 0x6C000][gameVersion], 0x1220)
@Asset("data/gfx/common/spr_ricky.bin", DataType.raw)
immutable(ubyte)[] sprRicky;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB20A6, 0x122)
	@Asset("data/gfx/" ~ game ~ "/spr_pumpkinhead_3.bin", DataType.raw)
	immutable(ubyte)[] sprPumpkinhead3;
}

@ROMSource([0xE1E20, 0xE1F19][gameVersion], 0x7F)
@Asset("data/gfx/common/map_file_menu_middle.bin", DataType.raw)
immutable(ubyte)[] mapFileMenuMiddle;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBBCF5, 0x1A2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_eyeglass_library_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetEyeglassLibrary1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBB14F, 0x7F)
	@Asset("data/gfx/" ~ game ~ "/map_pirate_ship_leaving_desert.bin", DataType.raw)
	immutable(ubyte)[] mapPirateShipLeavingDesert;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC19B7, 0xB4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_cave_replacement_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCaveReplacement1;
}

@ROMSource([0xB0C78, 0xB5899][gameVersion], 0x188)
@Asset("data/gfx/common/spr_twinrova_9.bin", DataType.raw)
immutable(ubyte)[] sprTwinrova9;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC5239, 0x4E5)
	@Asset("data/gfx/" ~ game ~ "/gfx_intro_link_face_shot.bin", DataType.raw)
	immutable(ubyte)[] gfxIntroLinkFaceShot;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC8A3F, 0x4C1)
	@Asset("data/gfx/" ~ game ~ "/spr_intro_link_riding_horse.bin", DataType.raw)
	immutable(ubyte)[] sprIntroLinkRidingHorse;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB9FCE, 0x1D1)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_fairy_forest_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetFairyForest1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xB779A, 0x65A)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_maku_tree_bottom.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetMakuTreeBottom;
}

@ROMSource([0xE14BD, 0xE15BB][gameVersion], 0x86)
@Asset("data/gfx/common/gfx_name.bin", DataType.raw)
immutable(ubyte)[] gfxName;

@ROMSource([0xBFFEF, 0xC0321][gameVersion], [0x655, 0x619][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tileset_sidescroll_1.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetSidescroll1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xC3A11, 0x08)
	@Asset("data/gfx/" ~ game ~ "/flg_jp_intro_screen_1.bin", DataType.raw)
	immutable(ubyte)[] flgJpIntroScreen1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC489D, 0x35)
	@Asset("data/gfx/" ~ game ~ "/flg_intro_link_on_horse_front_bg.bin", DataType.raw)
	immutable(ubyte)[] flgIntroLinkOnHorseFrontBg;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCD762, 0x7C)
	@Asset("data/gfx/" ~ game ~ "/flg_outside_onox_castle.bin", DataType.raw)
	immutable(ubyte)[] flgOutsideOnoxCastle;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA84FE, 0x142)
	@Asset("data/gfx/" ~ game ~ "/spr_roller_owl_barrier_orb.bin", DataType.raw)
	immutable(ubyte)[] sprRollerOwlBarrierOrb;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAB39E, 0x4F)
	@Asset("data/gfx/" ~ game ~ "/spr_omuai_2.bin", DataType.raw)
	immutable(ubyte)[] sprOmuai2;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0x6F620, 0x80)
	@Asset("data/gfx/" ~ game ~ "/spr_raft.bin", DataType.raw)
	immutable(ubyte)[] sprRaft;
}

@ROMSource([0x62340, 0x6F6E0][gameVersion], [0x200, 0x800][gameVersion])
@Asset("data/gfx/" ~ game ~ "/gfx_animations_2.bin", DataType.raw)
immutable(ubyte)[] gfxAnimations2;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBC029, 0x05)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_eyeglass_library_3.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetEyeglassLibrary3;
}

@ROMSource([0xA02DD, 0xA471B][gameVersion], 0x35A)
@Asset("data/gfx/common/gfx_rings.bin", DataType.raw)
immutable(ubyte)[] gfxRings;

@ROMSource([0xC6313, 0xC6C75][gameVersion], 0x200)
@Asset("data/gfx/common/gfx_link_on_horse_closeup_4.bin", DataType.raw)
immutable(ubyte)[] gfxLinkOnHorseCloseup4;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB9837, 0x29C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_biggoron.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetBiggoron;
}

@ROMSource([0xC8412, 0xC8D77][gameVersion], 0x245)
@Asset("data/gfx/common/map_titlescreen_scroll_1.bin", DataType.raw)
immutable(ubyte)[] mapTitlescreenScroll1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCEA9C, 0x32)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_scene6.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallScene6;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBAD77, 0x1B)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_talus_peaks_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTalusPeaks1;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xADCBE, 0x1CC)
	@Asset("data/gfx/" ~ game ~ "/spr_makuflower_book_seedling_weirdswirl_block.bin", DataType.raw)
	immutable(ubyte)[] sprMakuflowerBookSeedlingWeirdswirlBlock;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xA9467, 0x1C9)
	@Asset("data/gfx/" ~ game ~ "/spr_villagezora_plen_whitemustache.bin", DataType.raw)
	immutable(ubyte)[] sprVillagezoraPlenWhitemustache;
}

@ROMSource([0xD587F, 0xD51FA][gameVersion], [0x14, 0x12][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_scene3_top_rows.bin", DataType.raw)
immutable(ubyte)[] flgCreditsScene3TopRows;

@ROMSource([0xA12BC, 0xA57CF][gameVersion], 0x13)
@Asset("data/gfx/common/map_inventory_screen_2.bin", DataType.raw)
immutable(ubyte)[] mapInventoryScreen2;

@ROMSource([0xD7041, 0xD698C][gameVersion], [0x4BC, 0x493][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_credits_image4_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsImage42;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAD468, 0x14D)
	@Asset("data/gfx/" ~ game ~ "/spr_makuadultsprites_2.bin", DataType.raw)
	immutable(ubyte)[] sprMakuadultsprites2;
}

@ROMSource([0xD35E6, 0xD321A][gameVersion], 0x1A7)
@Asset("data/gfx/common/spr_credits_font.bin", DataType.raw)
immutable(ubyte)[] sprCreditsFont;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAC12D, 0x186)
	@Asset("data/gfx/" ~ game ~ "/spr_frypolar_2.bin", DataType.raw)
	immutable(ubyte)[] sprFrypolar2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA7FA4, 0x92)
	@Asset("data/gfx/" ~ game ~ "/spr_triforce_sparkle.bin", DataType.raw)
	immutable(ubyte)[] sprTriforceSparkle;
}

@ROMSource([0xAA738, 0xB0112][gameVersion], 0x197)
@Asset("data/gfx/common/spr_floormaster.bin", DataType.raw)
immutable(ubyte)[] sprFloormaster;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB6152, 0x15D)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_horon_village.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetHoronVillage;
}

@ROMSource([0xD59E2, 0xD5365][gameVersion], 0x123)
@Asset("data/gfx/common/spr_credits_font_object_designers.bin", DataType.raw)
immutable(ubyte)[] sprCreditsFontObjectDesigners;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAFF33, 0xC0)
	@Asset("data/gfx/" ~ game ~ "/spr_dragononox_2.bin", DataType.raw)
	immutable(ubyte)[] sprDragononox2;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBEDEA, 0x236)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_tarm_ruins.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTarmRuins;
}

@ROMSource([0xD4655, 0xD42A2][gameVersion], [0x15A, 0x20][gameVersion])
@Asset("data/gfx/"~ game ~"/map_credits_scene2.bin", DataType.raw)
immutable(ubyte)[] mapCreditsScene2;

@ROMSource([0xA6FED, 0xACD4F][gameVersion], 0x1A4)
@Asset("data/gfx/common/spr_zelda_1.bin", DataType.raw)
immutable(ubyte)[] sprZelda1;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xCEA6F, 0x24)
	@Asset("data/gfx/" ~ game ~ "/map_templefall_scene5.bin", DataType.raw)
	immutable(ubyte)[] mapTemplefallScene5;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB8A90, 0x1A2)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_clock_house.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetClockHouse;
}

@ROMSource([0xA14D6, 0xA59E5][gameVersion], 0x52)
@Asset("data/gfx/common/map_dungeon_minimap.bin", DataType.raw)
immutable(ubyte)[] mapDungeonMinimap;

@ROMSource([0xE3B65, 0xE2AA2][gameVersion], 0x35)
@Asset("data/gfx/common/oth_twinrova_lava_layout.bin", DataType.raw)
immutable(ubyte)[] othTwinrovaLavaLayout;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xABFA1, 0x1AD)
	@Asset("data/gfx/" ~ game ~ "/spr_pastlady_genericguy.bin", DataType.raw)
	immutable(ubyte)[] sprPastladyGenericguy;
}

@ROMSource([0xD37A5, 0xD33E9][gameVersion], [0x15, 0x10][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_scene1_top_rows.bin", DataType.raw)
immutable(ubyte)[] flgCreditsScene1TopRows;

@ROMSource([0xDFAE6, 0xDFBE4][gameVersion], 0xD6)
@Asset("data/gfx/common/spr_fileselect_decorations.bin", DataType.raw)
immutable(ubyte)[] sprFileselectDecorations;

@ROMSource([0xA17D2, 0xA5CA9][gameVersion], [0x16C, 0x13E][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d2.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD2;

@ROMSource([0xDD654, 0xDD758][gameVersion], 0x5CE)
@Asset("data/gfx/common/gfx_credits_linked_waving_goodbye_1.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedWavingGoodbye1;

@ROMSource([0xA1D56, 0xA61AC][gameVersion], [0x143, 0x153][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d6.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD6;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAC9F7, 0x1A1)
	@Asset("data/gfx/" ~ game ~ "/spr_aquamentus_4.bin", DataType.raw)
	immutable(ubyte)[] sprAquamentus4;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xD6E3E, 0x33C)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_credits.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetCredits;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xAA480, 0x1DD)
	@Asset("data/gfx/" ~ game ~ "/spr_bear_monkey.bin", DataType.raw)
	immutable(ubyte)[] sprBearMonkey;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBA523, 0x1C4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_samasa_desert_pirate_ship.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetSamasaDesertPirateShip;
}

@ROMSource([0xA1A9B, 0xA5F33][gameVersion], [0x188, 0x13E][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_blurb_d4.bin", DataType.raw)
immutable(ubyte)[] gfxBlurbD4;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBAF8B, 0x9D)
	@Asset("data/gfx/" ~ game ~ "/gfx_pirate_ship_tiles_3.bin", DataType.raw)
	immutable(ubyte)[] gfxPirateShipTiles3;
}

@ROMSource([0xC1682, 0xC1F05][gameVersion], [0x564, 0x518][gameVersion])
@Asset("data/gfx/"~ game ~"/gfx_tileset_cave_1.bin", DataType.raw)
immutable(ubyte)[] gfxTilesetCave1;

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC2961, 0x3D0)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_zora_palace.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetZoraPalace;
}

@ROMSource([0xE2297, 0xE2390][gameVersion], 0x30)
@Asset("data/gfx/common/map_secret_entry_bottom.bin", DataType.raw)
immutable(ubyte)[] mapSecretEntryBottom;

@ROMSource([0xDF1B5, 0xDF2B9][gameVersion], 0x28B)
@Asset("data/gfx/common/gfx_credits_linked_theend_2.bin", DataType.raw)
immutable(ubyte)[] gfxCreditsLinkedTheend2;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xB851F, 0x3A4)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_onox_castle_outside_1.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetOnoxCastleOutside1;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xAC2B3, 0x11A)
	@Asset("data/gfx/" ~ game ~ "/spr_frypolar_3.bin", DataType.raw)
	immutable(ubyte)[] sprFrypolar3;
}

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xBACA4, 0x169)
	@Asset("data/gfx/" ~ game ~ "/gfx_pirate_ship_tiles_1.bin", DataType.raw)
	immutable(ubyte)[] gfxPirateShipTiles1;
}

@ROMSource([0xD38E5, 0xD351C][gameVersion], [0x24, 0x19][gameVersion])
@Asset("data/gfx/"~ game ~"/flg_credits_image1.bin", DataType.raw)
immutable(ubyte)[] flgCreditsImage1;

@ROMSource([0xD484B, 0xD42DC][gameVersion], 0x124)
@Asset("data/gfx/common/map_credits_image2.bin", DataType.raw)
immutable(ubyte)[] mapCreditsImage2;

@ROMSource([0xC44B2, 0xC3C7A][gameVersion], 0x167)
@Asset("data/gfx/common/map_titlescreen.bin", DataType.raw)
immutable(ubyte)[] mapTitlescreen;

static if (gameVersion == GameVersion.seasons) {
	@ROMSource(0xA3F70, 0x170)
	@Asset("data/gfx/" ~ game ~ "/spr_roller_owl_magnetspinner.bin", DataType.raw)
	immutable(ubyte)[] sprRollerOwlMagnetspinner;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xC518B, 0x84)
	@Asset("data/gfx/" ~ game ~ "/map_intro_link_face_shot.bin", DataType.raw)
	immutable(ubyte)[] mapIntroLinkFaceShot;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xCD225, 0x241)
	@Asset("data/gfx/" ~ game ~ "/spr_black_tower_scene.bin", DataType.raw)
	immutable(ubyte)[] sprBlackTowerScene;
}

static if (gameVersion == GameVersion.ages) {
	@ROMSource(0xBB087, 0x48)
	@Asset("data/gfx/" ~ game ~ "/gfx_tileset_talus_peaks_past_2.bin", DataType.raw)
	immutable(ubyte)[] gfxTilesetTalusPeaksPast2;
}




// PALETTES


@ROMSource(0x5C000, 8)
@Asset("data/gfx/common/palette_data_4000.pal", DataType.raw)
immutable(ubyte)[] paletteData4000;

@ROMSource(0x5C008, 16)
@Asset("data/gfx/common/palette_data_4008.pal", DataType.raw)
immutable(ubyte)[] paletteData4008;

@ROMSource(0x5C018, 64)
@Asset("data/gfx/common/palette_data_4018.pal", DataType.raw)
immutable(ubyte)[] paletteData4018;

@ROMSource(0x5C058, 64)
@Asset("data/gfx/common/palette_data_4058.pal", DataType.raw)
immutable(ubyte)[] paletteData4058;

@ROMSource(0x5C098, 64)
@Asset("data/gfx/common/palette_data_4098.pal", DataType.raw)
immutable(ubyte)[] paletteData4098;

@ROMSource(0x5C0D8, 64)
@Asset("data/gfx/common/palette_data_40D8.pal", DataType.raw)
immutable(ubyte)[] paletteData40D8;

@ROMSource(0x5C118, 32)
@Asset("data/gfx/common/palette_data_4118.pal", DataType.raw)
immutable(ubyte)[] paletteData4118;

@ROMSource(0x5C138, 64)
@Asset("data/gfx/common/palette_data_4138.pal", DataType.raw)
immutable(ubyte)[] paletteData4138;

@ROMSource(0x5C178, 8)
@Asset("data/gfx/common/palette_data_4178.pal", DataType.raw)
immutable(ubyte)[] paletteData4178;

@ROMSource(0x5C180, 48)
@Asset("data/gfx/common/palette_data_4180.pal", DataType.raw)
immutable(ubyte)[] paletteData4180;

@ROMSource(0x5C1B0, 16)
@Asset("data/gfx/common/palette_data_41B0.pal", DataType.raw)
immutable(ubyte)[] paletteData41B0;

@ROMSource(0x5C1C0, 16)
@Asset("data/gfx/common/palette_data_41C0.pal", DataType.raw)
immutable(ubyte)[] paletteData41C0;

@ROMSource(0x5C1D0, 16)
@Asset("data/gfx/common/palette_data_41D0.pal", DataType.raw)
immutable(ubyte)[] paletteData41D0;

@ROMSource(0x5C1E0, 56)
@Asset("data/gfx/common/palette_data_41E0.pal", DataType.raw)
immutable(ubyte)[] paletteData41E0;

@ROMSource(0x5C218, 56)
@Asset("data/gfx/common/palette_data_4218.pal", DataType.raw)
immutable(ubyte)[] paletteData4218;

@ROMSource(0x5C250, 56)
@Asset("data/gfx/common/palette_data_4250.pal", DataType.raw)
immutable(ubyte)[] paletteData4250;

@ROMSource(0x5C288, 16)
@Asset("data/gfx/common/palette_data_4288.pal", DataType.raw)
immutable(ubyte)[] paletteData4288;

@ROMSource(0x5C298, 64)
@Asset("data/gfx/common/palette_data_4298.pal", DataType.raw)
immutable(ubyte)[] paletteData4298;

@ROMSource(0x5C2D8, 64)
@Asset("data/gfx/common/palette_data_42D8.pal", DataType.raw)
immutable(ubyte)[] paletteData42D8;

@ROMSource(0x5C318, 64)
@Asset("data/gfx/common/palette_data_4318.pal", DataType.raw)
immutable(ubyte)[] paletteData4318;

@ROMSource(0x5C358, 64)
@Asset("data/gfx/common/palette_data_4358.pal", DataType.raw)
immutable(ubyte)[] paletteData4358;

@ROMSource(0x5C398, 64)
@Asset("data/gfx/common/palette_data_4398.pal", DataType.raw)
immutable(ubyte)[] paletteData4398;

@ROMSource(0x5C3D8, 24)
@Asset("data/gfx/common/palette_data_43D8.pal", DataType.raw)
immutable(ubyte)[] paletteData43D8;

@ROMSource(0x5C3F0, 8)
@Asset("data/gfx/common/palette_data_43F0.pal", DataType.raw)
immutable(ubyte)[] paletteData43F0;

@ROMSource(0x5C3F8, 48)
@Asset("data/gfx/common/palette_data_43F8.pal", DataType.raw)
immutable(ubyte)[] paletteData43F8;

@ROMSource(0x5C428, 8)
@Asset("data/gfx/common/palette_data_4428.pal", DataType.raw)
immutable(ubyte)[] paletteData4428;

@ROMSource(0x5C430, 64)
@Asset("data/gfx/common/palette_data_4430.pal", DataType.raw)
immutable(ubyte)[] paletteData4430;

@ROMSource(0x5C470, 56)
@Asset("data/gfx/common/palette_data_4470.pal", DataType.raw)
immutable(ubyte)[] paletteData4470;

@ROMSource(0x5C4A8, 48)
@Asset("data/gfx/common/palette_data_44A8.pal", DataType.raw)
immutable(ubyte)[] paletteData44A8;

@ROMSource(0x5C4D8, 16)
@Asset("data/gfx/common/palette_data_44D8.pal", DataType.raw)
immutable(ubyte)[] paletteData44D8;

@ROMSource(0x5C4E8, 8)
@Asset("data/gfx/common/palette_data_44E8.pal", DataType.raw)
immutable(ubyte)[] paletteData44E8;

@ROMSource(0x5C4F0, 8)
@Asset("data/gfx/common/palette_data_44F0.pal", DataType.raw)
immutable(ubyte)[] paletteData44F0;

@ROMSource(0x5C4F8, 8)
@Asset("data/gfx/common/palette_data_44F8.pal", DataType.raw)
immutable(ubyte)[] paletteData44F8;

@ROMSource(0x5C500, 48)
@Asset("data/gfx/common/palette_data_4500.pal", DataType.raw)
immutable(ubyte)[] paletteData4500;

@ROMSource(0x5C530, 32)
@Asset("data/gfx/common/palette_data_4530.pal", DataType.raw)
immutable(ubyte)[] paletteData4530;

@ROMSource(0x5C550, 32)
@Asset("data/gfx/common/palette_data_4550.pal", DataType.raw)
immutable(ubyte)[] paletteData4550;

@ROMSource(0x5C570, 32)
@Asset("data/gfx/common/palette_data_4570.pal", DataType.raw)
immutable(ubyte)[] paletteData4570;

@ROMSource(0x5C590, 56)
@Asset("data/gfx/common/palette_data_4590.pal", DataType.raw)
immutable(ubyte)[] paletteData4590;

@ROMSource(0x5C5C8, 56)
@Asset("data/gfx/common/palette_data_45C8.pal", DataType.raw)
immutable(ubyte)[] paletteData45C8;

@ROMSource(0x5C600, 64)
@Asset("data/gfx/common/palette_data_4600.pal", DataType.raw)
immutable(ubyte)[] paletteData4600;

@ROMSource(0x5C640, 8)
@Asset("data/gfx/common/palette_data_4640.pal", DataType.raw)
immutable(ubyte)[] paletteData4640;

@ROMSource(0x5C648, 32)
@Asset("data/gfx/common/palette_data_4648.pal", DataType.raw)
immutable(ubyte)[] paletteData4648;

@ROMSource(0x5C668, 64)
@Asset("data/gfx/common/palette_data_4668.pal", DataType.raw)
immutable(ubyte)[] paletteData4668;

@ROMSource(0x5C6A8, 24)
@Asset("data/gfx/common/palette_data_46A8.pal", DataType.raw)
immutable(ubyte)[] paletteData46A8;

@ROMSource(0x5C6C0, 32)
@Asset("data/gfx/common/palette_data_46C0.pal", DataType.raw)
immutable(ubyte)[] paletteData46C0;

@ROMSource(0x5C6E0, 16)
@Asset("data/gfx/common/palette_data_46E0.pal", DataType.raw)
immutable(ubyte)[] paletteData46E0;

@ROMSource(0x5C6F0, 64)
@Asset("data/gfx/common/palette_data_46F0.pal", DataType.raw)
immutable(ubyte)[] paletteData46F0;

@ROMSource(0x5C730, 64)
@Asset("data/gfx/common/palette_data_4730.pal", DataType.raw)
immutable(ubyte)[] paletteData4730;

@ROMSource(0x5C770, 40)
@Asset("data/gfx/common/palette_data_4770.pal", DataType.raw)
immutable(ubyte)[] paletteData4770;

@ROMSource(0x5C798, 16)
@Asset("data/gfx/common/palette_data_4798.pal", DataType.raw)
immutable(ubyte)[] paletteData4798;

@ROMSource(0x5C7A8, 24)
@Asset("data/gfx/common/palette_data_47A8.pal", DataType.raw)
immutable(ubyte)[] paletteData47A8;

@ROMSource(0x5C7C0, 48)
@Asset("data/gfx/common/palette_data_47C0.pal", DataType.raw)
immutable(ubyte)[] paletteData47C0;

@ROMSource(0x5C7F0, 64)
@Asset("data/gfx/common/palette_data_47F0.pal", DataType.raw)
immutable(ubyte)[] paletteData47F0;

@ROMSource(0x5C830, 64)
@Asset("data/gfx/common/palette_data_4830.pal", DataType.raw)
immutable(ubyte)[] paletteData4830;

@ROMSource(0x5C870, 32)
@Asset("data/gfx/common/palette_data_4870.pal", DataType.raw)
immutable(ubyte)[] paletteData4870;

@ROMSource(0x5C890, 32)
@Asset("data/gfx/common/palette_data_4890.pal", DataType.raw)
immutable(ubyte)[] paletteData4890;

@ROMSource(0x5C8B0, 48)
@Asset("data/gfx/common/palette_data_48B0.pal", DataType.raw)
immutable(ubyte)[] paletteData48B0;

@ROMSource(0x5C8E0, 16)
@Asset("data/gfx/common/palette_data_48E0.pal", DataType.raw)
immutable(ubyte)[] paletteData48E0;

@ROMSource(0x5C8F0, 48)
@Asset("data/gfx/common/standardSpritePaletteData.pal", DataType.raw)
immutable(ubyte)[] standardSpritePaletteData;

@ROMSource(0x5C920, 8)
@Asset("data/gfx/common/palette_data_4920.pal", DataType.raw)
immutable(ubyte)[] paletteData4920;

@ROMSource(0x5C928, 8)
@Asset("data/gfx/common/palette_data_4928.pal", DataType.raw)
immutable(ubyte)[] paletteData4928;

@ROMSource(0x5C930, 8)
@Asset("data/gfx/common/palette_data_4930.pal", DataType.raw)
immutable(ubyte)[] paletteData4930;

@ROMSource(0x5C938, 8)
@Asset("data/gfx/common/palette_data_4938.pal", DataType.raw)
immutable(ubyte)[] paletteData4938;

@ROMSource(0x5C940, 8)
@Asset("data/gfx/common/palette_data_4940.pal", DataType.raw)
immutable(ubyte)[] paletteData4940;

@ROMSource(0x5C948, 8)
@Asset("data/gfx/common/palette_data_4948.pal", DataType.raw)
immutable(ubyte)[] paletteData4948;

@ROMSource(0x5C950, 8)
@Asset("data/gfx/common/palette_data_4950.pal", DataType.raw)
immutable(ubyte)[] paletteData4950;

@ROMSource(0x5C958, 8)
@Asset("data/gfx/common/palette_data_4958.pal", DataType.raw)
immutable(ubyte)[] paletteData4958;

@ROMSource(0x5C960, 8)
@Asset("data/gfx/common/palette_data_4960.pal", DataType.raw)
immutable(ubyte)[] paletteData4960;

@ROMSource(0x5C968, 8)
@Asset("data/gfx/common/palette_data_4968.pal", DataType.raw)
immutable(ubyte)[] paletteData4968;

@ROMSource(0x5C970, 8)
@Asset("data/gfx/common/palette_data_4970.pal", DataType.raw)
immutable(ubyte)[] paletteData4970;

@ROMSource(0x5C978, 16)
@Asset("data/gfx/common/palette_data_4978.pal", DataType.raw)
immutable(ubyte)[] paletteData4978;

@ROMSource(0x5C988, 8)
@Asset("data/gfx/common/palette_data_4988.pal", DataType.raw)
immutable(ubyte)[] paletteData4988;

@ROMSource(0x5C990, 8)
@Asset("data/gfx/common/palette_data_4990.pal", DataType.raw)
immutable(ubyte)[] paletteData4990;

@ROMSource(0x5C998, 8)
@Asset("data/gfx/common/palette_data_4998.pal", DataType.raw)
immutable(ubyte)[] paletteData4998;

@ROMSource(0x5C9A0, 8)
@Asset("data/gfx/common/palette_data_49A0.pal", DataType.raw)
immutable(ubyte)[] paletteData49A0;

@ROMSource(0x5C9A8, 8)
@Asset("data/gfx/common/palette_data_49A8.pal", DataType.raw)
immutable(ubyte)[] paletteData49A8;

@ROMSource(0x5C9B0, 64)
@Asset("data/gfx/common/palette_data_49B0.pal", DataType.raw)
immutable(ubyte)[] paletteData49B0;

@ROMSource(0x5C9F0, 64)
@Asset("data/gfx/common/palette_data_49F0.pal", DataType.raw)
immutable(ubyte)[] paletteData49F0;

@ROMSource(0x5CA30, 48)
@Asset("data/gfx/common/palette_data_4A30.pal", DataType.raw)
immutable(ubyte)[] paletteData4A30;

@ROMSource(0x5CA60, 48)
@Asset("data/gfx/common/palette_data_4A60.pal", DataType.raw)
immutable(ubyte)[] paletteData4A60;

@ROMSource(0x5CA90, 48)
@Asset("data/gfx/common/palette_data_4A90.pal", DataType.raw)
immutable(ubyte)[] paletteData4A90;

@ROMSource(0x5CAC0, 48)
@Asset("data/gfx/common/palette_data_4AC0.pal", DataType.raw)
immutable(ubyte)[] paletteData4AC0;

@ROMSource(0x5CAF0, 48)
@Asset("data/gfx/common/palette_data_4AF0.pal", DataType.raw)
immutable(ubyte)[] paletteData4AF0;

@ROMSource(0x5CB20, 48)
@Asset("data/gfx/common/palette_data_4B20.pal", DataType.raw)
immutable(ubyte)[] paletteData4B20;

@ROMSource(0x5CB50, 48)
@Asset("data/gfx/common/palette_data_4B50.pal", DataType.raw)
immutable(ubyte)[] paletteData4B50;

@ROMSource(0x5CB80, 48)
@Asset("data/gfx/common/palette_data_4B80.pal", DataType.raw)
immutable(ubyte)[] paletteData4B80;

@ROMSource(0x5CBB0, 48)
@Asset("data/gfx/common/palette_data_4BB0.pal", DataType.raw)
immutable(ubyte)[] paletteData4BB0;

@ROMSource(0x5CBE0, 48)
@Asset("data/gfx/common/palette_data_4BE0.pal", DataType.raw)
immutable(ubyte)[] paletteData4BE0;

@ROMSource(0x5CC10, 48)
@Asset("data/gfx/common/palette_data_4C10.pal", DataType.raw)
immutable(ubyte)[] paletteData4C10;

@ROMSource(0x5CC40, 48)
@Asset("data/gfx/common/palette_data_4C40.pal", DataType.raw)
immutable(ubyte)[] paletteData4C40;

@ROMSource(0x5CC70, 48)
@Asset("data/gfx/common/palette_data_4C70.pal", DataType.raw)
immutable(ubyte)[] paletteData4C70;

@ROMSource(0x5CCA0, 48)
@Asset("data/gfx/common/palette_data_4CA0.pal", DataType.raw)
immutable(ubyte)[] paletteData4CA0;

@ROMSource(0x5CCD0, 48)
@Asset("data/gfx/common/palette_data_4CD0.pal", DataType.raw)
immutable(ubyte)[] paletteData4CD0;

@ROMSource(0x5CD00, 48)
@Asset("data/gfx/common/palette_data_4D00.pal", DataType.raw)
immutable(ubyte)[] paletteData4D00;

@ROMSource(0x5CD30, 48)
@Asset("data/gfx/common/palette_data_4D30.pal", DataType.raw)
immutable(ubyte)[] paletteData4D30;

@ROMSource(0x5CD60, 48)
@Asset("data/gfx/common/palette_data_4D60.pal", DataType.raw)
immutable(ubyte)[] paletteData4D60;

@ROMSource(0x5CD90, 48)
@Asset("data/gfx/common/palette_data_4D90.pal", DataType.raw)
immutable(ubyte)[] paletteData4D90;

@ROMSource(0x5CDC0, 48)
@Asset("data/gfx/common/palette_data_4DC0.pal", DataType.raw)
immutable(ubyte)[] paletteData4DC0;

@ROMSource(0x5CDF0, 48)
@Asset("data/gfx/common/palette_data_4DF0.pal", DataType.raw)
immutable(ubyte)[] paletteData4DF0;

@ROMSource(0x5CE20, 48)
@Asset("data/gfx/common/palette_data_4E20.pal", DataType.raw)
immutable(ubyte)[] paletteData4E20;

@ROMSource(0x5CE50, 48)
@Asset("data/gfx/common/palette_data_4E50.pal", DataType.raw)
immutable(ubyte)[] paletteData4E50;

@ROMSource(0x5CE80, 48)
@Asset("data/gfx/common/palette_data_4E80.pal", DataType.raw)
immutable(ubyte)[] paletteData4E80;

@ROMSource(0x5CEB0, 48)
@Asset("data/gfx/common/palette_data_4EB0.pal", DataType.raw)
immutable(ubyte)[] paletteData4EB0;

@ROMSource(0x5CEE0, 48)
@Asset("data/gfx/common/palette_data_4EE0.pal", DataType.raw)
immutable(ubyte)[] paletteData4EE0;

@ROMSource(0x5CF10, 48)
@Asset("data/gfx/common/palette_data_4F10.pal", DataType.raw)
immutable(ubyte)[] paletteData4F10;

@ROMSource(0x5CF40, 48)
@Asset("data/gfx/common/palette_data_4F40.pal", DataType.raw)
immutable(ubyte)[] paletteData4F40;

@ROMSource(0x5CF70, 48)
@Asset("data/gfx/common/palette_data_4F70.pal", DataType.raw)
immutable(ubyte)[] paletteData4F70;

@ROMSource(0x5CFA0, 48)
@Asset("data/gfx/common/palette_data_4FA0.pal", DataType.raw)
immutable(ubyte)[] paletteData4FA0;

@ROMSource(0x5CFD0, 48)
@Asset("data/gfx/common/palette_data_4FD0.pal", DataType.raw)
immutable(ubyte)[] paletteData4FD0;

@ROMSource(0x5D000, 48)
@Asset("data/gfx/common/palette_data_5000.pal", DataType.raw)
immutable(ubyte)[] paletteData5000;

@ROMSource(0x5D030, 48)
@Asset("data/gfx/common/palette_data_5030.pal", DataType.raw)
immutable(ubyte)[] paletteData5030;

@ROMSource(0x5D060, 48)
@Asset("data/gfx/common/palette_data_5060.pal", DataType.raw)
immutable(ubyte)[] paletteData5060;

@ROMSource(0x5D090, 48)
@Asset("data/gfx/common/palette_data_5090.pal", DataType.raw)
immutable(ubyte)[] paletteData5090;

@ROMSource(0x5D0C0, 48)
@Asset("data/gfx/common/palette_data_50C0.pal", DataType.raw)
immutable(ubyte)[] paletteData50C0;

@ROMSource(0x5D0F0, 48)
@Asset("data/gfx/common/palette_data_50F0.pal", DataType.raw)
immutable(ubyte)[] paletteData50F0;

@ROMSource(0x5D120, 48)
@Asset("data/gfx/common/palette_data_5120.pal", DataType.raw)
immutable(ubyte)[] paletteData5120;

@ROMSource(0x5D150, 48)
@Asset("data/gfx/common/palette_data_5150.pal", DataType.raw)
immutable(ubyte)[] paletteData5150;

@ROMSource(0x5D180, 48)
@Asset("data/gfx/common/palette_data_5180.pal", DataType.raw)
immutable(ubyte)[] paletteData5180;

@ROMSource(0x5D1B0, 48)
@Asset("data/gfx/common/palette_data_51B0.pal", DataType.raw)
immutable(ubyte)[] paletteData51B0;

@ROMSource(0x5D1E0, 48)
@Asset("data/gfx/common/palette_data_51E0.pal", DataType.raw)
immutable(ubyte)[] paletteData51E0;

@ROMSource(0x5D210, 48)
@Asset("data/gfx/common/palette_data_5210.pal", DataType.raw)
immutable(ubyte)[] paletteData5210;

@ROMSource(0x5D240, 96)
@Asset("data/gfx/common/palette_data_5240.pal", DataType.raw)
immutable(ubyte)[] paletteData5240;

@ROMSource(0x5D2A0, 48)
@Asset("data/gfx/common/palette_data_52A0.pal", DataType.raw)
immutable(ubyte)[] paletteData52A0;

@ROMSource(0x5D2D0, 48)
@Asset("data/gfx/common/palette_data_52D0.pal", DataType.raw)
immutable(ubyte)[] paletteData52D0;

@ROMSource(0x5D300, 48)
@Asset("data/gfx/common/palette_data_5300.pal", DataType.raw)
immutable(ubyte)[] paletteData5300;

@ROMSource(0x5D330, 48)
@Asset("data/gfx/common/palette_data_5330.pal", DataType.raw)
immutable(ubyte)[] paletteData5330;

@ROMSource(0x5D360, 48)
@Asset("data/gfx/common/palette_data_5360.pal", DataType.raw)
immutable(ubyte)[] paletteData5360;

@ROMSource(0x5D390, 8)
@Asset("data/gfx/common/palette_data_5390.pal", DataType.raw)
immutable(ubyte)[] paletteData5390;

@ROMSource(0x5D398, 8)
@Asset("data/gfx/common/palette_data_5398.pal", DataType.raw)
immutable(ubyte)[] paletteData5398;

@ROMSource(0x5D3A0, 8)
@Asset("data/gfx/common/palette_data_53A0.pal", DataType.raw)
immutable(ubyte)[] paletteData53A0;

@ROMSource(0x5D3A8, 8)
@Asset("data/gfx/common/palette_data_53A8.pal", DataType.raw)
immutable(ubyte)[] paletteData53A8;

@ROMSource(0x5D3B0, 8)
@Asset("data/gfx/common/palette_data_53B0.pal", DataType.raw)
immutable(ubyte)[] paletteData53B0;

@ROMSource(0x5D3B8, 8)
@Asset("data/gfx/common/palette_data_53B8.pal", DataType.raw)
immutable(ubyte)[] paletteData53B8;

@ROMSource(0x5D3C0, 8)
@Asset("data/gfx/common/palette_data_53C0.pal", DataType.raw)
immutable(ubyte)[] paletteData53C0;

@ROMSource(0x5D3C8, 8)
@Asset("data/gfx/common/palette_data_53C8.pal", DataType.raw)
immutable(ubyte)[] paletteData53C8;

@ROMSource(0x5D3D0, 8)
@Asset("data/gfx/common/palette_data_53D0.pal", DataType.raw)
immutable(ubyte)[] paletteData53D0;

@ROMSource(0x5D3D8, 8)
@Asset("data/gfx/common/palette_data_53D8.pal", DataType.raw)
immutable(ubyte)[] paletteData53D8;

@ROMSource(0x5D3E0, 8)
@Asset("data/gfx/common/palette_data_53E0.pal", DataType.raw)
immutable(ubyte)[] paletteData53E0;

@ROMSource(0x5D3E8, 8)
@Asset("data/gfx/common/palette_data_53E8.pal", DataType.raw)
immutable(ubyte)[] paletteData53E8;

@ROMSource(0x5D3F0, 48)
@Asset("data/gfx/common/palette_data_53F0.pal", DataType.raw)
immutable(ubyte)[] paletteData53F0;

@ROMSource(0x5D420, 48)
@Asset("data/gfx/common/palette_data_5420.pal", DataType.raw)
immutable(ubyte)[] paletteData5420;

@ROMSource(0x5D450, 48)
@Asset("data/gfx/common/palette_data_5450.pal", DataType.raw)
immutable(ubyte)[] paletteData5450;

@ROMSource(0x5D480, 48)
@Asset("data/gfx/common/palette_data_5480.pal", DataType.raw)
immutable(ubyte)[] paletteData5480;

@ROMSource(0x5D4B0, 48)
@Asset("data/gfx/common/palette_data_54B0.pal", DataType.raw)
immutable(ubyte)[] paletteData54B0;

@ROMSource(0x5D4E0, 48)
@Asset("data/gfx/common/palette_data_54E0.pal", DataType.raw)
immutable(ubyte)[] paletteData54E0;

@ROMSource(0x5D510, 48)
@Asset("data/gfx/common/palette_data_5510.pal", DataType.raw)
immutable(ubyte)[] paletteData5510;

@ROMSource(0x5D540, 48)
@Asset("data/gfx/common/palette_data_5540.pal", DataType.raw)
immutable(ubyte)[] paletteData5540;

@ROMSource(0x5D570, 48)
@Asset("data/gfx/common/palette_data_5570.pal", DataType.raw)
immutable(ubyte)[] paletteData5570;

@ROMSource(0x5D5A0, 48)
@Asset("data/gfx/common/palette_data_55A0.pal", DataType.raw)
immutable(ubyte)[] paletteData55A0;

@ROMSource(0x5D5D0, 48)
@Asset("data/gfx/common/palette_data_55D0.pal", DataType.raw)
immutable(ubyte)[] paletteData55D0;

@ROMSource(0x5D600, 48)
@Asset("data/gfx/common/palette_data_5600.pal", DataType.raw)
immutable(ubyte)[] paletteData5600;

@ROMSource(0x5D630, 48)
@Asset("data/gfx/common/palette_data_5630.pal", DataType.raw)
immutable(ubyte)[] paletteData5630;

@ROMSource(0x5D660, 48)
@Asset("data/gfx/common/palette_data_5660.pal", DataType.raw)
immutable(ubyte)[] paletteData5660;

@ROMSource(0x5D690, 48)
@Asset("data/gfx/common/palette_data_5690.pal", DataType.raw)
immutable(ubyte)[] paletteData5690;

@ROMSource(0x5D6C0, 48)
@Asset("data/gfx/common/palette_data_56C0.pal", DataType.raw)
immutable(ubyte)[] paletteData56C0;

@ROMSource(0x5D6F0, 48)
@Asset("data/gfx/common/palette_data_56F0.pal", DataType.raw)
immutable(ubyte)[] paletteData56F0;

@ROMSource(0x5D720, 48)
@Asset("data/gfx/common/palette_data_5720.pal", DataType.raw)
immutable(ubyte)[] paletteData5720;

@ROMSource(0x5D750, 48)
@Asset("data/gfx/common/palette_data_5750.pal", DataType.raw)
immutable(ubyte)[] paletteData5750;

@ROMSource(0x5D780, 48)
@Asset("data/gfx/common/palette_data_5780.pal", DataType.raw)
immutable(ubyte)[] paletteData5780;

@ROMSource(0x5D7B0, 48)
@Asset("data/gfx/common/palette_data_57B0.pal", DataType.raw)
immutable(ubyte)[] paletteData57B0;

@ROMSource(0x5D7E0, 56)
@Asset("data/gfx/common/palette_data_57E0.pal", DataType.raw)
immutable(ubyte)[] paletteData57E0;

@ROMSource(0x5D818, 64)
@Asset("data/gfx/common/palette_data_5818.pal", DataType.raw)
immutable(ubyte)[] paletteData5818;

@ROMSource(0x5D858, 32)
@Asset("data/gfx/common/palette_data_5858.pal", DataType.raw)
immutable(ubyte)[] paletteData5858;

@ROMSource(0x5D878, 40)
@Asset("data/gfx/common/palette_data_5878.pal", DataType.raw)
immutable(ubyte)[] paletteData5878;

@ROMSource(0x5D8A0, 40)
@Asset("data/gfx/common/palette_data_58A0.pal", DataType.raw)
immutable(ubyte)[] paletteData58A0;

@ROMSource(0x5D8C8, 40)
@Asset("data/gfx/common/palette_data_58C8.pal", DataType.raw)
immutable(ubyte)[] paletteData58C8;

@ROMSource(0x5D8F0, 16)
@Asset("data/gfx/common/palette_data_58F0.pal", DataType.raw)
immutable(ubyte)[] paletteData58F0;

@ROMSource(0x5D900, 8)
@Asset("data/gfx/common/palette_data_5900.pal", DataType.raw)
immutable(ubyte)[] paletteData5900;

@ROMSource(0x5D908, 8)
@Asset("data/gfx/common/palette_data_5908.pal", DataType.raw)
immutable(ubyte)[] paletteData5908;

@ROMSource(0x5D910, 8)
@Asset("data/gfx/common/palette_data_5910.pal", DataType.raw)
immutable(ubyte)[] paletteData5910;

@ROMSource(0x5D918, 8)
@Asset("data/gfx/common/palette_data_5918.pal", DataType.raw)
immutable(ubyte)[] paletteData5918;

@ROMSource(0x5D920, 8)
@Asset("data/gfx/common/palette_data_5920.pal", DataType.raw)
immutable(ubyte)[] paletteData5920;

@ROMSource(0x5D928, 8)
@Asset("data/gfx/common/palette_data_5928.pal", DataType.raw)
immutable(ubyte)[] paletteData5928;

@ROMSource(0x5D930, 16)
@Asset("data/gfx/common/palette_data_5930.pal", DataType.raw)
immutable(ubyte)[] paletteData5930;

@ROMSource(0x5D940, 8)
@Asset("data/gfx/common/palette_data_5940.pal", DataType.raw)
immutable(ubyte)[] paletteData5940;

@ROMSource(0x5D948, 8)
@Asset("data/gfx/common/palette_data_5948.pal", DataType.raw)
immutable(ubyte)[] paletteData5948;

@ROMSource(0x5D950, 8)
@Asset("data/gfx/common/palette_data_5950.pal", DataType.raw)
immutable(ubyte)[] paletteData5950;

@ROMSource(0x5D958, 8)
@Asset("data/gfx/common/palette_data_5958.pal", DataType.raw)
immutable(ubyte)[] paletteData5958;

@ROMSource(0x5D960, 8)
@Asset("data/gfx/common/palette_data_5960.pal", DataType.raw)
immutable(ubyte)[] paletteData5960;

const(ubyte)[] gfxAsset(GFXAsset asset, ushort offset) {
	static import oracles.globals;
	final switch (asset) {
		static foreach (Asset; EnumMembers!GFXAsset) {
			static if (is(typeof(mixin(Asset.stringof)))) {
				case Asset: return mixin(Asset.stringof)[offset .. $];
			}
		}
		case GFXAsset.none: return [];
		case GFXAsset.paletteDataDEB0: return oracles.globals.tilesetPalettes[0x30 .. 0x38];
		case GFXAsset.tileMap: return oracles.globals.tileMap[offset .. $];
		case GFXAsset.statusBarAttributeMap: return oracles.globals.statusBarAttributeMap[offset .. $];
		case GFXAsset.statusBarTileMap: return oracles.globals.statusBarTileMap[offset .. $];
		case GFXAsset.vramTiles: return oracles.globals.vramTiles[offset .. $];
		case GFXAsset.tileMappingIndices: return oracles.globals.tileMappingIndices[offset .. $];
		case GFXAsset.attributeMap: return oracles.globals.attributeMap[offset .. $];
		case GFXAsset.nameEntryCharacterGFX: return oracles.globals.nameEntryCharacterGFX[offset .. $];
		case GFXAsset.gfxBuf: return oracles.globals.gfxBuf[offset .. $];
	}
}
