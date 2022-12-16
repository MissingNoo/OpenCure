/// @description Insert description here
// You can write your code in this editor

if (onArea) {
	direction=point_direction(x,y,oPlayer.x,oPlayer.y);
	speed=oPlayer.spd*1.2;
}
else speed=0;
otherxp = collision_circle(x,y, 30, oXP,false,true);
if (otherxp != noone) {
    otherxp.xp += xp;
	instance_destroy();
}