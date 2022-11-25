resetTimer();
if (global.musicPlaying != undefined) {
    audio_stop_all();
}
global.musicPlaying = audio_play_sound(snd_suspect,0,999);
