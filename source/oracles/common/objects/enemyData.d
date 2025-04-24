module oracles.common.objects.enemyData;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.objects.enemyData;
} else {
	public import oracles.seasons.objects.enemyData;
}

