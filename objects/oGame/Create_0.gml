/// @description Insert description here
// You can write your code in this editor
depth=99;
global.musicPlaying = undefined;
#region lines
	linespos = -100;
	alarm[1] = 1;
	linesoff = 0;
#endregion
if (!variable_global_exists("musicVolume")) { 
	global.musicVolume = 1; 
}else{
	if (global.musicVolume == undefined) {
	    global.musicVolume = 1; 
	}
}

if (!variable_global_exists("soundVolume")) { 
	global.soundVolume = 1; 
}else{
	if (global.soundVolume == undefined) {
	    global.soundVolume = 1; 
	}
}

if (!variable_global_exists("damageNumbers")) { 
	global.damageNumbers = 1; 
}else{
	if (global.damageNumbers == undefined) {
	    global.damageNumbers = 1; 
	}
}

global.debug=false;
canspawn=true;
global.gamePaused=false;
gamePausedImageSpeed =0;
//global.Player=global.characters[Characters.Amelia];
ResetPool();
resetTimer();
global.strafe = false;
global.minutesPast30 = 0;
global.hoursPast1= 0 ;
global.arrow_dir=0;
//gameWindow();
//show_message(string(global.upgradesAvaliable[weapons.AmePistol][1][?"name"]));


