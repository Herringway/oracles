module oracles.common.data.itemData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.itemData;
} else {
	public import oracles.seasons.data.itemData;
}

