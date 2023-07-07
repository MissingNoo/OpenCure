used = false;
maxuses = 1;
for (var i = 0; i < array_length(playerItems); ++i) {
    if (playerItems[i][$"id"] == ItemIds.BlacksmithsGear) {
	    maxuses = 2;
	}
}
audio_play_sound(snd_anvildrop,0,0);