module oracles.common.objects.extraData1;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.objects.extraData1;
} else {
	public import oracles.seasons.objects.extraData1;
}

