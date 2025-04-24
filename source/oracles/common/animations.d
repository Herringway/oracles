module oracles.common.animations;

import oracles.bank00;
import oracles.common.data.animationGfxHeaders;
import oracles.data;
import oracles.external;
import oracles.globals;
import std.logger;

void initializeAnimations() {
	//	ld a,(wTilesetAnimation)
	//	cp $ff
	//	ret z

	//	call loadAnimationData
	//.ifdef ROM_AGES
	//	call @locFunc
	//	ld hl,wAnimationState
	//	set 7,(hl)
	//	call @locFunc
	//	ld hl,wAnimationState
	//	set 7,(hl)
	//.endif
	//@locFunc:
	//	call updateAnimationData
	//-
	//	call updateAnimationQueue
	//	jr nz, -
	assert(0, "NYI");
}

//;;
void updateAnimations() {
	animationState &= ~0b0100_0000;
	if (cast(ubyte)(tilesetAnimation + 1) == 0) {
		return;
	}
	if ((scrollMode & 1) == 0) {
		return;
	}
	updateAnimationQueue();
	updateAnimationData();
}
//; Read the next index off of the animation queue, set zero flag if there's
//; nothing more to be read.
bool updateAnimationQueue() {
	if (animationQueueHead == animationQueueTail) {
		return true;
	}
	animationQueueHead = animationQueueHead + 1 & 0x1F;
	gbc.SVBK = 2;
	loadAnimationGFXIndex(animationQueue[animationQueueHead]);
	gbc.SVBK = 0;
	animationState |= 0b0100_0000;
	return false;
}

//;;
void updateAnimationData() {
	if ((animationState & 0b0001) != 0) {
		updateAnimationDataPointer(&animation1);
	}
	if ((animationState & 0b0010) != 0) {
		updateAnimationDataPointer(&animation2);
	}
	if ((animationState & 0b0100) != 0) {
		updateAnimationDataPointer(&animation3);
	}
	if ((animationState & 0b1000) != 0) {
		updateAnimationDataPointer(&animation4);
	}
	animationState &= 0x7F;
}

//; Update animation data pointed to by hl
void updateAnimationDataPointer(AnimationState* state) {
	// If bit 7 set, ignore counter
	if (((animationState & 0x80) == 0) && (--state.counter != 0)) {
		return;
	}
	const frame = state.pointer.frameIndex;
	state.pointer++;
	if (state.pointer.frameCount == 0xFF) {
		state.pointer += state.pointer.loopTarget;
	}
	state.counter = state.pointer.frameCount;

	// Set animation index to be loaded
	const newTail = (animationQueueTail + 1) & 0x1F;
	if (animationQueueHead == newTail) {
		// out of space...
		return;
	}
	animationQueueTail = newTail;
	gbc.SVBK = 2;
	animationQueue[newTail] = frame;
	gbc.SVBK = 0;
	//	or h // ??
}

//; Load animation index a
void loadAnimationGFXIndex(ubyte index) {
	auto gfx = animationGFXHeaders[index];
	queueDMATransfer(cast(ubyte)gfx.decompressedSize, gfx.bankMode, gfxAsset(gfx.source, gfx.sourceOffset), gfx.destination.array);
}
