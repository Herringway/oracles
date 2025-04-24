module oracles.common.objects.special.linkInCutscene;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.objects.special.linkInCutscene;
} else {
	public import oracles.seasons.objects.special.linkInCutscene;
}
