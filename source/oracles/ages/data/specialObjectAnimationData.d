module oracles.ages.data.specialObjectAnimationData;

import oracles.data;
import oracles.external;
import oracles.structures;
import oracles.ages.data.specialObjectOamData;

alias specialObject01GFXPointers = specialObject00GFXPointers;
alias specialObject08GFXPointers = specialObject00GFXPointers;
immutable specialObject00GFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0200, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0080, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x03E0, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0DA0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0DE0, 0x02),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0DA0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0100, 0x04),
	SpecialObjectGFX(0x06, GFXAsset.sprLink, 0x0140, 0x02),
	SpecialObjectGFX(0x06, GFXAsset.sprLink, 0x0160, 0x02),
	SpecialObjectGFX(0x12, GFXAsset.sprLink, 0x0F40, 0x02),
	SpecialObjectGFX(0x12, GFXAsset.sprLink, 0x0F60, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1980, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1A80, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1DC0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0900, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0920, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0960, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x09A0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x09E0, 0x02),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x09A0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0960, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0920, 0x04),
	SpecialObjectGFX(0x08, GFXAsset.sprLink, 0x1040, 0x04),
	SpecialObjectGFX(0x09, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x0A, GFXAsset.sprLink, 0x10C0, 0x04),
	SpecialObjectGFX(0x0B, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0240, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0D60, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0D60, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0000, 0x04),
	SpecialObjectGFX(0x14, GFXAsset.sprLink, 0x1C00, 0x14),
	SpecialObjectGFX(0x13, GFXAsset.sprLink, 0x1C00, 0x14),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1580, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1580, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x15C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1380, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x13C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1AC0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1B00, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1B40, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1B00, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1B40, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1180, 0x04),
	SpecialObjectGFX(0x0B, GFXAsset.sprLink, 0x11C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1180, 0x04),
	SpecialObjectGFX(0x09, GFXAsset.sprLink, 0x11C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0000, 0x04),
	SpecialObjectGFX(0x05, GFXAsset.sprLink, 0x09E0, 0x02),
	SpecialObjectGFX(0x2D, GFXAsset.sprLink, 0x0CE0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x03C0, 0x02),
	SpecialObjectGFX(0x2E, GFXAsset.sprLink, 0x0300, 0x06),
	SpecialObjectGFX(0x2E, GFXAsset.sprLink, 0x0360, 0x04),
	SpecialObjectGFX(0x2F, GFXAsset.sprLink, 0x0300, 0x06),
	SpecialObjectGFX(0x2F, GFXAsset.sprLink, 0x0360, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1040, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0D20, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x10C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1100, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1240, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1200, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1340, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1E00, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x12C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1280, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1340, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1300, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1700, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1740, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1780, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x17C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1800, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1880, 0x04),
	SpecialObjectGFX(0x08, GFXAsset.sprLink, 0x1700, 0x04),
	SpecialObjectGFX(0x09, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x0A, GFXAsset.sprLink, 0x17C0, 0x04),
	SpecialObjectGFX(0x0B, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0200, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0080, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0800, 0x02),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0840, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0820, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0840, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x01C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0180, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x01C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1940, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x19C0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x03A0, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x19C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0A00, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0B00, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0AA0, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0B00, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0400, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0500, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0480, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0400, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0580, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0480, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0600, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0780, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0680, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0700, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0600, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0780, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0880, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0700, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x10C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1640, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1680, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1600, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1680, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x00C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0200, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x00C0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0800, 0x02),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0840, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0820, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0840, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1140, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0180, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1140, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1940, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x19C0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x03A0, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x19C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0A40, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0B40, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0AC0, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0B40, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0440, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0540, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x04C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x00C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0440, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x05C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x04C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x00C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0640, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x07C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x06C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0740, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0640, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x07C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x08C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0740, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1A40, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0280, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1A00, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0280, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1640, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x16C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1600, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x16C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1100, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1100, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x10C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x08, GFXAsset.sprLink, 0x1040, 0x04),
	SpecialObjectGFX(0x09, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x0A, GFXAsset.sprLink, 0x10C0, 0x04),
	SpecialObjectGFX(0x0B, GFXAsset.sprLink, 0x02C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1080, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1740, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1880, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1800, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1880, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1700, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x17C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x08, GFXAsset.sprLink, 0x1700, 0x04),
	SpecialObjectGFX(0x09, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x0A, GFXAsset.sprLink, 0x17C0, 0x04),
	SpecialObjectGFX(0x0B, GFXAsset.sprLink, 0x1840, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1200, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1300, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1280, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1300, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1240, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1340, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x12C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1340, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1200, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1280, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1280, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1280, 0x04),
	SpecialObjectGFX(0x10, GFXAsset.sprLink, 0x0E00, 0x04),
	SpecialObjectGFX(0x11, GFXAsset.sprLink, 0x0EC0, 0x04),
	SpecialObjectGFX(0x12, GFXAsset.sprLink, 0x0E80, 0x02),
	SpecialObjectGFX(0x10, GFXAsset.sprLink, 0x0EC0, 0x04),
	SpecialObjectGFX(0x10, GFXAsset.sprLink, 0x0E40, 0x04),
	SpecialObjectGFX(0x11, GFXAsset.sprLink, 0x0F00, 0x04),
	SpecialObjectGFX(0x12, GFXAsset.sprLink, 0x0EA0, 0x02),
	SpecialObjectGFX(0x10, GFXAsset.sprLink, 0x0F00, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0A40, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0B80, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0AC0, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0B80, 0x04),
	SpecialObjectGFX(0x0C, GFXAsset.sprLink, 0x0A80, 0x02),
	SpecialObjectGFX(0x0D, GFXAsset.sprLink, 0x0BC0, 0x04),
	SpecialObjectGFX(0x0E, GFXAsset.sprLink, 0x0AE0, 0x02),
	SpecialObjectGFX(0x0F, GFXAsset.sprLink, 0x0BC0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0C00, 0x02),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0C60, 0x04),
	SpecialObjectGFX(0x05, GFXAsset.sprLink, 0x0C40, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0C60, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0C20, 0x02),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0CA0, 0x04),
	SpecialObjectGFX(0x05, GFXAsset.sprLink, 0x0C00, 0x02),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0CA0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprLink, 0x0C40, 0x02),
	SpecialObjectGFX(0x02, GFXAsset.sprLink, 0x0C60, 0x04),
	SpecialObjectGFX(0x05, GFXAsset.sprLink, 0x0C20, 0x02),
	SpecialObjectGFX(0x03, GFXAsset.sprLink, 0x0C60, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0F80, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0F80, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0F80, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0F80, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0FC0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x0FC0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0FC0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x0FC0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1400, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1500, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1480, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1500, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1440, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1540, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x14C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1540, 0x04),
];

alias specialObject09AnimationDataPointers = specialObject00AnimationDataPointers;
immutable specialObject00AnimationDataPointers = [
	animationData19e72,
	animationData19e7b,
	animationData19e75,
	animationData19e8f,
	animationData19ea9,
	animationData19eb4,
	animationData19eba,
	animationData19ec5,
	animationData19ed0,
	animationData19ed5,
	animationData19eda,
	animationData19ee3,
	animationData19eeb,
	animationData19ef3,
	animationData19eff,
	animationData19f05,
	animationData19f0b,
	animationData19f34,
	animationData19f5e,
	animationData19f3c,
	animationData19f47,
	animationData19f5b,
	animationData19f6a,
	animationData19f70,
	animationData19f78,
	animationData19f84,
	animationData19f84,
	animationData19f90,
	animationData19fa5,
	animationData19faa,
	animationData19faa,
	animationData19fdd,
	animationData19fe6,
	animationData19fe9,
	animationData19fef,
	animationData19ffe,
	animationData1a010,
	animationData1a013,
	animationData1a019,
	animationData1a025,
	animationData1a037,
	animationData1a03d,
	animationData1a043,
	animationData1a049,
	animationData1a051,
	animationData1a05a,
	animationData1a063,
	animationData1a06f,
	animationData1a08d,
	animationData1a093,
	animationData1a099,
	animationData1a09f,
	animationData19ff2,
	animationData1a01c,
	animationData1a05d,
	animationData1a069,
];

immutable specialObject01AnimationDataPointers = [
	animationData19e56,
	animationData19e5e,
	animationData19e75,
];

immutable specialObject08AnimationDataPointers = [
	animationData19f0b,
	animationData19d55,
	animationData19d60,
	animationData19d6b,
	animationData19d76,
	animationData19d84,
	animationData19d90,
	animationData19d96,
	animationData19e8f,
	animationData19daa,
	animationData19f78,
	animationData19dc5,
	animationData19dca,
	animationData19df0,
	animationData19dfb,
	animationData19e01,
	animationData19e06,
	animationData19e0b,
	animationData19e10,
	animationData19e2a,
	animationData19e38,
	animationData19e40,
	animationData19e4b,
];

immutable animationData19d55 = [
	AnimationData.frame(0x02, 0x55, 0x00),

	AnimationData.frame(0x06, 0x81, 0x00),
	AnimationData.frame(0x06, 0x55, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19d60 = [
	AnimationData.frame(0x02, 0x56, 0x00),

	AnimationData.frame(0x06, 0x82, 0x00),
	AnimationData.frame(0x06, 0x56, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19d6b = [
	AnimationData.frame(0x02, 0x57, 0x00),

	AnimationData.frame(0x06, 0x83, 0x00),
	AnimationData.frame(0x06, 0x57, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19d76 = [
	AnimationData.frame(0x01, 0x20, 0x00),
	AnimationData.frame(0x01, 0x54, 0x00),
	AnimationData.frame(0x01, 0x21, 0x00),
	AnimationData.frame(0x01, 0x54, 0x00),
	AnimationData.loop(-4),
];

immutable animationData19d84 = [
	AnimationData.frame(0x1e, 0x08, 0x00),
	AnimationData.frame(0x12, 0x09, 0x00),
	AnimationData.frame(0x0c, 0x0a, 0x00),
	AnimationData.frame(0x7f, 0x0a, 0xff),
];

immutable animationData19d90 = [
	AnimationData.frame(0x7f, 0x07, 0x00),
	AnimationData.frame(0x7f, 0x07, 0xff),
];

immutable animationData19d96 = [
	AnimationData.frame(0x14, 0x1c, 0x00),
	AnimationData.frame(0x08, 0x56, 0x00),
	AnimationData.frame(0x08, 0x57, 0x00),
	AnimationData.frame(0x08, 0x54, 0x00),
	AnimationData.frame(0x08, 0x55, 0x00),
	AnimationData.frame(0x08, 0x56, 0x00),
	AnimationData.loop(-6),
];

immutable animationData19daa = [
	AnimationData.frame(0x7f, 0x22, 0x00),
	AnimationData.frame(0x0a, 0x23, 0x00),
	AnimationData.frame(0x0a, 0x22, 0x00),
	AnimationData.frame(0x0a, 0x23, 0x00),
	AnimationData.frame(0x0a, 0x22, 0x00),
	AnimationData.frame(0x0a, 0x23, 0x00),
	AnimationData.frame(0x0a, 0x22, 0x00),
	AnimationData.frame(0x3b, 0x24, 0x00),
	AnimationData.frame(0x3c, 0x24, 0xff),
];

immutable animationData19dc5 = [
	AnimationData.frame(0x7f, 0x56, 0x00),
	AnimationData.loop(-1),
];

immutable animationData19dca = [
	AnimationData.frame(0x14, 0x1c, 0x00),
	AnimationData.frame(0x08, 0x56, 0x00),
	AnimationData.frame(0x08, 0x55, 0x00),
	AnimationData.frame(0x08, 0x54, 0x00),
	AnimationData.frame(0x08, 0x57, 0x00),
	AnimationData.frame(0x08, 0x56, 0x00),
	AnimationData.frame(0x14, 0x1c, 0x00),
	AnimationData.frame(0x08, 0x56, 0x00),
	AnimationData.frame(0x08, 0x57, 0x00),
	AnimationData.frame(0x08, 0x54, 0x00),
	AnimationData.frame(0x08, 0x55, 0x00),
	AnimationData.frame(0x08, 0x56, 0x00),
	AnimationData.loop(-12),
];

immutable animationData19df0 = [
	AnimationData.frame(0x7f, 0x10, 0x00),
	AnimationData.frame(0x08, 0x56, 0x00),

	AnimationData.frame(0x7f, 0x04, 0x00),
AnimationData.loop(-1),
];

immutable animationData19dfb = [
	AnimationData.frame(0x7f, 0x07, 0x00),
	AnimationData.frame(0x7f, 0x07, 0xff),
];

immutable animationData19e01 = [
	AnimationData.frame(0x7f, 0x96, 0x00),
	AnimationData.loop(-1),
];

immutable animationData19e06 = [
	AnimationData.frame(0x7f, 0x55, 0x00),
	AnimationData.loop(-1),
];

immutable animationData19e0b = [
	AnimationData.frame(0x7f, 0x95, 0x00),
	AnimationData.loop(-1),
];

immutable animationData19e10 = [
	AnimationData.frame(0xc8, 0x56, 0x00),

	AnimationData.frame(0x0c, 0x27, 0x00),
	AnimationData.frame(0x0e, 0x28, 0x00),
	AnimationData.frame(0x14, 0x29, 0x00),
	AnimationData.frame(0x0c, 0x27, 0x00),
	AnimationData.frame(0x0e, 0x2a, 0x00),
	AnimationData.frame(0x14, 0x2b, 0x00),
	AnimationData.frame(0x01, 0x2b, 0xff),
	AnimationData.loop(-7),
];

immutable animationData19e2a = [
	AnimationData.frame(0x7f, 0x1c, 0x00),
	AnimationData.frame(0x7f, 0x10, 0x00),
	AnimationData.frame(0x7f, 0x31, 0x00),

	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.loop(-1),
];

immutable animationData19e38 = [
	AnimationData.frame(0xb4, 0x04, 0x00),

	AnimationData.frame(0x7f, 0x56, 0x00),
	AnimationData.loop(-1),
];

immutable animationData19e40 = [
	AnimationData.frame(0x02, 0x67, 0x00),

	AnimationData.frame(0x06, 0x93, 0x00),
	AnimationData.frame(0x06, 0x67, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19e4b = [
	AnimationData.frame(0x02, 0x65, 0x00),

	AnimationData.frame(0x06, 0x91, 0x00),
	AnimationData.frame(0x06, 0x65, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19e56 = [
	AnimationData.frame(0x08, 0x54, 0x00),
	AnimationData.frame(0x08, 0x80, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19e5e = [
	AnimationData.frame(0x02, 0x56, 0x00),
	AnimationData.frame(0x02, 0x57, 0x00),
	AnimationData.frame(0x02, 0x54, 0x00),
	AnimationData.frame(0x02, 0x55, 0x00),
	AnimationData.frame(0x02, 0x56, 0x00),

	AnimationData.frame(0x7f, 0x1e, 0xff),
	AnimationData.loop(-1),
];

immutable animationData19e72 = [
	AnimationData.frame(0x7f, 0x1e, 0x00),
];

immutable animationData19e75 = [
	AnimationData.frame(0x4c, 0x04, 0x00),
	AnimationData.frame(0x80, 0x04, 0xff),
];

immutable animationData19e7b = [
	AnimationData.frame(0x08, 0x02, 0x00),

	AnimationData.frame(0x08, 0x01, 0x00),
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x03, 0x00),
	AnimationData.frame(0x07, 0x02, 0x00),
	AnimationData.frame(0x01, 0x02, 0x80),
	AnimationData.loop(-5),
];

immutable animationData19e8f = [
	AnimationData.frame(0x04, 0x10, 0x00),
	AnimationData.frame(0x04, 0x11, 0x00),
	AnimationData.frame(0x04, 0x12, 0x00),
	AnimationData.frame(0x04, 0x13, 0x00),
	AnimationData.frame(0x04, 0x14, 0x00),
	AnimationData.frame(0x04, 0x15, 0x00),
	AnimationData.frame(0x04, 0x16, 0x00),
	AnimationData.frame(0x04, 0x17, 0x00),
	AnimationData.loop(-8),
];

immutable animationData19ea9 = [
	AnimationData.frame(0x04, 0xe4, 0x00),
	AnimationData.frame(0x04, 0xe8, 0x00),
	AnimationData.frame(0x04, 0xec, 0x00),
	AnimationData.loop(-3),
];

immutable animationData19eb4 = [
	AnimationData.frame(0x7f, 0x1c, 0x00),
	AnimationData.frame(0x7f, 0x1c, 0xff),
];

immutable animationData19eba = [
	AnimationData.frame(0x2d, 0x32, 0x00),

	AnimationData.frame(0x04, 0x02, 0xff),
	AnimationData.frame(0x04, 0x32, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19ec5 = [
	AnimationData.frame(0x2d, 0x33, 0x00),

	AnimationData.frame(0x04, 0x02, 0xff),
	AnimationData.frame(0x04, 0x33, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19ed0 = [
	AnimationData.frame(0x7f, 0x1d, 0xff),
	AnimationData.loop(-1),
];

immutable animationData19ed5 = [
	AnimationData.frame(0x7f, 0x1e, 0xff),
	AnimationData.loop(-1),
];

immutable animationData19eda = [
	AnimationData.frame(0x06, 0xd4, 0x00),
	AnimationData.frame(0x10, 0x0b, 0x00),
	AnimationData.frame(0x7f, 0x0b, 0xff),
];

immutable animationData19ee3 = [
	AnimationData.frame(0x06, 0xd4, 0x00),
	AnimationData.frame(0x06, 0xd8, 0x01),
	AnimationData.loop(-2),
];

immutable animationData19eeb = [
	AnimationData.frame(0x10, 0x0b, 0x00),
	AnimationData.frame(0x10, 0x0c, 0x01),
	AnimationData.loop(-2),
];

immutable animationData19ef3 = [
	AnimationData.frame(0x10, 0x08, 0x00),
	AnimationData.frame(0x0a, 0x09, 0x00),
	AnimationData.frame(0x0a, 0x0a, 0x00),
	AnimationData.frame(0x7f, 0x0a, 0xff),
];

immutable animationData19eff = [
	AnimationData.frame(0x7f, 0x05, 0x00),
	AnimationData.frame(0x7f, 0x05, 0xff),
];

immutable animationData19f05 = [
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x06, 0xff),
];

immutable animationData19f0b = [
	AnimationData.frame(0x02, 0x54, 0x00),

	AnimationData.frame(0x06, 0x80, 0x24),
	AnimationData.frame(0x06, 0x54, 0x00),
	AnimationData.frame(0x06, 0x80, 0x04),
	AnimationData.frame(0x06, 0x54, 0x20),
	AnimationData.frame(0x06, 0x80, 0x04),
	AnimationData.frame(0x06, 0x54, 0x00),
	AnimationData.frame(0x06, 0x80, 0x24),
	AnimationData.frame(0x06, 0x54, 0x00),
	AnimationData.frame(0x06, 0x80, 0x04),
	AnimationData.frame(0x06, 0x54, 0x20),
	AnimationData.frame(0x06, 0x80, 0x04),
	AnimationData.frame(0x06, 0x54, 0x00),
	AnimationData.loop(-12),
];

immutable animationData19f34 = [
	AnimationData.frame(0x09, 0x7c, 0x00),
	AnimationData.frame(0x09, 0xa8, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19f3c = [
	AnimationData.frame(0x01, 0xdc, 0x00),

	AnimationData.frame(0x28, 0xe0, 0x01),
	AnimationData.frame(0x14, 0xdc, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19f47 = [
	AnimationData.frame(0x01, 0xdc, 0x00),

	AnimationData.frame(0x0a, 0xe0, 0x00),
	AnimationData.frame(0x6e, 0xe0, 0xff),
	AnimationData.frame(0x10, 0x04, 0x00),
	AnimationData.frame(0x0a, 0x54, 0x00),
	AnimationData.frame(0x0a, 0xdc, 0x00),
	AnimationData.loop(-5),
];

immutable animationData19f5b = [
	AnimationData.frame(0x03, 0xe0, 0x00),
];

immutable animationData19f5e= [
	AnimationData.frame(0x04, 0xe0, 0x00),
	AnimationData.frame(0x04, 0xdc, 0x04),
	AnimationData.frame(0x02, 0x5c, 0x08),
	AnimationData.frame(0x7f, 0x5c, 0xff),
];

immutable animationData19f6a= [
	AnimationData.frame(0x08, 0xb0, 0x04),
	AnimationData.frame(0x7f, 0xb0, 0xff),
];

immutable animationData19f70= [
	AnimationData.frame(0x09, 0xf0, 0x00),
	AnimationData.frame(0x09, 0xf4, 0x00),
	AnimationData.loop(-2),
];

immutable animationData19f78= [
	AnimationData.frame(0x09, 0xe4, 0x00),
	AnimationData.frame(0x09, 0xe8, 0x00),
	AnimationData.frame(0x06, 0xec, 0x00),
	AnimationData.frame(0x7f, 0x80, 0xff),
];

immutable animationData19f84= [
	AnimationData.frame(0x04, 0xf8, 0x00),
	AnimationData.frame(0x04, 0xf8, 0x01),
	AnimationData.frame(0x0f, 0xfc, 0x00),
	AnimationData.frame(0x7f, 0xfc, 0xff),
];

immutable animationData19f90= [
	AnimationData.frame(0x23, 0x2c, 0x00),
	AnimationData.frame(0x3c, 0x2d, 0x00),
	AnimationData.frame(0x23, 0x2c, 0x40),
	AnimationData.frame(0x23, 0x2e, 0x01),
	AnimationData.frame(0x3c, 0x2f, 0x01),
	AnimationData.frame(0x1e, 0x2e, 0x01),
	AnimationData.frame(0x7f, 0x2e, 0xff),
];

immutable animationData19fa5= [
	AnimationData.frame(0x7f, 0x07, 0xff),
	AnimationData.loop(-2),
];

immutable animationData19faa= [
	AnimationData.frame(0x14, 0x34, 0x00),
	AnimationData.frame(0x14, 0x35, 0x00),
	AnimationData.frame(0x0c, 0x34, 0x00),
	AnimationData.frame(0x14, 0x36, 0x01),
	AnimationData.frame(0x14, 0x37, 0x01),
	AnimationData.frame(0x0c, 0x36, 0x01),
	AnimationData.frame(0x14, 0x34, 0x00),
	AnimationData.frame(0x14, 0x35, 0x00),
	AnimationData.frame(0x0c, 0x34, 0x00),
	AnimationData.frame(0x14, 0x36, 0x01),
	AnimationData.frame(0x14, 0x37, 0x01),
	AnimationData.frame(0x0c, 0x36, 0x01),
	AnimationData.frame(0x14, 0x36, 0x01),
	AnimationData.frame(0x14, 0x37, 0x01),
	AnimationData.frame(0x0c, 0x36, 0x01),
	AnimationData.frame(0x01, 0x36, 0x81),
	AnimationData.frame(0x7f, 0x1c, 0xff),
];

immutable animationData19fdd = [
	AnimationData.frame(0x06, 0xb4, 0x44),
	AnimationData.frame(0x06, 0xb0, 0x06),
	AnimationData.frame(0x7f, 0xb0, 0x86),
];

immutable animationData19fe6 = [
	AnimationData.frame(0x06, 0xac, 0x00),
];

immutable animationData19fe9 = [
	AnimationData.frame(0x08, 0xb0, 0x06),
	AnimationData.frame(0x7f, 0xb0, 0x86),
];

immutable animationData19fef = [
	AnimationData.frame(0x03, 0xac, 0x00),
];

immutable animationData19ff2 = [
	AnimationData.frame(0x03, 0xb0, 0x02),
	AnimationData.frame(0x08, 0xb4, 0x64),
	AnimationData.frame(0x03, 0xb0, 0x06),
	AnimationData.frame(0x7f, 0xb0, 0x86),
];

immutable animationData19ffe= [
	AnimationData.frame(0x0c, 0xac, 0x40),
	AnimationData.frame(0x04, 0xb0, 0x42),
	AnimationData.frame(0x04, 0xb0, 0x44),
	AnimationData.frame(0x04, 0xb8, 0x46),
	AnimationData.frame(0x08, 0xb8, 0x48),
	AnimationData.frame(0x7f, 0xb8, 0x88),
];

immutable animationData1a010 = [
	AnimationData.frame(0x03, 0xc8, 0x00),
];

immutable animationData1a013 = [
	AnimationData.frame(0x08, 0xcc, 0x06),
	AnimationData.frame(0x7f, 0x58, 0x86),
];

immutable animationData1a019 = [
	AnimationData.frame(0x03, 0xc8, 0x00),
];

immutable animationData1a01c = [
	AnimationData.frame(0x03, 0xcc, 0x02),
	AnimationData.frame(0x08, 0xcc, 0x26),
	AnimationData.frame(0x7f, 0x58, 0x86),
];

immutable animationData1a025 = [
	AnimationData.frame(0x0c, 0xc8, 0x00),
	AnimationData.frame(0x04, 0xcc, 0x02),
	AnimationData.frame(0x04, 0xcc, 0x04),
	AnimationData.frame(0x04, 0xd0, 0x06),
	AnimationData.frame(0x08, 0xd0, 0x08),
	AnimationData.frame(0x7f, 0xd0, 0x88),
];

immutable animationData1a037 = [
	AnimationData.frame(0x03, 0x18, 0x50),
	AnimationData.frame(0x02, 0x18, 0xd1),
];

immutable animationData1a03d = [
	AnimationData.frame(0x03, 0x19, 0x52),
	AnimationData.frame(0x02, 0x19, 0xd3),
];

immutable animationData1a043 = [
	AnimationData.frame(0x03, 0x1a, 0x54),
	AnimationData.frame(0x02, 0x1a, 0xd5),
];

immutable animationData1a049 = [
	AnimationData.frame(0x03, 0x1b, 0x56),
	AnimationData.frame(0x02, 0x1b, 0xd7),
	AnimationData.loop(-8),
];

immutable animationData1a051 = [
	AnimationData.frame(0x06, 0xc4, 0x44),
	AnimationData.frame(0x06, 0xc0, 0x06),
	AnimationData.frame(0x7f, 0xc0, 0x86),
];

immutable animationData1a05a = [
	AnimationData.frame(0x03, 0xbc, 0x00),
];

immutable animationData1a05d = [
	AnimationData.frame(0x03, 0xc0, 0x02),
	AnimationData.frame(0x08, 0xc4, 0x64),
];

immutable animationData1a063 = [
	AnimationData.frame(0x03, 0xc0, 0x06),
	AnimationData.frame(0x7f, 0xc0, 0x86),
];

immutable animationData1a069 = [
	AnimationData.frame(0x08, 0xc0, 0x06),
	AnimationData.frame(0x7f, 0xc0, 0x86),
];

immutable animationData1a06f = [
	AnimationData.frame(0x09, 0xe4, 0x00),
	AnimationData.frame(0x09, 0xe8, 0x00),
	AnimationData.frame(0x06, 0xec, 0x00),
	AnimationData.frame(0x06, 0x80, 0x00),
	AnimationData.frame(0x10, 0x26, 0x01),
	AnimationData.frame(0x7f, 0x25, 0x00),
	AnimationData.frame(0x7f, 0x25, 0x02),
	AnimationData.frame(0x7f, 0x25, 0x03),
	AnimationData.frame(0x20, 0x26, 0x00),
	AnimationData.frame(0x7f, 0x26, 0x04),
];

immutable animationData1a08d = [
	AnimationData.frame(0x03, 0x50, 0x50),
	AnimationData.frame(0x02, 0x50, 0xd1),
];

immutable animationData1a093 = [
	AnimationData.frame(0x03, 0x51, 0x52),
	AnimationData.frame(0x02, 0x51, 0xd3),
];

immutable animationData1a099 = [
	AnimationData.frame(0x03, 0x52, 0x54),
	AnimationData.frame(0x02, 0x52, 0xd5),
];

immutable animationData1a09f = [
	AnimationData.frame(0x03, 0x53, 0x56),
	AnimationData.frame(0x02, 0x53, 0xd7),
	AnimationData.loop(-8),
];

alias specialObject01OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject02OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject03OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject04OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject05OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject06OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject07OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject08OAMDataPointers = specialObject00OAMDataPointers;
alias specialObject09OAMDataPointers = specialObject00OAMDataPointers;
immutable specialObject00OAMDataPointers = [
	oamData4C000,
	oamData4C009,
	oamData4C012,
	oamData4C01B,
	oamData4C024,
	oamData4C02D,
	oamData4C036,
	oamData4C03B,
	oamData4C040,
	oamData4C049,
	oamData4C052,
	oamData4C05B,
	oamData4C064,
	oamData4C06D,
	oamData4C076,
	oamData4C07F,
	oamData4C088,
	oamData4C091,
	oamData4C09A,
	oamData4C0A3,
	oamData4C0EC,
	oamData4C125,
	oamData4C12A,
	oamData4C12F,
	oamData4C134,
	oamData4C139,
	oamData4C13E,
	oamData4C143,
	oamData4C14C,
	oamData4C155,
	oamData4C15E,
	oamData4C167,
	oamData4C170,
	oamData4C179,
	oamData4C182,
	oamData4C18B,
	oamData4C194,
	oamData4C19D,
	oamData4C1A6,
	oamData4C1AF,
	oamData4C1B8,
	oamData4C1C1,
	oamData4C1CA,
	oamData4C1D3,
	oamData4C1D8,
	oamData4C1DD,
	oamData4C1E6,
	oamData4C1F3,
];

immutable specialObject02GFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprLinkBaby, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkBaby, 0x0080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLinkBaby, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLinkBaby, 0x0080, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkBaby, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkBaby, 0x00C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkBaby, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLinkBaby, 0x00C0, 0x04),
];

immutable specialObject02AnimationDataPointers = [
	animationData1a121,
];

immutable animationData1a121 = [
	AnimationData.frame(0x02, 0x00, 0x00),

	AnimationData.frame(0x06, 0x04, 0x84),
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.loop(-2),
];

immutable specialObject03GFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprSubrosian, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprSubrosian, 0x00C0, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprSubrosian, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprSubrosian, 0x00C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprSubrosian, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprSubrosian, 0x0080, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprSubrosian, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprSubrosian, 0x0080, 0x04),
];

immutable specialObject04GFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprLinkRetro, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkRetro, 0x0080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLinkRetro, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLinkRetro, 0x0080, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkRetro, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkRetro, 0x00C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprLinkRetro, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprLinkRetro, 0x00C0, 0x04),
];

immutable specialObject05GFXPointers = [
	SpecialObjectGFX(0x05, GFXAsset.sprOctorokLeeverTektiteZora, 0x0000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprOctorokLeeverTektiteZora, 0x0040, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprOctorokLeeverTektiteZora, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprOctorokLeeverTektiteZora, 0x0040, 0x04),
	SpecialObjectGFX(0x05, GFXAsset.sprOctorokLeeverTektiteZora, 0x0020, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprOctorokLeeverTektiteZora, 0x0080, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprOctorokLeeverTektiteZora, 0x0020, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprOctorokLeeverTektiteZora, 0x0080, 0x04),
];

immutable specialObject06GFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprMoblin, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprMoblin, 0x0080, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprMoblin, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprMoblin, 0x0080, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprMoblin, 0x0040, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprMoblin, 0x00C0, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprMoblin, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprMoblin, 0x00C0, 0x04),
];

immutable specialObject07GFXPointers = [
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00C0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00C0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00C0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00C0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00E0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00E0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00E0, 0x04),
	SpecialObjectGFX(0x04, GFXAsset.sprBallandchainLikelike, 0x00E0, 0x04),
];

alias specialObject04AnimationDataPointers = specialObject03AnimationDataPointers;
alias specialObject05AnimationDataPointers = specialObject03AnimationDataPointers;
alias specialObject06AnimationDataPointers = specialObject03AnimationDataPointers;
alias specialObject07AnimationDataPointers = specialObject03AnimationDataPointers;
immutable specialObject03AnimationDataPointers = [
	animationData1a1a6,
];

immutable animationData1a1a6 = [
	AnimationData.frame(0x02, 0x00, 0x00),

	AnimationData.frame(0x06, 0x04, 0x84),
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.loop(-2),
];

immutable specialObject0AGFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprDungeonSprites, 0x0000, 0x04),
	SpecialObjectGFX(0x01, GFXAsset.sprDungeonSprites, 0x0000, 0x04),
	SpecialObjectGFX(0x02, GFXAsset.sprDungeonSprites, 0x0040, 0x04),
	SpecialObjectGFX(0x02, GFXAsset.sprDungeonSprites, 0x0060, 0x04),
];

immutable specialObject0aAnimationDataPointers = [
	animationData1a1c5,
	animationData1a1cd,
	animationData1a1c5,
	animationData1a1cd,
];

immutable animationData1a1c5 = [
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.frame(0x06, 0x01, 0x04),
	AnimationData.loop(-2),
];

immutable animationData1a1cd = [
	AnimationData.frame(0x06, 0x02, 0x00),
	AnimationData.frame(0x06, 0x03, 0x04),
	AnimationData.loop(-2),
];

immutable specialObject0AOAMDataPointers = [
	oamData4C000,
	oamData4C009,
	oamData4C024,
];

immutable specialObject13GFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprRaft, 0x0000, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprRaft, 0x0020, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprRaft, 0x0040, 0x04),
	SpecialObjectGFX(0x00, GFXAsset.sprRaft, 0x0060, 0x04),
];

immutable specialObject13AnimationDataPointers = [
	animationData1a1ef,
	animationData1a1f7,
	animationData1a1ef,
	animationData1a1f7,
];

immutable animationData1a1ef = [
	AnimationData.frame(0x0c, 0x00, 0x00),
	AnimationData.frame(0x0c, 0x01, 0x04),
	AnimationData.loop(-2),
];

immutable animationData1a1f7 = [
	AnimationData.frame(0x0c, 0x02, 0x00),
	AnimationData.frame(0x0c, 0x03, 0x04),
	AnimationData.loop(-2),
];

immutable specialObject13OAMDataPointers = [
	oamData4C024,
];

immutable specialObject09GFXPointers = [
SpecialObjectGFX(0x06, GFXAsset.sprLink, 0x2280, 0x02),
SpecialObjectGFX(0x15, GFXAsset.sprLink, 0x1E60, 0x02),
SpecialObjectGFX(0x06, GFXAsset.sprLink, 0x1E40, 0x02),
SpecialObjectGFX(0x06, GFXAsset.sprLink, 0x1E60, 0x02),
SpecialObjectGFX(0x18, GFXAsset.sprLink, 0x1E80, 0x02),
SpecialObjectGFX(0x16, GFXAsset.sprLink, 0x1E40, 0x02),
SpecialObjectGFX(0x17, GFXAsset.sprLink, 0x1E80, 0x02),
SpecialObjectGFX(0x1a, GFXAsset.sprLink, 0x1EC0, 0x02),
SpecialObjectGFX(0x19, GFXAsset.sprLink, 0x1EA0, 0x02),
SpecialObjectGFX(0x19, GFXAsset.sprLink, 0x1EC0, 0x02),
SpecialObjectGFX(0x1a, GFXAsset.sprLink, 0x1EE0, 0x02),
SpecialObjectGFX(0x1a, GFXAsset.sprLink, 0x1EA0, 0x02),
SpecialObjectGFX(0x19, GFXAsset.sprLink, 0x1EE0, 0x02),
SpecialObjectGFX(0x1e, GFXAsset.sprLink, 0x1F00, 0x04),
SpecialObjectGFX(0x1b, GFXAsset.sprLink, 0x1F80, 0x04),
SpecialObjectGFX(0x1e, GFXAsset.sprLink, 0x1F40, 0x04),
SpecialObjectGFX(0x1c, GFXAsset.sprLink, 0x1F80, 0x04),
SpecialObjectGFX(0x1d, GFXAsset.sprLink, 0x1F00, 0x04),
SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x1FC0, 0x04),
SpecialObjectGFX(0x1d, GFXAsset.sprLink, 0x1F40, 0x04),
SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x1FC0, 0x04),
SpecialObjectGFX(0x1b, GFXAsset.sprLink, 0x2040, 0x04),
SpecialObjectGFX(0x1e, GFXAsset.sprLink, 0x2000, 0x04),
SpecialObjectGFX(0x1c, GFXAsset.sprLink, 0x2040, 0x04),
SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x2080, 0x04),
SpecialObjectGFX(0x1d, GFXAsset.sprLink, 0x2000, 0x04),
SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x2080, 0x04),
SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x20C0, 0x04),
SpecialObjectGFX(0x01, GFXAsset.sprLink, 0x2140, 0x04),
SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x2100, 0x04),
SpecialObjectGFX(0x00, GFXAsset.sprLink, 0x2140, 0x04),
SpecialObjectGFX(0x1f, GFXAsset.sprLink, 0x20C0, 0x04),
SpecialObjectGFX(0x1b, GFXAsset.sprLink, 0x2180, 0x04),
SpecialObjectGFX(0x1f, GFXAsset.sprLink, 0x2100, 0x04),
SpecialObjectGFX(0x1c, GFXAsset.sprLink, 0x2180, 0x04),
SpecialObjectGFX(0x25, GFXAsset.sprLink, 0x20C0, 0x04),
SpecialObjectGFX(0x23, GFXAsset.sprLink, 0x21C0, 0x04),
SpecialObjectGFX(0x22, GFXAsset.sprLink, 0x2100, 0x04),
SpecialObjectGFX(0x20, GFXAsset.sprLink, 0x21C0, 0x04),
SpecialObjectGFX(0x26, GFXAsset.sprLink, 0x20C0, 0x04),
SpecialObjectGFX(0x24, GFXAsset.sprLink, 0x2200, 0x04),
SpecialObjectGFX(0x21, GFXAsset.sprLink, 0x2100, 0x04),
SpecialObjectGFX(0x25, GFXAsset.sprLink, 0x2200, 0x04),
SpecialObjectGFX(0x27, GFXAsset.sprLink, 0x20C0, 0x04),
SpecialObjectGFX(0x2a, GFXAsset.sprLink, 0x2240, 0x04),
SpecialObjectGFX(0x28, GFXAsset.sprLink, 0x2100, 0x04),
SpecialObjectGFX(0x29, GFXAsset.sprLink, 0x2240, 0x04),
SpecialObjectGFX(0x06, GFXAsset.sprLink, 0x22A0, 0x02),
SpecialObjectGFX(0x2c, GFXAsset.sprLink, 0x22C0, 0x02),
SpecialObjectGFX(0x2b, GFXAsset.sprLink, 0x22C0, 0x02),
SpecialObjectGFX(0x15, GFXAsset.none),
];

alias specialObject12GFXPointers = specialObject0EGFXPointers;
immutable specialObject0EGFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprMaple, 0x0000, 0x0C),
	SpecialObjectGFX(0x01, GFXAsset.none),
	SpecialObjectGFX(0x02, GFXAsset.sprMaple, 0x01C0, 0x0C),
	SpecialObjectGFX(0x03, GFXAsset.none),
	SpecialObjectGFX(0x04, GFXAsset.sprMaple, 0x02E0, 0x0C),
	SpecialObjectGFX(0x05, GFXAsset.sprMaple, 0x04A0, 0x0A),
	SpecialObjectGFX(0x06, GFXAsset.sprMaple, 0x0540, 0x08),
	SpecialObjectGFX(0x07, GFXAsset.sprMaple, 0x05C0, 0x08),
	SpecialObjectGFX(0x08, GFXAsset.sprMaple, 0x0040, 0x08),
	SpecialObjectGFX(0x09, GFXAsset.none),
	SpecialObjectGFX(0x0A, GFXAsset.sprMaple, 0x0200, 0x08),
	SpecialObjectGFX(0x0B, GFXAsset.none),
	SpecialObjectGFX(0x0C, GFXAsset.sprMaple, 0x0320, 0x08),
	SpecialObjectGFX(0x0D, GFXAsset.sprMaple, 0x04E0, 0x06),
	SpecialObjectGFX(0x0E, GFXAsset.sprMaple, 0x0320, 0x08),
	SpecialObjectGFX(0x0F, GFXAsset.sprMaple, 0x04E0, 0x06),
	SpecialObjectGFX(0x10, GFXAsset.sprMaple, 0x08E0, 0x0A),
	SpecialObjectGFX(0x11, GFXAsset.sprMaple, 0x0980, 0x04),
	SpecialObjectGFX(0x12, GFXAsset.sprMaple, 0x0840, 0x0A),
	SpecialObjectGFX(0x13, GFXAsset.sprMaple, 0x08E0, 0x0A),
	SpecialObjectGFX(0x14, GFXAsset.sprMaple, 0x0980, 0x04),
	SpecialObjectGFX(0x15, GFXAsset.sprMaple, 0x0840, 0x0A),
	SpecialObjectGFX(0x16, GFXAsset.none),
	SpecialObjectGFX(0x17, GFXAsset.sprMaple, 0x0640, 0x0A),
	SpecialObjectGFX(0x18, GFXAsset.sprMaple, 0x06E0, 0x06),
	SpecialObjectGFX(0x19, GFXAsset.sprMaple, 0x0740, 0x0C),
	SpecialObjectGFX(0x1A, GFXAsset.sprMaple, 0x0800, 0x0A),
	SpecialObjectGFX(0x1B, GFXAsset.sprMaple, 0x09C0, 0x08),
	SpecialObjectGFX(0x1C, GFXAsset.sprMaple, 0x0800, 0x08),
	SpecialObjectGFX(0x1D, GFXAsset.sprMaple, 0x0100, 0x06),
	SpecialObjectGFX(0x1E, GFXAsset.none),
	SpecialObjectGFX(0x1F, GFXAsset.sprMaple, 0x0240, 0x0A),
	SpecialObjectGFX(0x20, GFXAsset.none),
	SpecialObjectGFX(0x21, GFXAsset.sprMaple, 0x0360, 0x08),
	SpecialObjectGFX(0x22, GFXAsset.sprMaple, 0x0520, 0x02),
	SpecialObjectGFX(0x23, GFXAsset.sprMaple, 0x0100, 0x0C),
	SpecialObjectGFX(0x24, GFXAsset.none),
	SpecialObjectGFX(0x25, GFXAsset.none),
	SpecialObjectGFX(0x26, GFXAsset.sprMaple, 0x0A20, 0x08),
	SpecialObjectGFX(0x27, GFXAsset.sprMaple, 0x0AA0, 0x08),
	SpecialObjectGFX(0x28, GFXAsset.sprMaple, 0x0AA0, 0x08),
	SpecialObjectGFX(0x29, GFXAsset.sprMaple, 0x0080, 0x08),
	SpecialObjectGFX(0x2A, GFXAsset.none),
	SpecialObjectGFX(0x2B, GFXAsset.sprMaple, 0x0240, 0x08),
	SpecialObjectGFX(0x2C, GFXAsset.none),
	SpecialObjectGFX(0x2D, GFXAsset.sprMaple, 0x03E0, 0x0C),
	SpecialObjectGFX(0x2E, GFXAsset.sprMaple, 0x03E0, 0x0C),
	SpecialObjectGFX(0x2F, GFXAsset.none),
	SpecialObjectGFX(0x30, GFXAsset.sprMaple, 0x0360, 0x08),
	SpecialObjectGFX(0x31, GFXAsset.sprMaple, 0x0520, 0x02),
	SpecialObjectGFX(0x32, GFXAsset.sprMaple, 0x0800, 0x0A),
	SpecialObjectGFX(0x33, GFXAsset.sprMaple, 0x09C0, 0x08),
	SpecialObjectGFX(0x34, GFXAsset.sprMaple, 0x0800, 0x08),
	SpecialObjectGFX(0x35, GFXAsset.sprMaple, 0x0A20, 0x08),
	SpecialObjectGFX(0x36, GFXAsset.sprMaple, 0x0AA0, 0x08),
	SpecialObjectGFX(0x37, GFXAsset.sprMaple, 0x0AA0, 0x08),
	SpecialObjectGFX(0x38, GFXAsset.none),
];

alias specialObject12AnimationDataPointers = specialObject0eAnimationDataPointers;
immutable specialObject0eAnimationDataPointers = [
	animationData1a385,
	animationData1a38d,
	animationData1a395,
	animationData1a39d,
	animationData1a3a5,
	animationData1a3ad,
	animationData1a3b5,
	animationData1a3bd,
	animationData1a3c5,
	animationData1a3cd,
	animationData1a3d5,
	animationData1a3dd,
	animationData1a3e5,
	animationData1a3ed,
	animationData1a3f5,
	animationData1a3fd,
	animationData1a405,
	animationData1a411,
	animationData1a41d,
	animationData1a429,
	animationData1a435,
	animationData1a441,
	animationData1a44d,
	animationData1a455,
	animationData1a45d,
	animationData1a468,
	animationData1a46d,
	animationData1a473,
	animationData1a385,
	animationData1a385,
	animationData1a385,
	animationData1a385,
];

immutable animationData1a385 = [
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x01, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a38d = [
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x03, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a395 = [
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x05, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a39d = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x07, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3a5 = [
	AnimationData.frame(0x08, 0x0a, 0x00),
	AnimationData.frame(0x08, 0x0b, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3ad = [
	AnimationData.frame(0x08, 0x0e, 0x00),
	AnimationData.frame(0x08, 0x0f, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3b5 = [
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x08, 0x09, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3bd = [
	AnimationData.frame(0x08, 0x0c, 0x00),
	AnimationData.frame(0x08, 0x0d, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3c5 = [
	AnimationData.frame(0x08, 0x2b, 0x00),
	AnimationData.frame(0x08, 0x2c, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3cd = [
	AnimationData.frame(0x08, 0x2e, 0x00),
	AnimationData.frame(0x08, 0x2f, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3d5 = [
	AnimationData.frame(0x08, 0x29, 0x00),
	AnimationData.frame(0x08, 0x2a, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3dd = [
	AnimationData.frame(0x08, 0x2d, 0x00),
	AnimationData.frame(0x08, 0x16, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3e5 = [
	AnimationData.frame(0x08, 0x1f, 0x00),
	AnimationData.frame(0x08, 0x20, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3ed = [
	AnimationData.frame(0x08, 0x30, 0x00),
	AnimationData.frame(0x08, 0x31, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3f5 = [
	AnimationData.frame(0x08, 0x1d, 0x00),
	AnimationData.frame(0x08, 0x1e, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a3fd = [
	AnimationData.frame(0x08, 0x21, 0x00),
	AnimationData.frame(0x08, 0x22, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a405 = [
	AnimationData.frame(0x01, 0x10, 0x00),
	AnimationData.frame(0x04, 0x11, 0x00),
	AnimationData.frame(0x04, 0x12, 0x00),
	AnimationData.frame(0x7f, 0x11, 0xff),
];

immutable animationData1a411 = [
	AnimationData.frame(0x01, 0x13, 0x00),
	AnimationData.frame(0x04, 0x14, 0x00),
	AnimationData.frame(0x04, 0x15, 0x00),
	AnimationData.frame(0x7f, 0x14, 0xff),
];

immutable animationData1a41d = [
	AnimationData.frame(0x01, 0x1a, 0x00),
	AnimationData.frame(0x04, 0x1b, 0x00),
	AnimationData.frame(0x04, 0x1c, 0x00),
	AnimationData.frame(0x7f, 0x1c, 0xff),
];

immutable animationData1a429 = [
	AnimationData.frame(0x01, 0x32, 0x00),
	AnimationData.frame(0x04, 0x33, 0x00),
	AnimationData.frame(0x04, 0x34, 0x00),
	AnimationData.frame(0x7f, 0x33, 0xff),
];

immutable animationData1a435 = [
	AnimationData.frame(0x08, 0x26, 0x00),
	AnimationData.frame(0x08, 0x27, 0x00),
	AnimationData.frame(0x08, 0x28, 0x00),
	AnimationData.frame(0x7f, 0x28, 0xff),
];

immutable animationData1a441 = [
	AnimationData.frame(0x08, 0x35, 0x00),
	AnimationData.frame(0x08, 0x36, 0x00),
	AnimationData.frame(0x08, 0x37, 0x00),
	AnimationData.frame(0x7f, 0x36, 0xff),
];

immutable animationData1a44d = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x07, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a455 = [
	AnimationData.frame(0x08, 0x17, 0x00),
	AnimationData.frame(0x08, 0x18, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a45d = [
	AnimationData.frame(0x08, 0x23, 0x00),
	AnimationData.frame(0x08, 0x24, 0x00),
	AnimationData.frame(0x08, 0x25, 0x00),
	AnimationData.loop(-3),
];

immutable animationData1a468 = [
	AnimationData.frame(0x7f, 0x38, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1a46d = [
	AnimationData.frame(0x1e, 0x19, 0x00),
	AnimationData.frame(0x7f, 0x19, 0xff),
];

immutable animationData1a473 = [
	AnimationData.frame(0x7f, 0x12, 0x00),
	AnimationData.frame(0x7f, 0x11, 0xff),
];

alias specialObject12OAMDataPointers = specialObject0EOAMDataPointers;
immutable specialObject0EOAMDataPointers = [
	oamData4C200,
	oamData4C211,
	oamData4C200,
	oamData4C211,
	oamData4C222,
	oamData4C233,
	oamData4C244,
	oamData4C255,
	oamData4C266,
	oamData4C277,
	oamData4C266,
	oamData4C277,
	oamData4C288,
	oamData4C299,
	oamData4C2AA,
	oamData4C2BB,
	oamData4C2CC,
	oamData4C2E1,
	oamData4C2F6,
	oamData4C30B,
	oamData4C320,
	oamData4C335,
	oamData4C381,
	oamData4C3C0,
	oamData4C3C0,
	oamData4C3D5,
	oamData4C3EE,
	oamData4C403,
	oamData4C418,
	oamData4C46C,
	oamData4C47D,
	oamData4C48E,
	oamData4C49F,
	oamData4C4B0,
	oamData4C4C1,
	oamData4C4F4,
	oamData4C509,
	oamData4C51E,
	oamData4C533,
	oamData4C544,
	oamData4C544,
	oamData4C34A,
	oamData4C35B,
	oamData4C34A,
	oamData4C35B,
	oamData4C36C,
	oamData4C396,
	oamData4C3AB,
	oamData4C4D2,
	oamData4C4E3,
	oamData4C42D,
	oamData4C442,
	oamData4C457,
	oamData4C555,
	oamData4C566,
	oamData4C577,
	oamData4C588,
];

alias specialObject0FGFXPointers = specialObject0BGFXPointers;
immutable specialObject0BGFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprRicky, 0x0000, 0x08),
	SpecialObjectGFX(0x01, GFXAsset.sprRicky, 0x0080, 0x04),
	SpecialObjectGFX(0x02, GFXAsset.sprRicky, 0x00C0, 0x08),
	SpecialObjectGFX(0x03, GFXAsset.sprRicky, 0x0140, 0x0A),
	SpecialObjectGFX(0x04, GFXAsset.sprRicky, 0x01E0, 0x08),
	SpecialObjectGFX(0x05, GFXAsset.sprRicky, 0x0260, 0x08),
	SpecialObjectGFX(0x06, GFXAsset.sprRicky, 0x02E0, 0x08),
	SpecialObjectGFX(0x07, GFXAsset.sprRicky, 0x0360, 0x0E),
	SpecialObjectGFX(0x08, GFXAsset.sprRicky, 0x0440, 0x0E),
	SpecialObjectGFX(0x09, GFXAsset.sprRicky, 0x0360, 0x0E),
	SpecialObjectGFX(0x0A, GFXAsset.sprRicky, 0x0440, 0x0E),
	SpecialObjectGFX(0x03, GFXAsset.sprRicky, 0x0140, 0x0C),
	SpecialObjectGFX(0x04, GFXAsset.sprRicky, 0x01E0, 0x08),
	SpecialObjectGFX(0x0D, GFXAsset.sprRicky, 0x0520, 0x0C),
	SpecialObjectGFX(0x0E, GFXAsset.none),
	SpecialObjectGFX(0x0F, GFXAsset.sprRicky, 0x05E0, 0x0C),
	SpecialObjectGFX(0x10, GFXAsset.none),
	SpecialObjectGFX(0x11, GFXAsset.sprRicky, 0x0940, 0x0E),
	SpecialObjectGFX(0x12, GFXAsset.sprRicky, 0x0A20, 0x0E),
	SpecialObjectGFX(0x13, GFXAsset.sprRicky, 0x06A0, 0x0E),
	SpecialObjectGFX(0x14, GFXAsset.sprRicky, 0x0780, 0x0E),
	SpecialObjectGFX(0x15, GFXAsset.sprRicky, 0x0940, 0x0E),
	SpecialObjectGFX(0x16, GFXAsset.sprRicky, 0x0A20, 0x0E),
	SpecialObjectGFX(0x17, GFXAsset.sprRicky, 0x06A0, 0x0E),
	SpecialObjectGFX(0x18, GFXAsset.sprRicky, 0x0780, 0x0E),
	SpecialObjectGFX(0x19, GFXAsset.sprRicky, 0x0860, 0x04),
	SpecialObjectGFX(0x1A, GFXAsset.sprRicky, 0x08A0, 0x02),
	SpecialObjectGFX(0x1B, GFXAsset.sprRicky, 0x08C0, 0x02),
	SpecialObjectGFX(0x1C, GFXAsset.sprRicky, 0x08E0, 0x06),
	SpecialObjectGFX(0x1D, GFXAsset.none),
	SpecialObjectGFX(0x1E, GFXAsset.sprRicky, 0x0BE0, 0x0E),
	SpecialObjectGFX(0x1F, GFXAsset.none),
	SpecialObjectGFX(0x20, GFXAsset.none),
	SpecialObjectGFX(0x21, GFXAsset.sprRicky, 0x0CC0, 0x10),
	SpecialObjectGFX(0x22, GFXAsset.none),
	SpecialObjectGFX(0x23, GFXAsset.none),
	SpecialObjectGFX(0x24, GFXAsset.sprRicky, 0x0B00, 0x0E),
	SpecialObjectGFX(0x25, GFXAsset.none),
	SpecialObjectGFX(0x26, GFXAsset.none),
	SpecialObjectGFX(0x27, GFXAsset.sprRicky, 0x0CC0, 0x10),
	SpecialObjectGFX(0x28, GFXAsset.none),
	SpecialObjectGFX(0x29, GFXAsset.none),
	SpecialObjectGFX(0x2A, GFXAsset.sprRicky, 0x0DC0, 0x0A),
	SpecialObjectGFX(0x2B, GFXAsset.sprRicky, 0x0E60, 0x04),
	SpecialObjectGFX(0x2C, GFXAsset.sprRicky, 0x0EA0, 0x04),
	SpecialObjectGFX(0x2D, GFXAsset.sprRicky, 0x0EE0, 0x0C),
	SpecialObjectGFX(0x2E, GFXAsset.none),
	SpecialObjectGFX(0x2F, GFXAsset.sprRicky, 0x0FA0, 0x0C),
	SpecialObjectGFX(0x30, GFXAsset.none),
	SpecialObjectGFX(0x31, GFXAsset.sprRicky, 0x1060, 0x0E),
	SpecialObjectGFX(0x32, GFXAsset.sprRicky, 0x1060, 0x0E),
	SpecialObjectGFX(0x33, GFXAsset.sprRicky, 0x1140, 0x0E),
];

alias specialObject0fAnimationDataPointers = specialObject0bAnimationDataPointers;
immutable specialObject0bAnimationDataPointers = [
	animationData1a5d1,
	animationData1a5f1,
	animationData1a5f9,
	animationData1a601,
	animationData1a609,
	animationData1a611,
	animationData1a61c,
	animationData1a627,
	animationData1a632,
	animationData1a64f,
	animationData1a65b,
	animationData1a66a,
	animationData1a676,
	animationData1a685,
	animationData1a691,
	animationData1a6ae,
	animationData1a6b6,
	animationData1a6be,
	animationData1a6c6,
	animationData1a6ce,
	animationData1a6d9,
	animationData1a6e4,
	animationData1a6ef,
	animationData1a6fa,
	animationData1a63d,
	animationData1a614,
	animationData1a61f,
	animationData1a62a,
	animationData1a635,
	animationData1a60c,
	animationData1a71a,
	animationData1a71d,
	animationData1a729,
	animationData1a734,
	animationData1a73f,
	animationData1a74a,
	animationData1a755,
];

immutable animationData1a5d1 = [
	AnimationData.frame(0x14, 0x00, 0x00),
	AnimationData.frame(0x06, 0x01, 0x00),
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.frame(0x06, 0x01, 0x00),
	AnimationData.frame(0x14, 0x00, 0x00),
	AnimationData.frame(0x01, 0x00, 0x80),
	AnimationData.frame(0x09, 0x02, 0x40),
	AnimationData.frame(0x09, 0x00, 0x00),
	AnimationData.frame(0x01, 0x00, 0x80),
	AnimationData.frame(0x09, 0x02, 0x01),
	AnimationData.loop(-10),
];

immutable animationData1a5f1 = [
	AnimationData.frame(0x01, 0x06, 0x40),

	AnimationData.frame(0x7f, 0x05, 0x80),
	AnimationData.loop(-1),
];

immutable animationData1a5f9 = [
	AnimationData.frame(0x01, 0x0a, 0x40),

	AnimationData.frame(0x7f, 0x09, 0x80),
	AnimationData.loop(-1),
];

immutable animationData1a601 = [
	AnimationData.frame(0x01, 0x04, 0x40),

	AnimationData.frame(0x7f, 0x03, 0x80),
	AnimationData.loop(-1),
];

immutable animationData1a609 = [
	AnimationData.frame(0x01, 0x08, 0x40),
];

immutable animationData1a60c = [
	AnimationData.frame(0x7f, 0x07, 0x80),
	AnimationData.loop(-1),
];

immutable animationData1a611 = [
	AnimationData.frame(0x01, 0x05, 0x00),
];

immutable animationData1a614 = [
	AnimationData.frame(0x01, 0x06, 0x40),

	AnimationData.frame(0x7f, 0x05, 0x80),
	AnimationData.loop(-1),
];

immutable animationData1a61c = [
	AnimationData.frame(0x01, 0x15, 0x01),
];

immutable animationData1a61f = [
	AnimationData.frame(0x01, 0x16, 0x44),

	AnimationData.frame(0x7f, 0x15, 0x81),
	AnimationData.loop(-1),
];

immutable animationData1a627 = [
	AnimationData.frame(0x01, 0x03, 0x02),
];

immutable animationData1a62a = [
	AnimationData.frame(0x01, 0x04, 0x45),

	AnimationData.frame(0x7f, 0x03, 0x82),
	AnimationData.loop(-1),
];

immutable animationData1a632 = [
	AnimationData.frame(0x01, 0x11, 0x03),
];

immutable animationData1a635 = [
	AnimationData.frame(0x01, 0x12, 0x46),

	AnimationData.frame(0x7f, 0x11, 0x83),
	AnimationData.loop(-1),
];

immutable animationData1a63d = [
	AnimationData.frame(0x3c, 0x05, 0x01),
	AnimationData.frame(0x01, 0x05, 0x00),
	AnimationData.frame(0x0a, 0x0f, 0x01),
	AnimationData.frame(0x01, 0x10, 0x01),
	AnimationData.frame(0x0a, 0x10, 0x01),
	AnimationData.frame(0x7f, 0x10, 0x80),
];

immutable animationData1a64f = [
	AnimationData.frame(0x0a, 0x0f, 0x00),
	AnimationData.frame(0x01, 0x10, 0x40),
	AnimationData.frame(0x0a, 0x10, 0x00),
	AnimationData.frame(0x7f, 0x10, 0x80),
];

immutable animationData1a65b = [
	AnimationData.frame(0x08, 0x17, 0x07),
	AnimationData.frame(0x06, 0x15, 0x01),
	AnimationData.frame(0x01, 0x18, 0x4a),
	AnimationData.frame(0x08, 0x18, 0x0a),
	AnimationData.frame(0x7f, 0x18, 0x8a),
];

immutable animationData1a66a = [
	AnimationData.frame(0x0a, 0x0d, 0x08),
	AnimationData.frame(0x01, 0x0e, 0x4b),
	AnimationData.frame(0x0a, 0x0e, 0x0b),
	AnimationData.frame(0x7f, 0x0e, 0x8b),
];

immutable animationData1a676 = [
	AnimationData.frame(0x08, 0x13, 0x09),
	AnimationData.frame(0x06, 0x11, 0x03),
	AnimationData.frame(0x01, 0x14, 0x4c),
	AnimationData.frame(0x08, 0x14, 0x0c),
	AnimationData.frame(0x7f, 0x14, 0x8c),
];

immutable animationData1a685 = [
	AnimationData.frame(0x14, 0x19, 0x00),
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x0a, 0x1b, 0x00),
	AnimationData.frame(0x7f, 0x1b, 0x80),
];

immutable animationData1a691 = [
	AnimationData.frame(0x0a, 0x1c, 0x00),
	AnimationData.frame(0x0a, 0x1d, 0x00),
	AnimationData.frame(0x0a, 0x1c, 0x00),
	AnimationData.frame(0x0a, 0x1d, 0x00),
	AnimationData.frame(0x0a, 0x2b, 0x00),
	AnimationData.frame(0x0a, 0x2c, 0x00),
	AnimationData.frame(0x0a, 0x2b, 0x00),

	AnimationData.frame(0x0a, 0x2c, 0x00),
	AnimationData.frame(0x7f, 0x2c, 0x80),
	AnimationData.loop(-2),
];

immutable animationData1a6ae = [
	AnimationData.frame(0x01, 0x05, 0x00),

	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1a6b6 = [
	AnimationData.frame(0x01, 0x15, 0x01),

	AnimationData.frame(0x7f, 0x16, 0x04),
	AnimationData.loop(-1),
];

immutable animationData1a6be = [
	AnimationData.frame(0x01, 0x0b, 0x02),

	AnimationData.frame(0x7f, 0x0c, 0x05),
	AnimationData.loop(-1),
];

immutable animationData1a6c6 = [
	AnimationData.frame(0x01, 0x11, 0x03),

	AnimationData.frame(0x7f, 0x12, 0x06),
	AnimationData.loop(-1),
];

immutable animationData1a6ce = [
	AnimationData.frame(0x03, 0x1e, 0x00),
	AnimationData.frame(0x03, 0x1f, 0x00),
	AnimationData.frame(0x03, 0x20, 0x00),
	AnimationData.loop(-3),
];

immutable animationData1a6d9 = [
	AnimationData.frame(0x03, 0x21, 0x00),
	AnimationData.frame(0x03, 0x22, 0x00),
	AnimationData.frame(0x03, 0x23, 0x00),
	AnimationData.loop(-3),
];

immutable animationData1a6e4 = [
	AnimationData.frame(0x03, 0x24, 0x00),
	AnimationData.frame(0x03, 0x25, 0x00),
	AnimationData.frame(0x03, 0x26, 0x00),
	AnimationData.loop(-3),
];

immutable animationData1a6ef = [
	AnimationData.frame(0x03, 0x27, 0x00),
	AnimationData.frame(0x03, 0x28, 0x00),
	AnimationData.frame(0x03, 0x29, 0x00),
	AnimationData.loop(-3),
];

immutable animationData1a6fa = [
	AnimationData.frame(0x14, 0x03, 0x00),
	AnimationData.frame(0x06, 0x2a, 0x00),
	AnimationData.frame(0x06, 0x03, 0x00),
	AnimationData.frame(0x06, 0x2a, 0x00),
	AnimationData.frame(0x14, 0x03, 0x00),
	AnimationData.frame(0x01, 0x03, 0x80),
	AnimationData.frame(0x09, 0x04, 0x40),
	AnimationData.frame(0x08, 0x03, 0x00),
	AnimationData.frame(0x01, 0x03, 0x80),
	AnimationData.frame(0x09, 0x04, 0x40),
	AnimationData.loop(-10),
];

immutable animationData1a71a = [
	AnimationData.frame(0x78, 0x09, 0x00),
];

immutable animationData1a71d = [
	AnimationData.frame(0x08, 0x17, 0x01),
	AnimationData.frame(0x06, 0x09, 0x00),
	AnimationData.frame(0x09, 0x18, 0x01),
	AnimationData.frame(0x7f, 0x18, 0xff),
];

immutable animationData1a729 = [
	AnimationData.frame(0x01, 0x05, 0x00),

	AnimationData.frame(0x0a, 0x2f, 0x00),
	AnimationData.frame(0x0a, 0x30, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a734 = [
	AnimationData.frame(0x01, 0x15, 0x01),

	AnimationData.frame(0x0a, 0x31, 0x30),
	AnimationData.frame(0x0a, 0x15, 0x01),
	AnimationData.loop(-2),
];

immutable animationData1a73f = [
	AnimationData.frame(0x01, 0x03, 0x02),

	AnimationData.frame(0x0a, 0x2d, 0x2f),
	AnimationData.frame(0x0a, 0x2e, 0x32),
	AnimationData.loop(-2),
];

immutable animationData1a74a = [
	AnimationData.frame(0x01, 0x11, 0x03),

	AnimationData.frame(0x0a, 0x32, 0x31),
	AnimationData.frame(0x0a, 0x11, 0x03),
	AnimationData.loop(-2),
];

immutable animationData1a755 = [
	AnimationData.frame(0x01, 0x07, 0x00),

	AnimationData.frame(0x0a, 0x33, 0x00),
	AnimationData.frame(0x0a, 0x07, 0x00),
	AnimationData.loop(-2),
];

alias specialObject0FOAMDataPointers = specialObject0BOAMDataPointers;
immutable specialObject0BOAMDataPointers = [
	oamData4C5BE,
	oamData4C5BE,
	oamData4C5BE,
	oamData4C5D3,
	oamData4C5BE,
	oamData4C5EC,
	oamData4C5EC,
	oamData4C6FF,
	oamData4C6FF,
	oamData4C71C,
	oamData4C71C,
	oamData4C5BE,
	oamData4C5BE,
	oamData4C605,
	oamData4C61E,
	oamData4C637,
	oamData4C650,
	oamData4C739,
	oamData4C756,
	oamData4C773,
	oamData4C773,
	oamData4C790,
	oamData4C7AD,
	oamData4C7CA,
	oamData4C7CA,
	oamData4C58E,
	oamData4C589,
	oamData4C589,
	oamData4C597,
	oamData4C5A4,
	oamData4C895,
	oamData4C7E7,
	oamData4C669,
	oamData4C919,
	oamData4C8B6,
	oamData4C804,
	oamData4C8D7,
	oamData4C821,
	oamData4C682,
	oamData4C93E,
	oamData4C8F8,
	oamData4C83E,
	oamData4C5D3,
	oamData4C5B1,
	oamData4C5B1,
	oamData4C69B,
	oamData4C6B4,
	oamData4C6CD,
	oamData4C6E6,
	oamData4C878,
	oamData4C85B,
	oamData4C85B,
];

alias specialObject10GFXPointers = specialObject0CGFXPointers;
immutable specialObject0CGFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprDimitri, 0x0000, 0x06),
	SpecialObjectGFX(0x01, GFXAsset.none),
	SpecialObjectGFX(0x02, GFXAsset.sprDimitri, 0x0240, 0x06),
	SpecialObjectGFX(0x03, GFXAsset.none),
	SpecialObjectGFX(0x04, GFXAsset.sprDimitri, 0x00A0, 0x06),
	SpecialObjectGFX(0x05, GFXAsset.none),
	SpecialObjectGFX(0x06, GFXAsset.sprDimitri, 0x02A0, 0x06),
	SpecialObjectGFX(0x07, GFXAsset.none),
	SpecialObjectGFX(0x08, GFXAsset.sprDimitri, 0x0140, 0x08),
	SpecialObjectGFX(0x09, GFXAsset.sprDimitri, 0x01C0, 0x08),
	SpecialObjectGFX(0x0A, GFXAsset.sprDimitri, 0x0320, 0x0A),
	SpecialObjectGFX(0x0B, GFXAsset.sprDimitri, 0x03C0, 0x0A),
	SpecialObjectGFX(0x0C, GFXAsset.sprDimitri, 0x0140, 0x08),
	SpecialObjectGFX(0x0D, GFXAsset.sprDimitri, 0x01C0, 0x08),
	SpecialObjectGFX(0x0E, GFXAsset.sprDimitri, 0x0320, 0x0A),
	SpecialObjectGFX(0x0F, GFXAsset.sprDimitri, 0x03C0, 0x0A),
	SpecialObjectGFX(0x10, GFXAsset.sprDimitri, 0x0900, 0x02),
	SpecialObjectGFX(0x11, GFXAsset.sprDimitri, 0x0920, 0x02),
	SpecialObjectGFX(0x12, GFXAsset.sprDimitri, 0x0940, 0x06),
	SpecialObjectGFX(0x13, GFXAsset.sprDimitri, 0x0940, 0x06),
	SpecialObjectGFX(0x14, GFXAsset.sprDimitri, 0x04A0, 0x08),
	SpecialObjectGFX(0x15, GFXAsset.sprDimitri, 0x0700, 0x08),
	SpecialObjectGFX(0x16, GFXAsset.sprDimitri, 0x0540, 0x08),
	SpecialObjectGFX(0x17, GFXAsset.sprDimitri, 0x0760, 0x04),
	SpecialObjectGFX(0x18, GFXAsset.sprDimitri, 0x05C0, 0x08),
	SpecialObjectGFX(0x19, GFXAsset.sprDimitri, 0x0680, 0x08),
	SpecialObjectGFX(0x1A, GFXAsset.sprDimitri, 0x07C0, 0x08),
	SpecialObjectGFX(0x1B, GFXAsset.sprDimitri, 0x0880, 0x08),
	SpecialObjectGFX(0x1C, GFXAsset.sprDimitri, 0x05C0, 0x08),
	SpecialObjectGFX(0x1D, GFXAsset.sprDimitri, 0x0680, 0x08),
	SpecialObjectGFX(0x1E, GFXAsset.sprDimitri, 0x07C0, 0x08),
	SpecialObjectGFX(0x1F, GFXAsset.sprDimitri, 0x0880, 0x08),
	SpecialObjectGFX(0x20, GFXAsset.sprDimitri, 0x09A0, 0x04),
	SpecialObjectGFX(0x21, GFXAsset.sprDimitri, 0x09E0, 0x02),
	SpecialObjectGFX(0x22, GFXAsset.sprDimitri, 0x0A00, 0x02),
	SpecialObjectGFX(0x23, GFXAsset.sprDimitri, 0x0A20, 0x10),
	SpecialObjectGFX(0x24, GFXAsset.none),
	SpecialObjectGFX(0x25, GFXAsset.sprDimitri, 0x0060, 0x04),
	SpecialObjectGFX(0x26, GFXAsset.sprDimitri, 0x0120, 0x02),
	SpecialObjectGFX(0x27, GFXAsset.sprDimitri, 0x0460, 0x04),
	SpecialObjectGFX(0x28, GFXAsset.sprDimitri, 0x0460, 0x04),
	SpecialObjectGFX(0x29, GFXAsset.sprDimitri, 0x0000, 0x06),
	SpecialObjectGFX(0x2A, GFXAsset.none),
	SpecialObjectGFX(0x2B, GFXAsset.sprDimitri, 0x00A0, 0x06),
	SpecialObjectGFX(0x2C, GFXAsset.none),
	SpecialObjectGFX(0x2D, GFXAsset.sprDimitri, 0x0140, 0x08),
	SpecialObjectGFX(0x2E, GFXAsset.sprDimitri, 0x01C0, 0x08),
	SpecialObjectGFX(0x2F, GFXAsset.sprDimitri, 0x0140, 0x08),
	SpecialObjectGFX(0x30, GFXAsset.sprDimitri, 0x01C0, 0x08),
	SpecialObjectGFX(0x14, GFXAsset.sprDimitri, 0x0740, 0x02),
	SpecialObjectGFX(0x16, GFXAsset.sprDimitri, 0x0580, 0x02),
	SpecialObjectGFX(0x18, GFXAsset.sprDimitri, 0x0640, 0x04),
	SpecialObjectGFX(0x1C, GFXAsset.sprDimitri, 0x0640, 0x04),
	SpecialObjectGFX(0x0D, GFXAsset.sprDimitri, 0x01C0, 0x08),
];

alias specialObject10AnimationDataPointers = specialObject0cAnimationDataPointers;
immutable specialObject0cAnimationDataPointers = [
	animationData1a8ba,
	animationData1a8c2,
	animationData1a8ca,
	animationData1a8d2,
	animationData1a8da,
	animationData1a8e2,
	animationData1a8ed,
	animationData1a8f5,
	animationData1a900,
	animationData1a909,
	animationData1a912,
	animationData1a91b,
	animationData1a924,
	animationData1a92a,
	animationData1a935,
	animationData1a93b,
	animationData1a946,
	animationData1a951,
	animationData1a95c,
	animationData1a967,
	animationData1a972,
	animationData1a97d,
	animationData1a988,
	animationData1a993,
	animationData1a99e,
	animationData1a9a1,
	animationData1a9a4,
	animationData1a9a7,
	animationData1a9aa,
	animationData1a9af,
	animationData1a9b4,
	animationData1a9b9,
	animationData1a9be,
	animationData1a9c3,
	animationData1a9c8,
	animationData1a9cd,
	animationData1a9d2,
	animationData1a9e0,
	animationData1a9ec,
	animationData1a9f4,
];

immutable animationData1a8ba = [
	AnimationData.frame(0x0a, 0x2b, 0x0d),
	AnimationData.frame(0x0a, 0x2c, 0x11),
	AnimationData.loop(-2),
];

immutable animationData1a8c2 = [
	AnimationData.frame(0x0a, 0x2f, 0x0e),
	AnimationData.frame(0x0a, 0x30, 0x12),
	AnimationData.loop(-2),
];

immutable animationData1a8ca = [
	AnimationData.frame(0x0a, 0x29, 0x0f),
	AnimationData.frame(0x0a, 0x2a, 0x13),
	AnimationData.loop(-2),
];

immutable animationData1a8d2 = [
	AnimationData.frame(0x0a, 0x2d, 0x10),
	AnimationData.frame(0x0a, 0x2e, 0x14),
	AnimationData.loop(-2),
];

immutable animationData1a8da = [
	AnimationData.frame(0x18, 0x16, 0x0d),
	AnimationData.frame(0x01, 0x16, 0x8d),
	AnimationData.loop(-2),
];

immutable animationData1a8e2 = [
	AnimationData.frame(0x0c, 0x1c, 0x0e),
	AnimationData.frame(0x0c, 0x1d, 0x12),
	AnimationData.frame(0x01, 0x1d, 0x92),
	AnimationData.loop(-3),
];

immutable animationData1a8ed = [
	AnimationData.frame(0x18, 0x14, 0x0f),
	AnimationData.frame(0x01, 0x14, 0x8f),
	AnimationData.loop(-2),
];

immutable animationData1a8f5 = [
	AnimationData.frame(0x0c, 0x18, 0x10),
	AnimationData.frame(0x0c, 0x19, 0x14),
	AnimationData.frame(0x01, 0x19, 0x94),
	AnimationData.loop(-3),
];

immutable animationData1a900 = [
	AnimationData.frame(0x06, 0x06, 0x0d),
	AnimationData.frame(0x06, 0x07, 0x11),
	AnimationData.frame(0x08, 0x07, 0x91),
];

immutable animationData1a909 = [
	AnimationData.frame(0x06, 0x0e, 0x15),
	AnimationData.frame(0x06, 0x0f, 0x18),
	AnimationData.frame(0x08, 0x0f, 0x98),
];

immutable animationData1a912 = [
	AnimationData.frame(0x06, 0x02, 0x16),
	AnimationData.frame(0x06, 0x03, 0x19),
	AnimationData.frame(0x08, 0x03, 0x99),
];

immutable animationData1a91b = [
	AnimationData.frame(0x06, 0x0a, 0x17),
	AnimationData.frame(0x06, 0x0b, 0x1a),
	AnimationData.frame(0x08, 0x0b, 0x9a),
];

immutable animationData1a924 = [
	AnimationData.frame(0x0c, 0x17, 0x0d),
	AnimationData.frame(0x0c, 0x17, 0x8d),
];

immutable animationData1a92a = [
	AnimationData.frame(0x06, 0x1e, 0x15),

	AnimationData.frame(0x06, 0x1f, 0x18),
	AnimationData.frame(0x0c, 0x1f, 0x98),
	AnimationData.loop(-2),
];

immutable animationData1a935 = [
	AnimationData.frame(0x0c, 0x15, 0x16),
	AnimationData.frame(0x7f, 0x15, 0x96),
];

immutable animationData1a93b = [
	AnimationData.frame(0x06, 0x1a, 0x17),

	AnimationData.frame(0x06, 0x1b, 0x1a),
	AnimationData.frame(0x0c, 0x1b, 0x9a),
	AnimationData.loop(-2),
];

immutable animationData1a946 = [
	AnimationData.frame(0x02, 0x2b, 0x0d),

	AnimationData.frame(0x0a, 0x26, 0x0d),
	AnimationData.frame(0x0c, 0x2b, 0x0d),
	AnimationData.loop(-2),
];

immutable animationData1a951 = [
	AnimationData.frame(0x02, 0x2f, 0x0e),

	AnimationData.frame(0x0a, 0x28, 0x0e),
	AnimationData.frame(0x0c, 0x2f, 0x0e),
	AnimationData.loop(-2),
];

immutable animationData1a95c = [
	AnimationData.frame(0x02, 0x29, 0x0f),

	AnimationData.frame(0x0a, 0x25, 0x0f),
	AnimationData.frame(0x0c, 0x29, 0x0f),
	AnimationData.loop(-2),
];

immutable animationData1a967 = [
	AnimationData.frame(0x02, 0x2d, 0x10),

	AnimationData.frame(0x0a, 0x27, 0x10),
	AnimationData.frame(0x0c, 0x2d, 0x10),
	AnimationData.loop(-2),
];

immutable animationData1a972 = [
	AnimationData.frame(0x02, 0x16, 0x0d),

	AnimationData.frame(0x0a, 0x32, 0x0d),
	AnimationData.frame(0x0c, 0x17, 0x0d),
	AnimationData.loop(-2),
];

immutable animationData1a97d = [
	AnimationData.frame(0x02, 0x1c, 0x0e),

	AnimationData.frame(0x0a, 0x34, 0x0e),
	AnimationData.frame(0x0c, 0x1c, 0x0e),
	AnimationData.loop(-2),
];

immutable animationData1a988 = [
	AnimationData.frame(0x02, 0x14, 0x0f),

	AnimationData.frame(0x0a, 0x31, 0x0f),
	AnimationData.frame(0x0c, 0x14, 0x0f),
	AnimationData.loop(-2),
];

immutable animationData1a993 = [
	AnimationData.frame(0x02, 0x18, 0x10),

	AnimationData.frame(0x0a, 0x33, 0x10),
	AnimationData.frame(0x0c, 0x18, 0x10),
	AnimationData.loop(-2),
];

immutable animationData1a99e = [
	AnimationData.frame(0x7f, 0x11, 0x00),
];

immutable animationData1a9a1 = [
	AnimationData.frame(0x7f, 0x13, 0x00),
];

immutable animationData1a9a4 = [
	AnimationData.frame(0x7f, 0x10, 0x00),
];

immutable animationData1a9a7 = [
	AnimationData.frame(0x7f, 0x12, 0x00),
];

immutable animationData1a9aa = [
	AnimationData.frame(0x7f, 0x2b, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1a9af = [
	AnimationData.frame(0x7f, 0x2f, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1a9b4 = [
	AnimationData.frame(0x7f, 0x29, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1a9b9 = [
	AnimationData.frame(0x7f, 0x2d, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1a9be = [
	AnimationData.frame(0x7f, 0x16, 0x01),
	AnimationData.loop(-1),
];

immutable animationData1a9c3 = [
	AnimationData.frame(0x0c, 0x1c, 0x01),
	AnimationData.loop(-1),
];

immutable animationData1a9c8 = [
	AnimationData.frame(0x7f, 0x14, 0x01),
	AnimationData.loop(-1),
];

immutable animationData1a9cd = [
	AnimationData.frame(0x0c, 0x18, 0x01),
	AnimationData.loop(-1),
];

immutable animationData1a9d2 = [
	AnimationData.frame(0x3c, 0x23, 0x00),
	AnimationData.frame(0x0f, 0x24, 0x00),
	AnimationData.frame(0x0f, 0x23, 0x00),
	AnimationData.frame(0x19, 0x24, 0x00),
	AnimationData.loop(-4),
];

immutable animationData1a9e0 = [
	AnimationData.frame(0x14, 0x20, 0x00),
	AnimationData.frame(0x0a, 0x21, 0x00),
	AnimationData.frame(0x0a, 0x22, 0x00),
	AnimationData.frame(0x08, 0x22, 0xff),
];

immutable animationData1a9ec = [
	AnimationData.frame(0x0c, 0x0c, 0x00),
	AnimationData.frame(0x0c, 0x35, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1a9f4 = [
	AnimationData.frame(0x0c, 0x08, 0x00),
	AnimationData.frame(0x0c, 0x0a, 0x00),
	AnimationData.loop(-2),
];

alias specialObject10OAMDataPointers = specialObject0COAMDataPointers;
immutable specialObject0COAMDataPointers = [
	oamData4C963,
	oamData4C974,
	oamData4CA78,
	oamData4CA9A,
	oamData4C963,
	oamData4C974,
	oamData4CA89,
	oamData4CAAB,
	oamData4C985,
	oamData4C985,
	oamData4C996,
	oamData4C9AB,
	oamData4C9C0,
	oamData4C9C0,
	oamData4C9D1,
	oamData4C9E6,
	oamData4C9FB,
	oamData4C9FB,
	oamData4CA04,
	oamData4CA11,
	oamData4CA1E,
	oamData4CA1E,
	oamData4CA2F,
	oamData4CA2F,
	oamData4CA40,
	oamData4CA40,
	oamData4CA40,
	oamData4CA40,
	oamData4C9C0,
	oamData4C9C0,
	oamData4C9C0,
	oamData4C9C0,
	oamData4CA51,
	oamData4CA5A,
	oamData4CA5A,
	oamData4CA40,
	oamData4CA5F,
	oamData4CA78,
	oamData4CA89,
	oamData4CA40,
	oamData4C9C0,
	oamData4CA78,
	oamData4CA9A,
	oamData4CA89,
	oamData4CAAB,
	oamData4CA40,
	oamData4CA40,
	oamData4C9C0,
	oamData4C9C0,
];

alias specialObject11GFXPointers = specialObject0DGFXPointers;
immutable specialObject0DGFXPointers = [
	SpecialObjectGFX(0x00, GFXAsset.sprMoosh, 0x0000, 0x0E),
	SpecialObjectGFX(0x01, GFXAsset.none),
	SpecialObjectGFX(0x02, GFXAsset.sprMoosh, 0x00E0, 0x08),
	SpecialObjectGFX(0x03, GFXAsset.sprMoosh, 0x0160, 0x08),
	SpecialObjectGFX(0x04, GFXAsset.sprMoosh, 0x01E0, 0x0C),
	SpecialObjectGFX(0x05, GFXAsset.sprMoosh, 0x01E0, 0x0C),
	SpecialObjectGFX(0x06, GFXAsset.sprMoosh, 0x02A0, 0x0A),
	SpecialObjectGFX(0x07, GFXAsset.none),
	SpecialObjectGFX(0x08, GFXAsset.sprMoosh, 0x0340, 0x0A),
	SpecialObjectGFX(0x09, GFXAsset.none),
	SpecialObjectGFX(0x0A, GFXAsset.sprMoosh, 0x03E0, 0x0C),
	SpecialObjectGFX(0x0B, GFXAsset.none),
	SpecialObjectGFX(0x0C, GFXAsset.sprMoosh, 0x03E0, 0x0C),
	SpecialObjectGFX(0x0D, GFXAsset.none),
	SpecialObjectGFX(0x0E, GFXAsset.sprMoosh, 0x02A0, 0x0A),
	SpecialObjectGFX(0x0F, GFXAsset.none),
	SpecialObjectGFX(0x10, GFXAsset.sprMoosh, 0x0340, 0x0A),
	SpecialObjectGFX(0x11, GFXAsset.none),
	SpecialObjectGFX(0x12, GFXAsset.sprMoosh, 0x03E0, 0x0C),
	SpecialObjectGFX(0x13, GFXAsset.none),
	SpecialObjectGFX(0x14, GFXAsset.sprMoosh, 0x03E0, 0x0C),
	SpecialObjectGFX(0x15, GFXAsset.none),
	SpecialObjectGFX(0x16, GFXAsset.sprMoosh, 0x04A0, 0x06),
	SpecialObjectGFX(0x17, GFXAsset.none),
	SpecialObjectGFX(0x18, GFXAsset.sprMoosh, 0x0500, 0x04),
	SpecialObjectGFX(0x19, GFXAsset.sprMoosh, 0x0540, 0x02),
	SpecialObjectGFX(0x1A, GFXAsset.sprMoosh, 0x0560, 0x02),
	SpecialObjectGFX(0x1B, GFXAsset.sprMoosh, 0x0580, 0x0C),
	SpecialObjectGFX(0x1C, GFXAsset.none),
	SpecialObjectGFX(0x1D, GFXAsset.sprMoosh, 0x0580, 0x0C),
	SpecialObjectGFX(0x1E, GFXAsset.none),
	SpecialObjectGFX(0x1F, GFXAsset.sprMoosh, 0x0640, 0x0C),
	SpecialObjectGFX(0x20, GFXAsset.none),
	SpecialObjectGFX(0x21, GFXAsset.sprMoosh, 0x0640, 0x0C),
	SpecialObjectGFX(0x22, GFXAsset.none),
	SpecialObjectGFX(0x23, GFXAsset.sprMoosh, 0x0700, 0x0C),
	SpecialObjectGFX(0x24, GFXAsset.sprMoosh, 0x07C0, 0x0C),
	SpecialObjectGFX(0x25, GFXAsset.sprMoosh, 0x0700, 0x0C),
	SpecialObjectGFX(0x26, GFXAsset.sprMoosh, 0x07C0, 0x0C),
	SpecialObjectGFX(0x27, GFXAsset.sprMoosh, 0x0700, 0x0C),
	SpecialObjectGFX(0x28, GFXAsset.sprMoosh, 0x07C0, 0x0C),
	SpecialObjectGFX(0x29, GFXAsset.sprMoosh, 0x0700, 0x0C),
	SpecialObjectGFX(0x2A, GFXAsset.sprMoosh, 0x07C0, 0x0C),
	SpecialObjectGFX(0x2B, GFXAsset.sprMoosh, 0x0880, 0x04),
	SpecialObjectGFX(0x2C, GFXAsset.sprMoosh, 0x08C0, 0x04),
	SpecialObjectGFX(0x2D, GFXAsset.sprMoosh, 0x0900, 0x0C),
	SpecialObjectGFX(0x2E, GFXAsset.none),
	SpecialObjectGFX(0x2F, GFXAsset.sprMoosh, 0x0B80, 0x04),
	SpecialObjectGFX(0x30, GFXAsset.sprMoosh, 0x0BC0, 0x04),
	SpecialObjectGFX(0x31, GFXAsset.sprMoosh, 0x09C0, 0x0C),
	SpecialObjectGFX(0x32, GFXAsset.none),
	SpecialObjectGFX(0x33, GFXAsset.sprMoosh, 0x0B80, 0x04),
	SpecialObjectGFX(0x34, GFXAsset.sprMoosh, 0x0BC0, 0x04),
	SpecialObjectGFX(0x35, GFXAsset.sprMoosh, 0x0A80, 0x10),
	SpecialObjectGFX(0x36, GFXAsset.none),
	SpecialObjectGFX(0x37, GFXAsset.sprMoosh, 0x0B80, 0x04),
	SpecialObjectGFX(0x38, GFXAsset.sprMoosh, 0x0BC0, 0x04),
	SpecialObjectGFX(0x39, GFXAsset.sprMoosh, 0x0A80, 0x10),
	SpecialObjectGFX(0x3A, GFXAsset.none),
	SpecialObjectGFX(0x3B, GFXAsset.sprMoosh, 0x0B80, 0x04),
	SpecialObjectGFX(0x3C, GFXAsset.sprMoosh, 0x0BC0, 0x04),
	SpecialObjectGFX(0x3D, GFXAsset.none),
	SpecialObjectGFX(0x3E, GFXAsset.none),
];

alias specialObject11AnimationDataPointers = specialObject0dAnimationDataPointers;
immutable specialObject0dAnimationDataPointers = [
	animationData1ab51,
	animationData1ab65,
	animationData1ab6a,
	animationData1ab6f,
	animationData1ab74,
	animationData1ab79,
	animationData1ab81,
	animationData1ab89,
	animationData1ab91,
	animationData1ab99,
	animationData1aba1,
	animationData1aba9,
	animationData1abb1,
	animationData1abb9,
	animationData1abda,
	animationData1abe6,
	animationData1abee,
	animationData1abf6,
	animationData1abfe,
	animationData1ac06,
	animationData1ac0e,
	animationData1ac16,
	animationData1ac1e,
	animationData1ac26,
	animationData1ac38,
	animationData1ac4a,
	animationData1ac5c,
];

immutable animationData1ab51 = [
	AnimationData.frame(0x0a, 0x00, 0x00),
	AnimationData.frame(0x0a, 0x00, 0x00),
	AnimationData.frame(0x14, 0x00, 0x00),
	AnimationData.frame(0x0a, 0x3d, 0x00),
	AnimationData.frame(0x0a, 0x3d, 0x00),
	AnimationData.frame(0x14, 0x3d, 0x00),
	AnimationData.loop(-6),
];

immutable animationData1ab65 = [
	AnimationData.frame(0x7f, 0x03, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1ab6a = [
	AnimationData.frame(0x7f, 0x05, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1ab6f = [
	AnimationData.frame(0x7f, 0x02, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1ab74 = [
	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.loop(-1),
];

immutable animationData1ab79 = [
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x08, 0x09, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1ab81 = [
	AnimationData.frame(0x08, 0x0c, 0x00),
	AnimationData.frame(0x08, 0x0d, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1ab89 = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x07, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1ab91 = [
	AnimationData.frame(0x08, 0x0a, 0x00),
	AnimationData.frame(0x08, 0x0b, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1ab99 = [
	AnimationData.frame(0x04, 0x10, 0x23),
	AnimationData.frame(0x04, 0x11, 0x27),
	AnimationData.loop(-2),
];

immutable animationData1aba1 = [
	AnimationData.frame(0x04, 0x14, 0x24),
	AnimationData.frame(0x04, 0x15, 0x28),
	AnimationData.loop(-2),
];

immutable animationData1aba9 = [
	AnimationData.frame(0x04, 0x0e, 0x25),
	AnimationData.frame(0x04, 0x0f, 0x29),
	AnimationData.loop(-2),
];

immutable animationData1abb1 = [
	AnimationData.frame(0x04, 0x12, 0x26),
	AnimationData.frame(0x04, 0x13, 0x2a),
	AnimationData.loop(-2),
];

immutable animationData1abb9 = [
	AnimationData.frame(0x1e, 0x16, 0x00),
	AnimationData.frame(0x06, 0x17, 0x00),
	AnimationData.frame(0x06, 0x16, 0x00),
	AnimationData.frame(0x06, 0x17, 0x00),
	AnimationData.frame(0x06, 0x16, 0x00),
	AnimationData.frame(0x1e, 0x17, 0x00),
	AnimationData.frame(0x0a, 0x2b, 0x00),
	AnimationData.frame(0x0a, 0x2c, 0x00),
	AnimationData.frame(0x0a, 0x2b, 0x00),
	AnimationData.frame(0x0a, 0x2c, 0x00),
	AnimationData.frame(0x7f, 0x2c, 0xff),
];

immutable animationData1abda = [
	AnimationData.frame(0x14, 0x18, 0x00),
	AnimationData.frame(0x0a, 0x19, 0x00),
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x7f, 0x1a, 0xff),
];

immutable animationData1abe6 = [
	AnimationData.frame(0x08, 0x1f, 0x00),
	AnimationData.frame(0x08, 0x20, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1abee = [
	AnimationData.frame(0x08, 0x27, 0x00),
	AnimationData.frame(0x08, 0x28, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1abf6 = [
	AnimationData.frame(0x08, 0x1b, 0x00),
	AnimationData.frame(0x08, 0x1c, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1abfe = [
	AnimationData.frame(0x08, 0x23, 0x00),
	AnimationData.frame(0x08, 0x24, 0x00),
	AnimationData.loop(-2),
];

immutable animationData1ac06 = [
	AnimationData.frame(0x08, 0x21, 0x1b),
	AnimationData.frame(0x08, 0x22, 0x1f),
	AnimationData.loop(-2),
];

immutable animationData1ac0e = [
	AnimationData.frame(0x08, 0x29, 0x1c),
	AnimationData.frame(0x08, 0x2a, 0x20),
	AnimationData.loop(-2),
];

immutable animationData1ac16 = [
	AnimationData.frame(0x08, 0x1d, 0x1d),
	AnimationData.frame(0x08, 0x1e, 0x21),
	AnimationData.loop(-2),
];

immutable animationData1ac1e = [
	AnimationData.frame(0x08, 0x25, 0x1e),
	AnimationData.frame(0x08, 0x26, 0x22),
	AnimationData.loop(-2),
];

immutable animationData1ac26 = [
	AnimationData.frame(0x04, 0x31, 0x2b),
	AnimationData.frame(0x04, 0x32, 0x2b),
	AnimationData.frame(0x04, 0x33, 0x2b),
	AnimationData.frame(0x04, 0x34, 0x2b),
	AnimationData.frame(0x0a, 0x31, 0x2b),
	AnimationData.frame(0x7f, 0x31, 0xab),
];

immutable animationData1ac38 = [
	AnimationData.frame(0x04, 0x39, 0x2c),
	AnimationData.frame(0x04, 0x3a, 0x2c),
	AnimationData.frame(0x04, 0x3b, 0x2c),
	AnimationData.frame(0x04, 0x3c, 0x2c),
	AnimationData.frame(0x0a, 0x39, 0x2c),
	AnimationData.frame(0x7f, 0x39, 0xac),
];

immutable animationData1ac4a = [
	AnimationData.frame(0x04, 0x2d, 0x2d),
	AnimationData.frame(0x04, 0x2e, 0x2d),
	AnimationData.frame(0x04, 0x2f, 0x2d),
	AnimationData.frame(0x04, 0x30, 0x2d),
	AnimationData.frame(0x0a, 0x2d, 0x2d),
	AnimationData.frame(0x7f, 0x2d, 0xad),
];

immutable animationData1ac5c = [
	AnimationData.frame(0x04, 0x35, 0x2e),
	AnimationData.frame(0x04, 0x36, 0x2e),
	AnimationData.frame(0x04, 0x37, 0x2e),
	AnimationData.frame(0x04, 0x38, 0x2e),
	AnimationData.frame(0x0a, 0x35, 0x2e),
	AnimationData.frame(0x7f, 0x35, 0xae),
];

alias specialObject11OAMDataPointers = specialObject0DOAMDataPointers;
immutable specialObject0DOAMDataPointers = [
	oamData4CABC,
	oamData4CAD5,
	oamData4CAEE,
	oamData4CAEE,
	oamData4CB07,
	oamData4CB20,
	oamData4CB39,
	oamData4CB52,
	oamData4CB39,
	oamData4CB52,
	oamData4CB6B,
	oamData4CB80,
	oamData4CB95,
	oamData4CBAA,
	oamData4CB39,
	oamData4CB52,
	oamData4CB39,
	oamData4CBBF,
	oamData4CBD8,
	oamData4CBED,
	oamData4CC02,
	oamData4CC17,
	oamData4CC2C,
	oamData4CC39,
	oamData4CC46,
	oamData4CC4F,
	oamData4CC4F,
	oamData4CC54,
	oamData4CC6D,
	oamData4CC86,
	oamData4CC6D,
	oamData4CC54,
	oamData4CC6D,
	oamData4CC54,
	oamData4CC6D,
	oamData4CC9F,
	oamData4CC9F,
	oamData4CC9F,
	oamData4CC9F,
	oamData4CCB8,
	oamData4CCB8,
	oamData4CCB8,
	oamData4CCB8,
	oamData4CCD1,
	oamData4CCD1,
	oamData4CCDE,
	oamData4CCF7,
	oamData4CD18,
	oamData4CD41,
	oamData4CD6A,
	oamData4CD83,
	oamData4CDA4,
	oamData4CDCD,
	oamData4CDF6,
	oamData4CE0F,
	oamData4CE30,
	oamData4CE59,
	oamData4CE82,
	oamData4CE9B,
	oamData4CEBC,
	oamData4CEE5,
	oamData4CF0E,
	oamData4CF27,
];
