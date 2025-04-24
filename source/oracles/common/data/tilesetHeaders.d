module oracles.common.data.tilesetHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tilesetHeaders;
} else {
	public import oracles.seasons.data.tilesetHeaders;
}
