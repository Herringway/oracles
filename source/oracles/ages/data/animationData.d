module oracles.ages.data.animationData;

import oracles.external;
import oracles.structures;

immutable animationDataDungeon = [ // 0x11e89
	AnimationData.frame2(0x0f, 0x5c),
	AnimationData.frame2(0x0f, 0x5d),
	AnimationData.frame2(0x0f, 0x5e),
	AnimationData.frame2(0x0f, 0x5f),
	AnimationData.loop(-4),
];

immutable animationDataJabu = [ // 0x11e93
	AnimationData.frame2(0x03, 0x60),
	AnimationData.frame2(0x03, 0x64),
	AnimationData.frame2(0x06, 0x65),
	AnimationData.frame2(0x03, 0x61),
	AnimationData.frame2(0x03, 0x66),
	AnimationData.frame2(0x06, 0x67),
	AnimationData.frame2(0x03, 0x62),
	AnimationData.frame2(0x03, 0x64),
	AnimationData.frame2(0x06, 0x65),
	AnimationData.frame2(0x03, 0x63),
	AnimationData.frame2(0x03, 0x66),
	AnimationData.frame2(0x06, 0x67),
	AnimationData.loop(-12),
];

immutable animationDataSpike = [ // 0x11ead
	AnimationData.frame2(0x0f, 0x68),
	AnimationData.frame2(0x0f, 0x69),
	AnimationData.frame2(0x0f, 0x6a),
	AnimationData.frame2(0x0f, 0x6b),
	AnimationData.frame2(0x0f, 0x6a),
	AnimationData.frame2(0x0f, 0x69),
	AnimationData.loop(-6),
];

immutable animationDataWaterfallFast = [ // 0x11ebb
	AnimationData.frame2(0x04, 0x00),
	AnimationData.frame2(0x04, 0x1c),
	AnimationData.frame2(0x04, 0x01),
	AnimationData.frame2(0x04, 0x1d),
	AnimationData.frame2(0x04, 0x02),
	AnimationData.frame2(0x04, 0x1e),
	AnimationData.frame2(0x04, 0x03),
	AnimationData.frame2(0x04, 0x1f),
	AnimationData.loop(-8),
];

immutable animationDataOverworldWaterFlower = [ // 0x11ecd
	AnimationData.frame2(0x0f, 0x04),
	AnimationData.frame2(0x0f, 0x05),
	AnimationData.frame2(0x0f, 0x06),
	AnimationData.frame2(0x0f, 0x07),
	AnimationData.loop(-4),
];

immutable animationDataPollution = [ // 0x11ed7
	AnimationData.frame2(0x0f, 0x08),
	AnimationData.frame2(0x0f, 0x09),
	AnimationData.frame2(0x0f, 0x0a),
	AnimationData.frame2(0x0f, 0x0b),
	AnimationData.loop(-4),
];

immutable animationDataWaterfall = [ // 0x11ee1
	AnimationData.frame2(0x03, 0x00),
	AnimationData.frame2(0x01, 0x18),
	AnimationData.frame2(0x04, 0x20),
	AnimationData.frame2(0x03, 0x01),
	AnimationData.frame2(0x01, 0x19),
	AnimationData.frame2(0x04, 0x21),
	AnimationData.frame2(0x03, 0x02),
	AnimationData.frame2(0x01, 0x1a),
	AnimationData.frame2(0x04, 0x22),
	AnimationData.frame2(0x03, 0x03),
	AnimationData.frame2(0x01, 0x1b),
	AnimationData.frame2(0x04, 0x23),
	AnimationData.loop(-12),
];

immutable animationDataWhirlpool = [ // 0x11efb
	AnimationData.frame2(0x03, 0x0c),
	AnimationData.frame2(0x03, 0x10),
	AnimationData.frame2(0x03, 0x0d),
	AnimationData.frame2(0x03, 0x11),
	AnimationData.frame2(0x03, 0x0e),
	AnimationData.frame2(0x03, 0x12),
	AnimationData.frame2(0x03, 0x0f),
	AnimationData.frame2(0x03, 0x13),
	AnimationData.loop(-8),
];

immutable animationDataWhirlpool2 = [ // 0x11f0d
	AnimationData.frame2(0x06, 0x0c),
	AnimationData.frame2(0x06, 0x0d),
	AnimationData.frame2(0x06, 0x0e),
	AnimationData.frame2(0x06, 0x0f),
	AnimationData.loop(-4),
];

immutable animationDataWaterfall3 = [ // 0x11f17
	AnimationData.frame2(0x04, 0x00),
	AnimationData.frame2(0x04, 0x20),
	AnimationData.frame2(0x04, 0x01),
	AnimationData.frame2(0x04, 0x21),
	AnimationData.frame2(0x04, 0x02),
	AnimationData.frame2(0x04, 0x22),
	AnimationData.frame2(0x04, 0x03),
	AnimationData.frame2(0x04, 0x23),
	AnimationData.loop(-8),
];

immutable animationDataWaterfalls4 = [ // 0x11f29
	AnimationData.frame2(0x04, 0x00),
	AnimationData.frame2(0x04, 0x28),
	AnimationData.frame2(0x04, 0x01),
	AnimationData.frame2(0x04, 0x29),
	AnimationData.frame2(0x04, 0x02),
	AnimationData.frame2(0x04, 0x2a),
	AnimationData.frame2(0x04, 0x03),
	AnimationData.frame2(0x04, 0x2b),
	AnimationData.loop(-8),
];

immutable animationDataLava = [ // 0x11f3b
	AnimationData.frame2(0x0c, 0x2c),
	AnimationData.frame2(0x0c, 0x2d),
	AnimationData.frame2(0x0c, 0x2e),
	AnimationData.frame2(0x0c, 0x2f),
	AnimationData.loop(-4),
];

immutable animationDataCurrents = [ // 0x11f45
	AnimationData.frame2(0x0a, 0x30),
	AnimationData.frame2(0x0a, 0x31),
	AnimationData.frame2(0x0a, 0x32),
	AnimationData.frame2(0x0a, 0x33),
	AnimationData.loop(-4),
];

immutable animationDataPollution2 = [ // 0x11f4f
	AnimationData.frame2(0x06, 0x34),
	AnimationData.frame2(0x06, 0x35),
	AnimationData.frame2(0x06, 0x36),
	AnimationData.frame2(0x06, 0x37),
	AnimationData.loop(-4),
];

immutable animationDataSeaweed = [ // 0x11f59
	AnimationData.frame2(0x0f, 0x38),
	AnimationData.frame2(0x0f, 0x39),
	AnimationData.frame2(0x0f, 0x3a),
	AnimationData.frame2(0x0f, 0x3b),
	AnimationData.loop(-4),
];

immutable animationDataWaterfallAndCurrent = [ // 0x11f63
	AnimationData.frame2(0x03, 0x00),
	AnimationData.frame2(0x03, 0x10),
	AnimationData.frame2(0x03, 0x01),
	AnimationData.frame2(0x03, 0x11),
	AnimationData.frame2(0x03, 0x02),
	AnimationData.frame2(0x03, 0x12),
	AnimationData.frame2(0x03, 0x03),
	AnimationData.frame2(0x03, 0x13),
	AnimationData.loop(-8),
];

immutable animationDataWaterfall5 = [ // 0x11f75
	AnimationData.frame2(0x04, 0x00),
	AnimationData.frame2(0x04, 0x24),
	AnimationData.frame2(0x04, 0x01),
	AnimationData.frame2(0x04, 0x25),
	AnimationData.frame2(0x04, 0x02),
	AnimationData.frame2(0x04, 0x26),
	AnimationData.frame2(0x04, 0x03),
	AnimationData.frame2(0x04, 0x27),
	AnimationData.loop(-8),
];

immutable animationDataCurrents2 = [ // 0x11f87
	AnimationData.frame2(0x06, 0x14),
	AnimationData.frame2(0x06, 0x15),
	AnimationData.frame2(0x06, 0x16),
	AnimationData.frame2(0x06, 0x17),
	AnimationData.loop(-4),
];

immutable animationDataSidescroll = [ // 0x11f91
	AnimationData.frame2(0x1e, 0x6c),
	AnimationData.frame2(0x1e, 0x6d),
	AnimationData.frame2(0x1e, 0x6e),
	AnimationData.frame2(0x1e, 0x6f),
	AnimationData.loop(-4),
];

immutable animationDataDungeonWithLava = [ // 0x11f9b
	AnimationData.frame2(0x0f, 0x3c),
	AnimationData.frame2(0x0f, 0x3d),
	AnimationData.frame2(0x0f, 0x3e),
	AnimationData.frame2(0x0f, 0x3f),
	AnimationData.loop(-4),
];

immutable animationDataWaterfall6 = [ // 0x11fa5
	AnimationData.frame2(0x08, 0x40),
	AnimationData.frame2(0x08, 0x41),
	AnimationData.frame2(0x08, 0x42),
	AnimationData.frame2(0x08, 0x43),
	AnimationData.loop(-4),
];

immutable animationDataSpikeAndThingy = [ // 0x11faf
	AnimationData.frame2(0x0f, 0x44),
	AnimationData.frame2(0x0f, 0x45),
	AnimationData.frame2(0x0f, 0x46),
	AnimationData.frame2(0x0f, 0x47),
	AnimationData.frame2(0x0f, 0x46),
	AnimationData.frame2(0x0f, 0x45),
	AnimationData.loop(-6),
];

immutable animationDataWaterThing = [ // 0x11fbd
	AnimationData.frame2(0x0f, 0x48),
	AnimationData.frame2(0x0f, 0x49),
	AnimationData.frame2(0x0f, 0x4a),
	AnimationData.frame2(0x0f, 0x4b),
	AnimationData.loop(-4),
];

immutable animationDataWaterThing2 = [ // 0x11fc7
	AnimationData.frame2(0x0f, 0x4c),
	AnimationData.frame2(0x0f, 0x4d),
	AnimationData.frame2(0x0f, 0x4e),
	AnimationData.frame2(0x0f, 0x4f),
	AnimationData.loop(-4),
];

immutable animationDataDungeonMinimal = [ // 0x11fd1
	AnimationData.frame2(0x0f, 0x50),
	AnimationData.frame2(0x0f, 0x51),
	AnimationData.frame2(0x0f, 0x52),
	AnimationData.frame2(0x0f, 0x53),
	AnimationData.loop(-4),
];

immutable animationDataUnderwaterCurrents = [ // 0x11fdb
	AnimationData.frame2(0x0c, 0x54),
	AnimationData.frame2(0x0c, 0x55),
	AnimationData.frame2(0x0c, 0x56),
	AnimationData.frame2(0x0c, 0x57),
	AnimationData.loop(-4),
];

immutable animationDataWTF = [ // 0x11fe5
	AnimationData.frame2(0x0f, 0x58),
	AnimationData.frame2(0x0f, 0x59),
	AnimationData.frame2(0x0f, 0x5a),
	AnimationData.frame2(0x0f, 0x5b),
	AnimationData.loop(-4),
];
