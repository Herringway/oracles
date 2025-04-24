module oracles.ages.data.musicAssignments;

import oracles.external;
import replatform64.gameboy;

@([ROMSource(0x1096C, 256), ROMSource(0x10A6C, 256), ROMSource(0x10B6C, 256), ROMSource(0x10C6C, 256), ROMSource(0x10D6C, 256), ROMSource(0x10E6C, 256), ROMSource(0x10D6C, 256), ROMSource(0x10E6C, 256)])
immutable(ubyte[])[] musicAssignmentGroupTable;
//	.dw group0Music
//	.dw group1Music
//	.dw group2Music
//	.dw group3Music
//	.dw group4Music
//	.dw group5Music
//	.dw group6Music
//	.dw group7Music

//group0Music:
//	.incbin "audio/ages/group0IDs.bin"
//group1Music:
//	.incbin "audio/ages/group1IDs.bin"
//group2Music:
//	.incbin "audio/ages/group2IDs.bin"
//group3Music:
//	.incbin "audio/ages/group3IDs.bin"
//group4Music:
//group6Music:
//	.incbin "audio/ages/group4IDs.bin"
//group5Music:
//group7Music:
//	.incbin "audio/ages/group5IDs.bin"