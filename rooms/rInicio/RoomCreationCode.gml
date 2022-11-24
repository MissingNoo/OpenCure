if (global.musicPlaying != undefined) {
    audio_stop_sound(global.musicPlaying);
}
global.musicPlaying = audio_play_sound(bgm_sss, 0, 999)