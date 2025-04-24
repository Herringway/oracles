module oracles.common.data.treasureDisplayData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.treasureDisplayData;
} else {
	public import oracles.seasons.data.treasureDisplayData;
}

