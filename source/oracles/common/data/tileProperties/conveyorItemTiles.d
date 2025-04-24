module oracles.common.data.tileProperties.conveyorItemTiles;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tileProperties.conveyorItemTiles;
} else {
	public import oracles.seasons.data.tileProperties.conveyorItemTiles;
}
