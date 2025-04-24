module oracles.common.data.signText;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.signText;
} else {
	public import oracles.seasons.data.signText;
}
