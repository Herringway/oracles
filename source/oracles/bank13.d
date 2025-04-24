module oracles.bank13;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	//.define BASE_OAM_DATA_BANK $13
	//.export BASE_OAM_DATA_BANK

	//.include {"{GAME_DATA_DIR}/specialObjectOamData.s"}
	//.include "data/itemOamData.s"
	//.include {"{GAME_DATA_DIR}/enemyOamData.s"}
} else {
	public import oracles.common.data.terrainEffects;

//	.include {"{GAME_DATA_DIR}/interactionOamData.s"}
//	.include {"{GAME_DATA_DIR}/partOamData.s"}
}
