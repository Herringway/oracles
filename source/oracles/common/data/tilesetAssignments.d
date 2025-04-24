module oracles.common.data.tilesetAssignments;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.tilesetAssignments;
} else {
	public import oracles.seasons.data.tilesetAssignments;
}

