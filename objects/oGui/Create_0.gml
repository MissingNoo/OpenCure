//window_set_fullscreen(true);
//display_set_gui_size(display_get_width(), display_get_height());
//window_set_size(display_get_width(),display_get_height());
lastmenu = PMenus.Pause;
editOption = false;
mousein = false;
guiOffset = 0;
characterSelected = false;
selectedCharacter = 0;
HP = 1;
if (os_type == os_android) {
	display_set_gui_size(display_get_width()/1.5, display_get_height()/1.5);
	window_set_size(display_get_width(),display_get_height());
	//show_message_async(string(1366) + ":" + string(display_get_width()/1.5) + "=" + string(1366 - (display_get_width()/1.5)))
	//guiOffset = round((display_get_width()/1.5) - 1366) / 6.50;
	guiOffset = round((display_get_width()/1.5) - 1366) / 6.50;
	//show_message_async(string(guiOffset));
	//display_set_gui_size(2340/1.5, 1080/1.5);
}
released=false;
/// @description Insert description here
// You can write your code in this editor
// Feather disable GM1043
global.showhpui = true;
zKey = 0;
xKey = 0;
eKey = 0;
leftKey = 0;
rightKey = 0;
upKey = 0;
downKey = 0;
isP=global.gamePaused;
lastinputs = array_create(10);
holoarrowspr=0;
debug=false;
selected=0;
maxselected = selected;
color=c_white;
menu_options = ["Singleplayer", "Multiplayer", "Shop", "Leaderboard", "Achievements", "Settings", "Credits", "Quit"];
resetTimer()
global.upgrades=ds_map_create();
// show_debug_message(string(Characters.Lenght));
global.a=1;
a=2;
b=2;
c=2;
d=2;
e=0;
image_speed=5;
sprindex=0;
if (os_type == os_android) {
    //display_set_gui_size(1280,720);
	if (!instance_exists(oJoystick)) {
	    instance_create_depth(0,0,0,oJoystick);
	}	
}

zButtonX = GW/1.15;
zButtonY = GH/14;
zButtonXEnd = zButtonX + 120;
zButtonYEnd =  zButtonY + 45;
xButtonX = GW/1.15 - 140;
xButtonY = GH/14;
xButtonXEnd = xButtonX + 120;
xButtonYEnd =  xButtonY + 45;
pButtonX = GW/1.15 - 280;
pButtonY = GH/14;
pButtonXEnd = pButtonX + 120;
pButtonYEnd =  pButtonY + 45;

zB = input_virtual_create();
zB.rectangle(zButtonX, zButtonY, zButtonXEnd, zButtonYEnd);
zB.button("accept");

xB = input_virtual_create();
xB.rectangle(xButtonX, xButtonY, xButtonXEnd, xButtonYEnd);
xB.button("cancel");

pB = input_virtual_create();
pB.rectangle(pButtonX, pButtonY, pButtonXEnd, pButtonYEnd);
pB.button("pause");

pad = input_virtual_create();
pad.circle(GW/6, GH/1.25, 60);
pad.follow(false);
pad.release_behavior(INPUT_VIRTUAL_RELEASE.RESET_POSITION);
pad.dpad("", "left", "right", "up", "down");

aim = input_virtual_create();
aim.circle(GW/1.2, GH/1.25, 60);

#region debug
revives = 0;
event = 0;
#endregion


#region PauseMenu
	
	activeMenu = PMenus.Pause;
	enum PM{	
		Title,
		XScale,
		YScale,
		Options,
		Bool,
		BoolValue,
		Lenght
	}
	enum PMenus{
		Pause,
		Settings,
		Graphics,
		Lenght
	}
	for (var i = 0; i < PMenus.Lenght; ++i) {
		pauseMenu[i] = array_create(PMenus.Lenght, 0);
		//show_message(string(pauseMenu));
	    for (var j = 0; j < PM.Lenght; ++j) {
		    pauseMenu[i][j] = 0;
		}
	}
	
	pauseMenu[PMenus.Pause][PM.Title] = "PAUSED";
	pauseMenu[PMenus.Pause][PM.XScale] = 2;
	pauseMenu[PMenus.Pause][PM.Options] = ["Skills", "????", "Resume", "Settings", "Quit"];
	//pauseMenu[PMenus.Pause][PM.Options] = ["Skills"];
	pauseMenu[PMenus.Pause][PM.YScale] = 0.75;
	#region Settings
		pauseMenu[PMenus.Settings][PM.Title] = "SETTINGS";
		pauseMenu[PMenus.Settings][PM.XScale] = 2.5;
	
		function loadSettingValues(){
			pauseMenu[PMenus.Settings][PM.Options][0] = "Music Volume: " + string(round(global.musicVolume*100)) + "%";
			pauseMenu[PMenus.Settings][PM.Options][1] = "Sound Volume: " + string(round(global.soundVolume*100)) + "%";
			pauseMenu[PMenus.Settings][PM.Bool][2] = true;
			pauseMenu[PMenus.Settings][PM.BoolValue][2] = global.DamageNumbers;
			pauseMenu[PMenus.Settings][PM.Options][2] = "Damage Numbers: ";
			pauseMenu[PMenus.Settings][PM.Bool][3] = true;
			pauseMenu[PMenus.Settings][PM.BoolValue][3] = global.ScreenShake;
			pauseMenu[PMenus.Settings][PM.Options][3] = "Screen Shake: ";
			pauseMenu[PMenus.Settings][PM.Bool][4] = true;
			pauseMenu[PMenus.Settings][PM.BoolValue][4] = global.SpawnEnemies;
			pauseMenu[PMenus.Settings][PM.Options][4] = "SpawnEnemies: ";
			pauseMenu[PMenus.Settings][PM.Options][5] = "GamePad: ";
			pauseMenu[PMenus.Settings][PM.Bool][5] = true;
			pauseMenu[PMenus.Settings][PM.BoolValue][5] = global.GamePad;
			pauseMenu[PMenus.Settings][PM.Options][6] = "showhpui: ";
			pauseMenu[PMenus.Settings][PM.Bool][6] = true;
			pauseMenu[PMenus.Settings][PM.BoolValue][6] = global.showhpui;			
		}
		loadSettingValues();
		//pauseMenu[PMenus.Pause][PM.Options] = ["Skills"];
		pauseMenu[PMenus.Settings][PM.YScale] = 0.75;
		#endregion
	startOption = 0;
	totaloptions = array_length(pauseMenu[activeMenu][PM.Options]);
#endregion

if (instance_number(oTitleRunning) < 15 and room == rInicio) {
    instance_create_layer(0,0, "Instances", oTitleRunning);
}


#region Stages
	stageSelected = false;
	stageModes = ["STAGE MODE", "ENDLESS MODE"];
	modesDescription = ["Defeat the last boss to complete the stage!", "Survive for as long as you can and reach the top of the leaderboards!"];
	stages = [{name: "Stage 1", port : sStage1Port, roomname : Room1}]
	selectedStage = 0;
#endregion