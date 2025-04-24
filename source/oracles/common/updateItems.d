module oracles.common.updateItems;

import oracles.bank00;
static if (gameVersion == GameVersion.ages) {
	import oracles.ages.objects.items.caneOfSomaria;
	import oracles.ages.objects.items.seedShooter;
	import oracles.ages.objects.items.switchHook;
}
import oracles.common.objects.items.biggoronSword;
import oracles.common.objects.items.bombchus;
import oracles.common.objects.items.bombs;
import oracles.common.objects.items.boomerang;
import oracles.common.objects.items.bracelet;
import oracles.common.objects.items.commonBombAndBraceletCode;
import oracles.common.objects.items.commonCode1;
import oracles.common.objects.items.commonCode2;
import oracles.common.objects.items.dimitriMouth;
import oracles.common.objects.items.dust;
import oracles.common.objects.items.foolsOre;
import oracles.common.objects.items.magnetBall;
import oracles.common.objects.items.minecartCollision;
import oracles.common.objects.items.postUpdate;
import oracles.common.objects.items.punch;
import oracles.common.objects.items.rickyMooshAttack;
import oracles.common.objects.items.rickyTornado;
import oracles.common.objects.items.seeds;
import oracles.common.objects.items.shovel;
import oracles.common.objects.items.slingshot;
import oracles.common.objects.items.sword;
import oracles.common.objects.items.swordBeam;

import oracles.defs;
import oracles.external;
import oracles.globals;
import oracles.structures;

//;;
void updateItems() {
	bool dontUpdate;
	if ((scrollMode == 8) || ((disabledObjects & 0x90) != 0) || (paletteThreadMode != 0) || (textIsActive != 0)) {
		dontUpdate = true;
	}
	unnamedCC8B = (unnamedCC8B & 0xFE) | dontUpdate;
	scentSeedActive = 0;

	activeObjectType = ObjectType.item;
	foreach (ref item; itemObjects[6 .. 15]) {
		activeObject = cast(ubyte)(&item - &itemObjects[0]);
		if (item.enabled == 0) {
			continue;
		}
		// Always update items when uninitialized
		// If already initialized, don't update items if variable is set
		if ((item.state == 0) || (unnamedCC8B == 0)) {
			updateItem(&item);
		}
	}
}

alias itemCode01 = itemDelete;
alias itemCode10 = itemDelete;
alias itemCode11 = itemDelete;
alias itemCode12 = itemDelete;
alias itemCode14 = itemDelete;
alias itemCode17 = itemDelete;
alias itemCode19 = itemDelete;
alias itemCode1B = itemDelete;
alias itemCode1C = itemDelete;
alias itemCode1F = itemDelete;
alias itemCode25 = itemDelete;
alias itemCode26 = itemDelete;

static if (gameVersion == GameVersion.ages) {
	alias itemCode07 = itemDelete;
	alias itemCode08 = itemDelete;
	alias itemCode0E = itemDelete;
} else {
	alias itemCode04 = itemDelete;
	alias itemCode09 = itemDelete;
	alias itemCode0A = itemDelete;
	alias itemCode0B = itemDelete;
	alias itemCode0E = itemDelete;
	alias itemCode0F = itemDelete;
	alias itemCode18 = itemDelete;
	alias itemCode0APost = itemDelete;
	alias itemCode0BPost = itemDelete;
	alias itemCode0FPost = itemDelete;
}

//; @param d Item index
void updateItem(GameObject* object) {
	switch (object.id) {
		case 0: itemCode00(object); break;
		case 1: itemCode01(object); break;
		case 2: itemCode02(object); break;
		case 3: itemCode03(object); break;
		case 4: itemCode04(object); break;
		case 5: itemCode05(object); break;
		case 6: itemCode06(object); break;
		case 7: itemCode07(object); break;
		case 8: itemCode08(object); break;
		case 9: itemCode09(object); break;
		case 10: itemCode0A(object); break;
		case 11: itemCode0B(object); break;
		case 12: itemCode0C(object); break;
		case 13: itemCode0D(object); break;
		case 14: itemCode0E(object); break;
		case 15: itemCode0F(object); break;
		case 16: itemCode10(object); break;
		case 17: itemCode11(object); break;
		case 18: itemCode12(object); break;
		case 19: itemCode13(object); break;
		case 20: itemCode14(object); break;
		case 21: itemCode15(object); break;
		case 22: itemCode16(object); break;
		case 23: itemCode17(object); break;
		case 24: itemCode18(object); break;
		case 25: itemCode19(object); break;
		case 26: itemCode1A(object); break;
		case 27: itemCode1B(object); break;
		case 28: itemCode1C(object); break;
		case 29: itemCode1D(object); break;
		case 30: itemCode1E(object); break;
		case 31: itemCode1F(object); break;
		case 32: itemCode20(object); break;
		case 33: itemCode21(object); break;
		case 34: itemCode22(object); break;
		case 35: itemCode23(object); break;
		case 36: itemCode24(object); break;
		case 37: itemCode25(object); break;
		case 38: itemCode26(object); break;
		case 39: itemCode27(object); break;
		case 40: itemCode28(object); break;
		case 41: itemCode29(object); break;
		case 42: itemCode2A(object); break;
		case 43: itemCode2B(object); break;
		default: assert(0);
	}
}

//;;
//; The main difference between this and the above "updateItems" is that this is called
//; after all of the other objects have been updated. This also doesn't have any conditions
//; before it starts calling the update code.
//;
void updateItemsPost() {
	foreach (ref item; itemObjects[6 .. $]) {
		activeObject = cast(ubyte)(&item - &itemObjects[0]);
		if (item.enabled != 0) {
			updateItemPost(&item);
		}
	}
}

void itemCodeNilPost(GameObject*) {}

void updateItemPost(GameObject* object) {
	switch (object.id) {
		case 0: itemCode00Post(object); break;
		case 1: itemCodeNilPost(object); break;
		case 2: itemCode02Post(object); break;
		case 3: itemCodeNilPost(object); break;
		case 4: itemCode04Post(object); break;
		case 5: itemCode05Post(object); break;
		case 6: itemCodeNilPost(object); break;
		case 7: itemCode07Post(object); break;
		case 8: itemCode08Post(object); break;
		case 9: itemCodeNilPost(object); break;
		case 10: itemCode0APost(object); break;
		case 11: itemCode0BPost(object); break;
		case 12: itemCode0CPost(object); break;
		case 13: itemCodeNilPost(object); break;
		case 14: itemCodeNilPost(object); break;
		case 15: itemCode0FPost(object); break;
		case 16: itemCodeNilPost(object); break;
		case 17: itemCodeNilPost(object); break;
		case 18: itemCodeNilPost(object); break;
		case 19: itemCode13Post(object); break;
		case 20: itemCodeNilPost(object); break;
		case 21: itemCodeNilPost(object); break;
		case 22: itemCodeNilPost(object); break;
		case 23: itemCodeNilPost(object); break;
		case 24: itemCodeNilPost(object); break;
		case 25: itemCodeNilPost(object); break;
		case 26: itemCodeNilPost(object); break;
		case 27: itemCodeNilPost(object); break;
		case 28: itemCodeNilPost(object); break;
		case 29: itemCode1DPost(object); break;
		case 30: itemCode1EPost(object); break;
		case 31: itemCodeNilPost(object); break;
		case 32: itemCodeNilPost(object); break;
		case 33: itemCodeNilPost(object); break;
		case 34: itemCodeNilPost(object); break;
		case 35: itemCodeNilPost(object); break;
		case 36: itemCodeNilPost(object); break;
		case 37: itemCodeNilPost(object); break;
		case 38: itemCodeNilPost(object); break;
		case 39: itemCodeNilPost(object); break;
		case 40: itemCodeNilPost(object); break;
		case 41: itemCodeNilPost(object); break;
		case 42: itemCodeNilPost(object); break;
		case 43: itemCodeNilPost(object); break;
		default: assert(0);
	}
}
