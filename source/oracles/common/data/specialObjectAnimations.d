module oracles.common.data.specialObjectAnimations;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.specialObjectAnimations;
} else {
	public import oracles.seasons.data.specialObjectAnimations;
}
