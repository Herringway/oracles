module oracles.common.objects.special.companionCutscene;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.objects.special.companionCutscene;
} else {
	public import oracles.seasons.objects.special.companionCutscene;
}
