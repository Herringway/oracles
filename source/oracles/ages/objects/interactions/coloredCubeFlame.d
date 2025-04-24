module oracles.ages.objects.interactions.coloredCubeFlame;

import oracles.external;
import oracles.structures;

//; ==================================================================================================
//; INTERAC_COLORED_CUBE_FLAME
//; ==================================================================================================
void interactionCode1A(GameObject* obj) {
//	call checkInteractionState
//	jr nz,@initialized
//	ld a,(wRotatingCubePos)
//	or a
//	ret z

//	call @updateColor
//	call interactionInitGraphics
//	call objectSetVisible82
//	call interactionIncState

//@initialized:
//	ld a,(wRotatingCubeColor)
//	rlca
//	jp nc,objectSetInvisible
//	call objectSetVisible
//	call @updateColor
//	jp interactionAnimate
	assert(0, "NYI");
}

//@updateColor:
//	ld a,(wRotatingCubeColor)
//	and $7f
//	ld hl,@palettes
//	rst_addAToHl
//	ld e,Interaction.oamFlags
//	ld a,(de)
//	and $f8
//	or (hl)
//	ld (de),a
//	ret

//@palettes:
//	.db $02 $03 $01
