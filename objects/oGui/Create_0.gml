/// @description Insert description here
// You can write your code in this editor
// Feather disable GM1043
debugy=169
debug = false;
selected=0;
color=c_white;
menu_options = ["Start", "Settings", "Exit"];
resetTimer()
global.upgrades=ds_map_create();
show_debug_message(string(Characters.lenght));
global.a=1;
a=0;
b=0;
c=2;
d=2;
e=0;
if (os_type == os_android) {
    display_set_gui_size(1280,720);
	if (!instance_exists(oJoystick)) {
	    instance_create_depth(0,0,0,oJoystick);
	}	
}

