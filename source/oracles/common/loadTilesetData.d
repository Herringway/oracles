module oracles.common.loadTilesetData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.loadTilesetData;
} else {
	public import oracles.seasons.loadTilesetData;
}

