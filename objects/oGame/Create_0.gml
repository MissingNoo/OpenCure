imguigml_activate();
targetDelta = 1 / 60;
actualDelta = 0;
global.gamePad = false;
global.arrowDir = 0;
linespos = 0;
global.shareXP = false;
global.shareItems = false;
global.shareWeapons = false;
global.pauseGame = false;
global.shareAnvils = false;
global.shareStamps = false;
global.shareBoxDrops = false;
global.allowHalu = false;
global.allowGrank = false;
global.scaleMobs = false;
global.socket = 0;
global.singleplayer = false;
global.roomname="";
lexicon_index_declare_from_json("english.json");
lexicon_language_set("English");
//if (!variable_global_exists("padset")) {
//    //global.padset = false;
//}

global.defeatedEnemies = 0;
if (!variable_global_exists("mode")) {
	global.mode = "menu";
}

global.gPnum = 0;
/// @description Insert description here
// You can write your code in this editor
// Feather disable GM2017
global.spawnEnemies = 1;
shakeFx = layer_get_fx("ShakeLayer");
shakeMagnitude = 0;
shakeSpeed = 1;
depth=99;
global.musicPlaying = undefined;
#region lines
	linespos = -100;
	alarm[1] = 1;
	linesoff = 0;
#endregion

#region stages
enum StageTypes{
	Stage,
	Endless
}
#endregion

#region SaveLoad


	var variables = ["musicVolume","soundVolume","damageNumbers","screenShake", "gamePad"];
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
//global.damageNumbers ??= 1;
	//if (!variable_global_exists("damageNumbers")) { 
	//	global.damageNumbers = 1; 
	//}else{
	//	if (global.damageNumbers == undefined) {
	//	    global.damageNumbers = 1; 
	//	}
	//}
	
	//if (!variable_global_exists("canShake")) { 
	//	global.screenShake = 1; 
	//}else{
	//	if (global.screenShake== undefined) {
	//	    global.screenShake= 1; 
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


