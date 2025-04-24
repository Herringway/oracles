module oracles.bank15;

import oracles.external;
import oracles.globals;

static if (gameVersion == GameVersion.ages) {
	//.include "scripts/common/scriptHelper.s"

	const(ubyte)* getObjectDataAddress() {
		return &objectDataGroupTable[activeGroup][activeRoom][0];
	}


	public import oracles.ages.objects.pointers;

	//.ENDS

	// m_section_free Bank_15_3 NAMESPACE scriptHelp
	//	.include "scripts/ages/scriptHelper.s"
	//.ends
} else {
	public import oracles.common.serialfunctions;
	//	.include "scripts/common/scriptHelper.s"

	//m_section_free Interaction_Code_Group7 NAMESPACE commonInteractions7
	//	.include "object_code/common/interactions/faroreGiveItem.s"
	//	.include "object_code/common/interactions/zeldaApproachTrigger.s"
	//.ends

	//m_section_free Interaction_Code_Group8 NAMESPACE commonInteractions8
	//	.include "object_code/common/interactions/eraOrSeasonInfo.s"
	//	.include "object_code/common/interactions/statueEyeball.s"
	//	.include "object_code/common/interactions/ringHelpBook.s"
	//.ends


	//oamData_15_4da3:
	//	.db $1a
	//	.db $40 $d0 $00 $02
	//	.db $50 $e8 $02 $02
	//	.db $f8 $50 $08 $06
	//	.db $f8 $58 $0a $06
	//	.db $f8 $60 $0c $06
	//	.db $f8 $68 $0e $06
	//	.db $40 $10 $10 $07
	//	.db $50 $18 $12 $07
	//	.db $50 $28 $14 $07
	//	.db $50 $30 $16 $07
	//	.db $50 $38 $1e $00
	//	.db $40 $20 $18 $07
	//	.db $38 $28 $1a $07
	//	.db $28 $2b $1c $07
	//	.db $40 $38 $20 $07
	//	.db $30 $38 $22 $00
	//	.db $30 $30 $24 $07
	//	.db $10 $28 $26 $01
	//	.db $10 $30 $28 $01
	//	.db $10 $38 $2a $01
	//	.db $10 $40 $2c $01
	//	.db $00 $40 $2e $01
	//	.db $2b $02 $30 $02
	//	.db $30 $50 $32 $00
	//	.db $30 $58 $34 $00
	//	.db $1d $55 $36 $00


	//oamData_15_4e0c:
	//	.db $0a
	//	.db $46 $4a $88 $03
	//	.db $46 $52 $8a $03
	//	.db $49 $4c $80 $02
	//	.db $49 $54 $82 $02
	//	.db $47 $42 $84 $03
	//	.db $47 $4a $86 $03
	//	.db $39 $4e $90 $03
	//	.db $43 $59 $8c $03
	//	.db $39 $46 $8e $03
	//	.db $3b $3c $92 $03


	//	.include "code/staticObjects.s"
	//	.include {"{GAME_DATA_DIR}/staticDungeonObjects.s"}
	//	.include {"{GAME_DATA_DIR}/chestData.s"}
	//	.include {"{GAME_DATA_DIR}/treasureObjectData.s"}

	//	m_section_free Bank_15_3 NAMESPACE scriptHelp
	//		.include "scripts/seasons/scriptHelper.s"
	//	.ends

	//m_section_free Seasons_Interactions_Bank15 NAMESPACE seasonsInteractionsBank15
	//	.include "object_code/seasons/interactions/linkedFountainLady.s"
	//	.include "object_code/seasons/interactions/linkedSecredGivers.s"
	//	.include "object_code/seasons/interactions/miscPuzzles.s"
	//	.include "object_code/seasons/interactions/goldenBeastOldMan.s"
	//	.include "object_code/seasons/interactions/makuSeedAndEssences.s"
	//	.include "object_code/common/interactions/nayruRalphCredits.s"
	//	.include "object_code/seasons/interactions/portalSpawner.s"
	//	.include "object_code/seasons/interactions/vire.s"
	//	.include "object_code/seasons/interactions/linkedHerosCaveOldMan.s"
	//	.include "object_code/seasons/interactions/getRodOfSeasons.s"
	//	.include "object_code/seasons/interactions/loneZora.s"
	//.ends

	//	.include {"{GAME_DATA_DIR}/partAnimations.s"}
}
