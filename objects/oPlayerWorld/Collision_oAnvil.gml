// Feather disable GM2016
var possible_upgrade = true;

//for (var i = 0; i < array_length(UPGRADES); ++i) {
//	if (UPGRADES[i][$"level"] < UPGRADES[i][$"maxlevel"]) {
//		possible_upgrade = true;
//	}
//}

//for (var i = 0; i < array_length(playerItems); ++i) {
//	if (playerItems[i][$"level"] < playerItems[i][$"maxlevel"]) {
//		possible_upgrade = true;
//	}
//}
other.alarm[0] = 30;
if (!other.used and possible_upgrade) {
	other.used = true;
	other.maxuses -= 1;
	if (global.shareAnvils) {
	    sendMessage({
			command : Network.UpdateAnvil,
			anvilid : other.anvilid,
			maxuses : other.maxuses
		});
	}
	oPlayer.lastanvil = other.id;
	ANVIL = true;
	oGui.selected = 0;
	oGui.anvilSelected = 0;
	oGui.anvilSelectedCategory = 0;
	audio_play_sound(snd_anvil,0,0);
	PauseGame();
}
