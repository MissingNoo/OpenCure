keyboard_key_release(ord("Z"));
keyboard_key_release(ord("X"));
keyboard_key_release(vk_escape);
keyboard_clear(ord("Z"));
keyboard_clear(ord("X"));
keyboard_clear(vk_escape);
resetTimer();
if (global.musicPlaying != undefined) {
    audio_stop_all();
}
global.musicPlaying = audio_play_sound(snd_suspect,0,999);
