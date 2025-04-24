module oracles.common.objectLoading;

import oracles.bank00;
import oracles.bank15;
import oracles.external;
import oracles.globals;
import oracles.objectScriptDefs;
import oracles.structures;

public import oracles.common.objects.extraData1;
public import oracles.common.objects.enemyData;
public import oracles.common.objects.extraData2;

//;;
void parseObjectData() {
	numEnemies = 0;
	allMiscState = allMiscState.init; // wipe everything, not just the first byte. it's easier
	enemyPlacement = enemyPlacement.init;
	addRoomToEnemiesKilledList();
	generateRandomBuffer();

	static if (gameVersion == GameVersion.ages) {
		auto data = getObjectDataAddress();
	} else {
	//	ld a,(wActiveGroup)
	//	ld hl,objectDataGroupTable
	//	rst_addDoubleIndex
	//	ldi a,(hl)
	//	ld h,(hl)
	//	ld l,a
	//	ld a,(wActiveRoom)
	//	ld e,a
	//	ld d,$00
	//	add hl,de
	//	add hl,de
	//	ldi a,(hl)
	//	ld d,(hl)
	//	ld e,a
	}
	parseGivenObjectDataI(data);
}

//;;
//; @param de Address of object data to parse
void parseGivenObjectDataI(const(ubyte)* data) {
//	; BUG(?): Not initializing the $cec0 memory block!
//	;
//	; I've seen this affect the target carts minigame, where because wEnemyPlacement.numEnemies
//	; is uninitialized, it writes to an address in the $cfxx memory range and messes up the
//	; room's collisions after loading the crystals. But that was in rando, not sure if it can
//	; happen in vanilla.
//	;
//	; However, it could be dangerous to add such a memory clear call here; there could be some
//	; poorly designed code that's using that memory region for something else even while it's
//	; used for object loading here. Would need to do some testing to make sure it doesn't break
//	; anything.

	outer: while (true) {
		if (data[0] == ObjectCommand.endPointer) {
			// pop de
		}
		if (data[0] == ObjectCommand.end) {
			return;
		}
		switch ((data++)[0] & 0xF) {
			case ObjectCommand.condition & 0xF:
				//; Only use objects when certain room properties are set
				//; Used a lot in jabu-jabu
				//	ld a,(wRoomStateModifier)
				//	ld hl,bitTable
				//	add l
				//	ld l,a
				//	ld a,(hl)
				//	ld b,a
				//	ld a,(de)
				//	inc de
				//	and b
				//	jp nz,parseGivenObjectData

				//	ld b,$00
				//	ld l,e
				//	ld h,d

				//@nextOpcode:
				//	ld a,(hl)

				//	; Parse new conditionals
				//	cp $f0
				//	jr z,parseGivenObjectData_hl

				//	; Parse return opcode
				//	cp $fe
				//	jr z,parseGivenObjectData_hl

				//	; Check return opcode
				//	cp $ff
				//	ret z

				//	; Otherwise, skip the next opcode
				//	and $0f
				//	ld de,objectDataOpcodeSizes
				//	call addDoubleIndexToDe
				//	ld a,(de)
				//	ld c,a
				//	add hl,bc
				//	inc de
				//	ld a,(de)
				//	ld c,a
				//-
				//	add hl,bc
				//	bit 7,(hl)
				//	jr nz,@nextOpcode
				//	jr -
				assert(0, "NYI");
				break;
			case ObjectCommand.interaction1 & 0xF: // No-value interaction
				GameObject* newObject;
				while (true) {
					if (data[0] >= ObjectCommand.condition) {
						continue outer;
					}
					if (!getFreeInteractionSlot(newObject)) {
						break;
					}

					ushort hl = read2Bytes(data);
					newObject.id = hl & 0xFF;
					newObject.subid = hl >> 8;
				}
				while (true) {
					data += 2;
					if (data[0] >= ObjectCommand.condition) {
						continue outer;
					}
				}
				break;
			case ObjectCommand.interaction2 & 0xF: // Double-value interaction
				GameObject* newObject;
				while (true) {
					if (data[0] >= ObjectCommand.condition) {
						continue outer;
					}
					if (!getFreeInteractionSlot(newObject)) {
						break;
					}

					ushort hl = read2Bytes(data);
					newObject.id = hl & 0xFF;
					newObject.subid = hl >> 8;
					readCoordinates(data, newObject);
				}
				while (true) {
					data += 4;
					if (data[0] >= ObjectCommand.condition) {
						continue outer;
					}
				}
				break;
			case ObjectCommand.pointer & 0xF:
				//;;
				//; Object pointer
				//objectDataOp3:
				//	call checkSkipPointer
				//	jr z,skipPointer
				//	jr parsePointer
				assert(0, "NYI");
				break;
			case ObjectCommand.beforeEvent & 0xF:
				//;;
				//; "Before Event" pointer: use the pointer if bit 7 of room flags is not set.
				//objectDataOp4:
				//	call checkSkipPointer
				//	jr z,skipPointer

				//	call getThisRoomFlags
				//	bit 7,a
				//	jr nz,skipPointer
				//	jr parsePointer
				assert(0, "NYI");
				break;
			case ObjectCommand.afterEvent & 0xF:
				//;;
				//; "After Event" pointer: use the pointer if bit 7 of room flags is set.
				//objectDataOp5:
				//	call checkSkipPointer
				//	jr z,skipPointer

				//	call getThisRoomFlags
				//	bit 7,a
				//	jr z,skipPointer
				//	jr parsePointer
				assert(0, "NYI");
				break;
			case ObjectCommand.randomEnemy & 0xF:
				//;;
				//; Random enemy
				//objectDataOp6:
				//	; Flags
				//	ld a,(de)
				//	inc de
				//	ld b,a
				//	and $1f
				//	ldh (<hFF8B),a

				//	; Count
				//	ld a,b
				//	swap a
				//	rrca
				//	and $07
				//	ldh (<hFF8C),a

				//	; Main ID
				//	ld a,(de)
				//	inc de
				//	ldh (<hFF8F),a

				//	; Sub ID
				//	ld a,(de)
				//	inc de
				//	ldh (<hFF8E),a

				//@nextRandomEnemy:
				//	ld a,$01
				//	ldh (<hFF8D),a
				//	ldh a,(<hFF8B)
				//	and $01
				//	jr nz,+

				//	call checkEnemyKilled
				//	jr nc,+++
				//+
				//	call getFreeEnemySlot
				//	jp nz,parseGivenObjectData

				//	call decEnemyCounterIfApplicable

				//	; Write ID
				//	ldh a,(<hFF8F)
				//	ldi (hl),a
				//	ldh a,(<hFF8E)
				//	ldi (hl),a

				//	ld a,h
				//	ldh (<hFF91),a
				//	push de
				//	call assignRandomPositionToEnemy
				//	pop de

				//.ifndef ENABLE_US_BUGFIXES
				//	; JP BUG: 'h' register not restored to point to the enemy object. This is only a problem
				//	; when a random-position enemy fails to be placed somewhere.
				//	; In this case, "hl" will point to wEnemyPlacement.randomPlacementAttemptCounter. This won't
				//	; really affect anything. The real problem is that, by not deleting the enemy, it will have
				//	; the default position 0,0 (top-left corner of the screen).
				//	; This should be very rare, because it's unlikely that the game will fail to place the enemy
				//	; anywhere at all, unless the room is full of walls.
				//	jr nc,++
				//	ld l,Enemy.enabled
				//	ld (hl),$00
				//	jr +++
				//.else
				//	; US BUG: If the enemy is not successfully placed, this does not clear the ID/SubID values.
				//	; This shouldn't matter in most cases because they will usually be overwritten when an enemy
				//	; is spawned. But, supposing there is a case where the game expects the subid to be
				//	; 0 and doesn't write the value explicitly, maybe this could affect something?
				//	;
				//	; ALSO (and this appies to both regions), this does not decrement "wNumEnemies", which could
				//	; make it impossible to clear certain rooms where you're supposed to kill all enemies, if
				//	; one of the enemies fails to spawn! (But again, this is rare)
				//	ldh a,(<hFF91)
				//	ld h,a
				//	jr nc,++

				//	ld l,Enemy.enabled
				//	ld (hl),$00
				//	jr +++
				//.endif

				//++
				//	ld l,Enemy.enabled
				//	ldh a,(<hFF8D)
				//	ld (hl),a
				//+++
				//	ldh a,(<hFF8C)
				//	dec a
				//	ldh (<hFF8C),a
				//	jr nz,@nextRandomEnemy
				//	jp parseGivenObjectData
				assert(0, "NYI");
				break;
			case ObjectCommand.specificEnemy & 0xF:
				//;;
				//; Specific position enemy
				//objectDataOp7:
				//	; Flags
				//	ld a,(de)
				//	inc de
				//	ldh (<hFF8B),a

				//@nextSpecificEnemy:
				//	ld a,(de)
				//	bit 7,a
				//	jp nz,parseGivenObjectData

				//	; Default value for "enabled" byte
				//	ld a,$01
				//	ldh (<hFF8D),a

				//	ldh a,(<hFF8B)
				//	and $01
				//	jr nz,+

				//	call checkEnemyKilled
				//	jr c,+

				//	inc de
				//	inc de
				//	inc de
				//	inc de
				//	jr @nextSpecificEnemy
				//+
				//	call getFreeEnemySlot
				//	jp nz,skipToOpEnd_4byte

				//	call decEnemyCounterIfApplicable

				//	; Get ID
				//	call read2Bytes

				//	; Get X/Y
				//	ld l,Enemy.yh
				//	call readCoordinates

				//	; l = Enemy.xh
				//	ldd a,(hl)
				//	and $f0
				//	swap a
				//	ld c,a
				//	; l = Enemy.yh
				//	dec l
				//	ld a,(hl)
				//	and $f0
				//	or c
				//	ld c,a

				//	; c now contains the object's tile / shortened position (YX)
				//	call addPositionToPlacedEnemyPositions

				//	ld l,Enemy.enabled
				//	ldh a,(<hFF8D)
				//	ld (hl),a
				//	jr @nextSpecificEnemy
				assert(0, "NYI");
				break;
			case ObjectCommand.part1 & 0xF:
				//;;
				//; "Parts" (owl statues etc)
				//objectDataOp8:
				//	ld a,(de)
				//	bit 7,a
				//	jp nz,parseGivenObjectData

				//	call getFreePartSlot
				//	jp nz,++

				//	call read2Bytes
				//	ld a,(de)
				//	ld c,a
				//	inc de
				//	ld l,Part.yh
				//	call setShortPosition
				//	call addPositionToPlacedEnemyPositions
				//	jr objectDataOp8
				//++
				//	inc de
				//	inc de
				//	inc de
				//	jr objectDataOp8
				assert(0, "NYI");
				break;
			case ObjectCommand.interaction3 & 0xF:
				//;;
				//; Object with parameter
				//objectDataOp9:
				//	call continueObjectLoopIfOpDone
				//	call @allocateObjectType
				//	jr nz,@allocationFailure

				//	; Read ID
				//	inc de
				//	ld a,(de)
				//	inc de
				//	ldi (hl),a
				//	ld a,(de)
				//	inc de
				//	ldi (hl),a

				//	; Read Object.var03
				//	ld a,(de)
				//	inc de
				//	ldi (hl),a

				//	; Read Y
				//	ld a,l
				//	and $c0
				//	add Object.yh
				//	ld l,a
				//	ld a,(de)
				//	inc de
				//	ldi (hl),a

				//	; Read X
				//	inc l
				//	ld a,(de)
				//	inc de
				//	ld (hl),a

				//	jr objectDataOp9

				//@allocationFailure:
				//	ld a,$06
				//	call addAToDe
				//	jr objectDataOp9

				//@allocateObjectType:
				//	ld a,(de)
				//	rst_jumpTable
				//	.dw getFreeInteractionSlot
				//	.dw getFreeEnemySlot_uncounted
				//	.dw getFreePartSlot
				assert(0, "NYI");
				break;
			static if (gameVersion == GameVersion.ages) {
			case ObjectCommand.itemDrop & 0xF:
				//;;
				//; Item drops. Seasons uses ENEMY_ITEM_DROP_PRODUCER directly instead of this.
				//objectDataOpA:
				//	ld a,(de)
				//	inc de
				//	ldh (<hFF8B),a
				//@nextOpA:
				//	ld a,(de)
				//	bit 7,a
				//	jp nz,parseGivenObjectData

				//	; Default value for "enabled" byte
				//	ld a,$01
				//	ldh (<hFF8D),a

				//	ldh a,(<hFF8B)
				//	and $01
				//	jr nz,++

				//	call checkEnemyKilled
				//	jr c,++

				//	inc de
				//	inc de
				//	jr @nextOpA
				//++
				//	call getFreeEnemySlot_uncounted
				//	jp nz,skipToOpEnd_2byte

				//	; Set ID
				//	ld (hl),ENEMY_ITEM_DROP_PRODUCER
				//	inc l
				//	ld a,(de)
				//	inc de
				//	ld (hl),a

				//	; Set YX
				//	ld l,Enemy.yh
				//	ld a,(de)
				//	inc de
				//	call setShortPosition

				//	call addPositionToPlacedEnemyPositions
				//	ld l,Enemy.enabled
				//	ldh a,(<hFF8D)
				//	ld (hl),a
				//	jr @nextOpA
				assert(0, "NYI");
				break;
			}
			default: assert(0);
		}
	}
}
//;;
//; In addition to checking wcc05, this appears to have a mechanism to prevent
//; the pointer from being read if link enters from a certain direction.
//; @param[out] @zflag Set if the pointer should be skipped.
//checkSkipPointer:
//.ifdef ROM_AGES
//	ld a,(wcc05)
//	bit 1,a
//	ret z
//.endif

//	ld a,(wcc85)
//	bit 7,a
//	jr z,++

//	and $03
//	ld b,a
//	xor a
//	ld (wcc85),a
//	ld a,(wScreenTransitionDirection)
//	cp b
//	ret z
//-
//	or d
//	ret
//++
//	or a
//	jr z,-

//	xor a
//	ret

//;;
//skipPointer:
//	inc de
//	inc de
//	jp parseGivenObjectData

//;;
//parsePointer:
//	ld l,e
//	ld h,d
//	inc de
//	inc de
//	push de
//	ldi a,(hl)
//	ld d,(hl)
//	ld e,a
//	jp parseGivenObjectData

//; Appears to be unused
//func_55f8:
//	jr parseGivenObjectData

//;;
//parseGivenObjectData_hl:
//	ld e,l
//	ld d,h
//	jr parseGivenObjectData

//; 1st byte is the base size of the opcode, 2nd byte is size of each subsequent
//; use of the opcode (as multiple uses of the same opcode saves space)
immutable ubyte[2][] objectDataOpcodeSizes = [
	[ 0x02, 0x00 ],
	[ 0x01, 0x02 ],
	[ 0x01, 0x04 ],
	[ 0x03, 0x00 ],
	[ 0x03, 0x00 ],
	[ 0x03, 0x00 ],
	[ 0x02, 0x02 ],
	[ 0x02, 0x04 ],
	[ 0x01, 0x03 ],
	[ 0x01, 0x06 ],
	[ gameVersion == GameVersion.ages ? 0x02 : 0x00, gameVersion == GameVersion.ages ? 0x02 : 0x00 ],
	[ 0x00, 0x00 ],
	[ 0x00, 0x00 ],
	[ 0x00, 0x00 ],
	[ 0x01, 0x00 ],
	[ 0x01, 0x00 ],
];

//;;
//continueObjectLoopIfOpDone:
//	ld a,(de)
//	cp $f0
//	ret c

//	pop bc
//	jp parseGivenObjectData

//; @param de Source
//; @param hl Destination
ushort read2Bytes(ref const(ubyte)* bytes) {
	auto result = *cast(const(ushort)*)bytes;
	bytes += 2;
	return result;
}

//; @param de Source
//; @param hl Destination (an Object.yh variable)
void readCoordinates(ref const(ubyte)* data, GameObject* obj) {
	obj.yh = (data++)[0];
	obj.xh = (data++)[0];
}

//;;
//; @param hFF8B Flags that came with the enemy data
//decEnemyCounterIfApplicable:
//	ldh a,(<hFF8B)
//	and $02
//	ret z

//	ld a,(wNumEnemies)
//	dec a
//	ld (wNumEnemies),a
//	ret

//;;
//; @param	c	Enemy position?
//addPositionToPlacedEnemyPositions:
//	push hl
//	ld a,(wEnemyPlacement.numEnemies)
//	ld hl,wEnemyPlacement.placedEnemyPositions
//	rst_addAToHl
//	ld (hl),c

//	ld a,(wEnemyPlacement.numEnemies)
//	inc a
//	and $0f
//	ld (wEnemyPlacement.numEnemies),a

//	pop hl
//	ret

//;;
//; @param[out]	cflag	c if a valid position couldn't be found
//assignRandomPositionToEnemy:
//	call getRandomPositionForEnemy
//	ret c

//	ld a,(wEnemyPlacement.enemyPos)
//	ld c,a
//	call addPositionToPlacedEnemyPositions
//	ldh a,(<hFF91)
//	ld h,a
//	ld l,Enemy.yh
//	call setShortPosition_paramC
//	xor a
//	ret

//;;
//; Calculates the value for an enemy's "enabled" byte (stored in hFF8D) such that the enemy
//; is assigned an index, which allows the game to remember which enemies have been killed.
//;
//; @param[out]	cflag	nc if the enemy has been killed already (so it shouldn't spawn)
//checkEnemyKilled:
//	ld a,(wEnemyPlacement.numKillableEnemies)
//	cp $07
//	jr nc,+

//	inc a
//	ld (wEnemyPlacement.numKillableEnemies),a

//	ld hl,bitTable
//	add l
//	ld l,a
//	ld a,(wEnemyPlacement.killedEnemiesBitset)
//	and (hl)
//	ret nz

//	; Calculate the value for the "enabled" byte, which contains the enemy's index.
//	ld a,(wEnemyPlacement.numKillableEnemies)
//	swap a
//	or $01
//	ldh (<hFF8D),a
//+
//	scf
//	ret

//.ends