module oracles.common.data.roomLayoutGroupTable;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.roomLayoutGroupTable;
} else {
	public import oracles.seasons.data.roomLayoutGroupTable;
}

