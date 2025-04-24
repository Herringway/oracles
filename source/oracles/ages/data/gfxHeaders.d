module oracles.ages.data.gfxHeaders;

import oracles.data;
import oracles.defs;
import oracles.extra;
import oracles.structures;

//; A "gfx header" is a mapping of one or more graphics or map files to VRAM (or sometimes to WRAM).
//; This provides a convenient interface to load a list of graphics and mapping data with a single
//; function call, as in this example:
//;
//GfxH.titlescreen: [
//;	call loadGfxHeader
//;
//; There are 3 main types of graphics files which gfx headers can load:
//;
//; - gfx data (png files, "gfx_..." or "spr_...")
//; - Tile mapping data (bin files, "map_...")
//; - Flag/attribute data (bin files, "flg_..."), usually paired with a "map" file
//;
//; (Other, miscellaneous types of data are prefixed with "oth_".)
//;
//; Together these 3 data types contain all the data needed to draw tiles to the gameboy screen,
//; except for palette data. Sprites are a bit more complicated, but the tiles used by them can be
//; loaded through gfx headers.
//;
//; There is no technical distinction between how the 3 data types are loaded (aside from png
//; conversion to binary in the makefile), but almost all graphical files fall into one of these
//; categories. Typically this data is loaded directly into VRAM, but sometimes it can be loaded into
//; WRAM instead for further processing.
//;
//; If this doesn't make sense, you should read some technical documentation on the gameboy's
//; graphical hardware (ie. gameboy pandocs).
//;
//; The gameboy screen should be off when the "loadGfxHeader" function is called; this is because
//; writes to VRAM will fail except during the vblank and hblank periods, and it is not designed to
//; copy the data quickly enough to fit within vblank. If you need to draw stuff while the screen is
//; on, see the "queueDmaTransfer" function or "data/{game}/uniqueGfxHeaders.s".

immutable GFXHeader[][] gfxHeaderTable = [
	GfxH.dmgScreen: [
		GFXHeader(0xF0, GFXAsset.gfxDMGText, 0, GFXDestination.vram, 0x800, 0, 0x2F),
		GFXHeader(0x70, GFXAsset.gfxDMGGametitle, 0, GFXDestination.vram, 0x1000, 0, 0x3D),
		GFXHeader(0xF0, GFXAsset.mapDMGMessage, 0, GFXDestination.vram, 0x1800, 0, 0x23),
	],
	GfxH.nintendoCapcomScreen: [
		GFXHeader(0x70, GFXAsset.flgCapcomNintendo, 0, GFXDestination.vram, 0x1880, 1, 0x13),
		GFXHeader(0xF0, GFXAsset.mapCapcomNintendo, 0, GFXDestination.vram, 0x1880, 0, 0x13),
		GFXHeader(0x70, GFXAsset.gfxCapcomNintendo, 0, GFXDestination.vram, 0x800, 0, 0x4F),
	],
	GfxH.titleScreen: [
		GFXHeader(0x70, GFXAsset.sprTitlescreenSprites, 0, GFXDestination.vram, 0x380, 0, 0x3D),
		GFXHeader(0xF0, GFXAsset.gfxTitlescreen1, 0, GFXDestination.vram, 0x800, 0, 0x4F),
		GFXHeader(0xF1, GFXAsset.gfxTitlescreen2, 0, GFXDestination.vram, 0xD00, 0, 0x5F),
		GFXHeader(0xB0, GFXAsset.gfxTitlescreen3, 0,GFXDestination.vram,  0x1300, 0, 0x0F),
		GFXHeader(0xB1, GFXAsset.gfxTitlescreen4, 0,GFXDestination.vram,  0x1400, 0, 0x3F),
		GFXHeader(0xB1, GFXAsset.gfxTitlescreen5, 0, GFXDestination.vram, 0x800, 1, 0x4F),
		GFXHeader(0x70, GFXAsset.gfxTitlescreen6, 0, GFXDestination.vram, 0xCD0, 1, 0x05),
		GFXHeader(0x70, GFXAsset.mapTitlescreen, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x70, GFXAsset.flgTitlescreen, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.done: [
		GFXHeader(0xB8, GFXAsset.gfxDone, 0, GFXDestination.vram, 0x800, 1, 0x1F),
	],
	GfxH.japaneseIntroScreen: [
		GFXHeader(0x30, GFXAsset.gfxCapcomNintendo, 0, GFXDestination.vram, 0x1800, 1, 0x7F),
		GFXHeader(0x30, GFXAsset.gfxCapcomNintendo, 0, GFXDestination.vram, 0x1800, 0, 0x7F),
		GFXHeader(0x30, GFXAsset.gfxCapcomNintendo, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x30, GFXAsset.gfxCapcomNintendo, 0, GFXDestination.vram, 0x1000, 0, 0x7F),
		GFXHeader(0x69, GFXAsset.sprMinimapIcons, 0, GFXDestination.vram, 0, 0, 0x1F),
		GFXHeader(0xB8, GFXAsset.gfxSecretListMenu, 0, GFXDestination.vram, 0x700, 0, 0x2F),
		GFXHeader(0xF8, GFXAsset.mapSecretListMenu, 0, GFXDestination.vram, 0x1C00, 0, 0x3F),
		GFXHeader(0xF8, GFXAsset.flgSecretListMenu, 0, GFXDestination.vram, 0x1C00, 1, 0x3F),
	],
	GfxH.secretListMenu: [
		GFXHeader(0x69, GFXAsset.sprMinimapIcons, 0, GFXDestination.vram, 0, 0, 0x1F),
		GFXHeader(0xB8, GFXAsset.gfxSecretListMenu, 0, GFXDestination.vram, 0x700, 0, 0x2F),
		GFXHeader(0xF8, GFXAsset.mapSecretListMenu, 0, GFXDestination.vram, 0x1C00, 0, 0x3F),
		GFXHeader(0xF8, GFXAsset.flgSecretListMenu, 0, GFXDestination.vram, 0x1C00, 1, 0x3F),
	],
	GfxH.herosSecretTextAges: [
		GFXHeader(0x78, GFXAsset.gfxHerossecret, 0, GFXDestination.vram, 0x800, 1, 0x1F),
	],
	GfxH.errorText: [
		GFXHeader(0xB8, GFXAsset.gfxError, 0, GFXDestination.vram, 0x800, 1, 0x1F),
	],
	GfxH.inventoryScreen: [
		GFXHeader(0x69, GFXAsset.gfxInventoryHud1, 0, GFXDestination.vram, 0, 0, 0x2F),
		GFXHeader(0xEA, GFXAsset.sprPresentPastSymbols, 0, GFXDestination.vram, 0x300, 0, 0x0F),
		GFXHeader(0x69, GFXAsset.sprQuestItems5, 0, GFXDestination.vram, 0x400, 0, 0x1F),
		GFXHeader(0x69, GFXAsset.sprMapCompassKeysBookofseals, 0, GFXDestination.vram, 0x600, 0, 0x1F),
		GFXHeader(0x69, GFXAsset.gfxSave, 0, GFXDestination.vram, 0x600, 0, 0x07),
		GFXHeader(0x69, GFXAsset.gfxBlank, 0, GFXDestination.vram, 0x800, 0, 0x1F),
		GFXHeader(0xE9, GFXAsset.gfxRings, 0, GFXDestination.vram, 0xA00, 0, 0x3F),
		GFXHeader(0xE9, GFXAsset.gfxInventoryHud2, 0, GFXDestination.vram, 0xE00, 0, 0x1F),
		GFXHeader(0x69, GFXAsset.sprItemIcons1Spr, 0, GFXDestination.vram, 0, 1, 0x1F),
		GFXHeader(0x19, GFXAsset.sprItemIcons2, 0, GFXDestination.vram, 0x200, 1, 0x1F),
		GFXHeader(0x19, GFXAsset.sprItemIcons3, 0, GFXDestination.vram, 0x400, 1, 0x1F),
		GFXHeader(0xA9, GFXAsset.sprEssences, 0, GFXDestination.vram, 0x600, 1, 0x17),
		GFXHeader(0x69, GFXAsset.sprQuestItems1, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x69, GFXAsset.sprQuestItems2, 0, GFXDestination.vram, 0xA00, 1, 0x1F),
		GFXHeader(0x69, GFXAsset.sprQuestItems3, 0, GFXDestination.vram, 0xC00, 1, 0x1F),
		GFXHeader(0x69, GFXAsset.sprQuestItems4, 0, GFXDestination.vram, 0xE00, 1, 0x1F),
		GFXHeader(0x69, GFXAsset.mapInventoryTextbar, 0, GFXDestination.tileMap, 0x1E0, 4, 0x05),
		GFXHeader(0x69, GFXAsset.flgInventoryTextbar, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x05),
		GFXHeader(0x69, GFXAsset.mapInventoryScreen1, 0, GFXDestination.tileMap, 0x40, 4, 0x19),
		GFXHeader(0x69, GFXAsset.flgInventoryScreen1, 0, GFXDestination.attributeMap, 0x40, 4, 0x19),
	],
	GfxH.inventorySubscreen1: [
		GFXHeader(0x69, GFXAsset.mapInventoryScreen1, 0, GFXDestination.tileMap, 0x40, 4, 0x19),
		GFXHeader(0x69, GFXAsset.flgInventoryScreen1, 0, GFXDestination.attributeMap, 0x40, 4, 0x19),
	],
	GfxH.inventorySubscreen2: [
		GFXHeader(0xE9, GFXAsset.mapInventoryScreen2, 0, GFXDestination.tileMap, 0x60, 4, 0x17),
		GFXHeader(0xE9, GFXAsset.flgInventoryScreen2, 0, GFXDestination.attributeMap, 0x60, 4, 0x17),
	],
	GfxH.inventorySubscreen3: [
		GFXHeader(0x69, GFXAsset.mapInventoryScreen3, 0, GFXDestination.tileMap, 0x40, 4, 0x19),
		GFXHeader(0xE9, GFXAsset.flgInventoryScreen3, 0, GFXDestination.attributeMap, 0x40, 4, 0x19),
	],
	GfxH.nayruSingingCutscene: [
		GFXHeader(0xF2, GFXAsset.sprNayruSingingCutscene, 0, GFXDestination.vram, 0, 0, 0x4D),
		GFXHeader(0xF2, GFXAsset.gfxNayruSingingCutscene1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF2, GFXAsset.gfxNayruSingingCutscene2, 0, GFXDestination.vram, 0x1000, 0, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxNayruSingingCutscene3, 0, GFXDestination.vram, 0x800, 1, 0x31),
		GFXHeader(0x73, GFXAsset.mapNayruSingingCutscene, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgNayruSingingCutscene, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.overworldMap: [
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesPresent1, 0, GFXDestination.vram, 0x800, 1, 0x6F),
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesCommon, 0, GFXDestination.vram, 0x1000, 1, 0x5F),
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesPresent2, 0, GFXDestination.vram, 0x1600, 1, 0x1F),
		GFXHeader(0x69, GFXAsset.sprMinimapIcons, 0, GFXDestination.vram, 0, 0, 0x6B),
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesDungeon, 0, GFXDestination.vram, 0x800, 0, 0x3F),
		GFXHeader(0x69, GFXAsset.mapPresentMinimap, 0, GFXDestination.tileMap, 0, 4, 0x23),
		GFXHeader(0x69, GFXAsset.flgPresentMinimap, 0, GFXDestination.attributeMap, 0, 4, 0x23),
	],
	GfxH.pastMap: [
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesPast1, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesCommon, 0, GFXDestination.vram, 0x1000, 1, 0x5F),
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesPast2, 0, GFXDestination.vram, 0x1600, 1, 0x1F),
		GFXHeader(0x69, GFXAsset.sprMinimapIcons, 0, GFXDestination.vram, 0, 0, 0x6B),
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesDungeon, 0, GFXDestination.vram, 0x800, 0, 0x3F),
		GFXHeader(0x6A, GFXAsset.mapPastMinimap, 0, GFXDestination.tileMap, 0, 4, 0x23),
		GFXHeader(0x6A, GFXAsset.flgPastMinimap, 0, GFXDestination.attributeMap, 0, 4, 0x23),
	],
	GfxH.dungeonMap: [
		GFXHeader(0x69, GFXAsset.sprMapCompassKeysBookofseals, 0, GFXDestination.vram, 0, 0, 0x1F),
		GFXHeader(0x69, GFXAsset.gfxMinimapTilesDungeon, 0, GFXDestination.vram, 0x800, 0, 0x3F),
		GFXHeader(0xE9, GFXAsset.mapDungeonMinimap, 0, GFXDestination.tileMap, 0, 4, 0x23),
		GFXHeader(0x69, GFXAsset.flgDungeonMinimap, 0, GFXDestination.attributeMap, 0, 4, 0x23),
	],
	GfxH.dungeon0Blurb: [
		GFXHeader(0xE9, GFXAsset.gfxBlurbMakupath, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon1Blurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD1, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon2Blurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD2, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon3Blurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD3, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon4Blurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD4, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon5Blurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD5, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon6Blurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD6, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon7Blurb: [
		GFXHeader(0xE9, GFXAsset.gfxBlurbD7, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon8Blurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD8, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeon9Blurb: [
		GFXHeader(0xE9, GFXAsset.gfxBlurbBlacktowerturret, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeonABlurb: [
		GFXHeader(0xE9, GFXAsset.gfxBlurbRoomofrites, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeonBBlurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbHeroscave, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeonCBlurb: [
		GFXHeader(0x69, GFXAsset.gfxBlurbD6, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeonDBlurb: [
		GFXHeader(0xE9, GFXAsset.gfxBlurbMakupath, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeonEBlurb: [
		GFXHeader(0xE9, GFXAsset.gfxBlurbMakupath, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.dungeonFBlurb: [
		GFXHeader(0xE9, GFXAsset.gfxBlurbMakupath, 0, GFXDestination.vram, 0xC00, 0, 0x27),
	],
	GfxH.hud: [
		GFXHeader(0x69, GFXAsset.gfxHud, 0, GFXDestination.vram, 0x1000, 0, 0x1F),
	],
	GfxH.hudLayoutNormal: [
		GFXHeader(0x69, GFXAsset.mapHudNormal, 0, GFXDestination.tileMap, 0x240, 4, 0x03),
		GFXHeader(0x69, GFXAsset.flgHudNormal, 0, GFXDestination.attributeMap, 0x240, 4, 0x03),
	],
	GfxH.hudLayoutExtraHearts: [
		GFXHeader(0x69, GFXAsset.mapHudExtraHearts, 0, GFXDestination.tileMap, 0x240, 4, 0x03),
		GFXHeader(0x69, GFXAsset.flgHudExtraHearts, 0, GFXDestination.attributeMap, 0x240, 4, 0x03),
	],
	GfxH.hudLayoutBiggoronSword: [
		GFXHeader(0x69, GFXAsset.mapHudBiggoronSword, 0, GFXDestination.tileMap, 0x240, 4, 0x03),
		GFXHeader(0x69, GFXAsset.flgHudBiggoronSword, 0, GFXDestination.attributeMap, 0x240, 4, 0x03),
		GFXHeader(0x69, GFXAsset.sprBiggoronSwordIcon, 0, GFXDestination.attributeMap, 0x280, 4, 0x07),
	],
	GfxH.unnamed24: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.unnamed25: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.unnamed26: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.unnamed27: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.unnamed28: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.unnamed29: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.unnamed2A: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.linkWithOracleEndScene: [
		GFXHeader(0xF3, GFXAsset.sprLinkWithOracle, 0, GFXDestination.vram, 0, 0, 0x53),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF3, GFXAsset.gfxLinkWithOracle2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxLinkWithOracle3, 0, GFXDestination.vram, 0x1000, 1, 0x31),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF3, GFXAsset.mapLinkWithOracle, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x73, GFXAsset.flgLinkWithOracle, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
	],
	GfxH.linkWithOracleAndTwinrovaEndScene: [
		GFXHeader(0x73, GFXAsset.sprLinkWithOracleAndTwinrova, 0, GFXDestination.vram, 0, 0, 0x49),
		GFXHeader(0xB3, GFXAsset.gfxLinkWithOracleAndTwinrova1, 0, GFXDestination.vram, 0x800, 0, 0x39),
		GFXHeader(0xB4, GFXAsset.gfxLinkWithOracleAndTwinrova2, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xB4, GFXAsset.gfxLinkWithOracleAndTwinrova3, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
		GFXHeader(0xF4, GFXAsset.mapLinkWithOracleAndTwinrova1, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x74, GFXAsset.flgLinkWithOracleAndTwinrova1, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0xF4, GFXAsset.mapLinkWithOracleAndTwinrova1, 0, GFXDestination.vramTiles, 0, 3, 0x23),
		GFXHeader(0x74, GFXAsset.flgLinkWithOracleAndTwinrova1, 0, GFXDestination.vramAttributes, 0, 3, 0x23),
		GFXHeader(0xF4, GFXAsset.mapLinkWithOracleAndTwinrova2, 0, GFXDestination.tileMap, 0, 4, 0x23),
		GFXHeader(0x74, GFXAsset.flgLinkWithOracleAndTwinrova2, 0, GFXDestination.attributeMap, 0, 4, 0x23),
	],
	GfxH.twinrovaCloseup: [
		GFXHeader(0xF4, GFXAsset.gfxTwinrovaCloseup1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF4, GFXAsset.gfxTwinrovaCloseup2, 0, GFXDestination.vram, 0x1000, 0, 0x34),
		GFXHeader(0x74, GFXAsset.gfxCreditsGametitle, 0, GFXDestination.vram, 0x800, 1, 0x69),
		GFXHeader(0x74, GFXAsset.mapTwinrovaCloseup, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0xF4, GFXAsset.flgTwinrovaCloseup, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0x74, GFXAsset.mapCreditsGametitle, 0, GFXDestination.vram, 0x1C40, 0, 0x1B),
		GFXHeader(0x74, GFXAsset.flgCreditsGametitle, 0, GFXDestination.vram, 0x1C40, 1, 0x1B),
	],
	GfxH.blackTowerMiddle: [
		GFXHeader(0xF3, GFXAsset.mapBlackTowerMiddle, 0, GFXDestination.vram, 0x19E0, 0, 0x15),
		GFXHeader(0x73, GFXAsset.flgBlackTowerMiddle, 0, GFXDestination.vram, 0x19E0, 1, 0x15),
		GFXHeader(0xF3, GFXAsset.mapBlackTowerMiddle, 0, GFXDestination.vramTiles, 0x20, 3, 0x15),
		GFXHeader(0x73, GFXAsset.flgBlackTowerMiddle, 0, GFXDestination.vramAttributes, 0x20, 3, 0x15),
		GFXHeader(0x73, GFXAsset.mapBlackTowerBase, 0, GFXDestination.vram, 0x1B40, 0, 0x0B),
		GFXHeader(0x73, GFXAsset.flgBlackTowerBase, 0, GFXDestination.vram, 0x1B40, 1, 0x0B),
		GFXHeader(0x73, GFXAsset.mapBlackTowerBase, 0, GFXDestination.vramTiles, 0x180, 3, 0x0B),
		GFXHeader(0x73, GFXAsset.flgBlackTowerBase, 0, GFXDestination.vramAttributes, 0x180, 3, 0x0B),
		GFXHeader(0xF3, GFXAsset.sprBlackTowerScene, 0, GFXDestination.vram, 0, 1, 0x4B),
		GFXHeader(0xF3, GFXAsset.gfxBlackTowerScene1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxBlackTowerScene2, 0, GFXDestination.vram, 0x1000, 0, 0x3F),
		GFXHeader(0xF3, GFXAsset.gfxBlackTowerScene3, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xB3, GFXAsset.gfxBlackTowerScene4, 0, GFXDestination.vram, 0x1000, 1, 0x6F),
	],
	GfxH.blackTowerBase: [
		GFXHeader(0x73, GFXAsset.mapBlackTowerBase, 0, GFXDestination.vram, 0x1B40, 0, 0x0B),
		GFXHeader(0x73, GFXAsset.flgBlackTowerBase, 0, GFXDestination.vram, 0x1B40, 1, 0x0B),
		GFXHeader(0x73, GFXAsset.mapBlackTowerBase, 0, GFXDestination.vramTiles, 0x180, 3, 0x0B),
		GFXHeader(0x73, GFXAsset.flgBlackTowerBase, 0, GFXDestination.vramAttributes, 0x180, 3, 0x0B),
		GFXHeader(0xF3, GFXAsset.sprBlackTowerScene, 0, GFXDestination.vram, 0, 1, 0x4B),
		GFXHeader(0xF3, GFXAsset.gfxBlackTowerScene1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x73, GFXAsset.gfxBlackTowerScene2, 0, GFXDestination.vram, 0x1000, 0, 0x3F),
		GFXHeader(0xF3, GFXAsset.gfxBlackTowerScene3, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xB3, GFXAsset.gfxBlackTowerScene4, 0, GFXDestination.vram, 0x1000, 1, 0x6F),
	],
	GfxH.introLinkMidFrame1: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkMidFrame1, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x0B),
	],
	GfxH.introLinkMidFrame2: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkMidFrame2, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x0B),
	],
	GfxH.introLinkMidFrame3: [
		GFXHeader(0x72, GFXAsset.sprIntroLinkMidFrame3, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x0B),
	],
	GfxH.introLinkMidFrame4: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkMidFrame4, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x0B),
	],
	GfxH.introLinkMidFrame5: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkMidFrame5, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x0B),
	],
	GfxH.introLinkCloseFrame1: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkCloseFrame1, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x1B),
	],
	GfxH.introLinkCloseFrame2: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkCloseFrame2, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x1D),
	],
	GfxH.introLinkCloseFrame3: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkCloseFrame3, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x1D),
	],
	GfxH.introLinkCloseFrame4: [
		GFXHeader(0xB2, GFXAsset.sprIntroLinkCloseFrame4, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x19),
	],
	GfxH.introLinkCloseFrame5: [
		GFXHeader(0x72, GFXAsset.sprIntroLinkCloseFrame5, 0, GFXDestination.nameEntryCharacterGFX, 0, 5, 0x17),
	],
	GfxH.unappraisedRingList: [
		GFXHeader(0xE9, GFXAsset.mapUnappraisedRingList, 0, GFXDestination.tileMap, 0, 4, 0x1F),
		GFXHeader(0x69, GFXAsset.flgUnappraisedRingList, 0, GFXDestination.attributeMap, 0, 4, 0x1F),
		GFXHeader(0x69, GFXAsset.gfxInventoryHud1, 0, GFXDestination.vram, 0, 0, 0x2F),
		GFXHeader(0xE9, GFXAsset.gfxRings, 0, GFXDestination.vram, 0xA00, 0, 0x3F),
		GFXHeader(0xE9, GFXAsset.gfxInventoryHud2, 0, GFXDestination.vram, 0xE00, 0, 0x1F),
		GFXHeader(0x69, GFXAsset.gfxHud, 0, GFXDestination.vram, 0x1000, 0, 0x1F),
	],
	GfxH.appraisedRingList: [
		GFXHeader(0xE9, GFXAsset.mapAppraisedRingList, 0, GFXDestination.tileMap, 0, 4, 0x23),
		GFXHeader(0xE9, GFXAsset.flgAppraisedRingList, 0, GFXDestination.attributeMap, 0, 4, 0x23),
		GFXHeader(0x69, GFXAsset.gfxInventoryHud1, 0, GFXDestination.vram, 0, 0, 0x2F),
		GFXHeader(0x69, GFXAsset.sprQuestItems5, 0, GFXDestination.vram, 0x400, 0, 0x1F),
		GFXHeader(0xE9, GFXAsset.gfxRings, 0, GFXDestination.vram, 0xA00, 0, 0x3F),
		GFXHeader(0xE9, GFXAsset.gfxInventoryHud2, 0, GFXDestination.vram, 0xE00, 0, 0x1F),
		GFXHeader(0x69, GFXAsset.gfxInventoryHud1, 0, GFXDestination.vram, 0x1000, 0, 0x2F),
	],
	GfxH.sceneCreditsMakutree: [
		GFXHeader(0xF4, GFXAsset.sprCreditsMakutree, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0x74, GFXAsset.gfxCreditsMakutree1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x74, GFXAsset.gfxCreditsMakutree2, 0, GFXDestination.vram, 0x1000, 0, 0x7F),
		GFXHeader(0x74, GFXAsset.gfxCreditsGametitle, 0, GFXDestination.vram, 0x800, 1, 0x69),
		GFXHeader(0xF4, GFXAsset.mapCreditsMakutree, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x74, GFXAsset.flgCreditsMakutree, 0, GFXDestination.vram, 0x1800, 1, 0x23),
		GFXHeader(0x74, GFXAsset.mapCreditsGametitle, 0, GFXDestination.vram, 0x1C40, 0, 0x1B),
		GFXHeader(0x74, GFXAsset.flgCreditsGametitle, 0, GFXDestination.vram, 0x1C40, 1, 0x1B),
	],
	GfxH.gashaTreeDisappeared: [
		GFXHeader(0xAD, GFXAsset.gfxGashaTree, 0, GFXDestination.unnamedD800, 0, 7, 0x44),
		GFXHeader(0xAD, GFXAsset.sprGrassTuft, 0, GFXDestination.unnamedD800, 0x450, 7, 0x03),
	],
	GfxH.gashaTreeDisappearedSand: [
		GFXHeader(0xAD, GFXAsset.gfxSand, 0, GFXDestination.unnamedD800, 0x450, 7, 0x03),
	],
	GfxH.gashaTreeDisappearedDirt: [
		GFXHeader(0x6D, GFXAsset.gfxDirt, 0, GFXDestination.unnamedD800, 0x450, 7, 0x03),
	],
	GfxH.tilesetOverworldPresent: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetOverworldPresent, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetLynnaCity1, 0, GFXDestination.vram, 0x1300, 1, 0x1F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetLynnaCity2, 0, GFXDestination.vram, 0x1500, 1, 0x1F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetLynnaCity3, 0, GFXDestination.vram, 0x1700, 1, 0x0F),
	],
	GfxH.tilesetOverworldPast: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldPast, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetLynnaCity1, 0, GFXDestination.vram, 0x1300, 1, 0x1F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetLynnaCity2, 0, GFXDestination.vram, 0x1500, 1, 0x1F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetLynnaCity3, 0, GFXDestination.vram, 0x1700, 1, 0x0F),
	],
	GfxH.tilesetUnderwaterPresent: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetUnderwaterPresent, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetUnderwaterCommon1, 0, GFXDestination.vram, 0x1300, 1, 0x1F),
		GFXHeader(0x2F, GFXAsset.gfxTilesetUnderwaterCommon2, 0, GFXDestination.vram, 0x1500, 1, 0x1F),
		GFXHeader(0x2F, GFXAsset.gfxTilesetUnderwaterCommon3, 0, GFXDestination.vram, 0x1700, 1, 0x0F),
	],
	GfxH.tilesetUnderwaterPast: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0xAF, GFXAsset.gfxTilesetUnderwaterPast, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetUnderwaterCommon1, 0, GFXDestination.vram, 0x1300, 1, 0x1F),
		GFXHeader(0x2F, GFXAsset.gfxTilesetUnderwaterCommon2, 0, GFXDestination.vram, 0x1500, 1, 0x1F),
		GFXHeader(0x2F, GFXAsset.gfxTilesetUnderwaterCommon3, 0, GFXDestination.vram, 0x1700, 1, 0x0F),
	],
	GfxH.seaweedCut: [
		GFXHeader(0xA9, GFXAsset.sprSeaweedCut, 0, GFXDestination.vram, 0, 1, 0x01),
	],
	GfxH.unnamed45: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed46: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed47: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed48: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed49: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed4A: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed4B: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed4C: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed4D: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed4E: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed4F: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.wingDungeonCollapsing1: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing1, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.wingDungeonCollapsing2: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing2, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.wingDungeonCollapsing3: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsing3, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.wingDungeonCollapsed: [
		GFXHeader(0x59, GFXAsset.mapWingDungeonCollapsed, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x0B),
	],
	GfxH.unnamed54: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed55: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed56: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed57: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed58: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed59: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed5A: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed5B: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed5C: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed5D: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed5E: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed5F: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.tilesetMakuPath: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.tilesetSpiritsGrave: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0xAF, GFXAsset.gfxTilesetSpiritsGrave, 0, GFXDestination.vram, 0x1400, 1, 0x25),
	],
	GfxH.tilesetWingDungeon: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0xAF, GFXAsset.gfxTilesetWingDungeon, 0, GFXDestination.vram, 0x1400, 1, 0x23),
	],
	GfxH.tilesetMoonlitGrotto: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0xAF, GFXAsset.gfxTilesetMoonlitGrotto, 0, GFXDestination.vram, 0x1400, 1, 0x21),
	],
	GfxH.tilesetSkullDungeon: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0xAF, GFXAsset.gfxTilesetSkullDungeon, 0, GFXDestination.vram, 0x1400, 1, 0x29),
	],
	GfxH.tilesetCrownDungeon: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetCrownDungeon, 0, GFXDestination.vram, 0x1400, 1, 0x26),
	],
	GfxH.tilesetMermaidsCave: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0xAF, GFXAsset.gfxTilesetMermaidsCave, 0, GFXDestination.vram, 0x1400, 1, 0x2F),
	],
	GfxH.tilesetJabuJabusBelly: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetJabuJabusBelly, 0, GFXDestination.vram, 0x1400, 1, 0x32),
	],
	GfxH.tilesetAncientTomb: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetAncientTomb, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMinecartTrack, 0, GFXDestination.vram, 0x10C0, 1, 0x03),
	],
	GfxH.tilesetBlackTowerTop: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetBlackTowerTop, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.tilesetRoomOfRites: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0xAF, GFXAsset.gfxTilesetRoomOfRites, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.unnamed6B: [
		GFXHeader(0x70, GFXAsset.gfxTilesetSidescroll1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xF0, GFXAsset.gfxTilesetSidescroll2, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.unnamed6C: [
		GFXHeader(0x70, GFXAsset.gfxTilesetSidescroll1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xF0, GFXAsset.gfxTilesetSidescroll2, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.tilesetSidescroll: [
		GFXHeader(0x70, GFXAsset.gfxTilesetSidescroll1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xF0, GFXAsset.gfxTilesetSidescroll2, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.tilesetBlackTower: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetBlackTower, 0, GFXDestination.vram, 0x800, 1, 0x6F),
	],
	GfxH.commonSpritesToWRAM: [
		GFXHeader(0x68, GFXAsset.sprCommonSprites, 0, GFXDestination.dragonOnoxTileMap1, 0, 6, 0x4D),
	],
	GfxH.tilesetMakuTree: [
		GFXHeader(0x6D, GFXAsset.gfxTilesetMakuTreeCommon, 0, GFXDestination.vram, 0x800, 1, 0x2F),
		GFXHeader(0xAD, GFXAsset.gfxTilesetMakuTreeBottom, 0, GFXDestination.vram, 0xB00, 1, 0x6F),
	],
	GfxH.tilesetMakuTreeTop: [
		GFXHeader(0x6D, GFXAsset.gfxTilesetMakuTreeCommon, 0, GFXDestination.vram, 0x800, 1, 0x2F),
		GFXHeader(0xAD, GFXAsset.gfxTilesetMakuTreeTop, 0, GFXDestination.vram, 0xB00, 1, 0x4F),
	],
	GfxH.mermaidsCaveWallRetraction: [
		GFXHeader(0x59, GFXAsset.mapMermaidsCaveWallRetraction, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x23),
		GFXHeader(0x59, GFXAsset.flgMermaidsCaveWallRetraction, 0, GFXDestination.tmpAttrBuffer, 0, 2, 0x23),
	],
	GfxH.ancientTombWallRetraction: [
		GFXHeader(0x59, GFXAsset.mapAncientTombWallRetraction, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x17),
		GFXHeader(0x59, GFXAsset.flgAncientTombWallRetraction, 0, GFXDestination.tmpAttrBuffer, 0, 2, 0x17),
	],
	GfxH.jabuOpening1: [
		GFXHeader(0xD9, GFXAsset.mapJabuOpening1, 0, GFXDestination.vramTiles, 0xE0, 3, 0x07),
		GFXHeader(0x59, GFXAsset.flgJabuOpening1, 0, GFXDestination.vramAttributes, 0xE0, 3, 0x07),
	],
	GfxH.jabuOpening2: [
		GFXHeader(0xD9, GFXAsset.mapJabuOpening2, 0, GFXDestination.vramTiles, 0xE0, 3, 0x07),
		GFXHeader(0x59, GFXAsset.flgJabuOpening2, 0, GFXDestination.vramAttributes, 0xE0, 3, 0x07),
	],
	GfxH.unnamed76: [
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoors1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoorsRafton, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.unnamed77: [
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoors1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoorsRafton, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.unnamed78: [
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoors1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoorsRafton, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.unnamed79: [
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoors1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoorsRafton, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.unnamed7A: [
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoors1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoorsRafton, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.tilesetIndoorsAges: [
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoors1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetIndoorsRafton, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
	],
	GfxH.tilesetCaveAges: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetCaveReplacement1, 0, GFXDestination.vram, 0x800, 1, 0x0F),
		GFXHeader(0x70, GFXAsset.gfxTilesetCaveReplacement2, 0, GFXDestination.vram, 0xB00, 1, 0x4F),
		GFXHeader(0x70, GFXAsset.gfxTilesetCave1, 0, GFXDestination.vram, 0x1000, 1, 0x5F),
		GFXHeader(0xB0, GFXAsset.gfxTilesetCave2, 0, GFXDestination.vram, 0x1600, 1, 0x1F),
	],
	GfxH.tilesetGoronCave: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x70, GFXAsset.gfxTilesetCaveReplacement1, 0, GFXDestination.vram, 0x800, 1, 0x0F),
		GFXHeader(0x70, GFXAsset.gfxTilesetCaveReplacement2, 0, GFXDestination.vram, 0xB00, 1, 0x4F),
		GFXHeader(0x70, GFXAsset.gfxTilesetCave1, 0, GFXDestination.vram, 0x1000, 1, 0x5F),
		GFXHeader(0x70, GFXAsset.gfxTilesetGoronCave, 0, GFXDestination.vram, 0x1600, 1, 0x1F),
	],
	GfxH.tilesetMoblinFortress: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x70, GFXAsset.gfxTilesetMoblinFortress, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
	],
	GfxH.tilesetZoraPalace: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0xB0, GFXAsset.gfxTilesetZoraPalace, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
		GFXHeader(0x30, GFXAsset.gfxTilesetZoraPalaceReplacement1, 0, GFXDestination.vram, 0xB00, 1, 0x03),
		GFXHeader(0xB0, GFXAsset.gfxTilesetZoraPalaceReplacement2, 0, GFXDestination.vram, 0x1180, 1, 0x07),
	],
	GfxH.blackTowerStage3Layout: [
		GFXHeader(0x73, GFXAsset.mapBlackTowerStage3Top, 0, GFXDestination.tileMap, 0, 4, 0x0F),
		GFXHeader(0x73, GFXAsset.flgBlackTowerStage3Top, 0, GFXDestination.attributeMap, 0, 4, 0x0F),
		GFXHeader(0x73, GFXAsset.mapBlackTowerStage3Middle, 0, GFXDestination.vram, 0x1800, 0, 0x1D),
		GFXHeader(0x73, GFXAsset.flgBlackTowerStage3Middle, 0, GFXDestination.vram, 0x1800, 1, 0x1D),
	],
	GfxH.blackTowerStage2Layout: [
		GFXHeader(0x73, GFXAsset.mapBlackTowerStage2, 0, GFXDestination.vram, 0x1840, 0, 0x19),
		GFXHeader(0x73, GFXAsset.flgBlackTowerStage2, 0, GFXDestination.vram, 0x1840, 1, 0x19),
	],
	GfxH.blackTowerStage1Layout: [
		GFXHeader(0xF3, GFXAsset.mapBlackTowerStage1, 0, GFXDestination.vram, 0x19C0, 0, 0x17),
		GFXHeader(0x73, GFXAsset.flgBlackTowerStage1, 0, GFXDestination.vram, 0x19C0, 1, 0x17),
		GFXHeader(0xF3, GFXAsset.mapBlackTowerStage1, 0, GFXDestination.vramTiles, 0, 3, 0x17),
		GFXHeader(0x73, GFXAsset.flgBlackTowerStage1, 0, GFXDestination.vramAttributes, 0, 3, 0x17),
	],
	GfxH.commonSprites: [
		GFXHeader(0x68, GFXAsset.sprCommonSprites, 0, GFXDestination.vram, 0, 1, 0x4D),
	],
	GfxH.creditsSceneMakuTreePast: [
		GFXHeader(0x75, GFXAsset.mapCreditsMakuPastTopRows, 0, GFXDestination.vram, 0x1800, 0, 0x03),
		GFXHeader(0x75, GFXAsset.flgCreditsMakuPastTopRows, 0, GFXDestination.vram, 0x1800, 1, 0x03),
	],
	GfxH.creditsScene1: [
		GFXHeader(0x74, GFXAsset.mapCreditsScene1TopRows, 0, GFXDestination.vram, 0x1800, 0, 0x03),
		GFXHeader(0x74, GFXAsset.flgCreditsScene1TopRows, 0, GFXDestination.vram, 0x1800, 1, 0x03),
	],
	GfxH.creditsImage1: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0x74, GFXAsset.sprCreditsFontPlanners, 0, GFXDestination.vram, 0x400, 0, 0x21),
		GFXHeader(0xB4, GFXAsset.gfxCreditsImage11, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x74, GFXAsset.gfxCreditsImage12, 0, GFXDestination.vram, 0x1000, 0, 0x58),
		GFXHeader(0x74, GFXAsset.mapCreditsImage1, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x74, GFXAsset.flgCreditsImage1, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsScene2: [
		GFXHeader(0x75, GFXAsset.mapCreditsScene2, 0, GFXDestination.vram, 0x1A00, 0, 0x03),
		GFXHeader(0x75, GFXAsset.flgCreditsScene2, 0, GFXDestination.vram, 0x1A00, 1, 0x03),
	],
	GfxH.creditsImage2: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.tileMap, 0, 4, 0x3B),
		GFXHeader(0x75, GFXAsset.sprCreditsFontNakanowatari, 0, GFXDestination.attributeMap, 0, 4, 0x13),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vramTiles, 0, 3, 0x3B),
		GFXHeader(0x75, GFXAsset.sprCreditsFontNakanowatari, 0, GFXDestination.vramAttributes, 0, 3, 0x13),
		GFXHeader(0x75, GFXAsset.sprCreditsFontNakanowatari, 0, GFXDestination.vram, 0x400, 0, 0x13),
		GFXHeader(0x75, GFXAsset.sprCreditsFontProgrammers, 0, GFXDestination.vram, 0x600, 0, 0x13),
		GFXHeader(0x75, GFXAsset.gfxCreditsImage21, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x75, GFXAsset.gfxCreditsImage22, 0, GFXDestination.vram, 0x1000, 0, 0x57),
		GFXHeader(0x75, GFXAsset.mapCreditsImage2, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x75, GFXAsset.flgCreditsImage2, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsScene3: [
		GFXHeader(0x75, GFXAsset.mapCreditsScene3TopRows, 0, GFXDestination.vram, 0x1800, 0, 0x03),
		GFXHeader(0x75, GFXAsset.flgCreditsScene3TopRows, 0, GFXDestination.vram, 0x1800, 1, 0x03),
	],
	GfxH.creditsImage3: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.tileMap, 0, 4, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontObjectDesigners, 0, GFXDestination.attributeMap, 0, 4, 0x1F),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vramTiles, 0, 3, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontObjectDesigners, 0, GFXDestination.vramAttributes, 0, 3, 0x1F),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontObjectDesigners, 0, GFXDestination.vram, 0x400, 0, 0x1F),
		GFXHeader(0xB5, GFXAsset.gfxCreditsImage31, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF5, GFXAsset.gfxCreditsImage32, 0, GFXDestination.vram, 0x1000, 0, 0x5C),
		GFXHeader(0x75, GFXAsset.mapCreditsImage3, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x75, GFXAsset.flgCreditsImage3, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsScene4: [
		GFXHeader(0x75, GFXAsset.mapCreditsScene4TopRows, 0, GFXDestination.vram, 0x1A00, 0, 0x03),
		GFXHeader(0x75, GFXAsset.flgCreditsScene4TopRows, 0, GFXDestination.vram, 0x1A00, 1, 0x03),
	],
	GfxH.creditsImage4: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.tileMap, 0, 4, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontMusic, 0, GFXDestination.attributeMap, 0, 4, 0x19),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vramTiles, 0, 3, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontMusic, 0, GFXDestination.vramAttributes, 0, 3, 0x19),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontMusic, 0, GFXDestination.vram, 0x400, 0, 0x19),
		GFXHeader(0xB5, GFXAsset.gfxCreditsImage41, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x75, GFXAsset.gfxCreditsImage42, 0, GFXDestination.vram, 0x1000, 0, 0x53),
		GFXHeader(0x75, GFXAsset.mapCreditsImage4, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x75, GFXAsset.flgCreditsImage4, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedScene1: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetOverworldPresent, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0xF5, GFXAsset.gfxTilesetCredits, 0, GFXDestination.vram, 0x1300, 1, 0x3F),
		GFXHeader(0x76, GFXAsset.mapCreditsLinkedScene1, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x76, GFXAsset.flgCreditsLinkedScene1, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedImage1: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0x74, GFXAsset.sprCreditsFontPlanners, 0, GFXDestination.vram, 0x400, 0, 0x21),
		GFXHeader(0x76, GFXAsset.gfxCreditsLinkedImage11, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xB6, GFXAsset.gfxCreditsLinkedImage12, 0, GFXDestination.vram, 0x1000, 0, 0x5F),
		GFXHeader(0x76, GFXAsset.mapCreditsLinkedImage1, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0xF6, GFXAsset.flgCreditsLinkedImage1, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedScene2: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetOverworldPresent, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0xF5, GFXAsset.gfxTilesetCredits, 0, GFXDestination.vram, 0x1300, 1, 0x3F),
		GFXHeader(0xF5, GFXAsset.mapCreditsLinkedScene2, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0xF5, GFXAsset.flgCreditsLinkedScene2, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedImage2: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.tileMap, 0, 4, 0x3B),
		GFXHeader(0x75, GFXAsset.sprCreditsFontNakanowatari, 0, GFXDestination.attributeMap, 0, 4, 0x13),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vramTiles, 0, 3, 0x3B),
		GFXHeader(0x75, GFXAsset.sprCreditsFontNakanowatari, 0, GFXDestination.vramAttributes, 0, 3, 0x13),
		GFXHeader(0x75, GFXAsset.sprCreditsFontNakanowatari, 0, GFXDestination.vram, 0x400, 0, 0x13),
		GFXHeader(0x75, GFXAsset.sprCreditsFontProgrammers, 0, GFXDestination.vram, 0x600, 0, 0x13),
		GFXHeader(0xB5, GFXAsset.gfxCreditsLinkedImage21, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x75, GFXAsset.gfxCreditsLinkedImage22, 0, GFXDestination.vram, 0x1000, 0, 0x5E),
		GFXHeader(0x75, GFXAsset.mapCreditsLinkedImage2, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0xF5, GFXAsset.flgCreditsLinkedImage2, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedScene3: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetOverworldPresent, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0xF5, GFXAsset.gfxTilesetCredits, 0, GFXDestination.vram, 0x1300, 1, 0x3F),
		GFXHeader(0xF6, GFXAsset.mapCreditsLinkedScene3, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0xF6, GFXAsset.flgCreditsLinkedScene3, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedImage3: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.tileMap, 0, 4, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontObjectDesigners, 0, GFXDestination.attributeMap, 0, 4, 0x1F),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vramTiles, 0, 3, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontObjectDesigners, 0, GFXDestination.vramAttributes, 0, 3, 0x1F),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontObjectDesigners, 0, GFXDestination.vram, 0x400, 0, 0x1F),
		GFXHeader(0xF6, GFXAsset.gfxCreditsLinkedImage31, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x76, GFXAsset.gfxCreditsLinkedImage32, 0, GFXDestination.vram, 0x1000, 0, 0x60),
		GFXHeader(0x76, GFXAsset.mapCreditsLinkedImage3, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0xF6, GFXAsset.flgCreditsLinkedImage3, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedScene4: [
		GFXHeader(0xAE, GFXAsset.gfxTilesetOverworldStandard, 0, GFXDestination.vram, 0x800, 1, 0x5F),
		GFXHeader(0x6E, GFXAsset.gfxTilesetOverworldPresent, 0, GFXDestination.vram, 0xE00, 1, 0x4F),
		GFXHeader(0xF5, GFXAsset.gfxTilesetCredits, 0, GFXDestination.vram, 0x1300, 1, 0x3F),
		GFXHeader(0x76, GFXAsset.mapCreditsLinkedScene4, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x76, GFXAsset.flgCreditsLinkedScene4, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedImage4: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.tileMap, 0, 4, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontMusic, 0, GFXDestination.attributeMap, 0, 4, 0x19),
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vramTiles, 0, 3, 0x3B),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontMusic, 0, GFXDestination.vramAttributes, 0, 3, 0x19),
		GFXHeader(0xF5, GFXAsset.sprCreditsFontMusic, 0, GFXDestination.vram, 0x400, 0, 0x19),
		GFXHeader(0xF6, GFXAsset.gfxCreditsLinkedImage41, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x76, GFXAsset.gfxCreditsLinkedImage42, 0, GFXDestination.vram, 0x1000, 0, 0x4E),
		GFXHeader(0x76, GFXAsset.mapCreditsLinkedImage4, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x76, GFXAsset.flgCreditsLinkedImage4, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsScroll: [
		GFXHeader(0xF4, GFXAsset.sprCreditsFont, 0, GFXDestination.vram, 0, 0, 0x3B),
		GFXHeader(0xF6, GFXAsset.sprCreditsSprites1, 0, GFXDestination.vram, 0x400, 0, 0x3F),
		GFXHeader(0xF6, GFXAsset.sprCreditsSprites2, 0, GFXDestination.vram, 0, 1, 0x73),
		GFXHeader(0x6B, GFXAsset.sprTriforceSparkleVineseedBookofseals, 0, GFXDestination.tileMap, 0, 4, 0x1F),
		GFXHeader(0xB6, GFXAsset.gfxCreditsBg1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xB6, GFXAsset.gfxCreditsBg2, 0, GFXDestination.vram, 0x1000, 0, 0x7F),
		GFXHeader(0xF7, GFXAsset.gfxCreditsBg3, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x76, GFXAsset.mapCreditsBg, 0, GFXDestination.vram, 0x1800, 0, 0x3F),
		GFXHeader(0x76, GFXAsset.flgCreditsBg, 0, GFXDestination.vram, 0x1800, 1, 0x3F),
	],
	GfxH.toBeContinuedAges: [
		GFXHeader(0x77, GFXAsset.gfxTobecontinued, 0, GFXDestination.vram, 0x800, 0, 0x7D),
		GFXHeader(0xF7, GFXAsset.mapTobecontinued, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x77, GFXAsset.flgTobecontinued, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.secretForLinkedGame: [
		GFXHeader(0x77, GFXAsset.sprFileselectDecorations, 0, GFXDestination.vram, 0x200, 0, 0x13),
		GFXHeader(0x69, GFXAsset.gfxHud, 0, GFXDestination.vram, 0x1000, 0, 0x07),
		GFXHeader(0x69, GFXAsset.gfxHud, 0, GFXDestination.vram, 0x1000, 1, 0x1F),
		GFXHeader(0x77, GFXAsset.gfxFileselect, 0, GFXDestination.vram, 0x1200, 1, 0x5F),
		GFXHeader(0x78, GFXAsset.gfxSecrettoholodrum, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x78, GFXAsset.mapFileMenuTop, 0, GFXDestination.vramTiles, 0, 3, 0x09),
		GFXHeader(0x78, GFXAsset.flgFileMenuTop, 0, GFXDestination.vramAttributes, 0, 3, 0x09),
		GFXHeader(0x78, GFXAsset.mapSecretForLinkedGame, 0, GFXDestination.vramTiles, 0xA0, 3, 0x13),
		GFXHeader(0x78, GFXAsset.flgSecretForLinkedGame, 0, GFXDestination.vramAttributes, 0xA0, 3, 0x13),
		GFXHeader(0x78, GFXAsset.mapSaveMenuBottom, 0, GFXDestination.vramTiles, 0x1E0, 3, 0x07),
		GFXHeader(0x78, GFXAsset.flgSaveMenuBottom, 0, GFXDestination.vramAttributes, 0x1E0, 3, 0x07),
	],
	GfxH.creditsTheEnd: [
		GFXHeader(0xB7, GFXAsset.gfxCreditsTheend1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x77, GFXAsset.gfxCreditsTheend2, 0, GFXDestination.vram, 0x1000, 1, 0x43),
		GFXHeader(0xF7, GFXAsset.mapCreditsTheend, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x77, GFXAsset.flgCreditsTheend, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedTheEnd: [
		GFXHeader(0xF7, GFXAsset.gfxCreditsLinkedTheend1, 0, GFXDestination.vram, 0xA00, 1, 0x5F),
		GFXHeader(0x77, GFXAsset.gfxCreditsLinkedTheend2, 0, GFXDestination.vram, 0x1000, 1, 0x57),
		GFXHeader(0xF7, GFXAsset.mapCreditsLinkedTheend, 0, GFXDestination.vram, 0x1800, 0, 0x23),
		GFXHeader(0x77, GFXAsset.flgCreditsLinkedTheend, 0, GFXDestination.vram, 0x1800, 1, 0x23),
	],
	GfxH.creditsLinkedWavingGoodbye: [
		GFXHeader(0x77, GFXAsset.sprCreditsLinkedWavingGoodbye, 0, GFXDestination.vram, 0, 0, 0x27),
		GFXHeader(0xF7, GFXAsset.gfxCreditsLinkedWavingGoodbye1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0x77, GFXAsset.gfxCreditsLinkedWavingGoodbye2, 0, GFXDestination.vram, 0x1000, 0, 0x0F),
		GFXHeader(0xB7, GFXAsset.gfxCreditsLinkedWavingGoodbye3, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xB7, GFXAsset.gfxCreditsLinkedWavingGoodbye4, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
		GFXHeader(0x77, GFXAsset.mapCreditsLinkedWavingGoodbye1, 0, GFXDestination.vram, 0x1800, 0, 0x3F),
		GFXHeader(0x77, GFXAsset.flgCreditsLinkedWavingGoodbye1, 0, GFXDestination.vram, 0x1800, 1, 0x3F),
		GFXHeader(0x77, GFXAsset.mapCreditsLinkedWavingGoodbye2, 0, GFXDestination.tileMap, 0, 4, 0x0B),
		GFXHeader(0x77, GFXAsset.flgCreditsLinkedWavingGoodbye2, 0, GFXDestination.attributeMap, 0, 4, 0x0B),
	],
	GfxH.introLinkRidingHorse: [
		GFXHeader(0xF1, GFXAsset.sprIntroLinkOnHorseFront, 0, GFXDestination.vram, 0, 0, 0x6F),
		GFXHeader(0x71, GFXAsset.gfxIntroLinkOnHorseFrontBg, 0, GFXDestination.vram, 0x800, 0, 0x69),
		GFXHeader(0x71, GFXAsset.gfxIntroLinkFaceShot, 0, GFXDestination.vram, 0x1000, 0, 0x62),
		GFXHeader(0xF0, GFXAsset.sprIntroLinkOnHorseFar, 0, GFXDestination.vram, 0, 1, 0x6D),
		GFXHeader(0x71, GFXAsset.sprIntroLinkFaceShotSparkle, 0, GFXDestination.vram, 0x800, 1, 0x25),
		GFXHeader(0x71, GFXAsset.gfxIntroLinkOnHorseFarBg1, 0, GFXDestination.vram, 0xC00, 1, 0x3F),
		GFXHeader(0x71, GFXAsset.gfxIntroLinkOnHorseFarBg2, 0, GFXDestination.vram, 0x1000, 1, 0x1A),
		GFXHeader(0xF0, GFXAsset.mapIntroLinkOnHorseFar, 0, GFXDestination.vram, 0x1860, 0, 0x29),
		GFXHeader(0x70, GFXAsset.flgIntroLinkOnHorseFar, 0, GFXDestination.vram, 0x1860, 1, 0x29),
		GFXHeader(0xB1, GFXAsset.mapIntroLinkFaceShot, 0, GFXDestination.vram, 0x1B20, 0, 0x0B),
		GFXHeader(0x71, GFXAsset.flgIntroLinkFaceShot, 0, GFXDestination.vram, 0x1B20, 1, 0x0B),
		GFXHeader(0x71, GFXAsset.mapIntroBar, 0, GFXDestination.vram, 0x1C00, 0, 0x05),
		GFXHeader(0x71, GFXAsset.flgIntroBar, 0, GFXDestination.vram, 0x1C00, 1, 0x05),
		GFXHeader(0x71, GFXAsset.mapIntroLinkOnHorseFrontGround, 0, GFXDestination.vramTiles, 0, 3, 0x09),
		GFXHeader(0x71, GFXAsset.flgIntroLinkOnHorseFrontGround, 0, GFXDestination.vramAttributes, 0, 3, 0x09),
		GFXHeader(0x71, GFXAsset.mapIntroBar, 0, GFXDestination.vram, 0x1E60, 0, 0x05),
		GFXHeader(0x71, GFXAsset.flgIntroBar, 0, GFXDestination.vram, 0x1E60, 1, 0x05),
		GFXHeader(0x71, GFXAsset.mapIntroLinkOnHorseFrontBg, 0, GFXDestination.vram, 0x1EC0, 0, 0x13),
		GFXHeader(0x71, GFXAsset.flgIntroLinkOnHorseFrontBg, 0, GFXDestination.vram, 0x1EC0, 1, 0x13),
	],
	GfxH.introLinkOnHorseCloseup: [
		GFXHeader(0xF2, GFXAsset.mapLinkOnHorseCloseup, 0, GFXDestination.vram, 0x1C00, 0, 0x3F),
		GFXHeader(0x72, GFXAsset.flgLinkOnHorseCloseup, 0, GFXDestination.vram, 0x1C00, 1, 0x3F),
		GFXHeader(0xF1, GFXAsset.sprLinkOnHorseCloseup, 0, GFXDestination.vram, 0, 0, 0x4D),
		GFXHeader(0xF1, GFXAsset.gfxLinkOnHorseCloseup1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xF1, GFXAsset.gfxLinkOnHorseCloseup2, 0, GFXDestination.vram, 0x1000, 0, 0x7F),
		GFXHeader(0xF1, GFXAsset.gfxLinkOnHorseCloseup3, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xF1, GFXAsset.gfxLinkOnHorseCloseup4, 0, GFXDestination.vram, 0x1000, 1, 0x2D),
	],
	GfxH.introOutsideCastle: [
		GFXHeader(0xF2, GFXAsset.sprIntroOutsideCastleSprites, 0, GFXDestination.vram, 0, 0, 0x6D),
		GFXHeader(0xF2, GFXAsset.gfxIntroOutsideCastle1, 0, GFXDestination.vram, 0x800, 0, 0x7F),
		GFXHeader(0xB2, GFXAsset.gfxIntroOutsideCastle2, 0, GFXDestination.vram, 0x1000, 0, 0x7F),
		GFXHeader(0x72, GFXAsset.gfxIntroOutsideCastle3, 0, GFXDestination.vram, 0x800, 1, 0x4F),
		GFXHeader(0xF2, GFXAsset.mapIntroOutsideCastle, 0, GFXDestination.vram, 0x1C00, 0, 0x23),
		GFXHeader(0x72, GFXAsset.flgIntroOutsideCastle, 0, GFXDestination.vram, 0x1C00, 1, 0x23),
	],
	GfxH.introTempleScene: [
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetDungeonStandard2, 0, GFXDestination.vram, 0x1000, 1, 0x3F),
		GFXHeader(0x6F, GFXAsset.gfxTilesetMakuPath, 0, GFXDestination.vram, 0x1400, 1, 0x3F),
		GFXHeader(0x69, GFXAsset.gfxHud, 0, GFXDestination.vram, 0x1000, 0, 0x07),
		GFXHeader(0xF2, GFXAsset.mapIntroTriforceRoom, 0, GFXDestination.vram, 0x1800, 0, 0x3F),
		GFXHeader(0xF2, GFXAsset.flgIntroTriforceRoom, 0, GFXDestination.vram, 0x1800, 1, 0x3F),
		GFXHeader(0xF2, GFXAsset.mapIntroTriforceRoom, 0, GFXDestination.vramTiles, 0, 3, 0x3F),
		GFXHeader(0xF2, GFXAsset.flgIntroTriforceRoom, 0, GFXDestination.vramAttributes, 0, 3, 0x3F),
	],
	GfxH.titlescreenTreeScroll: [
		GFXHeader(0xB1, GFXAsset.gfxTitlescreen5, 0, GFXDestination.vram, 0x800, 0, 0x4F),
		GFXHeader(0xF1, GFXAsset.gfxTitlescreen2, 0, GFXDestination.vram, 0xD00, 0, 0x5F),
		GFXHeader(0xB1, GFXAsset.gfxTitlescreen7, 0, GFXDestination.vram, 0x1300, 0, 0x0F),
		GFXHeader(0xB1, GFXAsset.gfxTitlescreen4, 0, GFXDestination.vram, 0x1400, 0, 0x3F),
		GFXHeader(0xF1, GFXAsset.gfxTitlescreenTree1, 0, GFXDestination.vram, 0x800, 1, 0x7F),
		GFXHeader(0xB2, GFXAsset.gfxTitlescreenTree2, 0, GFXDestination.vram, 0x1000, 1, 0x7F),
		GFXHeader(0x72, GFXAsset.mapTitlescreenScroll2, 0, GFXDestination.tileMap, 0, 4, 0x29),
		GFXHeader(0x72, GFXAsset.flgTitlescreenScroll2, 0, GFXDestination.attributeMap, 0, 4, 0x29),
		GFXHeader(0xF2, GFXAsset.mapTitlescreenScroll1, 0, GFXDestination.vram, 0x1C00, 0, 0x3F),
		GFXHeader(0x72, GFXAsset.flgTitlescreenScroll1, 0, GFXDestination.vram, 0x1C00, 1, 0x3F),
	],
	GfxH.fileMenuGFX: [
		GFXHeader(0x1A, GFXAsset.sprLink, 0x200, GFXDestination.vram, 0, 0, 0x9F),
		GFXHeader(0x1A, GFXAsset.sprRodOfSeasons, 0, GFXDestination.vram, 0x1A0, 0, 0x03),
		GFXHeader(0x69, GFXAsset.gfxHud, 0, GFXDestination.vram, 0x1000, 0, 0x1F),
		GFXHeader(0x69, GFXAsset.gfxHud, 0, GFXDestination.vram, 0x1000, 1, 0x1F),
		GFXHeader(0x77, GFXAsset.sprFileselectDecorations, 0, GFXDestination.vram, 0x200, 0, 0x13),
		GFXHeader(0x77, GFXAsset.gfxFileselect, 0, GFXDestination.vram, 0x1200, 1, 0x5F),
	],
	GfxH.fileMenu: [
		GFXHeader(0xEB, GFXAsset.sprDin1, 0, GFXDestination.vram, 0, 1, 0x05),
		GFXHeader(0xEA, GFXAsset.sprNayru1, 0, GFXDestination.vram, 0x060, 1, 0x03),
		GFXHeader(0x78, GFXAsset.gfxMessagespeed, 0, GFXDestination.vram, 0x1200, 0, 0x1F),
		GFXHeader(0xB7, GFXAsset.gfxPickafile2, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x77, GFXAsset.gfxCopy, 0, GFXDestination.vram, 0xA00, 1, 0x09),
		GFXHeader(0x77, GFXAsset.gfxErase, 0, GFXDestination.vram, 0xAA0, 1, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgFileMenuTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuMiddle, 0, GFXDestination.tileMap, 0x0A0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.flgFileMenuMiddle, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0xB8, GFXAsset.mapFileMenuBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x05),
		GFXHeader(0x78, GFXAsset.flgFileMenuBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x05),
	],
	GfxH.fileMenuLayout: [
		GFXHeader(0x78, GFXAsset.mapFileMenuTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgFileMenuTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuMiddle, 0, GFXDestination.tileMap, 0x0A0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.flgFileMenuMiddle, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0xB8, GFXAsset.mapFileMenuBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x05),
		GFXHeader(0x78, GFXAsset.flgFileMenuBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x05),
	],
	GfxH.fileMenuCopy: [
		GFXHeader(0xB8, GFXAsset.gfxCopywhatwhere, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x78, GFXAsset.gfxQuit2, 0, GFXDestination.vram, 0xA00, 1, 0x09),
		GFXHeader(0x77, GFXAsset.gfxCopy, 0, GFXDestination.vram, 0xAA0, 1, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgFileMenuTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuCopy, 0, GFXDestination.tileMap, 0x0A0, 4, 0x13),
		GFXHeader(0xF8, GFXAsset.flgFileMenuCopy, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0xB8, GFXAsset.mapFileMenuBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x05),
		GFXHeader(0x78, GFXAsset.flgFileMenuBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x05),
	],
	GfxH.fileMenuErase: [
		GFXHeader(0xB8, GFXAsset.gfxPickafile, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x78, GFXAsset.gfxQuit2, 0, GFXDestination.vram, 0xA00, 1, 0x09),
		GFXHeader(0x77, GFXAsset.gfxErase, 0, GFXDestination.vram, 0xAA0, 1, 0x09),
	],
	GfxH.nameEntry: [
		GFXHeader(0x78, GFXAsset.gfxName, 0, GFXDestination.vram, 0x800, 1, 0x09),
		GFXHeader(0x78, GFXAsset.mapNameEntryTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgNameEntryTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0xB8, GFXAsset.mapNameEntryMiddle, 0, GFXDestination.tileMap, 0x0A0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.flgNameEntryMiddle, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0xF8, GFXAsset.mapNameEntryBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x07),
		GFXHeader(0x78, GFXAsset.flgNameEntryBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x07),
	],
	GfxH.saveMenuLayout: [
		GFXHeader(0x78, GFXAsset.mapFileMenuTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgFileMenuTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.mapSaveMenuMiddle, 0, GFXDestination.tileMap, 0x0A0, 4, 0x13),
		GFXHeader(0xF8, GFXAsset.flgSaveMenuMiddle, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.mapSaveMenuBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x07),
		GFXHeader(0x78, GFXAsset.flgSaveMenuBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x07),
	],
	GfxH.newFileOptions: [
		GFXHeader(0xF8, GFXAsset.gfxNewfilescreen, 0, GFXDestination.vram, 0x800, 1, 0x67),
	],
	GfxH.saveMenuGFX: [
		GFXHeader(0xF8, GFXAsset.gfxSavescreen, 0, GFXDestination.vram, 0x800, 1, 0x67),
	],
	GfxH.gameOverGFX: [
		GFXHeader(0xB8, GFXAsset.gfxGameover, 0, GFXDestination.vram, 0x800, 1, 0x1F),
	],
	GfxH.secretEntryGFX: [
		GFXHeader(0x78, GFXAsset.gfxSecretThatswrong, 0, GFXDestination.vram, 0x800, 1, 0x1F),
	],
	GfxH.secretEntryLayoutSmall: [
		GFXHeader(0x78, GFXAsset.mapNameEntryTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgNameEntryTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0xB8, GFXAsset.mapSecretEntryMiddle, 0, GFXDestination.tileMap, 0x0A0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.flgSecretEntryMiddle, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.mapSecretEntryBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x07),
		GFXHeader(0x78, GFXAsset.flgSecretEntryBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x07),
	],
	GfxH.secretEntryLayout: [
		GFXHeader(0x78, GFXAsset.mapSecretEntryTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgSecretEntryTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0xB8, GFXAsset.mapSecretEntryMiddle, 0, GFXDestination.tileMap, 0x0A0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.flgSecretEntryMiddle, 0, GFXDestination.attributeMap, 0x4A0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.mapSecretEntryBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x07),
		GFXHeader(0x78, GFXAsset.flgSecretEntryBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x07),
	],
	GfxH.secretEntryErrorLayout: [
		GFXHeader(0xB8, GFXAsset.mapSecretEntryError, 0, GFXDestination.tileMap, 0x140, 4, 0x03),
		GFXHeader(0x78, GFXAsset.flgSecretEntryError, 0, GFXDestination.attributeMap, 0x140, 4, 0x03),
	],
	GfxH.gameLink: [
		GFXHeader(0x78, GFXAsset.gfxMessagespeed, 0, GFXDestination.vram, 0x1200, 0, 0x1F),
		GFXHeader(0xB7, GFXAsset.gfxPickafile2, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x77, GFXAsset.gfxCopy, 0, GFXDestination.vram, 0xA00, 1, 0x09),
		GFXHeader(0x77, GFXAsset.gfxErase, 0, GFXDestination.vram, 0xAA0, 1, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgFileMenuTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuMiddle, 0, GFXDestination.tileMap, 0xA0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.flgFileMenuMiddle, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0xB8, GFXAsset.mapFileMenuBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x05),
		GFXHeader(0x78, GFXAsset.flgFileMenuBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x05),
		GFXHeader(0xB8, GFXAsset.gfxLinking, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x78, GFXAsset.gfxQuit, 0, GFXDestination.vram, 0xA00, 1, 0x13),
	],
	GfxH.quitGFX: [
		GFXHeader(0x78, GFXAsset.gfxQuit, 0, GFXDestination.vram, 0xA00, 1, 0x13),
	],
	GfxH.ganonRevival: [
		GFXHeader(0x2D, GFXAsset.sprGanon1, 0, GFXDestination.vram, 0, 0, 0x1F),
		GFXHeader(0x6D, GFXAsset.sprTwinrovaSacrifice1, 0, GFXDestination.vram, 0x200, 0, 0x1F),
		GFXHeader(0x6D, GFXAsset.sprTwinrovaSacrifice2, 0, GFXDestination.vram, 0x400, 0, 0x1F),
		GFXHeader(0x6D, GFXAsset.sprTwinrovaSacrifice3, 0, GFXDestination.vram, 0x600, 0, 0x1F),
		GFXHeader(0x2D, GFXAsset.sprTwinrovaSacrifice4, 0, GFXDestination.vram, 0x800, 0, 0x1D),
	],
	GfxH.ganonA: [
		GFXHeader(0x6D, GFXAsset.sprGanon2, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x1D),
	],
	GfxH.ganonB: [
		GFXHeader(0xAD, GFXAsset.sprGanon5, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x1F),
	],
	GfxH.ganonC: [
		GFXHeader(0xAD, GFXAsset.sprGanon6, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x11),
	],
	GfxH.ganonD: [
		GFXHeader(0xAD, GFXAsset.sprGanon7, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x17),
	],
	GfxH.ganonE: [
		GFXHeader(0xAD, GFXAsset.sprGanon8, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x1F),
	],
	GfxH.ganonF: [
		GFXHeader(0x2D, GFXAsset.sprGanon9, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x1F),
	],
	GfxH.ganonG: [
		GFXHeader(0xAD, GFXAsset.sprGanon10, 0, GFXDestination.tmpGFXBuffer, 0, 2, 0x1F),
	],
	GfxH.twinrovaLavaLayout: [
		GFXHeader(0xF8, GFXAsset.othTwinrovaLavaLayout, 0, GFXDestination.roomLayout, 0, 0, 0x0A),
	],
	GfxH.twinrovaNormalLayout: [
		GFXHeader(0x78, GFXAsset.othTwinrovaNormalLayout, 0, GFXDestination.roomLayout, 0, 0, 0x0A),
	],
	GfxH.fileMenuWithMessageSpeed: [
		GFXHeader(0x78, GFXAsset.mapFileMenuMessageSpeed, 0, GFXDestination.statusBarTileMap, 0x0, 4, 0x07),
		GFXHeader(0x78, GFXAsset.flgFileMenuMessageSpeed, 0, GFXDestination.statusBarAttributeMap, 0x0, 4, 0x07),
		GFXHeader(0xEB, GFXAsset.sprDin1, 0, GFXDestination.vram, 0, 1, 0x05),
		GFXHeader(0xEA, GFXAsset.sprNayru1, 0, GFXDestination.vram, 0x060, 1, 0x03),
		GFXHeader(0x78, GFXAsset.gfxMessagespeed, 0, GFXDestination.vram, 0x1200, 0, 0x1F),
		GFXHeader(0xB7, GFXAsset.gfxPickafile2, 0, GFXDestination.vram, 0x800, 1, 0x1F),
		GFXHeader(0x77, GFXAsset.gfxCopy, 0, GFXDestination.vram, 0xA00, 1, 0x09),
		GFXHeader(0x77, GFXAsset.gfxErase, 0, GFXDestination.vram, 0xAA0, 1, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuTop, 0, GFXDestination.tileMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.flgFileMenuTop, 0, GFXDestination.attributeMap, 0, 4, 0x09),
		GFXHeader(0x78, GFXAsset.mapFileMenuMiddle, 0, GFXDestination.tileMap, 0xA0, 4, 0x13),
		GFXHeader(0x78, GFXAsset.flgFileMenuMiddle, 0, GFXDestination.attributeMap, 0xA0, 4, 0x13),
		GFXHeader(0xB8, GFXAsset.mapFileMenuBottom, 0, GFXDestination.tileMap, 0x1E0, 4, 0x05),
		GFXHeader(0x78, GFXAsset.flgFileMenuBottom, 0, GFXDestination.attributeMap, 0x1E0, 4, 0x05),
	],
];
