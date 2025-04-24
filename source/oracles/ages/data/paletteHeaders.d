module oracles.ages.data.paletteHeaders;

import oracles.data;
import oracles.defs;
import oracles.structures;

//; TODO: Finish labelling these
//;
//; Naming conventions:
//; - PALH_TILESET: Palettes used by tilesets, should load bg palettes 2-7.
//;                 May also load a sprite palette or two (ie. PALH_TILESET_BIGGORON)
//; - PALH_BG:      Loads bg palettes only (not used for tilesets)
//; - PALH_SPR:     Loads sprite palettes only
//; - PALH:         If none of the above, could load both sprite & bg palettes (or not yet categorized)

immutable PALHeader[][] paletteHeaderTable = [
	PalH.unnamed00: [
		PALHeader(false, 0, 1, GFXAsset.paletteData4000),
	],
	PalH.unnamed01: [
		PALHeader(false, 0, 2, GFXAsset.paletteData4008),
	],
	PalH.unnamed02: [
		PALHeader(false, 0, 1, GFXAsset.paletteData5960),
		PALHeader(true, 0, 1, GFXAsset.paletteData5960),
	],
	PalH.unnamed03: [
		PALHeader(false, 0, 8, GFXAsset.paletteData4018),
		PALHeader(true, 0, 8, GFXAsset.paletteData4058),
	],
	PalH.unnamed04: [
		PALHeader(false, 0, 4, GFXAsset.paletteData4648),
	],
	PalH.unnamed05: [
		PALHeader(false, 0, 1, GFXAsset.paletteData48E0),
		PALHeader(false, 2, 5, GFXAsset.paletteData5878),
		PALHeader(true, 0, 4, GFXAsset.standardSpritePaletteData),
		PALHeader(true, 4, 3, GFXAsset.paletteData5858),
	],
	PalH.unnamed06: [
		PALHeader(false, 0, 1, GFXAsset.paletteData48E0),
		PALHeader(false, 2, 5, GFXAsset.paletteData58A0),
		PALHeader(true, 0, 4, GFXAsset.standardSpritePaletteData),
		PALHeader(true, 4, 3, GFXAsset.paletteData5858),
	],
	PalH.unnamed07: [
		PALHeader(false, 0, 8, GFXAsset.paletteData4098),
		PALHeader(true, 0, 8, GFXAsset.paletteData4138),
	],
	PalH.unnamed08: [
		PALHeader(false, 0, 8, GFXAsset.paletteData40D8),
		PALHeader(true, 0, 8, GFXAsset.paletteData4138),
	],
	PalH.unnamed09: [
		PALHeader(false, 2, 4, GFXAsset.paletteData4118),
		PALHeader(true, 0, 6, GFXAsset.standardSpritePaletteData),
	],
	PalH.unnamed0A: [
		PALHeader(false, 0, 2, GFXAsset.paletteData48E0),
		PALHeader(false, 2, 6, GFXAsset.standardSpritePaletteData),
		PALHeader(true, 0, 6, GFXAsset.standardSpritePaletteData),
	],
	PalH.unnamed0B: [
		PALHeader(true, 0, 4, GFXAsset.standardSpritePaletteData),
		PALHeader(true, 2, 1, GFXAsset.paletteData43F0),
		PALHeader(true, 4, 3, GFXAsset.paletteData47A8),
	],
	PalH.unnamed0C: [
		PALHeader(false, 0, 8, GFXAsset.paletteData49B0),
		PALHeader(true, 0, 8, GFXAsset.paletteData49F0),
	],
	PalH.unnamed0D: [
		PALHeader(false, 1, 1, GFXAsset.paletteData4928),
	],
	PalH.unnamed0E: [
		PALHeader(false, 1, 1, GFXAsset.paletteData4920),
	],
	PalH.unnamed0F: [
		PALHeader(false, 0, 1, GFXAsset.paletteData48E0),
		PALHeader(true, 0, 6, GFXAsset.standardSpritePaletteData),
	],
	PalH.tilesetLynnaCity: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4A30),
	],
	PalH.tilesetLynnaVillage: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4A60),
	],
	PalH.tilesetFairiesForest: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4BB0),
	],
	PalH.tilesetDekuForest: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4BE0),
	],
	PalH.tilesetCrescentIslandPresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4C10),
	],
	PalH.tilesetCrescentIslandPast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4C40),
	],
	PalH.tilesetSymmetryCityRuined: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4C70),
	],
	PalH.tilesetSymmetryCityPast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4CA0),
	],
	PalH.tilesetRollingRidgePresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4D90),
	],
	PalH.unnamed19: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4D90),
	],
	PalH.unnamed1A: [],
	PalH.tilesetRollingRidgePast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4DC0),
	],
	PalH.tilesetEyeglassLibraryOutsidePresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4DF0),
	],
	PalH.tilesetEyeglassLibraryOutsidePast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4E20),
	],
	PalH.unnamed1E: [],
	PalH.tilesetSeaOfNoReturn: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4E50),
	],
	PalH.unnamed20: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4A30),
	],
	PalH.unnamed21: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4A30),
	],
	PalH.tilesetYollGraveyard: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4A90),
	],
	PalH.tilesetYollGraveyardAlternate: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4A90),
	],
	PalH.tilesetBlackTowerOutsidePresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4AC0),
	],
	PalH.tilesetBlackTowerOutsidePast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4AF0),
	],
	PalH.tilesetNuunHighlands: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4F10),
	],
	PalH.tilesetAmbisPalaceOutside: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4F40),
	],
	PalH.tilesetTalusPeaksPresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4CD0),
	],
	PalH.tilesetTalusPeaksPast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4D00),
	],
	PalH.tilesetTalusPeaksPastAlternate: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4D30),
	],
	PalH.tilesetUnderwaterPresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4EB0),
	],
	PalH.tilesetUnderwaterPast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4EE0),
	],
	PalH.tilesetForestOfTime: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4B20),
	],
	PalH.tilesetSymmetryCityRestored: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4D60),
	],
	PalH.tilesetMermaidsCavePastEntrance: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4B80),
	],
	PalH.tilesetMakuTreeAges: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4F70),
	],
	PalH.tilesetMakuTreeTop: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4FA0),
	],
	PalH.tilesetJabuJabuOutside: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4E80),
	],
	PalH.tilesetOverworldPastAlternate: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4B50),
	],
//; Color for seaweed being cut underwater
	PalH.seaweedCut: [
		PALHeader(true, 6, 1, GFXAsset.paletteData5950),
	],
	PalH.unnamed35: [],
	PalH.unnamed36: [],
	PalH.unnamed37: [],
	PalH.unnamed38: [],
	PalH.unnamed39: [],
	PalH.unnamed3A: [],
	PalH.unnamed3B: [],
	PalH.unnamed3C: [],
	PalH.unnamed3D: [],
	PalH.unnamed3E: [],
	PalH.unnamed3F: [],
	PalH.tilesetMakuPathPresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5000),
	],
	PalH.tilesetSpiritsGrave: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5060),
	],
	PalH.tilesetWingDungeon: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5090),
	],
	PalH.tilesetMoonlitGrotto: [
		PALHeader(false, 2, 6, GFXAsset.paletteData50C0),
	],
	PalH.tilesetSkullDungeon: [
		PALHeader(false, 2, 6, GFXAsset.paletteData50F0),
	],
	PalH.tilesetCrownDungeon: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5120),
	],
	PalH.tilesetMermaidsCavePresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5150),
	],
	PalH.tilesetJabuJabusBelly: [
		PALHeader(false, 2, 6, GFXAsset.paletteData51E0),
	],
	PalH.tilesetAncientTomb: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5240),
	],
	PalH.tilesetBlackTowerTop: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5300),
	],
	PalH.tilesetRoomOfRites: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5360),
	],
	PalH.tilesetHerosCaveAges: [
		PALHeader(false, 2, 6, GFXAsset.paletteData53F0),
	],
	PalH.tilesetMermaidsCavePast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5180),
	],
	PalH.tilesetMakuPathPast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5030),
	],
	PalH.unnamed4E: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5000),
	],
	PalH.unnamed4F: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5000),
	],
	PalH.tilesetSidescrollMermaidsCavePresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5480),
	],
	PalH.tilesetSidescrollSpiritsGrave: [
		PALHeader(false, 2, 6, GFXAsset.paletteData54B0),
	],
	PalH.tilesetSidescroll: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5480),
	],
	PalH.tilesetSidescrollSkullDungeonCrownDungeon: [
		PALHeader(false, 2, 6, GFXAsset.paletteData54E0),
	],
	PalH.tilesetSidescrollJabuJabusBelly: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5510),
	],
	PalH.tilesetSidescrollAncientTomb: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5540),
	],
	PalH.tilesetSidescrollMermaidsCavePast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5570),
	],
	PalH.tilesetSidescrollB: [
		PALHeader(false, 2, 6, GFXAsset.paletteData55A0),
	],
	PalH.tilesetSidescrollC: [
		PALHeader(false, 2, 6, GFXAsset.paletteData55D0),
	],
	PalH.blackTowerTopWithBushes: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5330),
	],
	PalH.unnamed5A: [],
	PalH.unnamed5B: [],
	PalH.unnamed5C: [],
	PalH.unnamed5D: [],
	PalH.unnamed5E: [],
	PalH.unnamed5F: [],
	PalH.tilesetBlackTower: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4FD0),
	],
	PalH.tilesetMermaidsCavePastUnderwater: [
		PALHeader(false, 2, 6, GFXAsset.paletteData51B0),
	],
	PalH.tilesetJabuJabusBellyUnderwater: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5210),
	],
	PalH.tilesetAncientTombBoss: [
		PALHeader(false, 2, 6, GFXAsset.paletteData52A0),
	],
	PalH.tilesetAncientTombUnderwater: [
		PALHeader(false, 2, 6, GFXAsset.paletteData52D0),
	],
	PalH.tilesetHerosCaveUnderwater: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5450),
	],
	PalH.tilesetHerosCaveWithBushes: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5420),
	],
	PalH.tilesetRoomOfRitesIceAges: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5360),
		PALHeader(false, 6, 1, GFXAsset.paletteData49A8),
	],
	PalH.unnamed68: [],
	PalH.unnamed69: [],
	PalH.unnamed6A: [],
	PalH.unnamed6B: [],
	PalH.unnamed6C: [],
	PalH.unnamed6D: [],
	PalH.unnamed6E: [],
	PalH.unnamed6F: [],
	PalH.tilesetIndoorsPresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5600),
	],
	PalH.tilesetOldManCavePresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5630),
	],
	PalH.tilesetIndoorsPast: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5690),
	],
	PalH.tilesetCaveAges: [
		PALHeader(false, 2, 6, GFXAsset.paletteData56C0),
	],
	PalH.tilesetAmbisPalace: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5720),
	],
	PalH.tilesetMoblinFortress: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5750),
	],
	PalH.tilesetZoraPalace: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5780),
	],
	PalH.tilesetMakuTreeInsideAges: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5660),
	],
	PalH.tilesetRollingRidgeCavePresent: [
		PALHeader(false, 2, 6, GFXAsset.paletteData56F0),
	],
	PalH.tilesetUnderwaterCave: [
		PALHeader(false, 2, 6, GFXAsset.paletteData57B0),
	],
	PalH.unnamed7A: [],
	PalH.unnamed7B: [],
	PalH.unnamed7C: [
		PALHeader(true, 6, 1, GFXAsset.paletteData5948),
	],
	PalH.unnamed7D: [
		PALHeader(true, 6, 1, GFXAsset.paletteData5940),
	],
	PalH.unnamed7E: [
		PALHeader(true, 6, 1, GFXAsset.paletteData5918),
	],
	PalH.sprLinkStone: [
		PALHeader(true, 7, 1, GFXAsset.paletteData4938),
	],
	PalH.unnamed80: [
		PALHeader(true, 6, 1, GFXAsset.paletteData46A8),
	],
	PalH.unnamed81: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4958),
	],
	PalH.unnamed82: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4998),
	],
	PalH.unnamed83: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4968),
	],
	PalH.unnamed84: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4970),
	],
	PalH.unnamed85: [
		PALHeader(true, 6, 1, GFXAsset.paletteData49A0),
	],
	PalH.unnamed86: [
		PALHeader(true, 6, 1, GFXAsset.paletteDataDEB0),
	],
	PalH.unnamed87: [
		PALHeader(true, 6, 2, GFXAsset.paletteData4978),
	],
	PalH.unnamed88: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4960),
	],
	PalH.unnamed89: [
		PALHeader(true, 6, 1, GFXAsset.paletteData5908),
		PALHeader(true, 7, 1, GFXAsset.paletteData5910),
	],
	PalH.unnamed8A: [
		PALHeader(true, 7, 1, GFXAsset.paletteData4978),
	],
	PalH.unnamed8B: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4988),
		PALHeader(false, 7, 1, GFXAsset.paletteData5390),
	],
	PalH.unnamed8C: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4990),
	],
	PalH.unnamed8D: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4948),
	],
	PalH.unnamed8E: [
		PALHeader(false, 2, 6, GFXAsset.paletteData5360),
		PALHeader(false, 6, 1, GFXAsset.paletteData49A8),
	],
	PalH.unnamed8F: [
		PALHeader(false, 2, 6, GFXAsset.paletteData4500),
	],
	PalH.unnamed90: [
		PALHeader(false, 1, 7, GFXAsset.paletteData41E0),
		PALHeader(true, 2, 6, GFXAsset.paletteData4180),
	],
	PalH.unnamed91: [
		PALHeader(false, 0, 1, GFXAsset.paletteData48E0),
		PALHeader(false, 2, 6, GFXAsset.paletteData43F8),
		PALHeader(true, 0, 6, GFXAsset.standardSpritePaletteData),
		PALHeader(true, 6, 1, GFXAsset.paletteData43F0),
	],
	PalH.unnamed92: [
		PALHeader(false, 0, 8, GFXAsset.paletteData4298),
		PALHeader(true, 0, 8, GFXAsset.paletteData4358),
	],
	PalH.unnamed93: [
		PALHeader(false, 0, 8, GFXAsset.paletteData42D8),
		PALHeader(true, 0, 8, GFXAsset.paletteData4398),
	],
	PalH.unnamed94: [
		PALHeader(false, 0, 8, GFXAsset.paletteData4318),
		PALHeader(true, 2, 3, GFXAsset.paletteData43D8),
	],
	PalH.unnamed95: [
		PALHeader(false, 0, 8, GFXAsset.paletteData4430),
		PALHeader(true, 0, 7, GFXAsset.paletteData4470),
	],
	PalH.unnamed96: [
		PALHeader(false, 1, 7, GFXAsset.paletteData4218),
	],
	PalH.unnamed97: [
		PALHeader(true, 6, 2, GFXAsset.paletteData44D8),
	],
	PalH.unnamed98: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4428),
	],
	PalH.unnamed99: [
		PALHeader(false, 2, 6, GFXAsset.paletteData44A8),
	],
	PalH.unnamed9A: [
		PALHeader(false, 2, 4, GFXAsset.paletteData4530),
	],
	PalH.unnamed9B: [
		PALHeader(false, 0, 7, GFXAsset.paletteData4250),
		PALHeader(true, 0, 2, GFXAsset.paletteData4288),
	],
	PalH.unnamed9C: [
		PALHeader(false, 0, 4, GFXAsset.paletteData4648),
	],
	PalH.unnamed9D: [
		PALHeader(false, 1, 7, GFXAsset.paletteData4590),
		PALHeader(true, 0, 8, GFXAsset.paletteData4600),
	],
	PalH.unnamed9E: [
		PALHeader(false, 1, 7, GFXAsset.paletteData45C8),
		PALHeader(true, 1, 1, GFXAsset.paletteData4640),
	],
	PalH.unnamed9F: [
		PALHeader(false, 0, 8, GFXAsset.paletteData47F0),
		PALHeader(true, 0, 8, GFXAsset.paletteData4830),
	],
	PalH.unnamedA0: [
		PALHeader(false, 0, 5, GFXAsset.paletteData4770),
		PALHeader(true, 0, 2, GFXAsset.paletteData4798),
	],
	PalH.unnamedA1: [
		PALHeader(false, 0, 4, GFXAsset.paletteData46C0),
		PALHeader(true, 0, 2, GFXAsset.paletteData46E0),
	],
	PalH.unnamedA2: [
		PALHeader(true, 6, 1, GFXAsset.paletteData44E8),
	],
	PalH.unnamedA3: [
		PALHeader(true, 6, 1, GFXAsset.paletteData5958),
	],
	PalH.unnamedA4: [
		PALHeader(true, 6, 2, GFXAsset.paletteData41B0),
	],
	PalH.unnamedA5: [
		PALHeader(true, 6, 2, GFXAsset.paletteData41C0),
	],
	PalH.unnamedA6: [
		PALHeader(true, 6, 2, GFXAsset.paletteData41D0),
	],
	PalH.unnamedA7: [
//.ifndef REGION_JP
		PALHeader(false, 0, 6, GFXAsset.paletteData48B0),
		PALHeader(true, 0, 6, GFXAsset.paletteData48B0),
	],
//.endif
	PalH.secretListMenuAges: [
		PALHeader(false, 2, 4, GFXAsset.paletteData58C8),
		PALHeader(true, 0, 8, GFXAsset.paletteData4138),
	],
	PalH.unnamedA9: [
		PALHeader(false, 2, 6, GFXAsset.paletteData47C0),
	],
	PalH.unnamedAA: [
		PALHeader(false, 0, 6, GFXAsset.paletteData4870),
		PALHeader(true, 4, 4, GFXAsset.paletteData4890),
	],
	PalH.unnamedAB: [
		PALHeader(true, 7, 1, GFXAsset.paletteData4178),
	],
	PalH.unnamedAC: [
		PALHeader(true, 6, 2, GFXAsset.paletteData58F0),
	],
	PalH.unnamedAD: [
		PALHeader(true, 6, 2, GFXAsset.paletteData44E8),
	],
	PalH.unnamedAE: [
		PALHeader(false, 0, 8, GFXAsset.paletteData4730),
	],
	PalH.unnamedAF: [
		PALHeader(true, 7, 1, GFXAsset.paletteData5900),
	],
	PalH.unnamedB0: [],
	PalH.unnamedB1: [
		PALHeader(false, 7, 1, GFXAsset.paletteData5390),
	],
	PalH.unnamedB2: [
		PALHeader(false, 7, 1, GFXAsset.paletteData5398),
	],
	PalH.unnamedB3: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53A0),
	],
	PalH.unnamedB4: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53A8),
	],
	PalH.unnamedB5: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53B0),
	],
	PalH.unnamedB6: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53B8),
	],
	PalH.unnamedB7: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53C0),
	],
	PalH.unnamedB8: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53C8),
	],
	PalH.unnamedB9: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53D0),
	],
	PalH.unnamedBA: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53D8),
	],
	PalH.unnamedBB: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53E0),
	],
	PalH.unnamedBC: [
		PALHeader(false, 7, 1, GFXAsset.paletteData53E8),
	],
	PalH.unnamedBD: [
		PALHeader(false, 1, 1, GFXAsset.paletteData4930),
	],
	PalH.unnamedBE: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4950),
	],
	PalH.unnamedBF: [
		PALHeader(true, 6, 1, GFXAsset.paletteData4940),
	],
	PalH.unnamedC0: [
		PALHeader(true, 7, 1, GFXAsset.paletteData5920),
	],
	PalH.unnamedC1: [
		PALHeader(true, 7, 1, GFXAsset.paletteData5928),
	],
	PalH.unnamedC2: [
		PALHeader(true, 7, 1, GFXAsset.paletteData5930),
	],
	PalH.unnamedC3: [
		PALHeader(false, 1, 7, GFXAsset.paletteData57E0),
		PALHeader(true, 0, 8, GFXAsset.paletteData5818),
	],
	PalH.unnamedC4: [
		PALHeader(false, 2, 4, GFXAsset.paletteData4550),
	],
	PalH.unnamedC5: [
		PALHeader(false, 2, 4, GFXAsset.paletteData4570),
	],
	PalH.unnamedC6: [
		PALHeader(true, 6, 1, GFXAsset.paletteData44F8),
	],
	PalH.unnamedC7: [
		PALHeader(true, 6, 1, GFXAsset.paletteData44F0),
	],
	PalH.unnamedC8: [
		PALHeader(true, 6, 1, GFXAsset.paletteData44F0),
		PALHeader(true, 7, 1, GFXAsset.paletteData44E8),
	],
	PalH.unnamedC9: [
		PALHeader(false, 0, 8, GFXAsset.paletteData4668),
		PALHeader(true, 0, 8, GFXAsset.paletteData4668),
	],
	PalH.unnamedCA: [
		PALHeader(false, 0, 8, GFXAsset.paletteData46F0),
	],
];
