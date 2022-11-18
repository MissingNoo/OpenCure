/// @description Insert description here
// You can write your code in this editor
// Feather disable GM1043
debug=false;
selected=0;
color=c_white;
menu_options = ["Play", "Shop", "Leaderboard", "Achievements", "Settings", "Credits", "Quit"];
resetTimer()
global.upgrades=ds_map_create();
show_debug_message(string(Characters.lenght));
global.a=1;
a=1;
b=1;
c=1;
d=1;
e=0;
image_speed=5;
sprindex=0;
if (os_type == os_android) {
    display_set_gui_size(1280,720);
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




