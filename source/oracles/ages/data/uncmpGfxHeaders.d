module oracles.ages.data.uncmpGfxHeaders;

import oracles.data;
import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.structures;

//; Uncompressed GFX headers are just like regular GFX headers (data/{game}/gfxHeaders.s) except that
//; these don't try to decompress anything, they just copy the data directly to its destination.
//;
//; Sometimes these are used to load uncompressed graphics files, but more often they're used to move
//; data from WRAM to VRAM.

immutable GFXHeader[][] uncmpGfxHeaderTable = [
	UGfxH.unnamed00: [],
	UGfxH.unnamed01: [
		GFXHeader(4, GFXAsset.tileMap, 0, GFXDestination.vram, 0x600, 1, 0x20),
	],
	UGfxH.unnamed02: [
		GFXHeader(4, GFXAsset.statusBarAttributeMap, 0x40, GFXDestination.vram, 0x780, 1, 0x08),
		GFXHeader(4, GFXAsset.statusBarAttributeMap, 0, GFXDestination.vram, 0x1FC0, 1, 0x04),
		GFXHeader(4, GFXAsset.statusBarTileMap, 0, GFXDestination.vram, 0x1FC0, 0, 0x04),
	],
	UGfxH.unnamed03: [
		GFXHeader(4, GFXAsset.statusBarAttributeMap, 0, GFXDestination.vram, 0x1FC0, 1, 0x04),
		GFXHeader(4, GFXAsset.statusBarTileMap, 0, GFXDestination.vram, 0x1FC0, 0, 0x04),
	],
	UGfxH.unnamed04: [
		GFXHeader(4, GFXAsset.attributeMap, 0x40, GFXDestination.vram, 0x1800, 1, 0x1A),
		GFXHeader(4, GFXAsset.tileMap, 0x40, GFXDestination.vram, 0x1800, 0, 0x1A),
	],
	UGfxH.unnamed05: [
		GFXHeader(4, GFXAsset.attributeMap, 0x40, GFXDestination.vram, 0x1C00, 1, 0x1A),
		GFXHeader(4, GFXAsset.tileMap, 0x40, GFXDestination.vram, 0x1C00, 0, 0x1A),
	],
	UGfxH.unnamed06: [
		GFXHeader(4, GFXAsset.attributeMap, 0x40, GFXDestination.vram, 0x1800, 1, 0x20),
		GFXHeader(4, GFXAsset.tileMap, 0x40, GFXDestination.vram, 0x1800, 0, 0x20),
	],
	UGfxH.unnamed07: [
		GFXHeader(4, GFXAsset.gfxBuf, 0, GFXDestination.vram, 0xC00, 1, 0x30),
	],
	UGfxH.unnamed08: [
		GFXHeader(4, GFXAsset.tileMap, 0, GFXDestination.vram, 0x1C00, 0, 0x24),
		GFXHeader(4, GFXAsset.attributeMap, 0, GFXDestination.vram, 0x1C00, 1, 0x24),
	],
	UGfxH.unnamed09: [
		GFXHeader(4, GFXAsset.tileMap, 0, GFXDestination.vram, 0x000, 0, 0x60),
	],
	UGfxH.unnamed0A: [
		GFXHeader(4, GFXAsset.tileMap, 0, GFXDestination.vram, 0x1800, 0, 0x2C),
		GFXHeader(4, GFXAsset.attributeMap, 0, GFXDestination.vram, 0x1800, 1, 0x2C),
	],
	UGfxH.unnamed0B: [
		GFXHeader(5, GFXAsset.nameEntryCharacterGFX, 0, GFXDestination.vram, 0x800, 0, 0x80),
	],
	UGfxH.unnamed0C: [
		GFXHeader(5, GFXAsset.nameEntryCharacterGFX, 0, GFXDestination.vram, 0x600, 1, 0x20),
	],
	UGfxH.unnamed0D: [
	//	m_GfxHeaderRam w4TileMap+$140,      $9ea0, $16
	//	m_GfxHeaderRam w4AttributeMap+$140, $9ea1, $16
	],
	UGfxH.unnamed0E: [
	//	m_GfxHeaderRam w3TileMappingIndices, $9801, $2c
	//	m_GfxHeaderRam w3VramTiles,          $9800, $2c
	],
	UGfxH.unnamed0F: [
	//	m_GfxHeaderRam w3VramTiles,          $9800, $20
	//	m_GfxHeaderRam w3TileMappingIndices, $9801, $20
	],
	UGfxH.unnamed10: [
	//	m_GfxHeaderRam w3TileMappingIndices, $9801, $2c
	//	m_GfxHeaderRam w3VramTiles,          $9800, $2c
	],
	UGfxH.unnamed11: [
	//	m_GfxHeaderRam w3TileMappingIndices+$60, $9861, $02
	//	m_GfxHeaderRam w3VramTiles+$60,          $9860, $02
	],
	UGfxH.unnamed12: [
	//	m_GfxHeaderRam w4AttributeMap, $9801, $24
	//	m_GfxHeaderRam w4TileMap,      $9800, $24
	],
	UGfxH.unnamed13: [
	//	m_GfxHeaderRam w4AttributeMap+$000, $9801, $20
	//	m_GfxHeaderRam w4TileMap+$000,      $9800, $20
	//	m_GfxHeaderRam w4AttributeMap+$200, $9bc1, $04
	//	m_GfxHeaderRam w4TileMap+$200,      $9bc0, $04
	],
	UGfxH.unnamed14: [
	//	m_GfxHeaderRam w4AttributeMap, $9c01, $24
	//	m_GfxHeaderRam w4TileMap,      $9c00, $24
	],
	UGfxH.unnamed15: [
	//	m_GfxHeaderRam w4AttributeMap+$000, $9c01, $10
	//	m_GfxHeaderRam w4TileMap+$000,      $9c00, $10
	//	m_GfxHeaderRam w4TileMap+$100,      $9900, $02
	//	m_GfxHeaderRam w4AttributeMap+$200, $9bc1, $04
	//	m_GfxHeaderRam w4TileMap+$200,      $9bc0, $04
	],
	UGfxH.unnamed16: [
		GFXHeader(4, GFXAsset.statusBarTileMap, 0, GFXDestination.vram, 0x1DC0, 0, 0x0A),
		GFXHeader(4, GFXAsset.statusBarAttributeMap, 0, GFXDestination.vram, 0x1DC0, 1, 0x0A),
	],
	UGfxH.unnamed17: [
	//	m_GfxHeaderRam w7TextGfxBuffer, $9201, $20
	],
	UGfxH.unnamed18: [
	//	m_GfxHeader spr_boomerang, $84e1, $04
	],
	UGfxH.unnamed19: [],
	UGfxH.unnamed1A: [
	//	m_GfxHeader spr_swords, $8521, $0a
	],
	UGfxH.unnamed1B: [
	//	m_GfxHeader spr_swords, $8521, $0e, $a0
	],
	UGfxH.ages1C: [
	//	m_GfxHeader spr_cane_of_somaria, $8521
	],
	UGfxH.ages1D: [
	//	m_GfxHeader spr_seed_shooter, $8521
	],
	UGfxH.ages1E: [],
	UGfxH.ages1F: [
	//	m_GfxHeader spr_switch_hook, $8521
	],
	UGfxH.unnamed20: [
	//	m_GfxHeaderRam w7d800+$000, $9200, $10
	],
	UGfxH.unnamed21: [
	//	m_GfxHeaderRam w7d800+$100, $9200, $10
	],
	UGfxH.unnamed22: [
	//	m_GfxHeaderRam w7d800+$200, $9240, $0b
	],
	UGfxH.unnamed23: [
	//	m_GfxHeaderRam w7d800+$2b0, $9240, $0a
	],
	UGfxH.unnamed24: [
	//	m_GfxHeaderRam w7d800+$350, $9240, $06
	],
	UGfxH.unnamed25: [
	//	m_GfxHeaderRam w7d800+$3b0, $9240, $04
	],
	UGfxH.unnamed26: [
	//	m_GfxHeaderRam w7d800+$3f0, $9240, $04
	],
	UGfxH.unnamed27: [],
	UGfxH.unnamed28: [
	//	m_GfxHeaderRam w7d800+$430, $9240, $02
	],
	UGfxH.unnamed29: [
	//	m_GfxHeaderRam w7d800+$450, $9200, $04
	],
	UGfxH.unnamed2A: [
	//	m_GfxHeaderRam w4TileMap,      $9d60, $16
	//	m_GfxHeaderRam w4AttributeMap, $9d61, $16
	],
	UGfxH.unnamed2B: [
	//	m_GfxHeaderRam w7d800,               $8c01, $30
	//	m_GfxHeaderRam w3VramTiles,          $9800, $2c
	//	m_GfxHeaderRam w3TileMappingIndices, $9801, $2c
	],
	UGfxH.unnamed2C: [
	//	m_GfxHeaderRam w4TileMap,      $9800, $0c
	//	m_GfxHeaderRam w4AttributeMap, $9801, $0c
	],
	UGfxH.unnamed2D: [
	//	m_GfxHeaderRam w3VramTiles,          $9840, $20
	//	m_GfxHeaderRam w3TileMappingIndices, $9841, $20
	],
	UGfxH.unnamed2E: [],
	UGfxH.unnamed2F: [],
	UGfxH.unnamed30: [
	//	m_GfxHeaderRam w6AttributeBuffer, $9801, $20
	//	m_GfxHeaderRam w6TileBuffer,      $9800, $20
	],
	UGfxH.unnamed31: [
	//	m_GfxHeaderRam w3VramTiles,          $9860, $20
	//	m_GfxHeaderRam w3TileMappingIndices, $9861, $20
	],
	UGfxH.unnamed32: [
	//	m_GfxHeaderRam w2TmpGfxBuffer, $8200, $20
	],
	UGfxH.unnamed33: [
	//	m_GfxHeaderRam w2TmpGfxBuffer, $8400, $20
	],
	UGfxH.unnamed34: [
	//	m_GfxHeaderRam w4TileMap,      $9b00, $10
	//	m_GfxHeaderRam w4AttributeMap, $9b01, $10
	],
	UGfxH.unnamed35: [
	//	m_GfxHeaderRam w7d800, $8300, $30
	],
	UGfxH.ages36: [
		GFXHeader(4, GFXAsset.tileMap, 0, GFXDestination.vram, 0x1C00, 0, 0x12),
		GFXHeader(4, GFXAsset.attributeMap, 0, GFXDestination.vram, 0x1C00, 1, 0x12),
	],
	UGfxH.ages37: [
	//	m_GfxHeader gfx_past_chest, $8a91
	//	m_GfxHeader gfx_past_sign,  $8dc1
	],
	UGfxH.ages38: [
		GFXHeader(3, GFXAsset.vramTiles, 0, GFXDestination.vram, 0x1C00, 0, 0x0A),
		GFXHeader(3, GFXAsset.tileMappingIndices, 0, GFXDestination.vram, 0x1C00, 1, 0x0A),
	],
	UGfxH.ages39: [],
	UGfxH.agesImpaFainted: [
	//	m_GfxHeader spr_impa_fainted, $8601
	],
	UGfxH.ages3B: [
	//	m_GfxHeader spr_raft, $8601
	],
	UGfxH.ages3C: [
	//	m_GfxHeaderRam w3VramTiles, $9800, $0c
	],
	UGfxH.ages3D: [
	//	m_GfxHeader gfx_animations_2, $8cc1, $04, $740
	],
	UGfxH.ages3E: [
	//	m_GfxHeader gfx_animations_2, $8cc1, $04, $780
	],
	UGfxH.ages3F: [
	//	m_GfxHeader gfx_animations_2, $8cc1, $04, $7c0
	],
];
