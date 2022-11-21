
if(global.gamePaused == false){
	if (boss) {
	    if(oPlayer.x < x) image_xscale=-2;
		if(oPlayer.x > x) image_xscale=2;
		image_yscale = 2;
	}
	else{
		if(oPlayer.x < x) image_xscale=-1;
		if(oPlayer.x > x) image_xscale=1;
		image_yscale = 1;
	}
	
	//if(oPlayer.y < y) y-=.5;
	//if(oPlayer.y > y) y+=.5;
	direction=point_direction(x,y,oPlayer.x,oPlayer.y)
	if (hp<=0) {
		image_alpha-=.05;
		x-=image_xscale;
		if (image_alpha == 0) {
		    instance_destroy();
		}
	}
	atk = (baseATK + (2 * global.timeA)) * (1 + (global.timeB / 25));
	speed = (baseSPD + (0.12 * global.timeA)) * (1 + (global.timeB / 25));
}
pausedamaged = false;



