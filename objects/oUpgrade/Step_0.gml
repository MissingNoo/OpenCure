//show_message(upg[?"speed"])
//Feather disable GM1043
if (a==0) {
a=1;
sprite_index=upg[?"sprite"];
speed=upg[?"speed"];
atk=upg[?"dmg"];
hits=upg[?"hits"];
switch (upg[?"name"]) {
    case "AsaCoco":
		n = instance_nearest(x,y,oEnemy);
        direction=point_direction(x,y,n.x,n.y);
		image_angle=point_direction(x,y,n.x,n.y);
        break;
    case "Flying Knife":
        if (oPlayer.image_xscale==1) {
		    image_xscale = 1;
			direction = point_direction(x,y,x+100,y)
		}
		else
		{
			image_xscale = -1;
			direction = point_direction(x,y,x-100,y)
		}
        break;
	default:
		image_speed=1;
	    switch (global.arrow_dir) {
            case 90:
                x = x + 32;
                break;
            case -90:
                x = x - 32;
                image_xscale = -1;
                break;
            case 0:
                y = y + 32;
                image_angle = point_direction(x, y, x, y + 90);
                break;
            case 180:
                y = y - 32;
                image_angle = point_direction(x, y, x, y - 90);
                break;
        }
		break;
	case "DouglasShoot":
		image_original_speed=1;
		image_index=0;
		image_speed=0;
		switch (oPlayer.image_xscale) {
            case 1:
                x = x + 16;
                break;
            case -1:
				speed=speed*-1;
                x = x - 16;
                image_xscale = -1;
                break;
        }
		if (!alarmset) {
		    alarm[0] = 15;
			alarmset=true;
		}
		
		break;
}


	if (sprite_index==blank) {
		instance_destroy();
	}
}

