module oracles.data;

public import oracles.data.sound;
import oracles.external;
public import oracles.data.gfx : GFXAsset, gfxAsset;
import replatform64.gameboy;


@ROMSource(0x70000, 0x600)
@Asset("data/gfx/common/gfxFontJP.png", DataType.bpp1)
immutable(ubyte)[] gfxFontJP;

@ROMSource(0x70600, 0x200)
@Asset("data/gfx/common/gfxFontTradeitems.png", DataType.bpp1)
immutable(ubyte)[] gfxFontTradeitems;

@ROMSource(0x70800, 0xF20)
@Asset("data/gfx/common/gfxFont.png", DataType.bpp1)
immutable(ubyte)[] gfxFont;

@ROMSource(0x71720, 0x80)
@Asset("data/gfx/common/gfxFontHeartpiece.png", DataType.bpp1)
immutable(ubyte)[] gfxFontHeartpiece;

void loadExtraData(scope const char[] name, const scope ubyte[] data, scope PlatformBackend) {
	import std.algorithm.searching : findSplit;
	import oracles.common.data.audio.soundPointers : soundPointers;
	import std.logger; tracef("Loading %s", name);
	switch(name.findSplit("/")[0]) {
		case "song":
			soundPointers ~= readSongFile(data);
			break;
		default: break;
	}
}

void extractExtraAssets(scope AddFileFunction addFile, scope ProgressUpdateFunction reportProgress, immutable(ubyte)[] rom) {
	import std.format : format;
	foreach (ubyte i; 0 .. 223) {
		addFile(format!"song/%s.oraclesong"(i), extractSong(i, rom, gameVersion));
	}
}
