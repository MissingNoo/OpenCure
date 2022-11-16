//show_message(upg[?"speed"])
//Feather disable GM1043
if (a==0) {
a=1;
show_debug_message("Spawned: " + upg[?"name"] + " Level: " + string(upg[?"level"]) + " shoots: " + string(shoots));
switch (upg[?"name"]) {
	default:
		defaultBehaviour();
		break;
	case "AmePistol":
		defaultBehaviour();
		alarm[0] = 10;
		break;
}
	if (sprite_index==blank) {
		instance_destroy();
	}
}

if (hits <= 0) {
    image_alpha=0;
}


