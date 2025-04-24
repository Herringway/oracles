module oracles.common.data.paletteHeaders;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.paletteHeaders : paletteHeaderTable;
} else {
	public import oracles.seasons.data.paletteHeaders : paletteHeaderTable;
}

