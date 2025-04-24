module oracles.common.data.partActiveCollisions;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.partActiveCollisions;
} else {
	public import oracles.seasons.data.partActiveCollisions;
}
