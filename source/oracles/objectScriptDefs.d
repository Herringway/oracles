module oracles.objectScriptDefs;

enum ObjectCommand : ubyte {
	condition = 0xF0,
	interaction1 = 0xF1,
	interaction2 = 0xF2,
	pointer = 0xF3,
	beforeEvent = 0xF4,
	afterEvent = 0xF5,
	randomEnemy = 0xF6,
	specificEnemy = 0xF7,
	part1 = 0xF8,
	part2 = 0xF9,
	interaction3 = 0xF9,
	itemDrop = 0xFA,
	endPointer = 0xFE,
	end = 0xFF,
}

ubyte[] objEnd() => [0xFF];

// F1 id, subID
ubyte[] objInteraction(scope ubyte[2] delegate()[] interactions...) {
	ubyte[] result = [0xF1];
	foreach (interaction; interactions) {
		result ~= interaction();
	}
	return result;
}
// F2 id, subID, y, x
ubyte[] objInteraction(scope ubyte[4] delegate()[] interactions...) {
	ubyte[] result = [0xF2];
	foreach (interaction; interactions) {
		result ~= interaction();
	}
	return result;
}
ubyte[] objInteraction(ubyte id, ubyte subID, ubyte y, ubyte x, ubyte v03) {
	return [0xF9, id, subID, v03, y, x];
}

ubyte[] objectScript(scope ubyte[] delegate()[] commands...) {
	ubyte[] newBuffer;
	foreach (command; commands) {
		newBuffer ~= command();
	}
	return newBuffer;
}
