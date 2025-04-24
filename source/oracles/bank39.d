module oracles.bank39;

import oracles.defs;
import oracles.external;
import oracles.globals;

import replatform64.gameboy;
import std.logger;

//version = audioEnabled;

void b39InitSound() {
	version(audioEnabled) initSound();
}

void b39UpdateSound() {
	version(audioEnabled) updateSound();
}

void b39PlaySound(ubyte id) {
	version(audioEnabled) playSound(id);
}

void b39StopSound() {
	version(audioEnabled) stopSound();
}

// Unused? (The address it jumps too doesn't seem like it would do anything useful...)
//func_39_400c:
//	pop af
//	jp $4d3e

// @param	a	Volume (0-3)
void b39UpdateMusicVolume(ubyte volume) {
	version(audioEnabled) updateMusicVolume(volume);
}

private:

// This is pointless?
//.dw musNone


void initSound() {
	soundDataBaseBank = 0x39;
	stopSound();
	audioState.musicVolume = 3;
	audioState.soundFadeDirection = 0;
	audioState.soundFadeCounter = 0;
	audioState.soundDisabled = 0;
	audioState.unnamedC023 = 0;
	gbc.NR52 = 0x8F;
	audioState.soundVolume = 0x77;
	gbc.NR50 = 0x77;
	gbc.NR51 = 0xFF;
	audioState.musicReadFunction = &readFunction;
}

// This function is copied to wMusicReadFunction and executed there.
ubyte readFunction(ubyte bank, ref const(ubyte)* hl) {
	soundDataBaseBank2 = bank;
	setROMBank(bank);
	ubyte tmp = (hl++)[0];
	soundDataBaseBank2 = soundDataBaseBank;
	setROMBank(soundDataBaseBank);
	return tmp;
}


// @param	a	Volume (0-3)
void updateMusicVolume(ubyte volume) {
	updateSquareChannelVolumes();
	audioState.musicVolume = volume;
	if (volume == 0) {
		audioState.unnamedC023 = 1;
	} else {
		audioState.unnamedC023 = 0;
	}
}

void updateSquareChannelVolumes() {
	// Update square 1's volume
	audioState.soundChannel = 0;
	if (audioState.channelsEnabled[audioState.soundChannel] != 0) {
		updateChannelStuff();
	}
	// Update square 2's volume
	audioState.soundChannel = 1;
	if (audioState.channelsEnabled[audioState.soundChannel] != 0) {
		updateChannelStuff();
	}
}

void stopSound() {
	foreach (ubyte i; 0 .. 8) {
		audioState.soundChannel = i;
		channelCmdFF();
	}
}

void func3940B9() {
	foreach (ubyte i; 0 .. 8) {
		audioState.soundChannel = i;
		updateChannelStuff();
	}
}

// Disable all sound effect channels
void stopSFX() {
	// Square 1
	audioState.soundChannel = 2;
	if (audioState.channelsEnabled[audioState.soundChannel] != 0) {
		channelCmdFF();
	}
	// Square 2
	audioState.soundChannel = 3;
	if (audioState.channelsEnabled[audioState.soundChannel] != 0) {
		channelCmdFF();
	}
	// Wave
	audioState.soundChannel = 5;
	if (audioState.channelsEnabled[audioState.soundChannel] != 0) {
		channelCmdFF();
	}
	// Noise
	audioState.soundChannel = 7;
	if (audioState.channelsEnabled[audioState.soundChannel] != 0) {
		channelCmdFF();
	}
}

void updateSound() {
	if (audioState.soundDisabled != 0) {
		return;
	}
	gbc.NR50 = audioState.soundVolume;
	if (audioState.soundFadeDirection != 0) {
		if ((++audioState.soundFadeCounter & audioState.soundFadeSpeed) == audioState.soundFadeSpeed) {
			if (audioState.soundFadeDirection == 10) {
				if (audioState.soundVolume == 119) {
					audioState.soundFadeCounter = 0;
					audioState.soundFadeDirection = 0;
				} else {
					audioState.soundVolume += 17;
				}
			} else {
				if (audioState.soundVolume == 0) {
					stopSound();
					audioState.soundFadeCounter = 0;
					audioState.soundFadeDirection = 0;
				} else {
					audioState.soundVolume -= 17;
				}
			}
		}
	}
	for (ubyte i = 0; i != 8; i++) {
		audioState.soundChannel = i;
		if (audioState.channelsEnabled[audioState.soundChannel] == 0) {
			continue;
		}
		if (audioState.channelWaitCounters[audioState.soundChannel] == 0) {
			while (doNextChannelCommand()) {}
		} else {
			func3941C2();
		}
	}
	if (audioState.unnamedC023 == 1) {
		audioState.unnamedC023 = 2;
	}
}

void func3941C2() {
	audioState.channelWaitCounters[audioState.soundChannel]--;
	if (audioState.soundChannel >= 6) {
		return;
	}
	if ((audioState.unnamedC039[audioState.soundChannel] & 0x40) != 0) {
		return;
	}
	if (audioState.soundChannel < 5) {
		func39464C();
	}
	func3941F3();
}

void func3941F3() {
	auto tmp = audioState.unnamedC03F[audioState.soundChannel];
	if ((tmp & 0x7F) != 0) {
		short de = ((tmp & 0x80) == 0) ? 0 : -256;
		de += audioState.unnamedC03F[audioState.soundChannel];
		soundData3[audioState.soundChannel] += de;
	}
	if ((audioState.unnamedC045[audioState.soundChannel] & 0x10) == 0) {
		if (audioState.unnamedC051[audioState.soundChannel] != 0) {
			audioState.unnamedC051[audioState.soundChannel]--;
			func42D1(0);
			return;
		}
		audioState.unnamedC045[audioState.soundChannel] = 0x10;
		audioState.unnamedC051[audioState.soundChannel] = 0;
	}
	if (audioState.unnamedC051[audioState.soundChannel] == 8) {
		audioState.unnamedC051[audioState.soundChannel] = 0;
	}
	audioState.unnamedC051[audioState.soundChannel]++;
	func42D1(func394A10(audioState.channelVibratos[audioState.soundChannel] & 0x0F, data4B40[audioState.unnamedC051[audioState.soundChannel]]));
}
void func42D1(ushort hl) {
	audioState.soundFrequency = cast(ushort)(hl + soundData3[audioState.soundChannel]);
	func42EA(audioState.soundFrequency);
}

void func42EA(ushort period) {
	if (audioState.soundChannel >= 4) {
		if (func39434B() != 0) {
			return;
		}
		gbc.NR33 = period & 0xFF;
		gbc.NR34 = period >> 8;
		gbc.NR31 = 0;
	} else if ((audioState.soundChannel >= 2) || (audioState.channelsEnabled[audioState.soundChannel + 2] == 0)) {
		gbc.writeRegister(Register.NR13 + (audioState.soundChannel & 1) * 5, audioState.soundFrequency & 0xFF);
		gbc.writeRegister(Register.NR14 + (audioState.soundChannel & 1) * 5, (audioState.soundFrequency >> 8) | audioState.soundCmdEnvelope);
		gbc.writeRegister(Register.NR11 + (audioState.soundChannel & 1) * 5, audioState.channelDutyCycles[audioState.soundChannel]);
	}
}

// @param[out]	a	0 or 1 (something about whether wSoundChannel can be active?)
ubyte func39434B() {
	if (audioState.soundChannel == 5) {
		return 0;
	}
	if (audioState.channelsEnabled[5] != 0) {
		return 1;
	}
	if (audioState.unnamedC023 == 2) {
		return 1;
	}
	return 0;
}

ubyte getNextChannelByte() {
	const result = audioState.musicReadFunction(soundChannelBanks[audioState.soundChannel], soundChannelAddresses[audioState.soundChannel]);
	return result;
}

bool doNextChannelCommand() {
	ubyte nextByte = getNextChannelByte();
	if (nextByte >= 0xF0) {
		static immutable table = [
			&channelCmdFF,
			&channelCmdFE,
			&channelCmdFD,
			&channelCmdFF,
			&channelCmdFF,
			&channelCmdFF,
			&channelCmdF9,
			&channelCmdF8,
			&channelCmdFF,
			&channelCmdF6,
			&channelCmdFF,
			&channelCmdFF,
			&channelCmdF3,
			&channelCmdF2,
			&channelCmdF1,
			&channelCmdF0,
		];
		return table[0xFF - nextByte]();
	} else if (nextByte >= 0xE0) {
		return cmdE0ToEF(nextByte);
	} else if (nextByte >= 0xD0) {
		return cmdVolume(nextByte);
	} else {
		audioState.soundCmd = nextByte;
		return standardSoundCmd();
	}
}


bool channelCmdF1() {
	return true;
}
bool channelCmdF2() {
	return true;
}
bool channelCmdF3() {
	return true;
}

// Vibrato
bool channelCmdF9() {
	if (audioState.soundChannel >= 6) {
		getNextChannelByte();
		return true;
	}
	audioState.channelVibratos[audioState.soundChannel] = getNextChannelByte();
	return true;
}

bool channelCmdF8() {
	if (audioState.soundChannel >= 6) {
		getNextChannelByte();
		return true;
	}
	audioState.unnamedC03F[audioState.soundChannel] = getNextChannelByte();
	return true;
}

bool channelCmdFD() {
	if (audioState.soundChannel >= 6) {
		getNextChannelByte();
		return true;
	}
	audioState.channelPitchShift[audioState.soundChannel] = cast(byte)getNextChannelByte();
	return true;
}

bool cmdE0ToEF(ubyte cmd) {
	audioState.channelEnvelopes[audioState.soundChannel] = cmd & 7;
	audioState.channelEnvelopes[audioState.soundChannel] = getNextChannelByte() & 7;
	return true;
}

bool channelCmdF0() {
	auto nextByte = getNextChannelByte();
	if (audioState.soundChannel == 7) {
		gbc.NR42 = nextByte;
		gbc.NR41 = 0;
		audioState.unnamedC01C = 0x80;
	} else if ((nextByte & 0x3F) == 0) {
		audioState.channelDutyCycles[audioState.soundChannel] = nextByte & 0xC0;
		audioState.unnamedC039[audioState.soundChannel] = 1;
	} else {
		audioState.channelDutyCycles[audioState.soundChannel] = nextByte;
		audioState.unnamedC039[audioState.soundChannel] = 0x41;
	}
	return true;
}

// Command $d0 to $df
bool cmdVolume(ubyte cmd) {
	if (audioState.soundChannel == 4) {
		return true;
	}
	audioState.channelVolumes[audioState.soundChannel] = cmd & 0x0F;
	return true;
}

bool channelCmdF6() {
	if ((audioState.soundChannel == 4) || (audioState.soundChannel == 5)) {
		const tmp = getNextChannelByte();
		audioState.channelDutyCycles[audioState.soundChannel] = tmp;
		audioState.waveformIndex = tmp;
		setWaveform();
	} else {
		audioState.channelDutyCycles[audioState.soundChannel] = (getNextChannelByte() & 3) << 6;
	}
	return true;
}

bool standardSoundCmd() {
	static immutable table = [
		&channel0To3,
		&channel0To3,
		&channel0To3,
		&channel0To3,
		&standardCmdChannels4To5,
		&standardCmdChannels4To5,
		&standardCmdChannel6,
		&standardCmdChannel7,
	];
	return table[audioState.soundChannel]();
}

bool channel0To3() {
	static void cmdUnknown(ushort frequency) {
		setSoundFrequency(frequency);
		audioState.unnamedC05D[audioState.soundChannel] = 0;
		func39464C();
		audioState.unnamedC045[audioState.soundChannel] = 0;
		audioState.unnamedC051[audioState.soundChannel] = (audioState.channelVibratos[audioState.soundChannel] & 0xF0) >> 3;
		func42EA(0);
		setChannelWaitCounter();
	}
	if (audioState.unnamedC039[audioState.soundChannel] != 0) {
		cmdUnknown((getNextChannelByte() << 8) | audioState.soundCmd);
		return false;
	}
	if (audioState.soundCmd == 0x60) {
		if (audioState.channelEnvelopes2[audioState.soundChannel] != 0) {
			setChannelWaitCounter();
			return false;
		}
		audioState.unnamedC05D[audioState.soundChannel] = 2;
		audioState.soundCmdEnvelope = cast(ubyte)((getChannelVolume() << 4) | 1);
		updateChannelVolume();
		func3941F3();
		setChannelWaitCounter();
	} else if (audioState.soundCmd == 0x61) {
		setChannelWaitCounter();
	} else {
		infof("%02X", audioState.soundCmd);
		cmdUnknown(soundFrequencyTable[audioState.soundCmd - 0x0C]);
	}
	return false;
}

// Read a byte, set the channel wait counter to the value
void setChannelWaitCounter() {
	audioState.channelWaitCounters[audioState.soundChannel] = cast(ubyte)(getNextChannelByte() - 1);
}

ubyte func394609(ubyte volume, ubyte envelope) {
	return data4AD0[volume][envelope];
}

// Sends wSoundFrequency to given value plus value in table at wChannelPitchShift.
void setSoundFrequency(ushort frequency) {
	soundData3[audioState.soundChannel] = cast(ushort)(frequency + audioState.channelPitchShift[audioState.soundChannel]);
	audioState.soundFrequency = soundData3[audioState.soundChannel];
}

void func39464C() {
	if (audioState.soundChannel == 4) {
		func394766();
		return;
	}
	if (audioState.unnamedC05D[audioState.soundChannel] == 0) {
		if (audioState.channelEnvelopes[audioState.soundChannel] != 0) {
			auto env = audioState.channelEnvelopes[audioState.soundChannel];
			audioState.soundCmdEnvelope = env & 0x18;
			audioState.unnamedC061[audioState.soundChannel] = func394609(getChannelVolume(), env);
			audioState.unnamedC05D[audioState.soundChannel] = 1;
			updateChannelVolume();
			return;
		}
	} else if (audioState.unnamedC05D[audioState.soundChannel] == 1) {
		if (audioState.unnamedC061[audioState.soundChannel] != 0) {
			audioState.unnamedC061[audioState.soundChannel]--;
			audioState.soundCmdEnvelope = 0;
			return;
		}
	} else {
		audioState.soundCmdEnvelope = 0;
		return;
	}
	audioState.unnamedC05D[audioState.soundChannel] = (audioState.channelEnvelopes2[audioState.soundChannel] == 0) ? 2 : 3;
	audioState.soundCmdEnvelope = cast(ubyte)(getChannelVolume() << 4);
	audioState.soundCmdEnvelope |= audioState.channelEnvelopes2[audioState.soundChannel];
	updateChannelVolume();
}

void updateChannelVolume() {
	if ((audioState.soundChannel < 2) && ((audioState.musicVolume == 0) || (audioState.channelsEnabled[audioState.soundChannel + 2] != 0))) {
		infof("exit: %s", audioState.soundChannel);
		return;
	}
	if ((audioState.soundChannel & 1) == 0) {
		// Channel 1 only: sweep off
		gbc.NR10 = 0x08;
	}
	// Set channel volume
	gbc.writeRegister(Register.NR12 + (audioState.soundChannel & 1) * 5, audioState.soundCmdEnvelope);
	audioState.soundCmdEnvelope = (audioState.unnamedC039[audioState.soundChannel] & 0x40) | 0x80;
}

void func394766() {
	if (audioState.unnamedC025[4] == func39489E()) {
		return;
	}
	audioState.unnamedC025[4] = func39489E();
	if (func39434B() == 0) {
		gbc.NR32 = audioState.unnamedC025[4];
	}
}

ubyte getChannelVolume() {
	if (audioState.soundChannel >= 2) {
		return audioState.channelVolumes[audioState.soundChannel];
	}
	return func39478C();
}

ubyte func39478C() {
	if (audioState.musicVolume == 0) {
		return 0;
	} else if (audioState.musicVolume == 1) {
		return audioState.channelVolumes[audioState.soundChannel] >> 2;
	} else if (audioState.musicVolume == 2) {
		return audioState.channelVolumes[audioState.soundChannel] >> 1;
	} else {
		return audioState.channelVolumes[audioState.soundChannel];
	}
}

bool standardCmdChannels4To5() {
	static void cmdUnknown(ushort frequency) {
		setSoundFrequency(frequency);
		audioState.unnamedC045[audioState.soundChannel] = 0;
		audioState.unnamedC051[audioState.soundChannel] = (audioState.channelVibratos[audioState.soundChannel] & 0xF0) >> 3;
		audioState.unnamedC025[audioState.soundChannel] = func39489E();
		if (func39434B() == 0) {
			gbc.NR32 = audioState.unnamedC025[audioState.soundChannel];
			gbc.NR33 = audioState.soundFrequency & 0xFF;
			gbc.NR34 = audioState.soundFrequency >> 8;
		}
		setChannelWaitCounter();
	}
	if (audioState.unnamedC039[audioState.soundChannel] != 0) {
		cmdUnknown((getNextChannelByte() << 8) | audioState.soundCmd);
		return false;
	}
	if (audioState.soundCmd == 0x60) {
		audioState.unnamedC02D[audioState.soundChannel] = 1;
		audioState.unnamedC025[audioState.soundChannel] = func39489E();
		if (func39434B() == 0) {
			gbc.NR32 = audioState.unnamedC025[audioState.soundChannel];
		}
		setChannelWaitCounter();
	} else {
		audioState.unnamedC02D[audioState.soundChannel] = 0;
		cmdUnknown(soundFrequencyTable[audioState.soundCmd]);
	}
	return false;
}

ubyte func39489E() {
	if (audioState.unnamedC02D[audioState.soundChannel] != 0) {
		return 0;
	}
	if (audioState.soundChannel >= 5) {
		return 0x20;
	}
	if (audioState.musicVolume == 0) {
		return 0;
	} else if (audioState.musicVolume == 1) {
		return 0x60;
	} else if (audioState.musicVolume == 2) {
		return 0x40;
	} else {
		return 0x20;
	}
}

bool standardCmdChannel6() {
	auto de = &noiseFrequencyTable[0];
	while (true) {
		if (de.cmd == 0xFF) {
			goto end;
		}
		if (de.cmd == audioState.soundCmd) {
			break;
		}
		de++;
	}
	if (audioState.channelsEnabled[7] == 0) {
		gbc.NR42 = cast(ubyte)(func39478C() << 4) | de.envelope;
		gbc.NR43 = de.frequency;
		gbc.NR44 = 0x80;
	}
	end:
	setChannelWaitCounter();
	return false;
}

bool standardCmdChannel7() {
	gbc.NR43 = audioState.soundCmd;
	gbc.NR41 = 0;
	if (audioState.unnamedC01C != 0) {
		gbc.NR44 = audioState.unnamedC01C;
	}
	audioState.unnamedC01C = 0;
	setChannelWaitCounter();
	return false;
}

bool channelCmdFF() {
	audioState.channelsEnabled[audioState.soundChannel] = 0;
	updateChannelStuff();
	return false;
}
// Checks whether to call updateChannelVolume on square channels, does some other things with the other types of channels...
void updateChannelStuff() {
	static immutable table = [
		&musicSquareChannel,
		&musicSquareChannel,
		&sfxSquareChannel,
		&sfxSquareChannel,
		&musicWaveChannel,
		&sfxWaveChannel,
		&noiseChannel,
		&noiseChannel,
	];
	table[audioState.soundChannel]();
}

void musicSquareChannel() {
	// Only update if the corresponding sfx channel is not enabled
	if (audioState.channelsEnabled[audioState.soundChannel + 2] == 0) {
		sfxSquareUpdateCommon();
	}
}

void sfxSquareChannel() {
	// Sfx always updates (but it still does this pointless check of the corresponding music channel)
	if (audioState.channelsEnabled[audioState.soundChannel - 2] == 0) {
		sfxSquareUpdateCommon();
	} else {
		sfxSquareUpdateCommon();
	}
}
void sfxSquareUpdateCommon() {
	infof("sq upd %s", audioState.soundChannel);
	if (audioState.unnamedC05D[audioState.soundChannel] == 3) {
		return;
	}
	audioState.soundCmdEnvelope = 0x08;
	updateChannelVolume();
	func42EA(0);
}

void musicWaveChannel() {
	if (func39434B() == 0) {
		gbc.NR30 = 0;
	}
}

void sfxWaveChannel() {
	if (audioState.channelsEnabled[4] == 0) {
		gbc.NR30 = 0;
	} else {
		audioState.waveformIndex = audioState.channelDutyCycles[4];
		setWaveform();
		gbc.NR32 = audioState.unnamedC025[4];
	}
}

void noiseChannel() {
	gbc.NR42 = 0x08;
	gbc.NR44 = 0x80;
}

void setWaveform() {
	if (func39434B() != 0) {
		return;
	}
	// Wait for channel 3 to be on
	do {
		gbc.NR30 = 0;
	} while ((gbc.NR52 & 4) != 0);
	// Copy waveform to $ff30
	foreach (i; 0 .. 16) {
		gbc.waveRAM[i] = waveformTable[audioState.waveformIndex][i];
	}
	// Enable channel 3
	do {
		gbc.NR30 = 0x80;
	} while ((gbc.NR30 & 0x80) == 0);
	// Restart channel 3 (but trashes lower frequency bits?)
	gbc.NR34 = 0x80;
}

bool channelCmdFE() {
	ushort next = getNextChannelByte() | (getNextChannelByte() << 8);
	soundChannelAddresses[audioState.soundChannel] = soundChannelBaseAddresses[audioState.soundChannel] + next;
	return true;
}

ushort func394A10(ubyte a, ushort hl) {
	return cast(ushort)(hl * a);
}

immutable ushort[] soundFrequencyTable = [
	0x002D,
	0x009D,
	0x0108,
	0x016C,
	0x01CB,
	0x0224,
	0x0279,
	0x02C8,
	0x0313,
	0x0358,
	0x039B,
	0x03DB,
	0x0416,
	0x044F,
	0x0484,
	0x04B6,
	0x04E5,
	0x0512,
	0x053C,
	0x0564,
	0x058A,
	0x05AC,
	0x05CE,
	0x05ED,
	0x060B,
	0x0627,
	0x0642,
	0x065B,
	0x0673,
	0x0689,
	0x069E,
	0x06B2,
	0x06C5,
	0x06D6,
	0x06E7,
	0x06F7,
	0x0706,
	0x0714,
	0x0721,
	0x072E,
	0x0739,
	0x0745,
	0x074F,
	0x0759,
	0x0762,
	0x076B,
	0x0773,
	0x077B,
	0x0783,
	0x078A,
	0x0790,
	0x0797,
	0x079D,
	0x07A2,
	0x07A8,
	0x07AD,
	0x07B1,
	0x07B6,
	0x07BA,
	0x07BE,
	0x07C1,
	0x07C5,
	0x07C8,
	0x07CB,
	0x07CE,
	0x07D1,
	0x07D4,
	0x07D6,
	0x07D9,
	0x07DB,
	0x07DD,
	0x07DF,
	0x07E1,
	0x07E2,
	0x07E4,
	0x07E6,
	0x07E7,
	0x07E9,
	0x07EA,
	0x07EB,
	0x07EC,
	0x07ED,
	0x07EE,
	0x07EF,
	0x07F0,
	0x07F1,
	0x07F2,
];

immutable ubyte[8][] data4AD0 = [
	[ 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07 ],
	[ 0x00, 0x02, 0x04, 0x06, 0x07, 0x09, 0x0b, 0x0d ],
	[ 0x00, 0x03, 0x06, 0x08, 0x0b, 0x0e, 0x11, 0x14 ],
	[ 0x00, 0x04, 0x07, 0x0b, 0x0f, 0x13, 0x16, 0x1a ],
	[ 0x00, 0x05, 0x09, 0x0e, 0x13, 0x17, 0x1c, 0x21 ],
	[ 0x00, 0x06, 0x0b, 0x11, 0x16, 0x1c, 0x22, 0x27 ],
	[ 0x00, 0x07, 0x0d, 0x14, 0x1a, 0x21, 0x27, 0x2e ],
	[ 0x00, 0x07, 0x0f, 0x16, 0x1e, 0x25, 0x2d, 0x34 ],
	[ 0x00, 0x08, 0x11, 0x19, 0x22, 0x2a, 0x32, 0x3b ],
	[ 0x00, 0x09, 0x13, 0x1c, 0x25, 0x2f, 0x38, 0x41 ],
	[ 0x00, 0x0a, 0x15, 0x1f, 0x29, 0x33, 0x3e, 0x48 ],
	[ 0x00, 0x0b, 0x16, 0x22, 0x2d, 0x38, 0x43, 0x4e ],
	[ 0x00, 0x0c, 0x18, 0x24, 0x31, 0x3d, 0x49, 0x55 ],
	[ 0x00, 0x0d, 0x1a, 0x27, 0x34, 0x41, 0x4e, 0x5b ],
];
immutable ubyte[] data4B40 = [
	0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
	0x00, 0x00, 0xff, 0xff, 0xfe, 0xff, 0xff, 0xff,
];

// @param a The sound to play.
void playSound(ubyte sound) {
	audioState.soundTmp = sound;
	if (sound == 0) {
		return;
	}
	void fadeoutCommon(ubyte length) {
		audioState.soundFadeSpeed = length;
		audioState.soundFadeCounter = 0;
		audioState.soundFadeDirection = 1;
		audioState.soundVolume = 119;
	}
	void fadeinCommon(ubyte length) {
		audioState.soundFadeSpeed = length;
		audioState.soundFadeCounter = 0;
		audioState.soundFadeDirection = 10;
		audioState.soundVolume = 0;
	}
	switch (sound) {
		case Snd.stopMusic:
			audioState.soundTmp = 0xDE;
			goto default;
		case Snd.stopSFX:
			stopSFX();
			break;
		case Snd.disable:
			func3940B9();
			audioState.soundDisabled = 1;
			audioState.soundVolume = 119;
			break;
		case Snd.enable:
			audioState.soundDisabled = 0;
			audioState.soundVolume = 119;
			break;
		case Snd.fastFadein:
			fadeinCommon(3);
			break;
		case Snd.mediumFadein:
			fadeinCommon(7);
			break;
		case Snd.slowFadein:
			fadeinCommon(15);
			break;
		case Snd.fastFadeout:
			fadeoutCommon(7);
			break;
		case Snd.mediumFadeout:
			fadeoutCommon(15);
			break;
		case Snd.slowFadeout:
			fadeoutCommon(31);
			break;
		default:
			audioState.soundFadeDirection = 0;
			auto hl = &soundPointers[audioState.soundTmp];
			audioState.loadingSoundBank = cast(ubyte)(soundDataBaseBank + 0x42); // fake a bank.
			foreach (channel; hl.channels) {
				if (channel.id == 0xFF) {
					break;
				}
				audioState.soundTmp = channel.id;
				audioState.soundChannelValue = cast(ubyte)((channel.id >> 4) + 1);
				audioState.soundTmp &= 0x0F;
				if (audioState.soundChannelValue < audioState.channelsEnabled[audioState.soundTmp]) {
					continue;
				}
				audioState.channelsEnabled[audioState.soundTmp] = audioState.soundChannelValue;
				audioState.channelVolumes[audioState.soundTmp] = 8;
				audioState.channelWaitCounters[audioState.soundTmp] = 0;
				switch (audioState.soundTmp) {
					case 0:
					case 1:
					case 2:
					case 3: // square channels
						// Clear a bunch of variables
						audioState.channelEnvelopes[audioState.soundTmp] = 0;
						audioState.channelEnvelopes2[audioState.soundTmp] = 0;
						audioState.channelDutyCycles[audioState.soundTmp] = 0;
						audioState.channelVibratos[audioState.soundTmp] = 0;
						audioState.unnamedC03F[audioState.soundTmp] = 0;
						audioState.channelPitchShift[audioState.soundTmp] = 0;
						audioState.unnamedC039[audioState.soundTmp] = 0;
						break;
					case 4:
					case 5: // wave channels
						audioState.channelVibratos[audioState.soundTmp] = 0;
						audioState.unnamedC03F[audioState.soundTmp] = 0;
						audioState.channelPitchShift[audioState.soundTmp] = 0;
						audioState.unnamedC039[audioState.soundTmp] = 0;
						break;
					default: // noise channels (no-op)
						break;
				}
				// Write the bank for this sound channel into hSoundChannelBanks
				soundChannelBanks[audioState.soundTmp] = audioState.loadingSoundBank;

				// Write the address for this sound channel into hSoundChannelAddresses
				soundChannelBaseAddresses[audioState.soundTmp] = soundChannelAddresses[audioState.soundTmp] = &channel.data[0];
			}
			audioState.soundVolume = 119;
			break;
	}
}

// Reads a word at hl+a*2 into de and hl. Index can't be higher than $7f.
ushort readWordFromTable(ubyte index, void* src) => *cast(ushort*)(src + index);

// Adds b to c, writes a to ($ff00+c), increments c.
void writeIndexedHighRamAndIncrement(ubyte toWrite, ref ubyte index, ubyte offset) => assert(0);

import oracles.common.data.audio.noise;
import oracles.common.data.audio.waveforms;
import oracles.common.data.audio.soundPointers;
