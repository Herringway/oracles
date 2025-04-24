module oracles.common.data.tileProperties.tileTypeMappings;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tileProperties.tileTypeMappings;
} else {
	public import oracles.seasons.data.tileProperties.tileTypeMappings;
}
