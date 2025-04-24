module oracles.common.data.itemUsageTables;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.itemUsageTables;
} else {
	public import oracles.seasons.data.itemUsageTables;
}
