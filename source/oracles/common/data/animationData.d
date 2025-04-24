module oracles.common.data.animationData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.animationData;
} else {
	public import oracles.seasons.data.animationData;
}

