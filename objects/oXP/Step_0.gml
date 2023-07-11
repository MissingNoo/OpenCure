/// @description Insert description here
// You can write your code in this editor

if (onArea) {
	direction=point_direction(x,y,oPlayer.x,oPlayer.y);
	speed=oPlayer.spd*1.3;
}
else speed=0;
if (!global.gamePaused) {
	y = sine_wave(current_time / 1000, 1, 1, y);
}
var nearestxp = instance_nearest(x,y, oXP);
if (distance_to_point(nearestxp.x, nearestxp.y) < 40) {
    otherxp = collision_circle(x,y, 30, oXP,false,true);
}

if (otherxp != noone and !onArea) {    
	direction = point_direction(x,y,otherxp.x,otherxp.y);
	speed = 1;
	if (collision_circle(x,y, 3, oXP,false,true)) {
	    otherxp.xp += xp;
		instance_destroy();
	}
}