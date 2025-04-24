module oracles.common.data.uniqueGfxHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.uniqueGfxHeaders;
} else {
	public import oracles.seasons.data.uniqueGfxHeaders;
}

