module oracles.common.data.roomPacks;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.roomPacks;
	alias roomPackData = oracles.ages.data.roomPacks.roomPackData;
} else {
	public import oracles.seasons.data.roomPacks;
	alias roomPackData = oracles.seasons.data.roomPacks.roomPackData;
}
