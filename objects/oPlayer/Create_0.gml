event_inherited();
weaponHaste = 0;
justBandageHealing = 0;
haveBandage = false;
bandageLevel = 0;
bandageHealSeconds = 0;
renderDistance = x + (view_wport[0] / 2);
dAlarm = array_create(11, -1);
//show_debug_overlay(true);
immortal = false;
if (global.singleplayer) {
	global.roomname = "";
	//feather disable once GM2017
	global.IsHost = true;
}
global.defeatedEnemies = 0;
x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;
if (variable_global_exists("aim")) {
    global.aim.destroy();
}
global.aim = input_virtual_create();
global.aim.rectangle(GW/2, GH/2, GW, GH);
//aim.circle(GW/1.2, GH/1.25, 60);
global.aim.follow(false);

if (variable_global_exists("move")) {
    global.move.destroy();
}
global.move = input_virtual_create();
//global.move.circle(GW/6, GH/1.25, 60);
global.move.rectangle(0, GH/2, GW/2, GH);
//aim.circle(GW/1.2, GH/1.25, 60);
global.move.follow(false);

#region redgura
	redgura = false;
	//feather disable once GM2017
	part_red = undefined;
	//feather disable once GM2017
	redstop = function(){redgura = false; part_system_destroy(part_red); part_red = undefined;}
	redtime = time_source_create(time_source_game, 10, time_source_units_seconds,redstop);
#endregion
skilltimer = 0;
special = SPECIAL_LIST[global.player[?"special"]];
specialcooldown = special.cooldown;
pimanLevel = 0;
pimanUsable = false;
dead = false;
reset_timer();
reset_pool();
idolCostumeLevel = 0;
global.lastsequence = undefined;
global.testvar = "";
socket = 1;
healSeconds = 0;
initializePlayer(global.player);
oImageSpeed = image_speed;
pickupRadius = 35;
originalPickupRadius = pickupRadius;
//feather disable once GM2017
in_range = noone;
canShoot=1;
neededxp = 79;
atkpercentage=0;
v=0;
global.arrowDir=0;
canMove=true;
ospd = spd;
if (!instance_exists(oCam)) {
    instance_create_depth(x,y,0,oCam);
}


lef =0;
dow=0;
rig=0;
upp=0;
//feather disable once GM2017
global.rerolls = global.shopUpgrades.Reroll.level;
critChance = 0;