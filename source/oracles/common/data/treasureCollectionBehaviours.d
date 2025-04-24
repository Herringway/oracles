module oracles.common.data.treasureCollectionBehaviours;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.treasureCollectionBehaviours;
} else {
	public import oracles.seasons.data.treasureCollectionBehaviours;
}

