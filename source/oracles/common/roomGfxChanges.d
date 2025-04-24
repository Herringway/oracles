module oracles.common.roomGfxChanges;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.roomGfxChanges;
} else {
	public import oracles.seasons.roomGfxChanges;
}

