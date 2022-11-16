
if(global.gamePaused == false){
	if(oPlayer.x < x) image_xscale=-1;
	if(oPlayer.x > x) image_xscale=1;
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
}
pausedamaged = false;
