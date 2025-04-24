module oracles.common.data.seedTreeRefillData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.seedTreeRefillData;
} else {
	public import oracles.seasons.data.seedTreeRefillData;
}

