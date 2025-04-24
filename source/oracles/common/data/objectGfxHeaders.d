module oracles.common.data.objectGfxHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.objectGfxHeaders;
} else {
	public import oracles.seasons.data.objectGfxHeaders;
}

