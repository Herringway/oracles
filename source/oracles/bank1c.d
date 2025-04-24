module oracles.bank1c;

import oracles.external;

//m_GfxDataSimple map_rings ; $717a0
static if (gameVersion == GameVersion.ages) {
	//.include {"{GAME_DATA_DIR}/largeRoomLayoutTables.s"} ; $719c0
} else {
	//.include {"{BUILD_DIR}/textData.s"}

	//.include {"{GAME_DATA_DIR}/roomLayoutData.s"}
	//.include {"{GAME_DATA_DIR}/gfxDataMain.s"}
}
