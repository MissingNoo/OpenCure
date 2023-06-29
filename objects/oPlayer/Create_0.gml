event_inherited();
if (global.server) {
	global.roomname = "";
	global.IsHost = true;
}

//show_debug_overlay(true);
global.defeatedEnemies = 0;
//show_debug_overlay(true);
_x1 = 0;
_x1 = 0;
_y2 = 0;
_y2 = 0;

#region redgura
	redgura = false;
	part_red = undefined;
	redstop = function(){redgura = false; part_system_destroy(part_red); part_red = undefined;}
	redtime = time_source_create(time_source_game, 10, time_source_units_seconds,redstop);
#endregion
skilltimer = 0;
special = SPECIAL_LIST[global.player[?"special"]];
specialcooldown = special.cooldown;
pimanLevel = 0;
pimanUsable = false;
dead = false;
resetTimer();
ResetPool();
idolCostumeLevel = 0;
global.lastsequence = undefined;
global.testvar = "";
socket = 1;
healSeconds = 0;
initializePlayer(global.player);
pickupRadius = 35;
originalPickupRadius = pickupRadius;
in_range = noone;
canShoot=1;
neededxp = 79;
atkpercentage=0;
v=0;
global.arrowDir=0;
can_move=true;
ospd = spd;
if (!instance_exists(oCam)) {
    instance_create_depth(x,y,0,oCam);
}


lef =0;
dow=0;
rig=0;
upp=0;
global.rerolls = global.ShopUpgrades.Reroll.level;