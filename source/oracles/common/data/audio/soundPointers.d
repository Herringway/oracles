module oracles.common.data.audio.soundPointers;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.audio.soundPointers;
	alias soundPointers = oracles.ages.data.audio.soundPointers.soundPointers;
} else {
	public import oracles.seasons.data.audio.soundPointers;
	alias soundPointers = oracles.ages.data.audio.soundPointers.soundPointers;
}

