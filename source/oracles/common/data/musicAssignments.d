module oracles.common.data.musicAssignments;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.data.musicAssignments;
	alias musicAssignmentGroupTable = oracles.ages.data.musicAssignments.musicAssignmentGroupTable;
} else {
	public import oracles.seasons.data.musicAssignments;
	alias musicAssignmentGroupTable = oracles.seasons.data.musicAssignments.musicAssignmentGroupTable;
}
