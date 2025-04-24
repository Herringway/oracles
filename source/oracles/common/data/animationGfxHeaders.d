module oracles.common.data.animationGfxHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.animationGfxHeaders;
} else {
	public import oracles.seasons.data.animationGfxHeaders;
}

