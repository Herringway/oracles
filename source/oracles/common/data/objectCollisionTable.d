module oracles.common.data.objectCollisionTable;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.objectCollisionTable;
} else {
	public import oracles.seasons.data.objectCollisionTable;
}
