module oracles.structures;

import oracles.data;
import oracles.defs;
import oracles.external;
import oracles.extra;

import replatform64.gameboy;

import core.thread;
import std.bitmanip;

struct ZThread {
	private static class NormalThreadTermination : Exception { this() { super("Thread terminated normally"); }}
	enum State {
		inactive = 0, /// Thread is dead
		sleeping = 1, /// Thread is sleeping until frameCounter hits 0
		ready = 2, /// Thread is ready to run
		active = 3, /// Thread is currently running
	}
	ubyte state;
	ubyte frameCounter;
	void function() start;
	Fiber fiber;
	void initNew(void function() newStart) {
		fiber = new Fiber(newStart);
		terminate();
	}
	void resume() {
		assert(fiber);
		assert(fiber.state == Fiber.State.HOLD);
		try {
			fiber.call(Fiber.Rethrow.yes);
		} catch (NormalThreadTermination) {}
	}
	void run() {
		fiber = new Fiber(start);
		resume();
	}
	static void yield() {
		Fiber.yield();
	}
	void terminate() {
		if (fiber) {
			throw new NormalThreadTermination;
		}
	}
}

struct GfxRegsStruct {
	ubyte lcdc;
	ubyte scy;
	ubyte scx;
	ubyte wy;
	ubyte wx;
	ubyte lyc;
}
union MiscState {
	struct {
		align(1):
		ubyte mode;
		ubyte mode2;
		ubyte unnamedCBB5;
		ubyte unnamedCBB6;
		ubyte textInputMode;
		ubyte textInputMaxCursorPos;
		ubyte kanaMode;
		ubyte fontXor;
		ubyte cursorOffset;
		ubyte cursorPos;
		ubyte cursorPos2;
		ubyte textInputCursorPos;
		ubyte linkTimer;
		ubyte unnamedCBC0;
		ubyte unnamedCBC1;
		ubyte unnamedCBC2;
	}
	//struct {

	//}
	struct {
		align(1):
		ubyte selectedRing;
		ubyte ringListCursorIndex;
		ubyte numPages;
		ubyte page;
		ubyte unnamedCBB7;
		ubyte listCursorFlickerCounter;
		ubyte rupeeRefundValue;
		ubyte tileMapIndex;
		ubyte ringNameTextIndex;
		ubyte scrollDirection;
		ubyte ringBoxCursorIndex;
		ubyte boxCursorFlickerCounter;
		ubyte displayedRingNumberComparator;
		ubyte descriptionTextIndex;
		ubyte textDelayCounter;
		ubyte textDelayCounter2;
	}
	struct {
		align(1):
		ubyte state;
		ubyte gameOver;
		ubyte cursorIndex;
		ubyte delayCounter;
	}
	struct {
		align(1):
		ubyte state_;
		ubyte unnamedCBB4;
		ubyte numEntries;
		ubyte cursorIndex_;
		ubyte scroll;
		ubyte scrollSpeed;
	}
	struct {
		align(1):
		ubyte state__;
		ubyte delayCounter__;
	}
	struct {
		align(1):
		ushort unnamedCBB3;
		ubyte cinematicState;
		ubyte unnamedCBB6_;
		ubyte frameCounter;
		ubyte unnamedCBB8;
		ubyte triforceState;
		ubyte unnamedCBBA;
		ubyte unnamedCBBB;
		ubyte unnamedCBBC;
		ubyte unnamedCBBD;
	}
	struct {
		align(1):
		ubyte unnamedCBB3_;
		ubyte unnamedCBB4_;
		ubyte itemSubmenuIndex;
		ubyte unnamedCBB6__;
		ubyte selectedItem;
		ubyte unnamedCBB8_;
		ubyte submenu2CursorPos2;
		ubyte unnamedCBBA_;
		ubyte activeText;
		ubyte unnamedCBBC_;
		ubyte unnamedCBBD_;
		ubyte itemSubmenuCounter;
		ubyte itemSubmenuMaxWidth;
		ubyte itemSubmenuWidth;
		ubyte unnamedCBC1_;
	}
	struct {
		align(1):
		ubyte unnamedCBB3__;
		ubyte unnamedCBB4__;
		ubyte unnamedCBB5_;
		ubyte unnamedCBB6___;
		ubyte unnamedCBB7_;
		ubyte unnamedCBB8__;
		ubyte unnamedCBB9;
		ubyte unnamedCBBA__;
		ubyte unnamedCBBB_;
		ubyte unnamedCBBC__;
		ubyte unnamedCBBD__;
		ubyte unnamedCBBE;
		ubyte unnamedCBBF;
		ubyte unnamedCBC0_;
		ubyte unnamedCBC1__;
		ubyte unnamedCBC2_;
	}
}
struct MiscStateNormal {
	ubyte unnamedCFC0;
	ubyte doorControllerState;
}
struct MiscStateShootingGallery {
	ubyte gameStatus;
	ubyte[21] unnamedCFC1;
	ubyte isStrike;
	ubyte savedBItem;
	ubyte unnamedCFD9;
	ubyte unnamedCFDA;
	ubyte unnamedCFDB;
	ubyte disableGoronNPCs;
	ubyte useTileIndexData;
	ubyte remainingRounds;
	ubyte targetLayoutIndex;
}
struct MiscStateGoronDance {
	ubyte[17] filler;
	ubyte failureType;
	ubyte danceAnimation;
	ubyte linkJumping;
	ubyte linkStartedDance;
	ushort frameCounter;
	ubyte currentMove;
	ubyte consecutiveBPressCounter;
	ubyte unnamedCFD9;
	ubyte roundIndex;
	ubyte numFailedRounds;
	ubyte beat;
	ubyte danceLevel;
	ubyte remainingRounds;
	ubyte dancePattern;
}
struct MiscStateTargetCarts {
}
struct MiscStateBigBangGame {
}
struct MiscStateGoronCutscenes {
}
struct MiscStateFairyHideAndSeek {
}
struct MiscStateWildTokay {
}
struct MiscStateGenericCutscene {
}
struct MiscStateIntroCutscene {
}
struct MiscStateBombUpgradeCutscene {
}
struct MiscStateOctogonBoss {
}
struct MiscStatePatchMinigame {
}
struct MiscStateFallDownHoleEvent {
}
struct MiscStateCarpenterSearch {
}
struct MiscStateArmosStatue {
}

struct EnemyPlacement {
}

struct GameObject {
	// Enemies: bits 4-6 are the "index" of the enemy on the screen? (this is used to remember whether it's been killed.)
	// When bits 0-1 == 3, the object persists across screens? (for interactions at least)
	// Companion: bit 1 set when Link is riding it?
	//; Certain interactions delete themselves when (enabled&3) == 2?
	//; Bit 7: if set, this interaction _always_ updates, even when scrolling, when
	//; textboxes are up, and when bit 1 of wActiveObjects is set.
	//; For parent items, this also represents the item's priority (versus other items).
	//; Bits 4-7 are set initially, but bits 0-3 can be set for this purpose as well?
	ubyte enabled;
	ubyte id;
	ubyte subid;
	//; Parent items: this is the bitmask of the button pressed.
	//;   Gets updated when you first use it, and when closing a menu (in case the button
	//;   assignment changes)
	//; Throwable items: Sets the animation that will play on breakage.
	//;   bits 0-3 are the main byte of the ID ($0-$f) (ie. INTERAC_GRASSDEBRIS)
	//;   bit 4 controls whether to flicker (bit 0 of the subid).
	ubyte var03;
	//; Enemy states below $08 behave differently? (See constants/common/enemyStates.s)
	ubyte state;
	//; For items, this is used as a "being held" state.
	//; $00: Just picked up?
	//; $01: Being held
	//; $02: Just released?
	//; $03: Not being held
	ubyte substate;
	union {
		ushort counter;
		struct {
			//; counter1 is used by the checkabutton command among others. checkabutton
			//; doesn't activate until it reaches zero.
			//; Link's counter1 is used for:
			//;  - Movement with flippers
			//;  - Recovering from stone & collapsed states
			ubyte counter1;
			//; For interactions that use scripts, while counter2 is nonzero, the object moves
			//; based on its angle and speed instead of running the script.
			//; Link's counter2 is used for:
			//; - Creating bubbles in sidescrolling underwater areas
			//; - Diving underwater
			ubyte counter2;
		}
	}
	//; A value from 0-3. See constants/common/directions.s.
	//; This is sometimes treated as an animation index which could go beyond those
	//; values? (Particularly for enemies?)
	ubyte direction;
	//; An angle is a value from $00-$1f. Determines which way the object moves.
	//;  $00 = up
	//;  $08 = right
	//;  $10 = down
	//;  $18 = left
	//; And it can take any value in-between.
	ubyte angle;
	union {
		struct {
			ubyte y;
			ubyte yh;
		}
		ushort fullY;
	}
	union {
		struct {
			ubyte x;
			ubyte xh;
		}
		ushort fullX;
	}
	union {
		struct {
			ubyte z;
			ubyte zh;
		}
		ushort fullZ;
	}

	//; There are two ways to handle speed: the most common is for there to be a single
	//; byte value in the "speed" variable that gets combined with "angle", then call
	//; the "objectApplySpeed" function.
	//; The other way is for speedY and speedX to be set to specific values, and then to
	//; use the "objectApplyComponentSpeed" function. This allows the two speed
	//; components to be controlled separately.
	//; Note that they use the same memory, so only one of these systems can be used.
	union {
		ushort speedY;
		struct {
			ubyte speed;
			ubyte speedTmp;
		}
	}
	union {
		ushort speedX;
		struct {
			ubyte var12;
			ubyte var13;
		}
	}
	ushort speedZ;
	GameObject* relatedObj;

	//; relatedObj2 uses for link:
	//; - switch hook
	//; - shop items (held items in general?)
	//; Maple: instead of pointing to an object, this is a pointer to data that says
	//;        what her next position in her "route" should be.
	// Sometimes used as "scriptPtr" instead
	//; Uses for relatedObj2:
	//; - Bombchus: the target to attack (after being verified as valid)
	union {
		ushort relatedObj2;
		const(ubyte)* scriptPtr;
		struct {
			ubyte var18;
			ubyte var19;
		}
	}
	//; Bit 7 of visible tells if it's visible, bits 0-1 determine its priority, bit
	//; 6 is set if the object has terrain effects (shadow, puddle/grass animation)
	//; Bits 0-2 are "priority" (lower priority = drawn on top of more sprites)
	ubyte visible;
	//; oamFlagsBackup generally never changes, so it's used to remember what flags the
	//; object should have "normally" (ie. when it's not flashing from damage).
	ubyte oamFlagsBackup;
	ubyte oamFlags;
	ubyte oamTileIndexBase;
	const(Animation)* oamDataAddress;
	ubyte var1F;
	ubyte animCounter;
	ubyte animParameter;
	const(AnimationData)* animPointer;
	//bit 7: set to enable collisions (for Enemies, Parts)
	ubyte collisionType;
	ubyte damageToApply;
	alias enemyCollisionMode = damageToApply;
	ubyte collisionRadiusY;
	ubyte collisionRadiusX;
	ubyte damage;
	//; Link uses this "health" variable instead as a sort of "damage reduction"
	//; variable; this is probably so that damage that would be 1/8th of a heart rounds
	//; down instead of up.
	ubyte health;
	//; Enemy/part: on collision with an item, this is set to the "collisionType" value.
	//; Bit 7 is set if the collision "just occurred"? All enemies have code that resets
	//; bit 7 just after their main code is called, meaning it will happen at most once
	//; per collision.
	ubyte var2A;

	//; For interactions, this is a counter used in "npcFaceLinkAndAnimate" to set
	//; a minimum amount of time before the npc changes facing directions.
	//; When this is $00-$7f, this counts down and the object flashes red.
	//; When this is $80-$ff, this counts up and the object is just invincible.
	ubyte invincibilityCounter;
	//; This does something different for interactions?
	ubyte knockbackAngle;
	//; Enemies: if bit 7 is set, "dust" is created as they get knocked back?
	ubyte knockbackCounter;
	//if nonzero, enemies / parts don't damage link
	ubyte stunCounter;
	//; This seems to frequently be used for "communication" between different objects?
	//; (A bit is set as a sort of status signal.)
	//; Bombs:
	//;  Bit 7: Resets animation? (used by maple)
	//;  Bit 6: Set while being held, thrown, or exploding?
	//;  Bit 5: Deletes the bomb? (used by maple, head thwomp)
	//;  Bit 4: Triggers explosion?
	//;
	//; ITEM_18:
	//;  Bit 5: Delete self due to another somaria block appearing?
	//;  Bit 4: If set, no "poof" is created on destruction?
	//;  Bit 0: Set when Link pushes on the block
	//;
	//; In general bit 5 is set to request that the item be deleted?
	//; Link:
	//;   Bit 7 set if in an underwater map
	//;   Bit 6 set if wearing the mermaid suit? (even on land)
	//;   Bit 0 set if jumping down a ledge where a screen transition will occur
	ubyte var2F;
	//; Bombchus: use this to cycle through enemy target candidates
	//; Swingable items: animation index?
	ubyte var30;
	alias animMode = var30;
	//; If nonzero, Interaction.textID+1 ($33) replaces whatever upper byte you use in a showText opcode.
	alias useTextID = var30;
	//; Bombchus: this is the direction to turn if it reaches an impassable barrier
	//; while trying to reach its target. Either $08 or $f8.
	//; Sword: base damage (not accounting for spin slash or anything)
	//; Bombs/scent seeds: var31/var32 are Y/X positions the object is pulled toward.
	//; "Base" for frame index, not accounting for direction. Also used by parent items.
	//; This value comes directly from the animation (specialObjectAnimationData.s).
	ubyte var31;
	alias pressedAButton = var31;

	union {
		ushort textID;
		struct {
			//; Bombchus: set to 1 when clinging to a wall in a sidescrolling area
			//; ITEM_18: tile index the block is on
			//; Bombs/scent seeds: var31/var32 are Y/X positions the object is pulled toward.
			//; Frame index, accounting for direction.
			ubyte var32;
			//; Bombchus: the former "angle" value from before it started climbing a wall. Used
			//; to check whether the bombchu is still touching the wall.
			ubyte var33;
			//; For link/companion, this has certain bits set depending on where walls are on
			//; any side of him?
			//; Bit:
			//;   0: right-down
			//;   1: right-up
			//;   2: left-down
			//;   3: left-up
			//;   4: down-left
			//;   5: down-right
			//;   6: up-right
			//;   7: up-left
			alias adjacentWallsBitset = var33;
		}
	}
	//; Bit 4 set if Link is pushing against a wall?
	//; Bombchus: set to 1 when hanging upside-down on a ceiling
	//; Boomerang: the angle which the boomerang is adjusting toward.
	//; Seeds: bounce counter (seed effect triggers when it reaches 0)
	ubyte var34;
	//; Link: keeps track of when you press "A" to swim faster in water (for flippers).
	//;       $00 normally, $01 when speeding up, $02 when speeding down.
	//; Ricky: counter for tornado punch charge (ready when it reaches $1e)
	//; Dimitri: set to $01 when his "eating" attack swallows something.
	ubyte var35;
	alias scriptRet = var35;
	//; Link: this is an index for a table in the updateLinkSpeed function?
	//; Ricky: this stores the tile 2 spaces away, to see if Ricky can land on it?
	ubyte var36;
	//; Bombs:
	//;  Bit 7: set after initialized
	//;  Bit 6: set when explosion hits Link (to prevent double-hits?)
	//; Throwable objects:
	//;  Bit 0: set after being thrown
	//; Bracelet parent: former tile ID of tile picked up (or 0 if N/A)
	//; For npcs, this is the animation index for "facing up", and the next 3 are for
	//; the other facing directions.
	//; Companion: $0d if on a hole, $0e if in water? (correspond to animation indices?)
	ubyte var37;
	//; Companion: gets added to animation index?
	//; Dimitri: if nonzero, he's in water?
	//; Used by ring treasures to override which ring is given
	//; Throwable objects: the value of wLinkGrabState2. Affects "weight".
	ubyte var38;
	//; Throwable objects: gravity.
	//; For some npcs, when var39 is nonzero, their animations don't update.
	//; Ricky: acts as a counter until he can jump again
	//; Dimitri: var39/var3a are Y/X positions for him to move to when he's in water
	//;          without being mounted.
	//; Moosh: number of frames to ignore gravity (set to 8 each time he flutters)
	ubyte var39;
	//; Dimitri: see above
	//; Moosh: the number of times he has fluttered in the air (maximum is $10)
	//; Sword parent item: sets var3a when double-edged ring is in use
	//; Physical items have this set the same as the "Item.damage" value on loading.
	//;   Sword item: actual damage (accounting for spin slash, but not ring modifiers)
	ubyte var3A;
	//; Objects use this if they have an INTERAC_ACCESSORY; accessory deletes itself
	//; when this is nonzero.
	//; Used by throwable items to indicate when an item lands, and what it lands on.
	//; Bit 0: Landed on water
	//; Bit 1: Landed on hole
	//; Bit 2: Landed on lava
	//; Bit 3: Unused?
	//; Bit 4: Landed
	//; Bit 5: Unused?
	//; Bit 6: Set when the item enters or leaves water (that is, when bit 0 changes)
	//; Bit 7: Flips every frame the item is on the ground?
	//; See the itemUpdateThrowing (07:4aa5) function.
	//; Dimitri: ?
	//; Moosh: counter for how long A has been held
	ubyte var3B;
	//; Companion: when nonzero, wWarpsDisabled gets set?
	//; Projectiles: current tile position
	ubyte var3C;
	//; Projectiles: current tile index
	//; Enemy: Counter used when scent seeds are active?
	//; Companion: used as "pressedAButton" checker
	ubyte var3D;
	//; Raft: angle at which Link dismounts
	//; Enemy/part: on collision with Link/item, var3e is written to collidee's var2a
	//; Parts set this to $08 upon initialization?
	//; Projectiles: the elevation of the item, for passing through cliff tiles
	ubyte var3E;
	//; Link / parent items: "priority" value; when choosing which frame to load for
	//;                      Link, the game takes the parentItem with the highest
	//;                      "var3f" value, and uses its "var31" value as the frame
	//;                      index (not accounting for facing direction).
	//; Raft: counter for # of frames Link's pressing against the shore to dismount
	//; Maple: vehicle?
	//; Enemies:
	//;   Bit 7: if set, it disappears instantly when killed instead of dying in a puff
	//;          of smoke?
	//;   Bit 5: ? (Used by buzzblobs, podoboo towers, cuccos, color changing gels,
	//;             veran possession boss?)
	//;   Bit 4: if set, the enemy moves toward scent seeds?
	//;   Bit 1: affects how an enemy behaves when it has no health?
	//;   Bits 0-3: Nonzero when the enemy has touched a hazard. Corresponds to entries
	//;             in hazardCollisionTable:
	//;             Bit 3: Unused?
	//;             Bit 2: Lava
	//;             Bit 1: Hole
	//;             Bit 0: Water
	ubyte var3F;
}
alias InteractionObject = GameObject;
alias ItemObject = GameObject;
alias EnemyObject = GameObject;
alias PartObject = GameObject;
struct FileDisplayVariables {
	ubyte b0; // bit 7: set if blank
	ubyte b1;
	ubyte numHearts;
	ubyte numHeartContainers;
	ushort deathCount;
	ubyte b6; // bit 0: linked game
	ubyte b7; // bit 0: completed, bit 1: hero file
}
alias Obj = OAMEntry;

struct ObjLoad {
	ubyte count;
	Obj[] objects;
}

struct RemappedDestination {
	GFXDestination destination;
	ushort offset;
	ubyte bank;
	auto opUnary(string op : "++")() {
		offset++;
		return this;
	}
	ubyte* address() const {
		return &array[0];
	}
	ubyte[] array() const {
		import oracles.extra : remapDestination;
		return remapDestination(this);
	}
}

struct GFXHeader {
	union {
		align(1) struct {
			mixin(bitfields!(
				ubyte, "bank", 6,
				ubyte, "compressionMode", 2,
			));
		}
		ubyte bankMode;
	}
	GFXAsset source;
	ushort sourceOffset;
	RemappedDestination destination;
	ushort decompressedSize;
	this(ubyte bankMode, GFXAsset source, ushort sourceOffset, GFXDestination destination, ushort destinationOffset, ubyte bank, ushort decompressedSize) {
		this.bankMode = bankMode;
		this.source = source;
		this.sourceOffset = sourceOffset;
		this.destination.destination = destination;
		this.destination.offset = destinationOffset;
		this.destination.bank = bank;
		this.decompressedSize = decompressedSize;
	}
}
struct PALHeader {
	union {
		align(1) struct {
			mixin(bitfields!(
				ubyte, "count", 3,
				ubyte, "offset", 3,
				bool, "sprite", 1,
				bool, "", 1,
			));
		}
		ubyte def;
	}
	GFXAsset source;
	this(bool sprite, ubyte offset, ubyte count, GFXAsset source)
		in(count > 0)
	{
		this.offset = offset;
		this.count = cast(ubyte)(count - 1);
		this.sprite = sprite;
		this.source = source;
	}
}

struct TreasureBehaviour {
	TreasureBehaviourVars relatedVar;
	ubyte flags;
	ubyte soundEffect;
}

struct PartialDeathRespawn {
	ubyte fields;
	DeathRespawn values;
}

struct DeathRespawn {
	ubyte group;
	ubyte room;
	ubyte stateModifier;
	ubyte facingDir;
	ubyte y;
	ubyte x;
	ubyte rememberedCompanionID;
	ubyte rememberedCompanionGroup;
	ubyte rememberedCompanionRoom;
	ubyte linkObjectIndex;
	ubyte unnamedC635;
	ubyte rememberedCompanionY;
	ubyte rememberedCompanionX;
}

struct DMAQueueEntry {
	void function(DMAQueueEntry*) func;
	ubyte sourceBank;
	const(void)[] source;
	void[] destination;
	ubyte vbk;
	ushort size;
}

struct SpecialObjectGFX {
	ubyte oamIndex;
	GFXAsset source;
	ushort offset;
	ubyte size;
}

struct TerrainEffect {
	ubyte y;
	ubyte x;
	void* data;
}

struct Animation {
	ubyte frames;
	OAMEntry[] entries;
	this(ubyte frames, OAMEntry[] entries) {
		this.frames = frames;
		this.entries = entries;
	}
	this(OAMEntry[] entries) {
		this(cast(ubyte)entries.length, entries);
	}
}

struct ObjectGFX {
	ubyte bankMode;
	GFXAsset asset;
	ushort offset;
}

alias ItemDef = InteractionData;
struct InteractionData {
	ubyte objectGFX;
	ubyte oamTileBase;
	ubyte oamFlags;
}

struct AnimationData {
	ubyte frameCount;
	//union {
		short loopTarget;
		struct {
			ubyte frameIndex;
			ubyte etc;
		}
	//}
	static AnimationData frame(ubyte frameCount, ubyte frameIndex, ubyte etc) {
		return AnimationData(frameCount: frameCount, frameIndex: frameIndex, etc: etc);
	}
	static AnimationData frame2(ubyte frameCount, ubyte frameIndex) {
		return AnimationData(frameCount: frameCount, frameIndex: frameIndex);
	}
	static AnimationData loop(short index) {
		return AnimationData(frameCount: 0xFF, loopTarget: index);
	}
}

struct SimulatedInput {
	ushort frames;
	ubyte input;
}

struct GameState {
	ushort checksum;
	char[8] saveFileString;
	ubyte[6] _;
	ubyte[0x40] unappraisedRings;
	ushort gameID;
	ubyte[6] linkName;
	ubyte unnamedC608;
	ubyte[6] kidName;
	ubyte childStatus;
	ubyte animalCompanion;
	ubyte whichGame;
	ubyte fileIsLinkedGame;
	ubyte fileIsHeroGame;
	ubyte fileIsCompleted;
	ubyte obtainedRingBox;
	ubyte ringsObtained;
	ushort deathCounter;
	ushort totalEnemiesKilled;
	uint playtimeCounter;
	ubyte totalSignsDestroyed;
	ushort totalRupeesCollected;
	ubyte textSpeed;
	ubyte activeLanguage;
	DeathRespawn deathRespawnBuffer;
	ubyte lastAnimalMountPointY;
	ubyte lastAnimalMountPointX;
	ubyte minimapGroup;
	ubyte minimapRoom;
	ubyte minimapDungeonMapPosition;
	ubyte minimapDungeonFloor;
	static if (gameVersion == GameVersion.ages) {
		ubyte portalGroup;
		ubyte portalRoom;
		ubyte portalPos;
	}
	ubyte mapleKillCounter;
	ubyte boughtShopItems1;
	ubyte boughtShopItems2;
	ubyte mapleState;
	ubyte boughtSubrosianShopItems;
	ubyte rickyState;
	ubyte dimitriState;
	ubyte mooshState;
	ubyte companionTutorialTextShown;
	ubyte unnamedC64A;
	ubyte unnamedC64B;
	ubyte gashaSpotFlags;
	ubyte[(numGashaSpots + 7) / 8] gashaSpotsPlantedBitset;
	ubyte[numGashaSpots] gashaSpotKillCounters;
	ushort gashaMaturity;
	static if (gameVersion == GameVersion.ages) {
		ubyte unnamedC661;
	} else {
		ubyte[4] unnamedC65D;
	}
	ubyte[numDungeons] dungeonVisitedFloors;
	ubyte[numDungeons] dungeonSmallKeys;
	ubyte[(numDungeons + 7) / 8] dungeonBossKeys;
	ubyte[(numDungeons + 7) / 8] dungeonCompasses;
	ubyte[(numDungeons + 7) / 8] dungeonMaps;
	ubyte inventoryB;
	ubyte inventoryA;
	ubyte[inventoryCapacity] inventoryStorage;
	ubyte[16] obtainedTreasureFlags;
	ubyte linkHealth;
	ubyte linkMaxHealth;
	ubyte numHeartPieces;
	ushort numRupees;
	static if (gameVersion == GameVersion.seasons) {
		ushort numOreChunks;
	}
	ubyte shieldLevel;
	ubyte numBombs;
	ubyte maxBombs;
	ubyte swordLevel;
	ubyte numBombchus;
	ubyte seedSatchelLevel;
	ubyte fluteIcon;
	static if (gameVersion == GameVersion.ages) {
		ubyte switchHookLevel;
		ubyte selectedHarpSong;
		ubyte braceletLevel;
	} else {
		ubyte obtainedSeasons;
		ubyte boomerangLevel;
		ubyte magnetGlovePolarity;
		ubyte slingshotLevel;
		ubyte featherLevel;
	}
	ubyte numEmberSeeds;
	ubyte numScentSeeds;
	ubyte numPegasusSeeds;
	ubyte numGaleSeeds;
	ubyte numMysterySeeds;
	ubyte numGashaSeeds;
	ubyte essencesObtained;
	ubyte tradeItem;
	static if (gameVersion == GameVersion.ages) {
		ubyte unnamedC6C1;
		ubyte tuniNutState;
		ubyte numSlates;
	} else {
		ubyte pirateBellState;
	}
	ubyte satchelSelectedSeeds;
	ubyte shooterSelectedSeeds;
	ubyte[5] ringBoxContents;
	ubyte activeRing;
	ubyte ringBoxLevel;
	ubyte numUnappraisedRingsBCD;
	ubyte numAppraisedRings;
	ubyte killedGoldenEnemies;
	ubyte[0x10] globalFlags;
	ubyte childStage;
	ubyte nextChildStage;
	ubyte unnamedC6E2;
	ubyte childStage8Response;
	ubyte childPersonality;
	ubyte unnamedC6E5;
	static if (gameVersion == GameVersion.seasons) {
		ubyte unnamedC6E0;
		ubyte insertedJewels;
		ubyte numTimesPlayedSubrosianDance;
		ubyte numTimesPlayedStrangeBrothersGame;
		ubyte talkedToPiratianCaptainState;
	}
	ubyte makuMapTextPresent;
	static if (gameVersion == GameVersion.ages) {
		ubyte makuMapTextPast;
		ubyte makuTreeState;
		ubyte jabuWaterLevel;
		ubyte wildTokayGameLevel;
		ubyte makuTreeSeedSatchelXPosition;
		ubyte pirateShipRoom;
		ubyte pirateShipY;
		ubyte pirateShipX;
		ubyte pirateShipAngle;
		ubyte unnamedC6F0;
	}
	ubyte shortSecretIndex;
	ubyte unnamedC6FC;
	ubyte secretXORCipherIndex;
	ubyte secretType;

	ubyte[0x100] group0RoomFlags;

	static if (gameVersion == GameVersion.ages) {
		alias presentRoomFlags = group0RoomFlags;
	} else {
		alias overworldRoomFlags = group0RoomFlags;
	}
	ubyte[0x100] group1RoomFlags;

	static if (gameVersion == GameVersion.ages) {
		alias pastRoomFlags = group1RoomFlags;
		auto ref ubyte[6] vinePositions() => pastRoomFlags[0xF0 .. 0xF6];
	} else {
		alias subrosiaRoomFlags = group1RoomFlags;
		auto ref ubyte[8] d2RupeeRoomRupees() => subrosiaRoomFlags[0xF0 .. 0xF8];
		auto ref ubyte[8] d6RupeeRoomRupees() => subrosiaRoomFlags[0xF8 .. 0x100];
	}
	ubyte[0x100] group4RoomFlags;
	ubyte[0x100] group5RoomFlags;
}
