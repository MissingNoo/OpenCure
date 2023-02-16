
// Feather disable GM2017
if(global.gamePaused == false){
	
	if (boss) {
	    if(target.x < x) image_xscale=-2;
		if(target.x > x) image_xscale=2;
		image_yscale = 2;
	}
	else{
		if(target.x < x) image_xscale=-1;
		if(target.x > x) image_xscale=1;
		image_yscale = 1;
	}
	
	//if(target.y < y) y-=.5;
		//if(target.y > y) y+=.5;
		var _is_colliding = collision_point(x,y, oUpgrade,false, true)
	if (_is_colliding != noone and _is_colliding.upg[?"id"] == Weapons.PowerofAtlantis) {
	    direction=point_direction(x,y,_is_colliding.x,_is_colliding.y + (sprite_get_height(sWaterPoolStart) / 2));
	}	else {direction=point_direction(x,y,target.x,target.y);}
	
	if (hp<=0) {
		image_alpha-=.05;
		x-=image_xscale;
		if (boss and global.ScreenShake == 1) {
			oGame.shake_magnitude=6;
		}
		if (image_alpha == 0) {
		    instance_destroy();
		}
	}
	atk = (baseATK + (2 * global.timeA)) * (1 + (global.timeB / 25));
	
	speed = (baseSPD + (0.12 * global.timeA)) * (1 + (global.timeB / 25));
}
var pausedamaged = false;





