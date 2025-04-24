module oracles.common.data.treeGfxHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.treeGfxHeaders;
} else {
	public import oracles.seasons.data.treeGfxHeaders;
}

