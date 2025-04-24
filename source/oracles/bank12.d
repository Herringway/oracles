module oracles.bank12;

import oracles.external;

static if (gameVersion == GameVersion.ages) {
	public import oracles.common.objectLoading;
	public import oracles.ages.roomSpecificCode;

	//m_section_free Objects_2 namespace objectData

	//	.include "objects/ages/mainData.s"
	//	.include "objects/ages/extraData3.s"

	//.ends

	//m_section_superfree Underwater_Surface_Data namespace underwaterSurfacing

	//	.include "code/ages/underwaterSurfacing.s"
	//	.include "data/ages/underwaterSurfaceData.s"

	//.ENDS

	//m_section_free Objects_3 namespace objectData

	//	.include "objects/ages/extraData4.s"

	//.ends
} else {
	//.include {"{GAME_DATA_DIR}/specialObjectOamData.s"}
	//.include "data/itemOamData.s"
	//.include {"{GAME_DATA_DIR}/enemyOamData.s"}
}
