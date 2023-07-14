used = false;
if (!dontsend) {
	maxuses = 1;
    anvilid = irandom(9999);
	for (var i = 0; i < array_length(playerItems); ++i) {
	    if (playerItems[i][$"id"] == ItemIds.BlacksmithsGear) {
		    maxuses = 2;
		}
	}
}
audio_play_sound(snd_anvildrop,0,0);
if (global.shareAnvils and !dontsend) {
	sendMessage({
		command : Network.SpawnAnvil,
		x, y, 
		anvilid,
		maxuses
	});
}
