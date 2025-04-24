module oracles.common.data.tileProperties.breakableTiles;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tileProperties.breakableTiles;
} else {
	public import oracles.seasons.data.tileProperties.breakableTiles;
}
