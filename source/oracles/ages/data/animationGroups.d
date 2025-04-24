module oracles.ages.data.animationGroups;

import oracles.external;
import oracles.structures;
import oracles.ages.data.animationData;;

struct AnimationGroup {
	ubyte unknown;
	AnimationData[][] animations;
}

immutable animationGroupTable = [ // 0x11b52
	animationGroup00,
	animationGroup01,
	animationGroup02,
	animationGroup03,
	animationGroup04,
	animationGroup05,
	animationGroup06,
	animationGroup07,
	animationGroup08,
	animationGroup09,
	animationGroup0a,
	animationGroup0b,
	animationGroup0c,
	animationGroup0d,
	animationGroup0e,
	animationGroup0f,
	animationGroup10,
	animationGroup11,
	animationGroup12,
	animationGroup13,
	animationGroup14,
	animationGroup15,
];

immutable animationGroup00 = immutable(AnimationGroup)(0x8F, [ // 0x11b7e
	animationDataWaterfall,
	animationDataOverworldWaterFlower,
	animationDataPollution,
	animationDataWhirlpool,
]);
immutable animationGroup01 = immutable(AnimationGroup)(0x87, [ // 0x11b87
	animationDataWaterfallFast,
	animationDataOverworldWaterFlower,
	animationDataWhirlpool2,
]);
immutable animationGroup02 = immutable(AnimationGroup)(0x87, [ // 0x11b8e
	animationDataOverworldWaterFlower,
	animationDataWhirlpool2,
	animationDataWaterfall3,
]);
immutable animationGroup03 = immutable(AnimationGroup)(0x87, [ // 0x11b95
	animationDataOverworldWaterFlower,
	animationDataPollution,
	animationDataWhirlpool2,
]);
immutable animationGroup04 = immutable(AnimationGroup)(0x87, [ // 0x11b9c
	animationDataOverworldWaterFlower,
	animationDataWaterfalls4,
	animationDataLava,
]);
immutable animationGroup05 = immutable(AnimationGroup)(0x87, [ // 0x11ba3
	animationDataOverworldWaterFlower,
	animationDataWhirlpool2,
	animationDataWaterfallAndCurrent,
]);
immutable animationGroup06 = immutable(AnimationGroup)(0x87, [ // 0x11baa
	animationDataOverworldWaterFlower,
	animationDataWaterfall5,
	animationDataCurrents2,
]);
immutable animationGroup07 = immutable(AnimationGroup)(0x81, [ // 0x11bb1
	animationDataOverworldWaterFlower,
]);
alias animationGroup09 = animationGroup08; // 0x11bb4
alias animationGroup0a = animationGroup08; // 0x11bb4
alias animationGroup0b = animationGroup08; // 0x11bb4
alias animationGroup0c = animationGroup08; // 0x11bb4
alias animationGroup0d = animationGroup08; // 0x11bb4
alias animationGroup0e = animationGroup08; // 0x11bb4
alias animationGroup0f = animationGroup08; // 0x11bb4
immutable animationGroup08 = immutable(AnimationGroup)(0x8F, [ // 0x11bb4
	animationDataCurrents,
	animationDataPollution2,
	animationDataWhirlpool2,
	animationDataSeaweed,
]);
immutable animationGroup10 = immutable(AnimationGroup)(0x8F, [ // 0x11bbd
	animationDataDungeonWithLava,
	animationDataWaterfall6,
	animationDataSpikeAndThingy,
	animationDataWaterThing,
]);
immutable animationGroup11 = immutable(AnimationGroup)(0x87, [ // 0x11bc6
	animationDataDungeonWithLava,
	animationDataWaterfall6,
	animationDataWaterThing2,
]);
immutable animationGroup12 = immutable(AnimationGroup)(0x81, [ // 0x11bcd
	animationDataSidescroll,
]);
immutable animationGroup13 = immutable(AnimationGroup)(0x8F, [ // 0x11bd0
	animationDataDungeonMinimal,
	animationDataUnderwaterCurrents,
	animationDataWaterThing2,
	animationDataWaterfall6,
]);
immutable animationGroup14 = immutable(AnimationGroup)(0x87, [ // 0x11bd9
	animationDataDungeonMinimal,
	animationDataWTF,
	animationDataSpikeAndThingy,
]);
immutable animationGroup15 = immutable(AnimationGroup)(0x8F, [ // 0x11be0
	animationDataDungeon,
	animationDataJabu,
	animationDataSpike,
	animationDataWaterThing,
]);
