module oracles.data.sound;

import oracles.external;
import replatform64.gameboy;
import std.format;

struct Song {
	Channel[] channels;
}
struct Channel {
	ubyte id;
	ubyte[] data = [ 0xFF ];
}

void readArray(T)(ref const(ubyte)[] src, ref T[] dest) {
	const length = (cast(const(uint)[])(src[0 .. uint.sizeof]))[0];
	scope(exit) {
		src = src[uint.sizeof + length * T.sizeof .. $];
	}
	dest = cast(T[])(src[uint.sizeof .. uint.sizeof + length * T.sizeof]);
}

void writeArray(T)(ref const(ubyte)[] dest, const T[] array) {
	uint[1] tmp = [cast(uint)array.length];
	dest ~= cast(const(ubyte)[])(tmp[]);
	dest ~= cast(const(ubyte)[])array;
}

const(Song) readSongFile(const(ubyte)[] data) @safe pure {
	const(Channel)[] channels;
	while(data[0] != 0xFF) {
		const id = data[0];
		data = data[1 .. $];
		const(ubyte)[] channelData;
		readArray(data, channelData);
		channels ~= const(Channel)(id, channelData);
	}
	return const(Song)(channels ~ Channel(0xFF));
}
const(ubyte)[] extractSong(ubyte songIndex, const(ubyte)[] rom, GameVersion ver) @safe pure {
	enum offsets = [ GameVersion.ages: 0xE5748, GameVersion.seasons: 0xE57CF];
	enum songs = 223;
	const(ubyte)[] result;
	const song = (cast(const(ubyte[3])[])(rom[offsets[ver] .. offsets[ver] + songs * 3]))[songIndex];
	const songAddr = 0xE4000 + ((cast(const(ushort)[])(song[1 .. $]))[0] - 0x4000);
	auto songData = rom[songAddr .. $];
	while (songData[0] != 0xFF) {
		result ~= songData[0];
		const originalTrackAddr = (cast(const(ushort)[])(songData[1 .. 3]))[0];
		auto trackAddr = 0xE0000 + (song[0] * 0x4000) + originalTrackAddr;
		auto trackData = rom[trackAddr .. $];
		size_t index;
		ubyte[] alteredTrackData;
		void copyBytes(ubyte count) {
			alteredTrackData ~= trackData[index .. index + count];
			index += count;
		}
		bool unnamedFlag;
		while (trackData[index] != 0xFF) {
			switch (trackData[index]) {
				case 0x00: .. case 0x5F:
				case 0x60: .. case 0x80: copyBytes(2 + unnamedFlag); break;
				case 0xF0:
					unnamedFlag = ((songData[0] & 0xF) <= 6) && (trackData[index + 1] != 0);
					goto case;
				case 0xE0: .. case 0xE7:
				case 0xF6:
				case 0xF8:
				case 0xF9:
				case 0xFD: copyBytes(2); break;
				case 0xD0: .. case 0xDF:
				case 0xF1:
				case 0xF2:
				case 0xF3:
				case 0xF4:
				case 0xF5: copyBytes(1); break;
				case 0xFE:
					alteredTrackData ~= 0xFE;
					auto destination = (cast(const(ushort)[])(trackData[index + 1 .. index + 3]))[0];
					auto newDestination = destination - originalTrackAddr;
					if (destination >= originalTrackAddr + index) {
						assert(0, "assumption wrong");
					}
					ushort[1] tmp = cast(ushort)newDestination;
					alteredTrackData ~= cast(ubyte[])tmp[];
					index += 3;
					break;
				default: assert(0, format!"undefined: %02X"(trackData[index]));
			}
		}
		writeArray(result, alteredTrackData);
		songData = songData[3 .. $];
	}
	result ~= 0xFF;
	return result;
}
