module oracles.common.data.singleTileChanges;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.singleTileChanges;
} else {
	public import oracles.seasons.data.singleTileChanges;
}

