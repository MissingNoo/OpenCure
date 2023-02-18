if (socket == oPlayer.socket) {
    owner = instance_nearest(x,y,oPlayer) 
}else{
	owner = instance_nearest(x,y, oSlave);
}
#region Start
// Feather disable GM2016
if (a==0) {	
	var randomEnemy;
	global.upgradeCooldown[upg[$"id"]] = upg[$"cooldown"];
	alarm[1] = upg[$"duration"];
	image_speed=1;
	image_alpha=1;		
	a=1;
	//if (shoots > 0) {
	//    show_debug_message("Spawned: " + string(upg[$"id"]) + " Name: " + upg[$"name"] + " Level: " + string(upg[$"level"]) + " shoots: " + string(shoots) + " cooldown: " + string(upg[$"cooldown"]) );
	//}
	
	//show_message(string(image_xscale));
	switch (upg[$"id"]) {
		default:{
			defaultBehaviour();
			break;}
			
		case Weapons.AmePistol:{
			audio_play_sound(snd_bullet,0,0);
			defaultBehaviour();
			alarm[0] = 10;
			break;}
			
		case Weapons.GuraTrident:{
			image_angle = arrowDir + diroffset;
			//defaultBehaviour();			
			if (upg[$"level"] >= 6) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			alarm[0] = 1;
			break;}
			
		case "InaTentacle":{
			//defaultBehaviour();
			if (shoots > 0) {
			    image_angle = arrowDir;
			}
			else image_angle=diroffset;
			
			if (upg[$"level"] >= 4) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			alarm[0]=1;
			break;}
			
		case Weapons.PlugAsaCoco:{
			originaly=y;
			image_alpha = .99;
			if (instance_exists(oEnemy)) {
				random_set_seed(current_time * global.upgradeCooldown[0]);
				var enemies = instance_number(oEnemy);
				//var CE = instance_nearest(x,y-50.75,oEnemy);
				randomize();
				CE = instance_find(oEnemy, irandom_range(0,enemies-1));
				direction = point_direction(x,y-50.75,CE.x, CE.y);
				image_angle = point_direction(x,y-50.75,CE.x, CE.y);
				if (shoots>0) {
					for (var i = 1; i < shoots; ++i) {
						//inst = (instance_create_layer(owner.x,owner.y-8,"Upgrades",oUpgrade));
						//inst.upg=upg;
						//inst.speed=upg[$"speed"];
						//inst.hits=999;
						//inst.shoots = 0;
						//inst.sprite_index=upg[$"sprite"];
						spawnUpgrade();
						alarm[0]=1;
					}
				}
			} else instance_destroy();
			originalspeed = speed;
			speed = 0;
			alarm[0]=30;
			break;}
			
		case Weapons.BlBook:{
			orbit_length = 50;
			if (shoots > 0) {	
				switch (upg[$"level"]) {
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
			
		case Weapons.EliteLavaBucket:{	
			level = upg[$"level"];
			random_set_seed(current_time);
			x = owner.x + irandom_range(-100,100)
			random_set_seed(current_time);
			y = owner.y + (irandom_range(-100,100)*-1)
			alarm[0] = 1;
			depth=owner.depth;
			for (var i = 0; i < array_length(Bonuses[BonusType.WeaponSize]); ++i) {
				if (Bonuses[BonusType.WeaponSize][i] != 0) {
				    image_xscale = image_xscale * Bonuses[BonusType.WeaponSize][i];
					image_yscale = image_yscale * Bonuses[BonusType.WeaponSize][i];
				}			    
			}
			if (level >= 2 and level < 7) {
			    image_xscale = image_xscale * 1.20;
				image_yscale = image_yscale * 1.20;
			}
			if (level >= 7) {
			    image_xscale = image_xscale * 1.40;
				image_yscale = image_yscale * 1.40;
			}
			break;}
		case Weapons.PowerofAtlantis:{	
			random_set_seed(current_time);
			x = owner.x + irandom_range(-200,200)
			random_set_seed(current_time);
			y = owner.y + (irandom_range(-200,200)*-1)
			alarm[0] = 1;
			image_xscale = 1.3;
			image_yscale = 1.3;
			break;}
		case Weapons.CEOTears:{
			if (instance_exists(oEnemy)) {
				random_set_seed(current_time * global.upgradeCooldown[0]);
				var enemies = instance_number(oEnemy);
				//var CE = instance_nearest(x,y-50.75,oEnemy);
				randomize();
				CE = instance_find(oEnemy, irandom_range(0,enemies-1));
				direction = point_direction(x,y,CE.x, CE.y);
				image_angle = point_direction(x,y,CE.x, CE.y);
				if (shoots>0) {
					for (var i = 1; i < shoots; ++i) {
						spawnUpgrade();
						alarm[0]=1;
					}
				}
			} else instance_destroy();
			break;
		}
		case Weapons.CuttingBoard:{
			direction = arrowDir + 180;
			speed = upg[$"speed"];
			image_angle = arrowDir + diroffset;
			break;
		}
	}
		if (sprite_index==blank) {
			instance_destroy();
	}
	for (var i = 0; i < array_length(Bonuses[BonusType.WeaponSize]); ++i) {
	    if (Bonuses[BonusType.WeaponSize][i] != 0) {
			if (image_xscale > 0) { image_xscale = image_xscale * Bonuses[BonusType.WeaponSize][i]; }
			else { image_xscale = image_xscale * (Bonuses[BonusType.WeaponSize][i] * -1); }
			image_yscale = image_yscale * Bonuses[BonusType.WeaponSize][i];
		}
	}
	{ //online code
		vars = variable_instance_get_names(self);
		savedvars = {};
		for (var i = 0; i < array_length(vars); ++i) {
		    variable_struct_set(savedvars, vars[i], variable_instance_get(self, vars[i]));
		}
		sendvars = json_stringify(savedvars);
		//show_message(sendvars);
		buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
		buffer_write(oClient.clientBuffer, buffer_u8, Network.SpawnUpgrade);
		buffer_write(oClient.clientBuffer, buffer_u8, oPlayer.socket);
		buffer_write(oClient.clientBuffer, buffer_u16, x);
		buffer_write(oClient.clientBuffer, buffer_u16, y);
		buffer_write(oClient.clientBuffer, buffer_u16, sprite_index);
		buffer_write(oClient.clientBuffer, buffer_u16, speed);
		buffer_write(oClient.clientBuffer, buffer_s16, direction);
		buffer_write(oClient.clientBuffer, buffer_s16, image_angle);
		buffer_write(oClient.clientBuffer, buffer_string, sendvars);
		buffer_write(oClient.clientBuffer, buffer_string, json_stringify(upg));
		//var sidevars = ["upg", "speed", "hits", "sprite_index", "level", "mindmg", "maxdmg"];
		//for (var i = 0; i < array_length(sidevars); ++i) {
		//    buffer_write(oClient.clientBuffer, buffer_s16, variable_instance_get(self, sidevars[i]));
		//}
		//if (global.debug) {
		//    show_message(sendvars);
		//}

		if (!variable_instance_exists(self, "sent")) {
		    network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
		}
	}	
}

#endregion