module oracles.common.data.interactionData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.interactionData;
} else {
	public import oracles.seasons.data.interactionData;
}

