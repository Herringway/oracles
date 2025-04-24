module oracles.common.data.warpDestinations;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.warpDestinations;
} else {
	public import oracles.seasons.data.warpDestinations;
}

