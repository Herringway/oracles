module oracles.common.updateParts;

import oracles.common.objects.parts.commonCode;
import oracles.common.data.partCodeTable;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;

void updateParts() {
	activeObjectType = ObjectType.part;
	if ((scrollMode == 8) || (textIsActive != 0) || ((disabledObjects & 0x88) != 0)) {
		foreach (ref part; parts[]) {
			activeObject = cast(ubyte)(&part - &parts[0]);
			if (part.enabled == 0) {
				continue;
			}
			if (((part.enabled & 0x80) != 0) && (part.state != 0)) {
				continue;
			}
			updatePart(&part);
		}
	} else {
		foreach (ref part; parts[]) {
			activeObject = cast(ubyte)(&part - &parts[0]);
			if (part.enabled == 0) {
				continue;
			}
			updatePart(&part);
			part.var2A &= ~0x80;
		}
	}
}

void updatePart(GameObject* part) {
	ubyte status = partCommonStandardUpdate(part);
	partCodeTable[part.id](part, status);
}