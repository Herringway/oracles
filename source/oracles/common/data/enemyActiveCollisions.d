module oracles.common.data.enemyActiveCollisions;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.enemyActiveCollisions;
} else {
	public import oracles.seasons.data.enemyActiveCollisions;
}
