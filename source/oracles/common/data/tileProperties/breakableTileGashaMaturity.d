module oracles.common.data.tileProperties.breakableTileGashaMaturity;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tileProperties.breakableTileGashaMaturity;
} else {
	public import oracles.seasons.data.tileProperties.breakableTileGashaMaturity;
}
