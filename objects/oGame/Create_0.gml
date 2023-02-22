if (!variable_global_exists("padset")) {
    global.padset = false;
}

global.defeatedEnemies = 0;
if (!variable_global_exists("mode")) {
	global.mode = "menu";
}

global.gPnum = 0;
/// @description Insert description here
// You can write your code in this editor
// Feather disable GM2017
global.SpawnEnemies = 1;
shake_fx = layer_get_fx("ShakeLayer");
shake_magnitude = 0;
shake_speed = 1;
depth=99;
global.musicPlaying = undefined;
#region lines
	linespos = -100;
	alarm[1] = 1;
	linesoff = 0;
#endregion
#region SaveLoad


	var variables = ["musicVolume","soundVolume","DamageNumbers","ScreenShake", "GamePad"];
	for (var i = 0; i < array_length(variables); ++i) {
			if (!variable_global_exists(variables[i])) {
				variable_global_set(variables[i], 1)
			}
			if (!variable_global_exists(variables[i]) and variable_global_get(variables[i]) == undefined) {
				variable_global_set(variables[i], 1)
			}
		}


	//if (!variable_global_exists("musicVolume")) { 
	//	global.musicVolume = 1; 
	//}else{
	//	if (global.musicVolume == undefined) {
	//	    global.musicVolume = 1; 
	//	}
	//}

	//if (!variable_global_exists("soundVolume")) { 
	//	global.soundVolume = 1; 
	//}else{
	//	if (global.soundVolume == undefined) {
	//	    global.soundVolume = 1; 
	//	}
	//}

	//if (!variable_global_exists("damageNumbers")) { 
	//	global.DamageNumbers = 1; 
	//}else{
	//	if (global.DamageNumbers == undefined) {
	//	    global.DamageNumbers = 1; 
	//	}
	//}
	
	//if (!variable_global_exists("canShake")) { 
	//	global.ScreenShake = 1; 
	//}else{
	//	if (global.ScreenShake== undefined) {
	//	    global.ScreenShake= 1; 
	//	}
	//}
#endregion
global.debug=false;
canspawn=true;
global.gamePaused=false;
gamePausedImageSpeed =0;
//global.player=global.characters[Characters.Amelia];
ResetPool();
resetTimer();
global.strafe = false;
global.minutesPast30 = 0;
global.hoursPast1= 0 ;
global.arrowDir=0;
//gameWindow();
//show_message(string(global.upgradesAvaliable[Weapons.AmePistol][1][?"name"]));



