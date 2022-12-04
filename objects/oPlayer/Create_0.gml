event_inherited();
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


