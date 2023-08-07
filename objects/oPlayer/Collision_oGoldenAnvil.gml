other.alarm[0] = 30;
if (!other.used) {
	other.used = true;
	other.maxuses -= 1;
	GoldenANVIL = true;
	oGui.canCollab = false;
	audio_play_sound(snd_anvil,0,0);
	pause_game();
}
