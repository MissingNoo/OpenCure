//if (socket == oPlayer.socket) {
//    owner = instance_nearest(x,y,oPlayer);
//}else{
//	owner = instance_nearest(x,y, oSlave);
//}
//#region Start
//// Feather disable GM2016
////if (a==0) {	
//speed=upg[$"speed"];
//mindmg = upg[$"mindmg"];
//maxdmg = upg[$"maxdmg"];
//hits=upg[$"hits"];
//if (shoots == 0) {
//    shoots = upg[$"shoots"];
//}
//if (keyboard_check(ord("C")) and upg != UPGRADES[0]) {show_message(upg[$"shoots"]);show_message(shoots)};
//sprite_index=upg[$"sprite"];



//	var randomEnemy;
//	if (upg[$"perk"] and global.ShopUpgrades.Growth.level == 1) {
//	    for (var i = 0; i < global.level; ++i) {
//		    mindmg = mindmg + (mindmg* 2 / 100);
//			maxdmg = maxdmg+ (maxdmg* 2 / 100);
//		}
//	}
//	global.upgradeCooldown[upg[$"id"]] = upg[$"cooldown"];
//	alarm[1] = upg[$"duration"];
//	image_speed=1;
//	image_alpha=1;		
//	//a=1;
//	//if (shoots > 0) {
//	//    show_debug_message("Spawned: " + string(upg[$"id"]) + " Name: " + upg[$"name"] + " Level: " + string(upg[$"level"]) + " shoots: " + string(shoots) + " cooldown: " + string(upg[$"cooldown"]) );
//	//}
//	if (variable_struct_exists(upg, "sound") and upg[$"sound"] != "") {
//		if (is_array(upg[$"sound"])) {
//			var snd = irandom_range(0, array_length(upg[$"sound"])-1);
//		    audio_play_sound(upg[$"sound"][snd],0,0);
//		}else{
//			audio_play_sound(upg[$"sound"],0,0);
//		}
	    
//	}
//	//show_message(string(image_xscale));
//	switch (upg[$"id"]) {
//		default:{
//			defaultBehaviour();
//			break;}
			
//		case Weapons.AmePistol:{
//			defaultBehaviour();
//			direction = global.arrowDir;
//			alarm[0] = 10;
//			image_angle = global.arrowDir;
//			break;}
			
//		case Weapons.GuraTrident:{
//			image_angle = arrowDir + diroffset;
//			//defaultBehaviour();			
//			if (upg[$"level"] >= 6) {
//			    var dirr = (image_xscale > 0) ? .25 : -.25;
//				image_xscale += dirr;
//			}
//			alarm[0] = 1;
//			break;}
			
//		case Weapons.InaTentacle:{
//			if (shoots > 1) {
//				for (var i = 0; i < shoots; ++i) {
//				    spawnUpgrade();
//				}
//			}
//			if (shoots > 0) {
//			    image_angle = arrowDir;
//			}else{
//				image_angle=random(360);
//			}
			
//			if (upg[$"level"] >= 4) {
//			    var dirr = (image_xscale > 0) ? .25 : -.25;
//				image_xscale += dirr;
//			}
//			alarm[0]=1;
//			break;}
			
//		case Weapons.PlugAsaCoco:{
//			originaly=y;
//			image_alpha = .99;
//			if (instance_exists(oEnemy)) {
//				var enemies = instance_number(oEnemy);
//				CE = instance_find(oEnemy, irandom_range(0,enemies-1));
//				direction = point_direction(x,y-50.75,CE.x, CE.y);
//				image_angle = point_direction(x,y-50.75,CE.x, CE.y);				
//				if (shoots>0) {
//					for (var i = 1; i < shoots; ++i) {
//						//inst = (instance_create_layer(owner.x,owner.y-8,"Upgrades",oUpgrade));
//						//inst.upg=upg;
//						//inst.speed=upg[$"speed"];
//						//inst.hits=999;
//						//inst.shoots = 0;
//						//inst.sprite_index=upg[$"sprite"];
//						spawnUpgrade();
//						alarm[0]=10;
//					}
//				}
//			} else instance_destroy();
//			originalspeed = speed;
//			speed = 0;
//			alarm[0]=30;
//			break;}
			
//		case Weapons.BlBook:{
//			orbit_length = 50;
//			if (shoots > 0) {	
//				switch (upg[$"level"]) {
//				    case 1:
//				        orbitoffset = -120;
//				        break;
//				    case 2:
//				        orbitoffset = -90;
//				        break;
//					case 3:
//				        orbitoffset = -90;
//				        break;
//					case 4:
//				        orbitoffset = -80;
//				        break;
//					case 5:
//				        orbitoffset = -80;
//				        break;
//					case 6:
//				        orbitoffset = -60;
//				        break;
//					case 7:
//				        orbitoffset = -60;
//				        break;
//				}
//			}
//			alarm[0]=1;
//			break;}
			
//		case Weapons.EliteLavaBucket:{	
//			level = upg[$"level"];
//			random_set_seed(current_time);
//			x = owner.x + irandom_range(-100,100);
//			random_set_seed(current_time);
//			y = owner.y + (irandom_range(-100,100)*-1);
//			alarm[0] = 1;
//			depth=owner.depth;
//			//for (var i = 0; i < array_length(Bonuses[BonusType.WeaponSize]); ++i) {
//			//	if (Bonuses[BonusType.WeaponSize][i] != 0) {
//			//	    image_xscale = image_xscale * Bonuses[BonusType.WeaponSize][i];
//			//		image_yscale = image_yscale * Bonuses[BonusType.WeaponSize][i];
//			//	}			    
//			//}
//			if (level >= 2 and level < 7) {
//			    image_xscale = image_xscale * 1.20;
//				image_yscale = image_yscale * 1.20;
//			}
//			if (level >= 7) {
//			    image_xscale = image_xscale * 1.40;
//				image_yscale = image_yscale * 1.40;
//			}
//			break;}
//		case Weapons.PowerofAtlantis:{	
//			random_set_seed(current_time);
//			x = owner.x + irandom_range(-200,200);
//			random_set_seed(current_time);
//			y = owner.y + (irandom_range(-200,200)*-1);
//			alarm[0] = 1;
//			image_xscale = 1.3;
//			image_yscale = 1.3;
//			break;}
//		case Weapons.CEOTears:{
//			if (instance_exists(oEnemy)) {
//				// random_set_seed(current_time * global.upgradeCooldown[0]);
//				var enemies = instance_number(oEnemy);
//				//var CE = instance_nearest(x,y-50.75,oEnemy);
//				// // randomize;
//				//if (CE != 0) {
//				    CE = instance_find(oEnemy, irandom_range(0,enemies-1));
//					direction = point_direction(x,y,CE.x, CE.y);
//					image_angle = point_direction(x,y,CE.x, CE.y);
//				//}
//				if (shoots>0) {
//					for (var i = 1; i < shoots; ++i) {
//						spawnUpgrade();
//						alarm[0]=1;
//					}
//				}
//			} else instance_destroy();
//			break;
//		}
//		case Weapons.FanBeam:{
//			image_xscale = owner.image_xscale;
//			if(shoots == 0){
//				image_xscale = image_xscale * -1;
//			}
//			if (shoots>0) {
//				for (var i = 1; i < shoots; ++i) {
//					spawnUpgrade();
//					alarm[0]=1;
//				}
//			}
//			break;}
//		case Weapons.CuttingBoard:{
//			direction = arrowDir + 180;
//			speed = upg[$"speed"];
//			image_angle = arrowDir + diroffset;
//			break;
//		}
//		case Weapons.HoloBomb:{	
//			x = owner.x + irandom_range(-50,50);			
//			y = owner.y + (irandom_range(-50,50)*-1);
//			alarm[0] = 1;
//			depth=owner.depth;
//			break;}
			
//		case Weapons.Glowstick:{
//			if (instance_exists(oEnemy)) {
//				var enemies = instance_number(oEnemy);
//				CE = instance_find(oEnemy, irandom_range(0,enemies-1));
//				direction = point_direction(x,y,CE.x, CE.y);
//				image_angle = point_direction(x,y,CE.x, CE.y);
//				if (shoots>0) {
//					for (var i = 1; i < shoots; ++i) { spawnUpgrade(); }
//				}
//			} else instance_destroy();
//			break;}
			
//		case Weapons.IdolSong:{
//			if (idolDir == 0) {
//			    idolDir = 180;
//				direction = idolDir;
//			}else{
//				idolDir = 0;
//				direction = idolDir;
//				image_xscale = image_xscale * -1;
//			}		
//			if (shoots>0) {
//				alarm[0] = 1;
//			}
//			break;}
//		case Weapons.PsychoAxe:{
//			orbitoffset = 0;
//			orbit_length = 0;
//			break;}
//		case Weapons.WamyWater:{
//			image_angle = arrowDir + diroffset;
//			break;}
//		#region modded
//		case Weapons.PipiPilstol:{
//			defaultBehaviour();
//			direction = global.arrowDir;
//			image_angle = global.arrowDir;
//			alarm[0] = 10;
//			if (shoots % 2) {
//				sprite_index = spr_Pipmod_Pippa_bullet_rifle_blue;
//				var enemies = instance_number(oEnemy);
//			    CE = instance_find(oEnemy, irandom_range(0,enemies-1));
//				direction = point_direction(x,y,CE.x, CE.y);
//				image_angle = point_direction(x,y,CE.x, CE.y);
//			}
//			break;
//		}
//		case Weapons.HeavyArtillery:{
//			defaultBehaviour();
//			var closest = instance_nearest(oPlayer.x ,oPlayer.y, oEnemy);
//			x=closest.x;
//			y=closest.y;
//			if (shoots>0) {
//				alarm[0] = 20;
//			}
//			break;
//		}
//		#endregion
//	}
//		if (sprite_index==blank) {
//			instance_destroy();
//	}
//	if (variable_struct_exists(upg, "size")) {
//	    image_xscale = upg[$"size"];
//	    image_yscale = upg[$"size"];
//	}
	
//	originalSize = [image_xscale, image_yscale];
//	for (var i = 0; i < array_length(Bonuses[BonusType.WeaponSize]); ++i) {
//	    if (Bonuses[BonusType.WeaponSize][i] != 0 and upg[$"id"] != Weapons.HoloBomb) {
//			if (image_xscale > 0) { image_xscale = image_xscale * Bonuses[BonusType.WeaponSize][i]; }
//			else { image_xscale = image_xscale * (Bonuses[BonusType.WeaponSize][i] * -1); }
//			image_yscale = image_yscale * Bonuses[BonusType.WeaponSize][i];
//		}
//	}
//	{ //online code
//		vars = variable_instance_get_names(self);
//		savedvars = {};
//		for (var i = 0; i < array_length(vars); ++i) {
//		    variable_struct_set(savedvars, vars[i], variable_instance_get(self, vars[i]));
//		}
//		sendvars = json_stringify(savedvars);
//		//show_message(sendvars);
//		buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
//		buffer_write(oClient.clientBuffer, buffer_u8, Network.SpawnUpgrade);
//		buffer_write(oClient.clientBuffer, buffer_u8, oPlayer.socket);
//		buffer_write(oClient.clientBuffer, buffer_u16, x);
//		buffer_write(oClient.clientBuffer, buffer_u16, y);
//		buffer_write(oClient.clientBuffer, buffer_u16, sprite_index);
//		//buffer_write(oClient.clientBuffer, buffer_u16, speed);
//		buffer_write(oClient.clientBuffer, buffer_s16, direction);
//		buffer_write(oClient.clientBuffer, buffer_s16, image_angle);
//		buffer_write(oClient.clientBuffer, buffer_string, sendvars);
//		buffer_write(oClient.clientBuffer, buffer_u8, upg[$"id"]);
//		//var sidevars = ["upg", "speed", "hits", "sprite_index", "level", "mindmg", "maxdmg"];
//		//for (var i = 0; i < array_length(sidevars); ++i) {
//		//    buffer_write(oClient.clientBuffer, buffer_s16, variable_instance_get(self, sidevars[i]));
//		//}
//		//if (global.debug) {
//		//    show_message(sendvars);
//		//}

//		if (!variable_instance_exists(self, "sent")) {
//		    network_send_udp_raw(oClient.client, global.serverip, global.port, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
//		}
//	}	
////}

//#endregion