module oracles.common.data.enemyData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.enemyData;
} else {
	public import oracles.seasons.data.enemyData;
}

