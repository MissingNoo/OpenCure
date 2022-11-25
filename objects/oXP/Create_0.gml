/// @description Insert description here
// You can write your code in this editor
//image_angle = randomise();
//image_xscale=.05;
//image_yscale=.05;
otherxp = collision_circle(x,y, 30, oXP,false,true);
if (otherxp != noone) {
    otherxp.xp += xp;
	instance_destroy();
}