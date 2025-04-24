module oracles.common.data.itemAttributes;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.itemAttributes;
} else {
	public import oracles.seasons.data.itemAttributes;
}
