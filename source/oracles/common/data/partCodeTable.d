module oracles.common.data.partCodeTable;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.partCodeTable;
} else {
	public import oracles.seasons.data.partCodeTable;
}

