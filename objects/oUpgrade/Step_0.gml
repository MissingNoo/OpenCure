//show_message(upg[?"speed"])
//Feather disable GM1043
#region Start
if (a==0) {
	a=1;
	if (shoots > 0) {
	    show_debug_message("Spawned: " + upg[?"name"] + " Level: " + string(upg[?"level"]) + " shoots: " + string(shoots));
	}
	//show_message(string(image_xscale));
	switch (upg[?"name"]) {
		default:
			defaultBehaviour();
			break;
		case "AmePistol":
			defaultBehaviour();
			alarm[0] = 10;
			break;
		case "GuraTrident":
			defaultBehaviour();
			if (upg[?"level"] >= 6) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			if (shoots==0) {
				if (image_xscale==1) {
				    image_angle = point_direction(x,y,x+100,y+diroffset);
				}
				else {
				    image_angle = point_direction(x,y,x+100,y-diroffset);
				}		    
			}
			alarm[0] = 1;
			break;
		case "InaTentacle":
			defaultBehaviour();
			if (upg[?"level"] >= 4) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			if (image_xscale > 0) {
			    x+= 16;
			}
			else {
			    x-= 16;
			}
			break;
	}
		if (sprite_index==blank) {
			instance_destroy();
	}
}
#endregion

#region Connected to Character
switch (upg[?"name"]) {
	case "GuraTrident":
		x=oPlayer.x;
		y=oPlayer.y-8;
		break;
	case "InaTentacle":
		var dirr = (image_xscale > 0) ? 32 : -32;
		x=oPlayer.x+dirr;
		y=oPlayer.y-8;
		break;
}
#endregion


if (hits <= 0) {
    image_alpha=0;
}



