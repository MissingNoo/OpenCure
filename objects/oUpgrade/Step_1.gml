maxImg = sprite_get_number(sprite_index);
sprSpeed = sprite_get_speed(sprite_index);
sprSpeedType = sprite_get_speed_type(sprite_index);
//if (instance_number(oEnemy) == 0) {
//    instance_destroy();
//}
//if (global.gamePaused and !gotpaused) {
//    gotpaused = true;
//	speed = 0;
//	imageSpeedOriginal = image_speed;
//	image_speed = 0;
//}
if (socket == oPlayer.socket) {
    owner = instance_nearest(x,y,oPlayer);
}else{
	owner = instance_nearest(x,y, oSlave);
}
#region Start
// Feather disable GM2016
if (a==0) {	
speed=upg[$ "speed"];
if (!variable_instance_exists(self, "mindmg")) {
	mindmg = upg[$ "mindmg"];
}
if (!variable_instance_exists(self, "maxdmg")) {
	maxdmg = upg[$ "maxdmg"];
}
hits=upg[$ "hits"];
if (variable_struct_exists(upg, "size")) {
	    image_xscale = upg[$ "size"];
	    image_yscale = upg[$ "size"];
	}
if (shoots == 0) {
    shoots = upg[$ "shoots"];
}
if (shoots > 1) {
	arrowDir = global.arrowDir;
	if (variable_struct_exists(upg, "attackdelay")) {
		//alarm[0] = upg[$ "attackdelay"];
		dAlarm[0] = upg[$ "attackdelay"];
	}
	else{
		//alarm[0] = 1;
		dAlarm[0] = 1;
	}
}
sprite_index=upg[$ "sprite"];
subImg = 0;
image_index = 0;
image_speed = 0;


	var randomEnemy;
	//feather disable once GM2017
	if (upg[$ "perk"] and global.shopUpgrades.Growth.level == 1) {
	    for (var i = 0; i < global.level; ++i) {
		    mindmg = mindmg + (mindmg* 2 / 100);
			maxdmg = maxdmg+ (maxdmg* 2 / 100);
		}
	}
	var cooldown = upg[$ "cooldown"];
	if (upg[$ "canBeHasted"] == true and oPlayer.weaponHaste != 0) {
	    cooldown -= (cooldown * oPlayer.weaponHaste) - cooldown;
		//show_debug_message(string($ "{upg[$ "cooldown"]}/{cooldown}/{oPlayer.weaponHaste}"));
	}
	var minCooldown = upg[$ "minimumcooldown"];
	if (cooldown < minCooldown) {
	    cooldown = minCooldown;
	}
	global.upgradeCooldown[upg[$ "id"]] = cooldown;
	dAlarm[1] = upg[$ "duration"];
	image_speed=1;
	image_alpha=1;
	a=1;
	//if (shoots > 0) {
	//    show_debug_message("Spawned: " + string(upg[$ "id"]) + " Name: " + upg[$ "name"] + " Level: " + string(upg[$ "level"]) + " shoots: " + string(shoots) + " cooldown: " + string(upg[$ "cooldown"]) );
	//}
	if (variable_struct_exists(upg, "sound") and upg[$ "sound"] != "") {
		if (is_array(upg[$ "sound"])) {
			var snd = irandom_range(0, array_length(upg[$ "sound"])-1);
		    audio_play_sound(upg[$ "sound"][snd],0,0);
		}else{
			audio_play_sound(upg[$ "sound"],0,0);
		}
	    
	}
	//show_message(string(image_xscale));
	switch (upg[$ "id"]) {
		default:{
			defaultBehaviour();
			break;}
		case Weapons.AmePistol:{
			defaultBehaviour();
			direction = arrowDir;
			//alarm[0] = 10;
			image_angle = arrowDir;
			break;}
		case Weapons.GuraTrident:{
			image_angle = arrowDir + diroffset;
			//defaultBehaviour();			
			if (upg[$ "level"] >= 6) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			//alarm[0] = 1;
			break;}
		case Weapons.InaTentacle:{
			if (shoots > 1) {
				for (var i = 0; i < shoots; ++i) {
				    spawnUpgrade();
				}
			}
			if (shoots > 0) {
			    image_angle = arrowDir;
			}else{
				image_angle=random(360);
			}
			
			if (upg[$ "level"] >= 4) {
			    var dirr = (image_xscale > 0) ? .25 : -.25;
				image_xscale += dirr;
			}
			dAlarm[0]=1;
			break;}
		case Weapons.PlugAsaCoco:{
			originaly=y;
			image_alpha = .99;
			if (instance_exists(oEnemy)) {
				var enemies = instance_number(oEnemy);
				if (enemies == 0) { instance_destroy(); }
				ce = instance_find(oEnemy, irandom_range(0,enemies-1));
				direction = point_direction(x,y-50.75,ce.x, ce.y);
				image_angle = point_direction(x,y-50.75,ce.x, ce.y);
			} else instance_destroy();
			originalspeed = speed;
			speed = 0;
			dAlarm[1]=30;
			break;}
		case Weapons.BlBook:{
			orbitLength = 50;
			if (shoots > 0) {	
				switch (upg[$ "level"]) {
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
			//alarm[0]=1;
			break;}
		case Weapons.BounceBall:{
			//defaultBehaviour();
			direction = point_direction(x,y,x,y+10);
			for (var i = 0; i < global.player[?"ballsize"]; ++i) {
				image_xscale = image_xscale * 1.10;
				image_yscale = image_xscale;
			}
			y = oPlayer.y - 200;
			var _bx = irandom_range(-100, 100);
			x = oPlayer.x + _bx;
			//alarm[0] = upg[$ "attackdelay"];
			break;
		}
		case Weapons.EliteLavaBucket:{	
			level = upg[$ "level"];
			random_set_seed(current_time);
			x = owner.x + irandom_range(-100,100);
			random_set_seed(current_time);
			y = owner.y + (irandom_range(-100,100)*-1);
			//alarm[0] = 1;
			depth=owner.depth;
			//for (var i = 0; i < array_length(Bonuses[BonusType.WeaponSize]); ++i) {
			//	if (Bonuses[BonusType.WeaponSize][i] != 0) {
			//	    image_xscale = image_xscale * Bonuses[BonusType.WeaponSize][i];
			//		image_yscale = image_yscale * Bonuses[BonusType.WeaponSize][i];
			//	}			    
			//}
			//if (level >= 2 and level < 7) {
			//    image_xscale = image_xscale * 1.20;
			//	image_yscale = image_yscale * 1.20;
			//}
			//if (level >= 7) {
			//    image_xscale = image_xscale * 1.40;
			//	image_yscale = image_yscale * 1.40;
			//}
			break;}
		case Weapons.PowerofAtlantis:{	
			random_set_seed(current_time);
			x = owner.x + irandom_range(-200,200);
			random_set_seed(current_time);
			y = owner.y + (irandom_range(-200,200)*-1);
			//alarm[0] = 1;
			image_xscale = 1.3;
			image_yscale = 1.3;
			break;}
		case Weapons.CEOTears:{
			if (instance_exists(oEnemy)) {
				// random_set_seed(current_time * global.upgradeCooldown[0]);
				var enemies = instance_number(oEnemy);
				if (enemies == 0) { instance_destroy(); }
				//var ce = instance_nearest(x,y-50.75,oEnemy);
				// // randomize;
				//if (ce != 0) {
				    ce = instance_find(oEnemy, irandom_range(0,enemies-1));
					direction = point_direction(x,y,ce.x, ce.y);
					image_angle = point_direction(x,y,ce.x, ce.y);
				//}
				if (shoots>0) {
					for (var i = 1; i < shoots; ++i) {
						spawnUpgrade();
						//alarm[0]=1;
						dAlarm[0]=1;
					}
				}
			} else instance_destroy();
			break;
		}
		case Weapons.FanBeam:{
			image_xscale = owner.image_xscale;
			if(shoots == -1){
				image_xscale = image_xscale * -1;
			}
			if (shoots>0) {
				for (var i = 1; i < shoots; ++i) {
					spawnUpgrade();
					//alarm[0]=1;
					dAlarm[0]=1;
				}
			}
			break;}
		case Weapons.AbsoluteWall:{
			if (global.player[?"flat"]) {
				image_xscale = image_xscale * 1.20;
				image_yscale = image_yscale * 1.20;
				mindmg = mindmg * 1.20;
				maxdmg = maxdmg * 1.20;
			}
			break;}
		case Weapons.CuttingBoard:{
			if (global.player[?"flat"]) {
				image_xscale = image_xscale * 1.30;
				image_yscale = image_yscale * 1.30;
				mindmg = mindmg * 1.30;
				maxdmg = maxdmg * 1.30;
			}
			direction = arrowDir + 180 + diroffset;
			speed = upg[$ "speed"];
			image_angle = arrowDir + diroffset;
			//alarm[0] = upg[$ "attackdelay"];
			break;
		}
		case Weapons.HoloBomb:{	
			x = owner.x + irandom_range(-50,50);			
			y = owner.y + (irandom_range(-50,50)*-1);
			//alarm[0] = 1;
			depth=owner.depth;
			break;}	
		case Weapons.Glowstick:{
			if (instance_exists(oEnemy)) {
				var enemies = instance_number(oEnemy);
				if (enemies == 0) { instance_destroy(); }
				ce = instance_find(oEnemy, irandom_range(0,enemies-1));
				direction = point_direction(x,y,ce.x, ce.y);
				image_angle = point_direction(x,y,ce.x, ce.y);
				if (shoots>0) {
					for (var i = 1; i < shoots; ++i) { spawnUpgrade(); }
				}
			} else instance_destroy();
			break;}
		case Weapons.IdolSong:{
			if (idolDir == 90) {
			    idolDir = 270;
				idolStartX= oPlayer.x + 20;
				direction = idolDir;
			}else{
				idolDir = 90;
				idolStartX= oPlayer.x - 20;
				//xstart = xstart - 20;
				direction = idolDir;
				//image_xscale = image_xscale * -1;
			}
			break;}
		case Weapons.PsychoAxe:{
			orbitoffset = 0;
			orbitLength = 0;
			break;}
		case Weapons.WamyWater:{
			image_angle = arrowDir + diroffset;
			break;}
		#region modded
		case Weapons.PipiPilstol:{
			defaultBehaviour();
			direction = arrowDir;
			image_angle = arrowDir;
			//alarm[0] = 10;
			//if (shoots % 2) {
			if (shoots == -1) {
				sprite_index = sBulletBlue;
				var enemies = instance_number(oEnemy);
			    ce = instance_find(oEnemy, irandom_range(0,enemies-1));
				try{
					direction = point_direction(x,y,ce.x, ce.y);
					image_angle = point_direction(x,y,ce.x, ce.y);
				}
				catch (err){
					direction = point_direction(x,y, 0, 0);
					image_angle = point_direction(x,y, 0, 0);
				}				
			}
			break;
		}
		case Weapons.HeavyArtillery:{
			defaultBehaviour();
			var closest = instance_nearest(oPlayer.x ,oPlayer.y, oEnemy);
			x=closest.x;
			y=closest.y;
			if (shoots>0) {
				//alarm[0] = 20;
			}
			break;
		}
		#endregion
		case Weapons.SpiderCooking:{
			x = owner.x;
			y = owner.y - (sprite_get_height(global.player[?"sprite"]) / 3);
			image_yscale = image_xscale;
			for (var i = 0; i < instance_number(oUpgrade); ++i) {
				try{
					var inst = instance_find(oUpgrade, i);
					if (inst.upg[$ "id"] == Weapons.SpiderCooking and inst.id != id) {
						instance_destroy(inst);
					}
				}
				catch (err){ }
			}
			break;}
		case Weapons.ENsCurse:{
			direction = arrowDir;
			image_angle  = arrowDir;
			break;}
		case Weapons.XPotato:{
			direction = irandom_range(0,360);
			break;}
		#region Collabs
		case Weapons.MiComet:{
			instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Upgrades", oUpgrade,{
					upg : WEAPONS_LIST[Weapons.MiCometMeteor][1],
					speed : WEAPONS_LIST[Weapons.MiCometMeteor][1][$ "speed"],
					hits : WEAPONS_LIST[Weapons.MiCometMeteor][1][$ "hits"],
					shoots : WEAPONS_LIST[Weapons.MiCometMeteor][1][$ "shoots"],
					sprite_index : WEAPONS_LIST[Weapons.MiCometMeteor][1][$ "sprite"],
					level : WEAPONS_LIST[Weapons.MiCometMeteor][1][$ "level"],
					mindmg: WEAPONS_LIST[Weapons.MiCometMeteor][1][$ "mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.MiCometMeteor][1][$ "maxdmg"]
				});
			break;}
		case Weapons.MiCometMeteor:{
			break;}
		case Weapons.MiCometPool:{
			break;}
		case Weapons.BoneBrosBullet:{
			image_angle = direction;
			break;}
		case Weapons.BoneBros:{
			break;}
		case Weapons.BoneBrosSlash:{
			image_angle = direction;
			break;}
		case Weapons.BLFujoshi:{
			instance_create_layer(x, y, "Upgrades", oUpgrade,{
					upg : WEAPONS_LIST[Weapons.BLFujoshiAxe][1],
					speed : WEAPONS_LIST[Weapons.BLFujoshiAxe][1][$ "speed"],
					hits : WEAPONS_LIST[Weapons.BLFujoshiAxe][1][$ "hits"],
					shoots : WEAPONS_LIST[Weapons.BLFujoshiAxe][1][$ "shoots"],
					sprite_index : WEAPONS_LIST[Weapons.BLFujoshiAxe][1][$ "sprite"],
					level : WEAPONS_LIST[Weapons.BLFujoshiAxe][1][$ "level"],
					mindmg: WEAPONS_LIST[Weapons.BLFujoshiAxe][1][$ "mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.BLFujoshiAxe][1][$ "maxdmg"]
				});
			instance_create_layer(x, y, "Upgrades", oUpgrade,{
					upg : WEAPONS_LIST[Weapons.BLFujoshiBook][1],
					speed : WEAPONS_LIST[Weapons.BLFujoshiBook][1][$ "speed"],
					hits : WEAPONS_LIST[Weapons.BLFujoshiBook][1][$ "hits"],
					shoots : WEAPONS_LIST[Weapons.BLFujoshiBook][1][$ "shoots"],
					sprite_index : WEAPONS_LIST[Weapons.BLFujoshiBook][1][$ "sprite"],
					level : WEAPONS_LIST[Weapons.BLFujoshiBook][1][$ "level"],
					mindmg: WEAPONS_LIST[Weapons.BLFujoshiBook][1][$ "mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.BLFujoshiBook][1][$ "maxdmg"]
				});
			break;}
		case Weapons.BLFujoshiAxe:{
			break;}
		case Weapons.BLFujoshiBook:{
			break;}
		case Weapons.EldritchHorror:{
			dAlarm[3] = irandom(100);
			depth = layer_get_depth("Pools") + 1;
			x = oPlayer.x + irandom_range(-200, 200);
			y = oPlayer.y + irandom_range(-200, 200);
			ps = part_system_create();
			ps2 = part_system_create();
			part_system_depth(ps, depth-1);
			part_system_depth(ps2, depth-1);
			part_system_color(ps, c_white, .5);
			part_system_color(ps2, c_white, .5);
			part_system_draw_order( ps, false);
			part_system_draw_order( ps2, false);
			var _scale = 0.75;
			var _speed = 1;
			var ptype1 = part_type_create();
			part_type_sprite( ptype1, sEldricthHorrorSmoke, true, true, false);
			part_type_size( ptype1, 1, 1, 0, 0 );
			part_type_scale( ptype1, _scale, _scale);
			part_type_speed( ptype1, _speed, _speed, 0, 0);
			part_type_direction( ptype1, 180, 0, 0, 0);
			part_type_gravity( ptype1, 0, 270);
			part_type_orientation( ptype1, 0, 0, 0, 0, false);
			part_type_colour3( ptype1, $FFFFFF, $FFFFFF, $FFFFFF );
			part_type_alpha3( ptype1, 1, 1, 1);
			part_type_blend( ptype1, false);
			part_type_life( ptype1, 80, 80);
			var ptype2 = part_type_create();
			part_type_sprite( ptype2, sEldricthHorrorSmoke, true, true, false);
			part_type_size( ptype2, 1, 1, 0, 0 );
			part_type_scale( ptype2, _scale, _scale);
			part_type_speed( ptype2, _speed, _speed, 0, 0);
			part_type_direction( ptype2, 0, 0, 0, 0);
			part_type_gravity( ptype2, 0, 270);
			part_type_orientation( ptype2, 0, 0, 0, 0, false);
			part_type_colour3( ptype2, $FFFFFF, $FFFFFF, $FFFFFF );
			part_type_alpha3( ptype2, 1, 1, 1);
			part_type_blend( ptype2, false);
			part_type_life( ptype2, 80, 80);

			var pemit1 = part_emitter_create( ps );
			var pemit2 = part_emitter_create( ps2 );
			var _shape = ps_shape_ellipse;
			var _size = sprite_get_width(sEldricthHorrorPool);
			var _number = 1;
			part_emitter_region( ps, pemit1, -_size, _size, -_size, _size, _shape, ps_distr_linear );
			part_emitter_stream(ps, pemit1, ptype1, _number);
			part_emitter_region( ps2, pemit2, -_size, _size, -_size, _size, _shape, ps_distr_linear );
			part_emitter_stream(ps2, pemit2, ptype2, _number);

			part_system_position(ps, x, y);
			part_system_position(ps2, x, y);

			break;}
		case Weapons.BreatheInTypeAsacoco:{
			asaDirection = random_range(-1,1);
			asaRotationSpeed = irandom_range(-10, 10);
			asaSpeed = irandom_range(1, 8);
			asaDuration = random_range(0.8, 1.2);
			vspd = -11;
			break;}
		case Weapons.EliteCooking:{
			x = owner.x + irandom_range(-100,100);
			y = owner.y + (irandom_range(-100,100)*-1);
			break;}
		case Weapons.StreamOfTears:{
			image_xscale = upg[$ "sizeX"];
			image_yscale = upg[$ "sizeY"];
			//if (shoots == -1) {
			//    image_xscale = image_xscale*-1;
			//}
			break;}
		case Weapons.RingOfFitness:{
			//ringDir = 0;
			for (var i = 0; i < global.player[?"ballsize"]; ++i) {
				image_xscale = image_xscale * 1.10;
				image_yscale = image_xscale;
			}
			x = owner.x + lengthdir_x(20, ringDir);
			y = owner.y + lengthdir_y(20, ringDir);
			direction = point_direction(owner.x, owner.y, x, y);
			for (var i = 0; i < shoots - 1; ++i) {
				ringDir+= 24;
				//var _x = x + lengthdir_x(20, round(ringDir));
				//var _y = y + lengthdir_y(20, round(ringDir));
				//var dirr = point_direction(_x, _y, owner.x, owner.y);
			    instance_create_depth(owner.x, owner.y, depth, oUpgrade,{
					upg : WEAPONS_LIST[Weapons.RingOfFitness][1],
					speed : WEAPONS_LIST[Weapons.RingOfFitness][1][$ "speed"],
					hits : WEAPONS_LIST[Weapons.RingOfFitness][1][$ "hits"],
					shoots : -1,
					sprite_index : WEAPONS_LIST[Weapons.RingOfFitness][1][$ "sprite"],
					level : WEAPONS_LIST[Weapons.RingOfFitness][1][$ "level"],
					mindmg: WEAPONS_LIST[Weapons.RingOfFitness][1][$ "mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.RingOfFitness][1][$ "maxdmg"],
					ringDir,
					owner,
					firstBall : false
					//x : _x,
					//y : _y,
					//direction : dirr,
				});	
			}
			break;}
		case Weapons.ImDie:{
			direction = global.arrowDir;
			break;}
		case Weapons.ImDieExplosion:{
			break;}
		#endregion
	}
	if (sprite_index==sBlank and !variable_struct_exists(upg, "collab")) {
			instance_destroy();
	}
	
	originalSize = [image_xscale, image_yscale];	
	for (var i = 0; i < array_length(Bonuses[BonusType.WeaponSize]); ++i) {
	    if (Bonuses[BonusType.WeaponSize][i] != 0 and upg[$ "id"] != Weapons.HoloBomb) {
			if (image_xscale > 0) { 
				image_xscale = image_xscale * Bonuses[BonusType.WeaponSize][i]; 
			}
			else {
				image_xscale = image_xscale * (Bonuses[BonusType.WeaponSize][i] * -1); 
			}
			//image_yscale = image_yscale * Bonuses[BonusType.WeaponSize][i];
			image_yscale = image_xscale;
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
		if (!variable_instance_exists(self, "sent")) {
			sendMessage({
				command : Network.SpawnUpgrade,
				socket : oClient.connected,
				x,
				y,
				sprite_index,
				direction,
				image_angle,
				//speed,
				//sendvars,
				//upg : upg[$ "id"],
				upgID,
				haveafterimage : (variable_struct_exists(upg, "afterimage")) ? true : false
			});
		}
		//var sidevars = ["upg", "speed", "hits", "sprite_index", "level", "mindmg", "maxdmg"];
		//for (var i = 0; i < array_length(sidevars); ++i) {
		//    buffer_write(oClient.clientBuffer, buffer_s16, variable_instance_get(self, sidevars[i]));
		//}
		//if (global.debug) {
		//    show_message(sendvars);
		//}
	}	
}

#endregion