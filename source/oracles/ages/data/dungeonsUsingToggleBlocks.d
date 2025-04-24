module oracles.ages.data.dungeonsUsingToggleBlocks;

import oracles.external;
//; Each bit sets whether a particular dungeon uses those red/blue toggle blocks.
//; The default values are dungeons 5, 8, and hero's cave.

immutable ubyte[] dungeonsUsingToggleBlocks = [
	0b00000100,
	0b10010000,
];
