
#region Start
// Feather disable GM2016
if (a==0) {	
	global.upgradeCooldown[upg[?"id"]] = upg[?"cooldown"];
	alarm[1] = upg[?"duration"];
	
	if (!variable_instance_exists(self, "mindmg")) {
		mindmg = upg[?"mindmg"];
	}
	
	if (!variable_instance_exists(self, "maxdmg")) {
	    maxdmg = upg[?"maxdmg"];
	}
	
	
	image_speed=1;
	image_alpha=1;
	a=1;
	if (shoots > 0) {
	    show_debug_message("Spawned: " + string(upg[?"id"]) + " Name: " + upg[?"name"] + " Level: " + string(upg[?"level"]) + " shoots: " + string(shoots) + " cooldown: " + string(upg[?"cooldown"]) );
	}
	
	//show_message(string(image_xscale));
	switch (upg[?"name"]) {
		default:{
			defaultBehaviour();
			break;}
			
		case "AmePistol":{
			audio_play_sound(snd_Bullet,0,0);
			defaultBehaviour();
			alarm[0] = 10;
			break;}
			
		case "GuraTrident":{
			image_angle = global.arrow_dir + diroffset;
			//defaultBehaviour();			
			if (upg[?"level"] >= 6) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			alarm[0] = 1;
			break;}
			
		case "InaTentacle":{
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
			break;}
			
		case "Plug-type Asacoco":{
			originaly=y;
			if (instance_exists(oEnemy)) {
				random_set_seed(current_time * global.upgradeCooldown[0]);
				var enemies = instance_number(oEnemy);
				//var CE = instance_nearest(x,y-50.75,oEnemy);
				CE = instance_find(oEnemy, irandom_range(0,enemies-1));
				direction = point_direction(x,y-50.75,CE.x, CE.y)
				image_angle = point_direction(x,y-50.75,CE.x, CE.y)
				if (shoots>0) {
					for (var i = 1; i < shoots; ++i) {
						inst = (instance_create_layer(oPlayer.x,oPlayer.y-8,"Upgrades",oUpgrade));
						inst.upg=upg;
						inst.speed=upg[?"speed"];
						inst.hits=upg[?"hits"];
						inst.shoots = 0;
						inst.sprite_index=upg[?"sprite"];
						alarm[0]=1;
					}
				}
			} else instance_destroy();
			originalspeed = speed;
			speed = 0;
			alarm[0]=30;
			break;}
			
		case "BL Book":{
			orbit_length = 50;
			if (shoots > 0) {	
				switch (upg[?"level"]) {
				    case 1:
				        orbitoffset = -120;
				        break;
				    case 2:
				        orbitoffset = -90;
				        break;
					case 3:
				        orbitoffset = -90;
				        break;
					case 4:
				        orbitoffset = -80;
				        break;
					case 5:
				        orbitoffset = -80;
				        break;
					case 6:
				        orbitoffset = -60;
				        break;
					case 7:
				        orbitoffset = -60;
				        break;
				}
			}
			alarm[0]=1;
			break;}
			
		case "Elite Lava Bucket":{	
			random_set_seed(current_time);
			x = oPlayer.x + irandom_range(-200,200)
			random_set_seed(current_time);
			y = oPlayer.y + (irandom_range(-200,200)*-1)
			alarm[0] = 1;
			alarm[1] = 9999;
			depth=oPlayer.depth;
			break;}
		case "Power of Atlantis":{	
			random_set_seed(current_time);
			x = oPlayer.x + irandom_range(-200,200)
			random_set_seed(current_time);
			y = oPlayer.y + (irandom_range(-200,200)*-1)
			alarm[0] = 1;
			depth=oPlayer.depth;
			break;}
	}
		if (sprite_index==blank) {
			instance_destroy();
	}
	for (var i = 0; i < array_length(Bonuses[bonusType.weaponSize]); ++i) {
	    if (Bonuses[bonusType.weaponSize][i] != 0) {
			if (image_xscale > 0) { image_xscale = image_xscale * Bonuses[bonusType.weaponSize][i]; }
			else { image_xscale = image_xscale * (Bonuses[bonusType.weaponSize][i] * -1); }
			image_yscale = image_yscale * Bonuses[bonusType.weaponSize][i];
		}
	}
	
}
#endregion





