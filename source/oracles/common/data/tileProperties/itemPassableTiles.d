module oracles.common.data.tileProperties.itemPassableTiles;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tileProperties.itemPassableTiles;
} else {
	public import oracles.seasons.data.tileProperties.itemPassableTiles;
}
