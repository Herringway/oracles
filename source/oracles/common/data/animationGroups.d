module oracles.common.data.animationGroups;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.animationGroups;
} else {
	public import oracles.seasons.data.animationGroups;
}

