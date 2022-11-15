/// @description Insert description here
// You can write your code in this editor
if (distance_to_object(oPlayer) < 20) {
	direction=point_direction(x,y,oPlayer.x,oPlayer.y);
	speed=oPlayer.spd*1.2;
}
else speed=0;

