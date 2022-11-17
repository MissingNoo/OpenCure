/// @description Insert description here
// You can write your code in this editor
if (b == 0) {
    b = 1;
	image_speed=1;
	image_alpha=1;
	switch (upg[?"name"]) {
		default:
			if (oPlayer.image_xscale==1) 
			{
				direction = point_direction(x,y,x+100,y+diroffset);
			}
			else 
			{
				direction = point_direction(x,y,x-100,y-diroffset);
			}
			break;
		case "GuraTrident":
			image_angle = global.arrow_dir+diroffset;
			break;
		case "InaTentacle":
			image_angle = global.arrow_dir;
			break;
		case "Plug-type Asacoco":
			originalspeed = speed;
			speed = 0
			break;
	}
}

