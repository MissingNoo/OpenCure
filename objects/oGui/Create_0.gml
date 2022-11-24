/// @description Insert description here
// You can write your code in this editor
// Feather disable GM1043

holoarrowspr=0;
debug=false;
selected=0;
maxselected = selected;
color=c_white;
menu_options = ["Play", "Shop", "Leaderboard", "Achievements", "Settings", "Credits", "Quit"];
resetTimer()
global.upgrades=ds_map_create();
show_debug_message(string(Characters.lenght));
global.a=1;
a=2;
b=1;
c=70;
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
	
	activeMenu = pMenus.Pause;
	enum pM{	
		Title,
		xScale,
		yScale,
		Options,
		Bool,
		BoolValue,
		lenght
	}
	enum pMenus{
		Pause,
		Settings,
		lenght
	}
	for (var i = 0; i < pMenus.lenght; ++i) {
		pauseMenu[i] = array_create(pMenus.lenght, 0);
		//show_message(string(pauseMenu));
	    for (var j = 0; j < pM.lenght; ++j) {
		    pauseMenu[i][j] = 0;
		}
	}
	
	pauseMenu[pMenus.Pause][pM.Title] = "PAUSED";
	pauseMenu[pMenus.Pause][pM.xScale] = 2;
	pauseMenu[pMenus.Pause][pM.Options] = ["Skills", "????", "Resume", "Settings", "Quit"];
	//pauseMenu[pMenus.Pause][pM.Options] = ["Skills"];
	pauseMenu[pMenus.Pause][pM.yScale] = 0.75;
	#region Settings
		pauseMenu[pMenus.Settings][pM.Title] = "SETTINGS";
		pauseMenu[pMenus.Settings][pM.xScale] = 2.5;
	
		function loadSettingValues(){
			pauseMenu[pMenus.Settings][pM.Options][0] = "Music Volume: " + string(round(global.musicVolume*100)) + "%";
			pauseMenu[pMenus.Settings][pM.Options][1] = "Sound Volume: " + string(round(global.soundVolume*100)) + "%";
			pauseMenu[pMenus.Settings][pM.Bool][2] = true;
			pauseMenu[pMenus.Settings][pM.BoolValue][2] = global.damageNumbers;
			pauseMenu[pMenus.Settings][pM.Options][2] = "Damage Numbers: ";
			pauseMenu[pMenus.Settings][pM.Bool][3] = true;
			pauseMenu[pMenus.Settings][pM.BoolValue][3] = global.canShake;
			pauseMenu[pMenus.Settings][pM.Options][3] = "Screen Shake: ";
		}
		loadSettingValues();
		//pauseMenu[pMenus.Pause][pM.Options] = ["Skills"];
		pauseMenu[pMenus.Settings][pM.yScale] = 0.75;
		#endregion
	startOption = 0;
	totaloptions = array_length(pauseMenu[activeMenu][pM.Options]);
#endregion

if (instance_number(Object16) < 15 and room == rInicio) {
    instance_create_layer(0,0, "Instances", Object16);
}


