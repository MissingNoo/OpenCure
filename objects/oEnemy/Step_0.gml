
if(global.gamePaused == false){
	if(oPlayer.x < x) image_xscale=1;
	if(oPlayer.x > x) image_xscale=-1;
	//if(oPlayer.y < y) y-=.5;
	//if(oPlayer.y > y) y+=.5;
	direction=point_direction(x,y,oPlayer.x,oPlayer.y)
	if (hp<=0) {
	    instance_create_layer(x,y,"Instances",oXP);
		instance_destroy();
	}
}

pausedamaged = false;
