module oracles.common.tileSubstitutions;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.tileSubstitutions;
} else {
	public import oracles.seasons.tileSubstitutions;
}

