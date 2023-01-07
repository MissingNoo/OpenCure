mousein = false;
guiOffset = 0;
if (os_type == os_android) {
	display_set_gui_size(display_get_width()/1.5, display_get_height()/1.5);
	window_set_size(display_get_width(),display_get_height());
	//show_message_async(string(1366) + ":" + string(display_get_width()/1.5) + "=" + string(1366 - (display_get_width()/1.5)))
	guiOffset = round((display_get_width()/1.5) - 1366) / 6.50;
	//display_set_gui_size(2340/1.5, 1080/1.5);
}
released=false;
/// @description Insert description here
// You can write your code in this editor
// Feather disable GM1043
zKey = 0;
xKey = 0;
eKey = 0;
leftKey = 0;
rightKey = 0;
isP=global.gamePaused;
lastinputs = array_create(10);
holoarrowspr=0;
debug=false;
selected=0;
maxselected = selected;
color=c_white;
menu_options = ["Play", "Shop", "Leaderboard", "Achievements", "Settings", "Credits", "Quit"];
resetTimer()
global.upgrades=ds_map_create();
show_debug_message(string(Characters.Lenght));
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

#region debug
revives = 0;
event = 0;
#endregion


#region PauseMenu
	
	activeMenu = PMenus.Pause;
	enum pM{	
		Title,
		xScale,
		yScale,
		Options,
		Bool,
		BoolValue,
		Lenght
	}
	enum PMenus{
		Pause,
		Settings,
		Lenght
	}
	for (var i = 0; i < PMenus.Lenght; ++i) {
		pauseMenu[i] = array_create(PMenus.Lenght, 0);
		//show_message(string(pauseMenu));
	    for (var j = 0; j < pM.Lenght; ++j) {
		    pauseMenu[i][j] = 0;
		}
	}
	
	pauseMenu[PMenus.Pause][pM.Title] = "PAUSED";
	pauseMenu[PMenus.Pause][pM.xScale] = 2;
	pauseMenu[PMenus.Pause][pM.Options] = ["Skills", "????", "Resume", "Settings", "Quit"];
	//pauseMenu[PMenus.Pause][pM.Options] = ["Skills"];
	pauseMenu[PMenus.Pause][pM.yScale] = 0.75;
	#region Settings
		pauseMenu[PMenus.Settings][pM.Title] = "SETTINGS";
		pauseMenu[PMenus.Settings][pM.xScale] = 2.5;
	
		function loadSettingValues(){
			pauseMenu[PMenus.Settings][pM.Options][0] = "Music Volume: " + string(round(global.musicVolume*100)) + "%";
			pauseMenu[PMenus.Settings][pM.Options][1] = "Sound Volume: " + string(round(global.soundVolume*100)) + "%";
			pauseMenu[PMenus.Settings][pM.Bool][2] = true;
			pauseMenu[PMenus.Settings][pM.BoolValue][2] = global.DamageNumbers;
			pauseMenu[PMenus.Settings][pM.Options][2] = "Damage Numbers: ";
			pauseMenu[PMenus.Settings][pM.Bool][3] = true;
			pauseMenu[PMenus.Settings][pM.BoolValue][3] = global.ScreenShake;
			pauseMenu[PMenus.Settings][pM.Options][3] = "Screen Shake: ";
			pauseMenu[PMenus.Settings][pM.Bool][4] = true;
			pauseMenu[PMenus.Settings][pM.BoolValue][4] = global.SpawnEnemies;
			pauseMenu[PMenus.Settings][pM.Options][4] = "SpawnEnemies: ";
			pauseMenu[PMenus.Settings][pM.Options][5] = "GamePad: ";
			pauseMenu[PMenus.Settings][pM.Bool][5] = true;
			pauseMenu[PMenus.Settings][pM.BoolValue][5] = global.GamePad;
		}
		loadSettingValues();
		//pauseMenu[PMenus.Pause][pM.Options] = ["Skills"];
		pauseMenu[PMenus.Settings][pM.yScale] = 0.75;
		#endregion
	startOption = 0;
	totaloptions = array_length(pauseMenu[activeMenu][pM.Options]);
#endregion

if (instance_number(oTitleRunning) < 15 and room == rInicio) {
    instance_create_layer(0,0, "Instances", oTitleRunning);
}


