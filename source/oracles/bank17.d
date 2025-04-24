module oracles.bank17;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.paletteData;
	public import oracles.ages.data.tilesetCollisions;
	public import oracles.ages.data.smallRoomLayoutTables;
} else {
	//m_section_free Tile_Mappings

	//	tileMappingIndexDataPointer:
	//		.dw tileMappingIndexData
	//	tileMappingAttributeDataPointer:
	//		.dw tileMappingAttributeData

	//	tileMappingTable:
	//		.incbin {"{BUILD_DIR}/tileset_layouts/tileMappingTable.bin"}
	//	tileMappingIndexData:
	//		.incbin {"{BUILD_DIR}/tileset_layouts/tileMappingIndexData.bin"}
	//	tileMappingAttributeData:
	//		.incbin {"{BUILD_DIR}/tileset_layouts/tileMappingAttributeData.bin"}
}