module oracles.common.roomSpecificTileChanges;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.roomSpecificTileChanges;
} else {
	public import oracles.seasons.roomSpecificTileChanges;
}

