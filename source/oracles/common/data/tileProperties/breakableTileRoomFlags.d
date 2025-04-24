module oracles.common.data.tileProperties.breakableTileRoomFlags;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tileProperties.breakableTileRoomFlags;
} else {
	public import oracles.seasons.data.tileProperties.breakableTileRoomFlags;
}
