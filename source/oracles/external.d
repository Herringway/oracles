module oracles.external;

import replatform64.gameboy;

enum GameVersion {
	seasons = 0,
	ages = 1,
}
enum Region {
	japan = 0,
	northAmerica = 1,
}

enum gameVersion = GameVersion.ages;
enum gameRegion = Region.northAmerica;

enum game = ["seasons", "ages"][gameVersion];
enum gameTitle = ["The Legend of Zelda: Oracle of Seasons", "The Legend of Zelda: Oracle of Ages"][gameVersion];

class ForceGameReset : Exception { this() { super("Resetting"); } }

__gshared ubyte bank;
void selectWRAMBank(ubyte bank) { .bank = bank; } // mostly no-op, don't need to actually swap banks
ubyte getWRAMBank() { return bank; } // ditto

void setROMBank(ubyte bank) {}

__gshared GameBoySimple gbc;
