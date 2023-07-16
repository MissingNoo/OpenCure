event_inherited();
if (global.singleplayer) {
	global.roomname = "";
	global.IsHost = true;
}
if (variable_global_exists("aim")) {
    global.aim.destroy();
}
global.aim = input_virtual_create();
global.aim.rectangle(GW/2, GH/2, GW, GH);
global.aim.follow(false);
if (variable_global_exists("move")) {
    global.move.destroy();
}
global.move = input_virtual_create();
global.move.rectangle(0, GH/2, GW/2, GH);
global.move.follow(false);
socket = 1;
initializePlayer(global.player);
in_range = noone;
global.arrowDir=0;
can_move=true;
if (!instance_exists(oCam)) {
    instance_create_depth(x,y,0,oCamWorld);
}