module oracles.common.objects.extraData2;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.objects.extraData2;
} else {
	public import oracles.seasons.objects.extraData2;
}

