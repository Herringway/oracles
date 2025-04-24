module oracles.common.data.tileProperties.cliffTiles;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tileProperties.cliffTiles;
} else {
	public import oracles.seasons.data.tileProperties.cliffTiles;
}
