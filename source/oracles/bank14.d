module oracles.bank14;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.common.data.terrainEffects;

	//.include {"{GAME_DATA_DIR}/interactionOamData.s"}
	//.include {"{GAME_DATA_DIR}/partOamData.s"}
} else {

	//.include {"{GAME_DATA_DIR}/data_4556.s"}

	//; TODO: "SIMPLE_SCRIPT_BANK" define should be tied to this section somehow
	// m_section_free Scripts2 NAMESPACE scripts2
	//	.include "scripts/seasons/scripts2.s"
	//.ends
}
