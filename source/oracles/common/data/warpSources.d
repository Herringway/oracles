module oracles.common.data.warpSources;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.warpSources;
} else {
	public import oracles.seasons.data.warpSources;
}

