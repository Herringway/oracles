module oracles.common.data.gfxHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.gfxHeaders : gfxHeaderTable;
} else {
	public import oracles.seasons.data.gfxHeaders : gfxHeaderTable;
}

