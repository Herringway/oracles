module oracles.common.data.tilesets;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tilesets;
} else {
	public import oracles.seasons.data.tilesets;
}

