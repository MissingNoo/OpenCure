var possible_upgrade = false;

for (var i = 0; i < array_length(UPGRADES); ++i) {
	if (UPGRADES[i][?"level"] < UPGRADES[i][?"maxlevel"]) {
		possible_upgrade = true;
	}
}

for (var i = 0; i < array_length(playerItems); ++i) {
	if (playerItems[i][?"level"] < playerItems[i][?"maxlevel"]) {
		possible_upgrade = true;
	}
}

if (possible_upgrade) {
	ANVIL = true;
	oGui.selected = 0;
	oGui.anvilSelected = 0;
	oGui.anvilSelectedCategory = 0;
	instance_destroy(other);
	PauseGame();
}
