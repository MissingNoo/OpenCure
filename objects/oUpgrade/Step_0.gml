//show_message(upg[?"speed"])
//Feather disable GM1043
if (a==0) {
a=1;
sprite_index=upg[?"sprite"];
speed=upg[?"speed"];
atk=upg[?"dmg"];
hits=upg[?"hits"];
show_debug_message("Spawned: " + upg[?"name"] );
switch (upg[?"name"]) {
	default:
		defaultBehaviour();
		break;
	case "AmePistol":
		defaultBehaviour();
		alarm[0] = 10;
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

if (hits <= 0) {
    image_alpha=0;
}

