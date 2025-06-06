module oracles.ages.data.tilesets;

import oracles.external;
//; Data format:
//;   b0: bits 4-7: Value for wActiveCollisions variable.
//;                 Affects most collision properties other than basic solidity.
//;       bits 0-3: Value for wDungeonIndex ($f = no dungeon)
//;   b1 (wTilesetFlags):       Flags (see constants/common/tilesetFlags.s)
//;   b2 (wTilesetUniqueGfx):   Unique GFX index (see data/{game}/uniqueGfxHeaders.s)
//;   b3 (wTilesetGfx):         Main GFX index (see data/{game}/gfxHeaders.s)
//;   b4 (wTilesetPalette):     Palette index (see data/{game}/paletteHeaders.s)
//;   b5 (wTilesetLayout):      Tile mapping/collision data index (see data/{game}/tilesetMappings.s)
//;   b6 (wTilesetLayoutGroup): Layout group (will load room layout from rooms/.../roomXXYY.bin,
//;                             where XX = layout group, YY = room index for current overworld)
//;   b7 (wTilesetAnimation):   Animation data index (see data/{game}/animationGroups.s)

//tilesetData:
//	; 0x00
//	.db $0f, $01
//	.db UNIQUE_GFXH_LYNNA_CITY_1
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_LYNNA_CITY
//	.db $00, $00, $00

//	; 0x01
//	.db $0f, $01
//	.db UNIQUE_GFXH_YOLL_GRAVEYARD
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_YOLL_GRAVEYARD
//	.db $01, $00, $01

//	; 0x02
//	.db $0f, $01
//	.db UNIQUE_GFXH_BLACK_TOWER_OUTSIDE
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_BLACK_TOWER_OUTSIDE_PRESENT
//	.db $02, $00, $01

//	; 0x03
//	.db $0f, $01
//	.db UNIQUE_GFXH_FOREST_OF_TIME
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_FOREST_OF_TIME
//	.db $14, $00, $01

//	; 0x04
//	.db $0f, $01
//	.db UNIQUE_GFXH_FAIRY_FOREST
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_FAIRIES_FOREST
//	.db $03, $00, $03

//	; 0x05
//	.db $0f, $01
//	.db UNIQUE_GFXH_CRESCENT_ISLAND
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_CRESCENT_ISLAND_PRESENT
//	.db $04, $00, $01

//	; 0x06
//	.db $0f, $01
//	.db UNIQUE_GFXH_SYMMETRY_CITY_RUINED
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_SYMMETRY_CITY_RUINED
//	.db $05, $00, $04

//	; 0x07
//	.db $0f, $01
//	.db UNIQUE_GFXH_SYMMETRY_CITY_RESTORED
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_SYMMETRY_CITY_RESTORED
//	.db $19, $01, $01

//	; 0x08
//	.db $0f, $01
//	.db UNIQUE_GFXH_TALUS_PEAKS
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_TALUS_PEAKS_PRESENT
//	.db $06, $00, $01

//	; 0x09
//	.db $0f, $01
//	.db UNIQUE_GFXH_TALUS_PEAKS
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_TALUS_PEAKS_PRESENT
//	.db $06, $01, $01

//	; 0x0a
//	.db $0f, $01
//	.db UNIQUE_GFXH_ROLLING_RIDGE_PRESENT
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_ROLLING_RIDGE_PRESENT
//	.db $08, $00, $01

//	; 0x0b
//	.db $0f, $01
//	.db UNIQUE_GFXH_ROLLING_RIDGE_PRESENT
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_ROLLING_RIDGE_PRESENT
//	.db $08, $01, $01

//	; 0x0c
//	.db $0f, $01
//	.db UNIQUE_GFXH_EYEGLASS_LIBRARY_OUTSIDE
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_EYEGLASS_LIBRARY_OUTSIDE_PRESENT
//	.db $0a, $00, $03

//	; 0x0d
//	.db $0f, $01
//	.db UNIQUE_GFXH_NUUN_HIGHLANDS
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_NUUN_HIGHLANDS
//	.db $0d, $00, $06

//	; 0x0e
//	.db $0f, $01
//	.db UNIQUE_GFXH_NUUN_HIGHLANDS
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_NUUN_HIGHLANDS
//	.db $0d, $01, $06

//	; 0x0f
//	.db $0f, $01
//	.db UNIQUE_GFXH_NUUN_HIGHLANDS
//	.db GFXH_TILESET_OVERWORLD_PRESENT
//	.db PALH_TILESET_NUUN_HIGHLANDS
//	.db $0d, $03, $06

//	; 0x10
//	.db $0f, $81
//	.db UNIQUE_GFXH_LYNNA_CITY_2
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_LYNNA_VILLAGE
//	.db $0f, $02, $00

//	; 0x11
//	.db $0f, $81
//	.db UNIQUE_GFXH_LYNNA_CITY_2
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_LYNNA_VILLAGE
//	.db $0f, $03, $00

//	; 0x12
//	.db $0f, $81
//	.db UNIQUE_GFXH_LYNNA_CITY_2
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_MERMAIDS_CAVE_PAST_ENTRANCE
//	.db $0f, $02, $00

//	; 0x13
//	.db $0f, $81
//	.db UNIQUE_GFXH_YOLL_GRAVEYARD
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_YOLL_GRAVEYARD_ALTERNATE
//	.db $01, $02, $01

//	; 0x14
//	.db $0f, $81
//	.db UNIQUE_GFXH_BLACK_TOWER_OUTSIDE
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_BLACK_TOWER_OUTSIDE_PAST
//	.db $02, $02, $01

//	; 0x15
//	.db $0f, $81
//	.db UNIQUE_GFXH_BLACK_TOWER_OUTSIDE
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_BLACK_TOWER_OUTSIDE_PAST
//	.db $02, $03, $01

//	; 0x16
//	.db $0f, $81
//	.db UNIQUE_GFXH_FOREST_OF_TIME
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_OVERWORLD_PAST_ALTERNATE
//	.db $14, $02, $01

//	; 0x17
//	.db $0f, $81
//	.db UNIQUE_GFXH_FAIRY_FOREST
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_DEKU_FOREST
//	.db $03, $02, $03

//	; 0x18
//	.db $0f, $81
//	.db UNIQUE_GFXH_CRESCENT_ISLAND
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_CRESCENT_ISLAND_PAST
//	.db $04, $02, $01

//	; 0x19
//	.db $0f, $81
//	.db UNIQUE_GFXH_SYMMETRY_CITY_RUINED
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_SYMMETRY_CITY_PAST
//	.db $05, $02, $04

//	; 0x1a
//	.db $0f, $81
//	.db UNIQUE_GFXH_TALUS_PEAKS
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_TALUS_PEAKS_PAST
//	.db $06, $02, $01

//	; 0x1b
//	.db $0f, $81
//	.db UNIQUE_GFXH_TALUS_PEAKS
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_TALUS_PEAKS_PAST
//	.db $06, $03, $01

//	; 0x1c
//	.db $0f, $91
//	.db UNIQUE_GFXH_TALUS_PEAKS
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_TALUS_PEAKS_PAST
//	.db $06, $02, $01

//	; 0x1d
//	.db $0f, $81
//	.db UNIQUE_GFXH_TALUS_PEAKS_PAST
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_TALUS_PEAKS_PAST_ALTERNATE
//	.db $07, $02, $01

//	; 0x1e
//	.db $0f, $81
//	.db UNIQUE_GFXH_ROLLING_RIDGE_PAST
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_ROLLING_RIDGE_PAST
//	.db $09, $02, $02

//	; 0x1f
//	.db $0f, $81
//	.db UNIQUE_GFXH_EYEGLASS_LIBRARY_OUTSIDE
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_EYEGLASS_LIBRARY_OUTSIDE_PAST
//	.db $0a, $02, $03

//	; 0x20
//	.db $0f, $81
//	.db UNIQUE_GFXH_SEA_OF_NO_RETURN
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_SEA_OF_NO_RETURN
//	.db $0b, $02, $05

//	; 0x21
//	.db $0f, $81
//	.db UNIQUE_GFXH_AMBIS_PALACE_OUTSIDE
//	.db GFXH_TILESET_OVERWORLD_PAST
//	.db PALH_TILESET_AMBIS_PALACE_OUTSIDE
//	.db $0e, $02, $01

//	; 0x22
//	.db $0f, $02
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_TREE
//	.db PALH_TILESET_MAKU_TREE
//	.db $11, $00, $07

//	; 0x23
//	.db $0f, $02
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_TREE
//	.db PALH_TILESET_MAKU_TREE
//	.db $11, $01, $07

//	; 0x24
//	.db $0f, $02
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_TREE
//	.db PALH_TILESET_MAKU_TREE
//	.db $11, $03, $07

//	; 0x25
//	.db $0f, $02
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_TREE_TOP
//	.db PALH_TILESET_MAKU_TREE_TOP
//	.db $12, $00, $ff

//	; 0x26
//	.db $0f, $82
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_TREE
//	.db PALH_TILESET_MAKU_TREE
//	.db $11, $02, $07

//	; 0x27
//	.db $af, $18
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_BLACK_TOWER
//	.db PALH_TILESET_BLACK_TOWER
//	.db $13, $04, $ff

//	; 0x28
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_INDOORS_PRESENT
//	.db $15, $01, $10

//	; 0x29
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_OLD_MAN_CAVE_PRESENT
//	.db $15, $01, $10

//	; 0x2a
//	.db $1f, $84
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_INDOORS_PAST
//	.db $15, $01, $10

//	; 0x2b
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_INDOORS_PRESENT
//	.db $15, $03, $10

//	; 0x2c
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_INDOORS_PAST
//	.db $15, $03, $10

//	; 0x2d
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CAVE
//	.db PALH_TILESET_CAVE
//	.db $16, $01, $10

//	; 0x2e
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CAVE
//	.db PALH_TILESET_CAVE
//	.db $16, $03, $10

//	; 0x2f
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_GORON_CAVE
//	.db PALH_TILESET_CAVE
//	.db $16, $03, $10

//	; 0x30
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MOBLIN_FORTRESS
//	.db PALH_TILESET_MOBLIN_FORTRESS
//	.db $17, $01, $10

//	; 0x31
//	.db $1f, $44
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ZORA_PALACE
//	.db PALH_TILESET_ZORA_PALACE
//	.db $18, $03, $10

//	; 0x32
//	.db $1f, $44
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ZORA_PALACE
//	.db PALH_TILESET_UNDERWATER_CAVE
//	.db $18, $01, $10

//	; 0x33
//	.db $1f, $44
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ZORA_PALACE
//	.db PALH_TILESET_UNDERWATER_CAVE
//	.db $18, $03, $10

//	; 0x34
//	.db $20, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_PATH
//	.db PALH_TILESET_MAKU_PATH_PRESENT
//	.db $20, $04, $10

//	; 0x35
//	.db $2d, $88
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_PATH
//	.db PALH_TILESET_MAKU_PATH_PAST
//	.db $20, $04, $10

//	; 0x36
//	.db $21, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SPIRITS_GRAVE
//	.db PALH_TILESET_SPIRITS_GRAVE
//	.db $21, $04, $10

//	; 0x37
//	.db $22, $88
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_WING_DUNGEON
//	.db PALH_TILESET_WING_DUNGEON
//	.db $22, $04, $10

//	; 0x38
//	.db $23, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MOONLIT_GROTTO
//	.db PALH_TILESET_MOONLIT_GROTTO
//	.db $23, $04, $10

//	; 0x39
//	.db $24, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SKULL_DUNGEON
//	.db PALH_TILESET_SKULL_DUNGEON
//	.db $24, $04, $10

//	; 0x3a
//	.db $25, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CROWN_DUNGEON
//	.db PALH_TILESET_CROWN_DUNGEON
//	.db $25, $04, $10

//	; 0x3b
//	.db $26, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MERMAIDS_CAVE
//	.db PALH_TILESET_MERMAIDS_CAVE_PRESENT
//	.db $26, $05, $10

//	; 0x3c
//	.db $2c, $88
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MERMAIDS_CAVE
//	.db PALH_TILESET_MERMAIDS_CAVE_PAST
//	.db $26, $05, $10

//	; 0x3d
//	.db $2c, $c8
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MERMAIDS_CAVE
//	.db PALH_TILESET_MERMAIDS_CAVE_PAST_UNDERWATER
//	.db $26, $05, $13

//	; 0x3e
//	.db $27, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_JABU_JABUS_BELLY
//	.db PALH_TILESET_JABU_JABUS_BELLY
//	.db $27, $05, $15

//	; 0x3f
//	.db $27, $48
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_JABU_JABUS_BELLY
//	.db PALH_TILESET_JABU_JABUS_BELLY_UNDERWATER
//	.db $27, $05, $15

//	; 0x40
//	.db $28, $88
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ANCIENT_TOMB
//	.db PALH_TILESET_ANCIENT_TOMB
//	.db $28, $05, $10

//	; 0x41
//	.db $28, $88
//	.db UNIQUE_GFXH_ANCIENT_TOMB_BOSS
//	.db GFXH_TILESET_ANCIENT_TOMB
//	.db PALH_TILESET_ANCIENT_TOMB_BOSS
//	.db $28, $05, $10

//	; 0x42
//	.db $28, $c8
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ANCIENT_TOMB
//	.db PALH_TILESET_ANCIENT_TOMB_UNDERWATER
//	.db $28, $05, $13

//	; 0x43
//	.db $2f, $90
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_BLACK_TOWER_TOP
//	.db PALH_TILESET_BLACK_TOWER_TOP
//	.db $29, $04, $10

//	; 0x44
//	.db $2f, $90
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_BLACK_TOWER_TOP
//	.db PALH_BLACK_TOWER_TOP_WITH_BUSHES
//	.db $29, $04, $10

//	; 0x45
//	.db $af, $98
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_BLACK_TOWER_TOP
//	.db PALH_TILESET_BLACK_TOWER_TOP
//	.db $29, $04, $14

//	; 0x46
//	.db $2a, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ROOM_OF_RITES
//	.db PALH_TILESET_ROOM_OF_RITES
//	.db $2a, $05, $10

//	; 0x47
//	.db $2a, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ROOM_OF_RITES
//	.db PALH_TILESET_ROOM_OF_RITES_ICE
//	.db $2a, $05, $10

//	; 0x48
//	.db $2b, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_PATH
//	.db PALH_TILESET_HEROS_CAVE
//	.db $20, $04, $10

//	; 0x49
//	.db $2b, $08
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_PATH
//	.db PALH_TILESET_HEROS_CAVE_WITH_BUSHES
//	.db $20, $04, $10

//	; 0x4a
//	.db $2b, $48
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MAKU_PATH
//	.db PALH_TILESET_HEROS_CAVE_UNDERWATER
//	.db $20, $04, $11

//	; 0x4b
//	.db $3d, $a8
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL
//	.db $32, $04, $ff

//	; 0x4c
//	.db $31, $28
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_SPIRITS_GRAVE
//	.db $32, $04, $12

//	; 0x4d
//	.db $32, $28
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL
//	.db $32, $04, $12

//	; 0x4e
//	.db $34, $28
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_SKULL_DUNGEON_CROWN_DUNGEON
//	.db $32, $04, $12

//	; 0x4f
//	.db $35, $28
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_SKULL_DUNGEON_CROWN_DUNGEON
//	.db $32, $04, $12

//	; 0x50
//	.db $36, $28
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_MERMAIDS_CAVE_PRESENT
//	.db $32, $05, $12

//	; 0x51
//	.db $3c, $a8
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_MERMAIDS_CAVE_PAST
//	.db $32, $05, $12

//	; 0x52
//	.db $37, $a8
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_JABU_JABUS_BELLY
//	.db $32, $05, $12

//	; 0x53
//	.db $38, $a8
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_ANCIENT_TOMB
//	.db $32, $05, $12

//	; 0x54
//	.db $3b, $28
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL
//	.db $32, $04, $ff

//	; 0x55
//	.db $2e, $18
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_INDOORS_PRESENT
//	.db $15, $05, $10

//	; 0x56
//	.db $2f, $10
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_INDOORS_PRESENT
//	.db $15, $05, $10

//	; 0x57
//	.db $2f, $12
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_INDOORS
//	.db PALH_TILESET_MAKU_TREE_INSIDE
//	.db $15, $05, $10

//	; 0x58
//	.db $2e, $18
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CAVE
//	.db PALH_TILESET_CAVE
//	.db $16, $05, $10

//	; 0x59
//	.db $2f, $10
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CAVE
//	.db PALH_TILESET_CAVE
//	.db $16, $05, $10

//	; 0x5a
//	.db $2e, $18
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_MOBLIN_FORTRESS
//	.db PALH_TILESET_AMBIS_PALACE
//	.db $17, $05, $10

//	; 0x5b
//	.db $2f, $50
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_ZORA_PALACE
//	.db PALH_TILESET_ZORA_PALACE
//	.db $18, $05, $10

//	; 0x5c
//	.db $3f, $30
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_B
//	.db $32, $05, $12

//	; 0x5d
//	.db $3f, $30
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_C
//	.db $32, $05, $12

//	; 0x5e
//	.db $3e, $38
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_SIDESCROLL
//	.db PALH_TILESET_SIDESCROLL_B
//	.db $32, $05, $12

//	; 0x5f
//	.db $4f, $41
//	.db UNIQUE_GFXH_UNDERWATER
//	.db GFXH_TILESET_UNDERWATER_PRESENT
//	.db PALH_TILESET_UNDERWATER_PRESENT
//	.db $10, $01, $08

//	; 0x60
//	.db $4f, $c1
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_UNDERWATER_PAST
//	.db PALH_TILESET_UNDERWATER_PAST
//	.db $10, $03, $08

//	; 0x61
//	.db $4f, $d1
//	.db UNIQUE_GFXH_UNDERWATER
//	.db GFXH_TILESET_UNDERWATER_PRESENT
//	.db PALH_TILESET_UNDERWATER_PAST
//	.db $10, $03, $08

//	; 0x62
//	.db $4f, $41
//	.db UNIQUE_GFXH_JABU_JABU_OUTSIDE
//	.db GFXH_TILESET_UNDERWATER_PRESENT
//	.db PALH_TILESET_JABU_JABU_OUTSIDE
//	.db $1a, $01, $08

//	; 0x63
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CAVE
//	.db PALH_TILESET_ROLLING_RIDGE_CAVE_PRESENT
//	.db $16, $01, $10

//	; 0x64
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CAVE
//	.db PALH_TILESET_ROLLING_RIDGE_CAVE_PRESENT
//	.db $16, $03, $10

//	; 0x65
//	.db $2e, $18
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_CAVE
//	.db PALH_TILESET_ROLLING_RIDGE_CAVE_PRESENT
//	.db $16, $05, $10

//	; 0x66
//	.db $1f, $04
//	.db UNIQUE_GFXH_NONE
//	.db GFXH_TILESET_GORON_CAVE
//	.db PALH_TILESET_CAVE
//	.db $16, $02, $10