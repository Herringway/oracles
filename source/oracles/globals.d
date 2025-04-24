module oracles.globals;

import oracles.defs;
import oracles.external;
import oracles.structures;

import replatform64.gameboy;

import std.meta;

__gshared:

// Work RAM: Bank 0

ubyte[16] musicQueue;

struct AudioState {
	ubyte function(ubyte, ref const(ubyte)*) musicReadFunction;
	ubyte soundFadeCounter;
	ubyte soundFadeDirection;
	ubyte soundFadeSpeed;
	ubyte loadingSoundBank;
	ubyte soundTmp;
	ubyte soundChannelValue;
	ubyte soundChannel;
	ubyte soundDisabled;
	ubyte unnamedC01C;
	ubyte soundCmd;
	ubyte soundCmdEnvelope;
	ushort soundFrequency;
	ubyte waveformIndex;
	ubyte musicVolume;
	ubyte unnamedC023;
	ubyte soundVolume;
	ubyte[8] unnamedC025;
	ubyte[6] unnamedC02D;
	byte[6] channelPitchShift;
	ubyte[6] unnamedC039;
	ubyte[6] unnamedC03F;
	ubyte[6] unnamedC045;
	ubyte[6] channelVibratos;
	ubyte[6] unnamedC051;
	ubyte[6] channelDutyCycles;
	ubyte[4] unnamedC05D;
	ubyte[4] unnamedC061;
	ubyte[4] channelEnvelopes;
	ubyte[4] channelEnvelopes2;
	ubyte[8] channelsEnabled;
	ubyte[8] channelWaitCounters;
	ubyte[8] channelVolumes;
}

AudioState audioState;

// stacks were here

ubyte[32] unnamedC2C0;

ZThread[4] threadState;

ubyte introStage;
ubyte introVar;

ubyte gameState;

ubyte cutsceneIndex;

ubyte paletteThreadFadeOffset;

// $0:C300
ubyte[256] bigBuffer;

DMAQueueEntry[16] vblankFunctionQueue;

ubyte keysPressedLastFrame;
ubyte keysPressed;
ubyte keysJustPressed;
ubyte autoFireKeysPressed;
ubyte autoFireCounter;

// $0:C400
GfxRegsStruct gfxRegs1;
GfxRegsStruct gfxRegs2;
GfxRegsStruct gfxRegs3;
GfxRegsStruct gfxRegsFinal;

ubyte vblankChecker;
ubyte unnamedC49E;

GfxRegsStruct gfxRegs6;
GfxRegsStruct gfxRegs7;

ubyte paletteThreadMode;
ubyte paletteThreadSpeed;
ubyte paletteThreadUpdateRate;
ubyte paletteThreadParameter;
ubyte paletteThreadCounter;
ubyte paletteThreadCounterRefill;

ubyte[4] dirtyFadePalettes;
ubyte lockBG7Colour3ToBlack;
ubyte unnamedC4B6;
bool function(GameObject*) ramFunction;
const(Animation)* puddleAnimationPointer;

TerrainEffect[0x10] terrainEffectsBuffer;
GameObject*[16][4] objectsToDraw;

// $0:C500

GameState state;

// $0:CB00
OAMEntry[40] oam;

// make sure to put vars that get reinitialized on game start here as well
alias clearOnInitializationBoth = AliasSeq!(
	textIsActive,
	textDisplayMode,
	textIndex,
	textIndexBackupH,
	selectedTextOption,
	textGFXColourIndex,
	textMapAddress,
	textNumberSubstitution,
	unnamedCBAA,
	textboxPosition,
	unnamedCBAD,
	textboxFlags,
	fileSelect,
	mapMenu,
	ringMenu,
	saveQuitMenu,
	secretListMenu,
	fakeResetMenu,
	intro,
	inventory,
	genericCutscene,
	useSimulatedInput,
	simulatedInputCounter,
	simulatedInputBank,
	simulatedInputAddress,
	simulatedInputValue,
	disableLinkCollisionsAndMenu,
	openedMenuType,
	menuLoadState,
	menuActiveState,
	submenuState,
	inventorySubmenu,
	inventorySubmenu0CursorPos,
	inventorySubmenu1CursorPos,
	inventorySubmenu2CursorPos,
	ringMenuMode,
	lastSecretInputLength,
	gfxRegs4,
	gfxRegs5,
	unnamedCBE1,
	unnamedCBE2,
	extraBGPaletteHeader,
	displayedHearts,
	displayedRupees,
	dontUpdateStatusBar,
	unnamedCBE8,
	statusBarNeedsRefresh,
	bItem,
	aItem,
	frameCounter,
	isLinkedGame,
	menuDisabled,
	cutsceneState,
	cutsceneTrigger,
	loadedObjectGFXIndex,
	unnamedCC07,
	loadedObjectGFX,
	loadedTreeGFX,
	unnamedCC1A,
	loadedItemGraphic1,
	loadedItemGraphic2,
	enemyIDToLoadExtraGFX,
	interactionIDToLoadExtraGFX,
	unnamedCC1F,
	linkLocalRespawnY,
	linkLocalRespawnX,
	linkLocalRespawnDirection,
	rememberedCompanionID,
	rememberedCompanionGroup,
	rememberedCompanionRoom,
	rememberedCompanionY,
	rememberedCompanionX,
	gameKeysPressed,
	gameKeysJustPressed,
	linkAngle,
	linkObjectIndex,
	activeGroup,
	roomIsLarge,
	loadingRoom,
	activeRoom,
	roomPack,
	roomStateModifier,
	activeCollisions,
	tilesetFlags,
	activeMusic,
	grassAnimationModifier,
	eyePuzzleTransitionCounter,
	lostWoodsTransitionCounter2,
	dungeonIndex,
	dungeonMapPosition,
	dungeonFloor,
	dungeonRoomProperties,
	dungeonFlagsAddressH,
	dungeonWallmasterDestRoom,
	dungeonFirstLayout,
	dungeonNumFloors,
	dungeonMapBaseFloor,
	mapFloorsUnlockedWithCompass,
	dungeonData6,
	dungeonData7,
	loadingRoomPack,
	activeMusic2,
	warpDestGroup,
	warpDestRoom,
	warpTransition,
	warpDestPos,
	warpTransition2,
	unnamedCC4C,
	seedTreeRefilledBitset,
	linkForceState,
	unnamedCC50,
	linkStateParameter,
	unnamedCC52,
	heartRingCounter,
	disableRingTransformations,
	linkIDOverride,
	forceIcePhysics,
	swordDisabledCounter,
	linkGrabState,
	linkGrabState2,
	linkInAir,
	linkSwimmingState,
	magnetGloveState,
	linkUsingItem1,
	linkTurningDisabled,
	linkImmobilized,
	unnamedCC62,
	unnamedCC63,
	braceletGrabbingNothing,
	linkPushingDirection,
	forceLinkPushAnimation,
	unnamedCC67,
	linkClimbingVine,
	pushingAgainstTileCounter,
	instrumentsDisabledCounter,
	pegasusSeedCounter,
	warpsDisabled,
	usingShield,
	shieldY,
	shieldX,
	unnamedCC73,
	unnamedCC72,
	grabbableObjectBuffer,
	unnamedCC84,
	unnamedCC85,
	roomEdgeY,
	roomEdgeX,
	secretInputType,
	textInputResult,
	disabledObjects,
	unnamedCC8B,
	linkCanPassNPCs,
	linkPlayingInstrument,
	enteredWarpPosition,
	numTorchesLit,
	disableWarpTiles,
	disableScreenTransitions,
	unnamedCC92,
	unnamedCC93,
	screenShakeMagnitude,
	unnamedCC95,
	linkRidingObject,
	forceCompanionDismount,
	disallowMountingCompanion,
	activeTilePos,
	activeTileIndex,
	standingOnTileCounter,
	activeTileType,
	lastActiveTileType,
	isTileSlippery,
	linkOnChest,
	activeTriggers,
	unnamedCCA1,
	unnamedCCA2,
	chestContentsOverride,
	eyePuzzleCorrectDirection,
	blockPushAngle,
	upgradesObtained,
	twinrovaTileReplacementMode,
	unnamedCCAA,
	unnamedCCAF,
	unnamedCCB0,
	unnamedCCB1,
	aButtonSensitiveObjectList,
	inShop,
	unnamedCCD4,
	shootingGalleryCCD5,
	shopHaveEnoughRupees,
	shootingGalleryBallStatus,
	informativeTextsShown,
	unnamedCCD8,
	scentSeedActive,
	isSeedShooterInUse,
	isLinkBeingShocked,
	linkShockCounter,
	diggingUpEnemiesForbidden,
	changedTileQueueHead,
	changedTileQueueTail,
	unnamedCCE1,
	unnamedCCE2,
	unnamedCCE3,
	animationQueueHead,
	animationQueueTail,
	linkPathIndex,
	//followingLinkObjectType,
	followingLinkObject,
	unnamedCCE9,
	scrollMode,
	unnamedCD01,
	screenTransitionDirection,
	unnamedCD03,
	screenTransitionState,
	screenTransitionState2,
	screenTransitionState3,
	unnamedCD07,
	screenOffsetY,
	screenOffsetX,
	roomWidth,
	roomHeight,
	screenTransitionBoundaryX,
	screenTransitionBoundaryY,
	maxCameraY,
	maxCameraX,
	uniqueGFXHeaderAddress,
	screenScrollRow,
	screenScrollVRAMRow,
	screenScrollDirection,
	screenScrollCounter,
	unnamedCD14,
	screenTransitionDelay,
	cameraFocusedObjectType,
	cameraFocusedObject,
	screenShakeCounterY,
	screenShakeCounterX,
	unnamedCD1A,
	objectTileIndex,
	tilesetUniqueGFX,
	tilesetGFX,
	tilesetPalette,
	tilesetLayout,
	tilesetLayoutGroup,
	tilesetAnimation,
	unnamedCD26,
	unnamedCD27,
	loadedTilesetUniqueGFX,
	loadedTilesetPalette,
	loadedTilesetLayout,
	loadedTilesetAnimation,
	lastToggleBlocksState,
	deleteEnergyBeads,
	animationState,
	animation1,
	animation2,
	animation3,
	animation4,
	tmpVRAMBuffer,
	staticObjects,
	enemiesKilledList,
	enemiesKilledListTail,
	numEnemies,
	toggleBlocksState,
	switchState,
	spinnerState,
	linkDeathTrigger,
	gameOverScreenTrigger,
	unnamedCDD7,
	dimitriHitNPC,
	unnamedCDD9,
	mapleIsPresent,
	roomCollisions,
	unnamedCEC0,
	enemyPlacement,
	wizzrobePositionReservations,
	roomLayout,
	normal,
	shootingGallery,
	goronDance,
	targetCarts,
	bigBangGame,
	goronCutscenes,
	fairyHideAndSeek,
	wildTokay,
	genericCutsceneState,
	introCutscene,
	bombUpgradeCutscene,
	octogonBoss,
	patchMinigame,
	fallDownHoleEvent,
	carpenterSearch,
	armosStatue,
);

ubyte textIsActive;
ubyte textDisplayMode;
ushort textIndex;
ushort textIndexBackupH;
ubyte selectedTextOption;
ubyte textGFXColourIndex;
ubyte textMapAddress;
ubyte textNumberSubstitution;
ushort unnamedCBAA;
ubyte textboxPosition;
ubyte unnamedCBAD;
ubyte textboxFlags;

MiscState miscState;
alias fileSelect = miscState;
alias mapMenu = miscState;
alias ringMenu = miscState;
alias saveQuitMenu = miscState;
alias secretListMenu = miscState;
alias fakeResetMenu = miscState;
alias intro = miscState;
alias inventory = miscState;
alias genericCutscene = miscState;
void allCBB9(ubyte a) {
	miscState.unnamedCBB9 = a;
}
ubyte useSimulatedInput;
ushort simulatedInputCounter;
ubyte simulatedInputBank;
const(SimulatedInput)* simulatedInputAddress;
ubyte simulatedInputValue;
ubyte disableLinkCollisionsAndMenu;
ubyte openedMenuType;
ubyte menuLoadState;
ubyte menuActiveState;
ubyte submenuState;
ubyte inventorySubmenu;
ubyte inventorySubmenu0CursorPos;
ubyte inventorySubmenu1CursorPos;
ubyte inventorySubmenu2CursorPos;
ubyte ringMenuMode;
ubyte lastSecretInputLength;
GfxRegsStruct gfxRegs4;
GfxRegsStruct gfxRegs5;
ubyte unnamedCBE1;
ubyte unnamedCBE2;
ubyte extraBGPaletteHeader;
ubyte displayedHearts;
ushort displayedRupees;
ubyte dontUpdateStatusBar;
ubyte unnamedCBE8;
ubyte statusBarNeedsRefresh;
struct TreasureDisplay {
	ubyte treasure;
	ubyte spriteAttribute1;
	ubyte spriteAttribute2;
	ubyte spriteXOffset;
	ubyte displayMode;
}
TreasureDisplay bItem;
TreasureDisplay aItem;

// $0:CC00

ubyte frameCounter;
ubyte isLinkedGame;
ubyte menuDisabled;
ubyte cutsceneState;
ubyte cutsceneTrigger;
ubyte loadedObjectGFXIndex;
ubyte unnamedCC07;
struct LoadedObjectGFX {
	ubyte index;
	ubyte active;
}
LoadedObjectGFX[8] loadedObjectGFX;
LoadedObjectGFX loadedTreeGFX;
ubyte unnamedCC1A;
ubyte loadedItemGraphic1;
ubyte loadedItemGraphic2;
ubyte enemyIDToLoadExtraGFX;
ubyte interactionIDToLoadExtraGFX;
ubyte unnamedCC1F;
ubyte linkLocalRespawnY;
ubyte linkLocalRespawnX;
ubyte linkLocalRespawnDirection;
ubyte rememberedCompanionID;
ubyte rememberedCompanionGroup;
ubyte rememberedCompanionRoom;
ubyte rememberedCompanionY;
ubyte rememberedCompanionX;
ubyte gameKeysPressed;
ubyte gameKeysJustPressed;
ubyte linkAngle;
ubyte linkObjectIndex;
ubyte activeGroup;
ubyte roomIsLarge;
ubyte loadingRoom;
ubyte activeRoom;
ubyte roomPack;
ubyte roomStateModifier;
ubyte activeCollisions;
ubyte tilesetFlags;
ubyte activeMusic;
ubyte grassAnimationModifier;
ubyte eyePuzzleTransitionCounter;
alias lostWoodsTransitionCounter1 = eyePuzzleTransitionCounter;
ubyte lostWoodsTransitionCounter2;
ubyte dungeonIndex;
ubyte dungeonMapPosition;
ubyte dungeonFloor;
ubyte dungeonRoomProperties;
ubyte dungeonFlagsAddressH;
ubyte dungeonWallmasterDestRoom;
ubyte dungeonFirstLayout;
ubyte dungeonNumFloors;
ubyte dungeonMapBaseFloor;
ubyte mapFloorsUnlockedWithCompass;
ubyte dungeonData6;
ubyte dungeonData7;
ubyte loadingRoomPack;
ubyte activeMusic2;
ubyte warpDestGroup;
ubyte warpDestRoom;
ubyte warpTransition;
ubyte warpDestPos;
ubyte warpTransition2;
ubyte unnamedCC4C;
enum NUM_SEED_TREES = (gameVersion == GameVersion.ages) ? 16 : 8;
ubyte[NUM_SEED_TREES / 8] seedTreeRefilledBitset;
ubyte linkForceState;
ubyte unnamedCC50;
ubyte linkStateParameter;
ubyte unnamedCC52;
uint heartRingCounter;
ubyte disableRingTransformations;
ubyte linkIDOverride;
ubyte forceIcePhysics;
ubyte swordDisabledCounter;
ubyte linkGrabState;
ubyte linkGrabState2;
ubyte linkInAir;
ubyte linkSwimmingState;
ubyte magnetGloveState;
ubyte linkUsingItem1;
ubyte linkTurningDisabled;
ubyte linkImmobilized;
ubyte unnamedCC62;
ubyte unnamedCC63;
ubyte braceletGrabbingNothing;
ubyte linkPushingDirection;
ubyte forceLinkPushAnimation;
ubyte unnamedCC67;
ubyte linkClimbingVine;
ubyte pushingAgainstTileCounter;
ubyte instrumentsDisabledCounter;
ushort pegasusSeedCounter;
ubyte warpsDisabled;
ubyte usingShield;
ubyte shieldY;
ubyte shieldX;
ubyte unnamedCC73;
ubyte unnamedCC72;
ubyte[16] grabbableObjectBuffer;
ubyte unnamedCC84;
ubyte unnamedCC85;
ubyte roomEdgeY;
ubyte roomEdgeX;
ubyte secretInputType;
ubyte textInputResult;
ubyte disabledObjects;
ubyte unnamedCC8B;
ubyte linkCanPassNPCs;
ubyte linkPlayingInstrument;
ubyte enteredWarpPosition;
ubyte numTorchesLit;
ubyte disableWarpTiles;
ubyte disableScreenTransitions;
ubyte unnamedCC92;
ubyte unnamedCC93;
ubyte screenShakeMagnitude;
ubyte unnamedCC95;
ubyte linkRidingObject;
ubyte forceCompanionDismount;
ubyte disallowMountingCompanion;
ubyte activeTilePos;
ubyte activeTileIndex;
ubyte standingOnTileCounter;
ubyte activeTileType;
ubyte lastActiveTileType;
ubyte isTileSlippery;
ubyte linkOnChest;
ubyte activeTriggers;
ubyte unnamedCCA1;
ubyte unnamedCCA2;
ushort chestContentsOverride;
ubyte eyePuzzleCorrectDirection;
ubyte blockPushAngle;
ubyte upgradesObtained;
ubyte twinrovaTileReplacementMode;
ubyte unnamedCCAA;
ubyte unnamedCCAF;
ubyte unnamedCCB0;
ubyte unnamedCCB1;
void*[16] aButtonSensitiveObjectList;
ubyte inShop;
ubyte unnamedCCD4;
alias shootingGalleryHitTargets = unnamedCCD4;
alias linkPushingAgainstBedCounter = unnamedCCD4;
ubyte shootingGalleryCCD5;
ubyte shopHaveEnoughRupees;
ubyte shootingGalleryBallStatus;
ubyte informativeTextsShown;
ubyte unnamedCCD8;
ubyte scentSeedActive;
ubyte isSeedShooterInUse;
ubyte isLinkBeingShocked;
ubyte linkShockCounter;
ubyte diggingUpEnemiesForbidden;
ubyte changedTileQueueHead;
ubyte changedTileQueueTail;
ubyte unnamedCCE1;
ubyte unnamedCCE2;
ubyte unnamedCCE3;
ubyte animationQueueHead;
ubyte animationQueueTail;
ubyte linkPathIndex;
//ubyte followingLinkObjectType;
GameObject* followingLinkObject;
ubyte unnamedCCE9;

// $0:CD00

ubyte scrollMode;
ubyte unnamedCD01;
ubyte screenTransitionDirection;
ubyte unnamedCD03;
ubyte screenTransitionState;
ubyte screenTransitionState2;
ubyte screenTransitionState3;
ubyte unnamedCD07;
ubyte screenOffsetY;
ubyte screenOffsetX;
ubyte roomWidth;
ubyte roomHeight;
ubyte screenTransitionBoundaryX;
ubyte screenTransitionBoundaryY;
ubyte maxCameraY;
ubyte maxCameraX;
const(void)* uniqueGFXHeaderAddress;
ubyte screenScrollRow;
ubyte screenScrollVRAMRow;
ubyte screenScrollDirection;
ubyte screenScrollCounter;
ubyte unnamedCD14;
ubyte screenTransitionDelay;
ubyte cameraFocusedObjectType;
ubyte cameraFocusedObject;
ubyte screenShakeCounterY;
ubyte screenShakeCounterX;
ubyte[5] unnamedCD1A;
ubyte objectTileIndex;
ubyte tilesetUniqueGFX;
ubyte tilesetGFX;
ubyte tilesetPalette;
ubyte tilesetLayout;
ubyte tilesetLayoutGroup;
ubyte tilesetAnimation;
ubyte unnamedCD26;
ubyte unnamedCD27;
ubyte loadedTilesetUniqueGFX;
ubyte loadedTilesetPalette;
ubyte loadedTilesetLayout;
ubyte loadedTilesetAnimation;
ubyte lastToggleBlocksState;
ubyte deleteEnergyBeads;
alias screenVariables = AliasSeq!(
	scrollMode,
	unnamedCD01,
	screenTransitionDirection,
	unnamedCD03,
	screenTransitionState,
	screenTransitionState2,
	screenTransitionState3,
	unnamedCD07,
	screenOffsetY,
	screenOffsetX,
	roomWidth,
	roomHeight,
	screenTransitionBoundaryX,
	screenTransitionBoundaryY,
	maxCameraY,
	maxCameraX,
	uniqueGFXHeaderAddress,
	screenScrollRow,
	screenScrollVRAMRow,
	screenScrollDirection,
	screenScrollCounter,
	unnamedCD14,
	screenTransitionDelay,
	cameraFocusedObjectType,
	cameraFocusedObject,
	screenShakeCounterY,
	screenShakeCounterX,
	unnamedCD1A,
	objectTileIndex,
	tilesetUniqueGFX,
	tilesetGFX,
	tilesetPalette,
	tilesetLayout,
	tilesetLayoutGroup,
	tilesetAnimation,
	unnamedCD26,
	unnamedCD27,
	loadedTilesetUniqueGFX,
	loadedTilesetPalette,
	loadedTilesetLayout,
	loadedTilesetAnimation,
	lastToggleBlocksState,
	deleteEnergyBeads,
);

ubyte animationState;
struct AnimationState {
	ubyte counter;
	const(AnimationData)* pointer;
}
AnimationState animation1;
AnimationState animation2;
AnimationState animation3;
AnimationState animation4;

ubyte[0x40] tmpVRAMBuffer;
enum staticObjectSize = (gameVersion == GameVersion.ages) ? 0x40 : 0x80;
ubyte[staticObjectSize] staticObjects;

ubyte[16] enemiesKilledList;
ubyte enemiesKilledListTail;
ubyte numEnemies;
ubyte toggleBlocksState;
ubyte switchState;
ubyte spinnerState;
ubyte linkDeathTrigger;
ubyte gameOverScreenTrigger;
ubyte unnamedCDD7;
ubyte dimitriHitNPC;
ubyte unnamedCDD9;
static if (gameVersion == GameVersion.ages) {
	ubyte unnamedCC05;
	ubyte linkRaisedFloorOffset;
	ubyte unnamedCCA7;
	ubyte lever1PullDistance;
	ubyte lever2PullDistance;
	ubyte rotatingCubeColour;
	ubyte rotatingCubePos;
	ubyte disableWarps;
	ubyte switchHookState;
	ubyte unnamedCDDB;
	ubyte linkTimeWarpTile;
	ubyte unnamedCDDD;
	ubyte sentBackByStrangeForce;
	ubyte unnamedCDDF;
	ubyte unnamedCDE0;
	ubyte pirateShipChangedTile;
	ubyte mamamuDogLocation;
	ubyte unnamedCDE3;
	alias clearOnInitialization = AliasSeq!(clearOnInitializationBoth,
		unnamedCC05,
		linkRaisedFloorOffset,
		unnamedCCA7,
		lever1PullDistance,
		lever2PullDistance,
		rotatingCubeColour,
		rotatingCubePos,
		disableWarps,
		switchHookState,
		unnamedCDDB,
		linkTimeWarpTile,
		unnamedCDDD,
		sentBackByStrangeForce,
		unnamedCDDF,
		unnamedCDE0,
		pirateShipChangedTile,
		mamamuDogLocation,
		unnamedCDE3,
	);
	alias clearedOnFunc49C9 = AliasSeq!(clearedOnFunc49C9Common,
		linkRaisedFloorOffset,
		unnamedCCA7,
		lever1PullDistance,
		lever2PullDistance,
		rotatingCubeColour,
		rotatingCubePos,
		disableWarps,
		switchHookState,
	);
	alias clearedOnScreenReload = AliasSeq!(clearedOnFunc49C9, clearedOnScreenReloadCommon);
} else {
	ubyte displayedMoneyAddress;
	ubyte unnamedCC1E;
	ubyte pirateSkullRandomNumber;
	ubyte unnamedCCC3;
	ubyte inBoxingMatch;
	ubyte unnamedCC39;
	alias clearOnInitialization = AliasSeq!(clearOnInitializationBoth,
		displayedMoneyAddress,
		unnamedCC1E,
		pirateSkullRandomNumber,
		unnamedCCC3,
		unnamedCC39,
	);
	alias clearedOnFunc49C9 = AliasSeq!(clearedOnFunc49C9Common,
		pirateSkullRandomNumber,
		unnamedCCC3,
		inBoxingMatch,
	);
	alias clearedOnScreenReload = AliasSeq!(clearedOnFunc49C9, clearedOnScreenReloadCommon);
}
ubyte mapleIsPresent;

// $0:CE00

ubyte[0xC0] roomCollisions;
struct SpeedStruct {
	ushort y;
	ushort x;
}
SpeedStruct unnamedCEC0;
EnemyPlacement enemyPlacement;
alias shootingGalleryTileLayoutsToShow = wizzrobePositionReservations;
ubyte[16] wizzrobePositionReservations;
ubyte[16] unnamedCEF0;

// $0:CF00
ubyte[0xC0] roomLayout;
// extra script bits, normally overlapping
MiscStateNormal normal;
MiscStateShootingGallery shootingGallery;
MiscStateGoronDance goronDance;
MiscStateTargetCarts targetCarts;
MiscStateBigBangGame bigBangGame;
MiscStateGoronCutscenes goronCutscenes;
MiscStateFairyHideAndSeek fairyHideAndSeek;
MiscStateWildTokay wildTokay;
MiscStateGenericCutscene genericCutsceneState;
MiscStateIntroCutscene introCutscene;
MiscStateBombUpgradeCutscene bombUpgradeCutscene;
MiscStateOctogonBoss octogonBoss;
MiscStatePatchMinigame patchMinigame;
MiscStateFallDownHoleEvent fallDownHoleEvent;
MiscStateCarpenterSearch carpenterSearch;
MiscStateArmosStatue armosStatue;
alias allMiscState = AliasSeq!(
	normal,
	shootingGallery,
	goronDance,
	targetCarts,
	bigBangGame,
	goronCutscenes,
	fairyHideAndSeek,
	wildTokay,
	genericCutsceneState,
	introCutscene,
	bombUpgradeCutscene,
	octogonBoss,
	patchMinigame,
	fallDownHoleEvent,
	carpenterSearch,
	armosStatue,
);
// Work RAM: Bank 1

ItemObject[16] itemObjects;
InteractionObject[16] interactions;
EnemyObject[16] enemies;
PartObject[16] parts;
alias wramBank0 = AliasSeq!(itemObjects, interactions, enemies, parts);

// special objects
auto link() => &itemObjects[0];
auto companion() => &itemObjects[1];

// Work RAM: Bank 2

ubyte[0x400] tmpGFXBuffer;
ubyte[0x400] tmpAttrBuffer;
ubyte[0x80] waveScrollValues;
static if (gameVersion == GameVersion.ages) {
	ubyte[0x80] filler7;
	ubyte[NUM_SEED_TREES * 8] seedTreeRefillData;
} else {
	ubyte[0x180] pirateShipBGTiles;
}
ubyte[0x10] solidObjectPositions;
ubyte[0x70] filler6;
ubyte[0x90] colourComponentBuffer1;
struct LinkWalkPath {
	ubyte direction;
	ubyte y;
	ubyte x;
}
LinkWalkPath[0x10] linkWalkPath;
ubyte[0x40] changedTileQueue;
ubyte[0x90] colourComponentBuffer2;
ubyte[0x20] animationQueue;
ubyte[0x50] filler4;
ubyte[0x100] dungeonLayout;
ubyte[0x100] filler2;
ubyte[0x80] gbaModePaletteData;

ubyte[0x80] tilesetPalettes;
ref ubyte[0x40] tilesetBGPalettes() {
	return tilesetPalettes[0x00 .. 0x40];
}
ref ubyte[0x40] tilesetSpritePalettes() {
	return tilesetPalettes[0x40 .. 0x80];
}

ubyte[0x80] palettesBuffer;
ref ubyte[0x40] bgPalettesBuffer() {
	return palettesBuffer[0x00 .. 0x40];
}
ref ubyte[0x40] spritePalettesBuffer() {
	return palettesBuffer[0x40 .. 0x80];
}

ubyte[0x80] fadingPalettes;
ref ubyte[0x40] fadingBGPalettes() {
	return fadingPalettes[0x00 .. 0x40];
}
ref ubyte[0x40] fadingSpritePalettes() {
	return fadingPalettes[0x40 .. 0x80];
}

// Work RAM: Bank 3

ubyte[0x800] tileMappingData;
ubyte[0x300] vramTiles;
ubyte[0x100] tileCollisions;
ubyte[0x300] vramAttributes;
ref ubyte[0x200] tileMappingIndices() {
	return vramAttributes[0x0 .. 0x200];
}
ref ubyte[0x100] unusedDE00() {
	return vramAttributes[0x200 .. 0x300];
}
ubyte[0xC0] roomLayoutBuffer;

// Work RAM: Bank 4

ubyte[0x240] tileMap;
ubyte[0xC0] statusBarTileMap;
OAMEntry[40] savedOAM;
ubyte[0x40] tmpRingBufffer;
ubyte[0x20] subscreenTextIndices;
ubyte[0x240] attributeMap;
ubyte[0xC0] statusBarAttributeMap;
ubyte[0x80] unnamedD700;
FileDisplayVariables[3] fileDisplayVariables;
ubyte[8] unnamedD788;
ubyte[32] nameBuffer;
ubyte[0x20] secretBuffer;
ubyte[0x20] unnamedD7E0;
ubyte[0x180] savedVRAMTiles;
ubyte unnamedD980;
ubyte packetByteIndex;
ubyte packetChecksum;
ubyte unnamedD983;
ubyte unnamedD984;
ubyte disableLinkTimeout;
ubyte linkRetryCounter;
ubyte numPacketBytes;
ubyte waitingForNextByte;
ushort fileLinkTimer;
ubyte unnamedD98B;
ubyte unnamedD98C;
ubyte[22 * 3] ringFortuneStuff;
ubyte[539] packetBuffer;
ubyte[0x400] gfxBuf;


// Work RAM: Bank 5

ubyte[0x800] nameEntryCharacterGFX;

// Work RAM: Bank 6

ubyte[0x3C0] dragonOnoxTileMap1;

// Work RAM: Bank 7

struct TextboxState {
	/// Mapping for textbox. Goes with w7TextboxAttributes.
	/// Each row is $20 bytes, and there are 5 rows. So this should take $a0 bytes, but it seems to have
	/// room for an extra row.
	ubyte[0xC0] map;
	ubyte displayState;
	/// When bit 0 is set, text skips to the end of a line (A or B was pressed)
	/// When bit 2 is set, an "\opt()" command has been encountered.
	/// When bit 3 is set, an option prompt has already been shown?
	/// When bit 4 is set, an extra text index will be shown when this text is done.
	/// See getExtraTextIndex.
	/// When bit 5 is set, it shows the heart icon like when you get a piece of heart.
	ubyte unnamedD0C1;
	/// This is $00 when the text is done, $01 when a newline is encountered, and $ff for anything else?
	ubyte status;
	/// A sound effect that's played once
	ubyte soundEffect;
	alias textSound = printSound;
	// The sound that each character makes as it's displayed
	ubyte printSound;
	/// How many frames each character is displayed for before the next appears
	ubyte characterDisplayLength;
	/// The timer until the next character will be displayed
	ubyte characterDisplayTimer;
	/// The attribute byte for subsequent characters. This is the byte that is written into vram bank 1,
	/// which determines which palette to use and stuff like that.
	ubyte attribute;
	/// Whether or not the little red arrow in the bottom-right is being displayed.
	/// This can be eiher $02 (not displayed) or $03 (displayed).
	/// This changes every 16 frames.
	ubyte arrowState;
	/// pos specifies where the tilemap for the textbox is located. It points to the start of the row where it should be displayed.
	ubyte pos;
	/// Low byte of where to save the tiles under the textbox?
	ubyte unnamedD0CC;
	ubyte unnamedD0CD;
	ubyte unnamedD0CE;
	ubyte unnamedD0CF;
	/// The next column of text to be shown
	ubyte nextTextColumnToDisplay;
	ubyte unnamedD0D1;
	/// This variable is used by the retrieveTextCharacter function.
	/// 0: read a normal character
	/// 1: read a kanji
	/// 2: read a trade item symbol
	ubyte gfxSource;
	/// Textbox position?
	ubyte unnamedD0D3;
	ubyte activeBank;
	/// Address of text being read
	ushort textAddress;
	/// counter for how long to slow down the text? (Used for getting essences)
	ubyte slowdownTimer;
	/// Similar to w7TextboxPos, but this points to the vram where it ends up.
	ushort vramPos;
	ubyte[4] unnamedD0DA;
	ubyte invTextScrollTimer;
	/// Number of spaces to be inserted before looping back to the start of the text.
	ubyte invTextSpaceCounter;
	/// This is 8 bytes. Each byte correspond to a position for an available option in the text prompt.
	/// The bytes can be written straight to w7TextboxMap as the indices for the tiles that would normally
	/// be in those positions. They can also be converted into an INDEX for w7TextboxMap with the
	/// getAddressInTextboxMap function.
	ubyte[8] optionPositions;
	/// Note that this is distinct from wSelectedTextOption, but they behave very
	/// similarly. This is just used internally in text routines.
	ubyte selectedTextOption;
	/// The corresponding value from w7TextboxOptionPositions.
	ubyte selectedTextPosition;
	ubyte unnamedD0EA;
	/// Number of frames until the textbox closes itself.
	ubyte timer;
	ubyte IndexLBackup;
	/// How many spaces to put after the name of the item (for the inventory menu).
	/// This is calculated so that the item name appears in the middle.
	ubyte invTextSpacesAfterName;
	/// Frame counter until the next time a character should play its sound effect.
	/// While nonzero, the text scrolling sound doesn't play (although explicit sound
	/// effects do play).
	ubyte soundCooldownCounter;
	ubyte unnamedD0EF;
	ushort tableAddr;
	ubyte tableBank;
	ubyte[13] unnamedD0F3;
	/// This goes with w7TextboxMap, so it should be the same size.
	ubyte[0xC0] attributes;
	/// $20 bytes total, 4 bytes per entry. When looking up a word in a dictionary, this remembers the
	/// position it left off at.
	/// Entry format:
	///   b0: bank of text where it left off
	///   b1/2: address of text where it left off
	///   b3: high byte of text index
	ubyte[4][8] stack;
	ubyte[32] unnamedD1E0;
	/// Holds a line of text graphics.
	ubyte[0x200] gfxBuffer;
	/// The text for the line
	ubyte[16] lineTextBuffer;
	/// The attributes for the line
	ubyte[16] ineAttributesBuffer;
	/// The number of frames each character is displayed before the next appears.
	ubyte[16] lineDelaysBuffer;
	/// The sound each character will play as it's displayed.
	ubyte[16] lineSoundsBuffer;
	/// Sound effects created by the "sfx" command (ie. goron noise)
	ubyte[16] lineSoundEffectsBuffer;
	/// Bit 0 of a byte in this buffer is set if the text can be advanced with the A/B buttons.
	ubyte[16] lineAdvanceableBuffer;
}

TextboxState textbox;
ubyte[12] secretText1;
ubyte[12] secretText2;
ubyte[20] secretGenerationBuffer;
// hole?
ubyte[0x800] unnamedD800;

// High RAM

// must be run from RAM on real hardware
// ubyte[10] oamFunction;

// some general-use globals
ubyte varFF8A;
ubyte varFF8B;
ubyte varFF8C;
ubyte varFF8D;
ubyte varFF8E;
ubyte varFF8F;
ubyte varFF90;
ubyte varFF91;
ubyte varFF92;
ubyte varFF93;

// RNG state
ubyte rng1;
ubyte rng2;

ubyte gameboyType;

ubyte romBank;

static if (gameVersion == GameVersion.ages) {
	ubyte* scriptAddress;
}

ubyte activeFileSlot;

ubyte lcdInterruptBehaviour;
ubyte lcdInterruptCounter;
ubyte lcdNextInterruptBehaviour;

ubyte activeThread;

ubyte oamTail;

ubyte terrainEffectsBufferUsedSize;

ubyte[4] objectPriorityCounters;

ubyte vblankFunctionQueueTail;
ubyte dirtyBGPalettes;
ubyte dirtySpritePalettes;

ubyte bgPaletteSources;
ubyte spritePaletteSources;

ushort cameraY;
ushort cameraX;

ubyte activeObjectType;
ubyte activeObject;

ubyte enemyTargetY;
ubyte enemyTargetX;

ubyte unnamedFFB2;
ubyte unnamedFFB3;

ubyte musicQueueHead;
ubyte musicQueueTail;

ubyte musicVolume;

ubyte unnamedFFB7;
ubyte unnamedFFB8;

ubyte introInputsEnabled;

ubyte serialInterruptBehaviour;

ubyte receivedSerialByte;

ubyte serialByte;

ubyte unnamedFFBD;
ubyte unnamedFFBE;

ubyte serialLinkState;

ubyte ramEnd;

ubyte soundDataBaseBank2;
ubyte soundDataBaseBank;

ubyte[8] soundChannelBanks;
const(ubyte)*[8] soundChannelAddresses;
const(ubyte)*[8] soundChannelBaseAddresses; // not in original
ushort[8] soundData3;

alias clearedOnFunc49C9Common = AliasSeq!(
	linkInAir,
	linkSwimmingState,
	magnetGloveState,
	linkUsingItem1,
	linkTurningDisabled,
	linkImmobilized,
	unnamedCC62,
	unnamedCC63,
	braceletGrabbingNothing,
	linkPushingDirection,
	forceLinkPushAnimation,
	unnamedCC67,
	linkClimbingVine,
	pushingAgainstTileCounter,
	instrumentsDisabledCounter,
	pegasusSeedCounter,
	warpsDisabled,
	usingShield,
	shieldY,
	shieldX,
	unnamedCC73,
	unnamedCC72,
	grabbableObjectBuffer,
	unnamedCC84,
	unnamedCC85,
	roomEdgeY,
	roomEdgeX,
	secretInputType,
	textInputResult,
	disabledObjects,
	unnamedCC8B,
	linkCanPassNPCs,
	linkPlayingInstrument,
	enteredWarpPosition,
	numTorchesLit,
	disableWarpTiles,
	disableScreenTransitions,
	unnamedCC92,
	unnamedCC93,
	screenShakeMagnitude,
	unnamedCC95,
	linkRidingObject,
	forceCompanionDismount,
	disallowMountingCompanion,
	activeTilePos,
	activeTileIndex,
	standingOnTileCounter,
	activeTileType,
	lastActiveTileType,
	isTileSlippery,
	linkOnChest,
	activeTriggers,
	unnamedCCA1,
	unnamedCCA2,
	chestContentsOverride,
	eyePuzzleCorrectDirection,
	blockPushAngle,
	upgradesObtained,
	twinrovaTileReplacementMode,
	unnamedCCAA,
	unnamedCCAF,
	unnamedCCB0,
	unnamedCCB1,
	aButtonSensitiveObjectList,
	inShop,
	unnamedCCD4,
	shootingGalleryCCD5,
	shopHaveEnoughRupees,
	shootingGalleryBallStatus,
	informativeTextsShown,
	unnamedCCD8,
	scentSeedActive,
	isSeedShooterInUse,
	isLinkBeingShocked,
	linkShockCounter,
	diggingUpEnemiesForbidden,
	changedTileQueueHead,
	changedTileQueueTail,
	unnamedCCE1,
);

alias clearedOnScreenReloadCommon = AliasSeq!(
	unnamedCCE2,
	unnamedCCE3,
	animationQueueHead,
	animationQueueTail,
	linkPathIndex,
	//followingLinkObjectType,
	followingLinkObject,
	unnamedCCE9,
);
