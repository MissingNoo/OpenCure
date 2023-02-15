event_inherited();
global.P_System = part_type_create();
skilltimer = 0;
special = SPECIAL_LIST[global.player[?"special"]];
specialcooldown = special.cooldown;
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