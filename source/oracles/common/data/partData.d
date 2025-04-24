module oracles.common.data.partData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.partData;
} else {
	public import oracles.seasons.data.partData;
}

