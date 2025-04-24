module oracles.common.data.uncmpGfxHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.uncmpGfxHeaders;
} else {
	public import oracles.seasons.data.uncmpGfxHeaders;
}

