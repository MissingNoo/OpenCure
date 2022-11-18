/// @description Insert description here
// You can write your code in this editor
#region Start
if (a==0) {
	global.upgradeCooldown[upg[?"id"]] = upg[?"cooldown"];
	image_speed=1;
	image_alpha=1;
	a=1;
	if (shoots > 0) {
	    show_debug_message("Spawned: " + string(upg[?"id"]) + " Name: " + upg[?"name"] + " Level: " + string(upg[?"level"]) + " shoots: " + string(shoots) + " cooldown: " + string(upg[?"cooldown"]) );
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
			image_angle = global.arrow_dir + diroffset;
			//defaultBehaviour();			
			if (upg[?"level"] >= 6) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			alarm[0] = 1;
			break;
		case "InaTentacle":
			//defaultBehaviour();
			if (shoots > 0) {
			    image_angle = global.arrow_dir;
			}
			else image_angle=diroffset;
			
			if (upg[?"level"] >= 4) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			alarm[0]=1;
			break;
		case "Plug-type Asacoco":
			originaly=y;
			if (instance_exists(oEnemy)) {
				var CE = instance_nearest(x,y-50.75,oEnemy);
				direction = point_direction(x,y-50.75,CE.x, CE.y)
				image_angle = point_direction(x,y-50.75,CE.x, CE.y)
			} else instance_destroy();
			originalspeed = speed;
			speed = 0;
			alarm[0]=30;
			break;
	}
		if (sprite_index==blank) {
			instance_destroy();
	}
}
#endregion

