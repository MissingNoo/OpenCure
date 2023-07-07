/// @description 

if (upg[$"id"] == Weapons.BounceBall) {
		var _push = 5;
		var _dir = point_direction(other.x, other.y, x, y);
		var _rnd = 0;
		do {
		    _rnd = irandom_range(-1,1);
		} until (_rnd != 0);
		var _hspd = lengthdir_x(_push, _dir)  * _rnd;
		var _vspd = lengthdir_y(_push, _dir); 
		 //x+=_hspd;
		 //y+=_vspd;
		 vspeed=_vspd;
		 hspeed = _hspd;
		 //direction = point_direction(x, y, x + _hspd, y + _vspd);
		 //if (alarm_get(11) == -1) {
		 //    alarm[11] = 20;
		 //}
		 
}

if (other.hittedcooldown[upg[$"id"]] <= 0  and !global.gamePaused and other.image_alpha == 1 and image_alpha == 1 and ghost == false) {
	audio_play_sound(choose(snd_hit1, snd_hit2, snd_hit3), 0, 0, .5);
	#region debuffs	
	for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
		#region Shark Bite
		var found = false;
		if (PLAYER_PERKS[i][$"id"] == PerkIds.SharkBite and PLAYER_PERKS[i][$"level"] > 0 and irandom_range(1,100) <= Buffs[BuffNames.SharkBite].chance[PLAYER_PERKS[i][$"level"]]) {
			instance_create_layer(other.x, other.y, "Instances", oDebuffAnimation, {sprite_index : sSharkBiteAnimation});
			for (var j = 0; j < array_length(other.debuffs); ++j) {
				if (other.debuffs[j].id == BuffNames.SharkBite) {
					found = true;
					if (other.debuffs[j].marks < other.debuffs[j].maxMarks) {
						other.debuffs[j].marks += 1;
					}
				}
			}
			if (!found) {
				var _lv=0;
				for (var k = 0; k < array_length(PLAYER_PERKS); ++k) {
					if (PLAYER_PERKS[k][$"id"] == PerkIds.SharkBite) {
						_lv = PLAYER_PERKS[k][$"level"];
					}
				}
				Buffs[BuffNames.SharkBite].level = _lv;
				array_push(other.debuffs, copyStruct(Buffs[BuffNames.SharkBite]));
			}
		}
		#endregion
	}	
	#endregion
	
	other.hittedcooldown[upg[$"id"]] = upg[$"hitCooldown"];
	other.damaged = true;
	//random_set_seed(current_time);
	if (!variable_instance_exists(self, "mindmg")) {
		mindmg = 0;
	}
	
	if (!variable_instance_exists(self, "maxdmg")) {
	    // Feather disable once GM2016
	    maxdmg = 0;
	}
	var dmg = irandom_range(mindmg, maxdmg);
	var bdmg = 0;
	for (var i = 0; i < array_length(Bonuses[BonusType.Damage]); ++i) {
	    if (Bonuses[BonusType.Damage][i] != 0) {
		    bdmg += (dmg * Bonuses[BonusType.Damage][i]) - dmg;
		}
	}
	
	for (var i = 0; i < array_length(PerkBonuses[BonusType.Damage]); ++i) {
	    if (PerkBonuses[BonusType.Damage][i] != 0) {
		    bdmg += (dmg * PerkBonuses[BonusType.Damage][i]) - dmg;
		}
	}
	
	for (var i = 0; i < array_length(other.debuffs); ++i) {
	    if (other.debuffs[i].id == BuffNames.SharkBite) {
			for (var j = 0; j < other.debuffs[i].marks; ++j) {
				bdmg += (dmg * other.debuffs[i].damage[other.debuffs[i].level]) - dmg;
			}
		}
	}
	
	for (var i = 0; i < global.ShopUpgrades[$ "Atk"][$ "level"]; ++i) {
	    bdmg = bdmg + ((bdmg * 6) / 100);
	}

	dmg = dmg + bdmg;
	if (global.player == CHARACTERS[Characters.Amelia]) {
	    for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
		    if (PLAYER_PERKS[i][$"id"] == PerkIds.DetectiveEye and PLAYER_PERKS[i][$"level"] == 3) {
				randomize();
				if (irandom_range(0, 100) <= 2) {
				    dmg = dmg * 999;
				}			    
			}
		}
	}
	//show_message(string(originalDamage) + "/" + string(dmg));
	other.hp-= dmg * global.player[?"atk"];
	if (global.DamageNumbers) {
	    var _inst = instance_create_layer(other.x,other.y,"DamageLayer",oDamageText);
		_inst.dmg = round(dmg);
	}
	
	other.alarm[1]=15;	
	switch (upg[$"id"]) {
	    case Weapons.AmePistol:
	        if (hits == 1 and !AmePistolLastHit and upg[$"level"] >= 4) {
			    AmePistolLastHit=true;
				hits+=5;
				direction = random(360);
				//switch (direction) {
				//    case 0:
				//        direction = 180;
				//        break;
				//    case 180:
				//        direction = 0;
				//        break;
				//}
			}
	        break;
		case Weapons.ENsCurse:
			var chance = irandom_range(0, 100);
			if (chance < upg[$"chance"]) {
				var near = instance_nearest(x,y, oEnemy);
			    if (distance_to_object(near) < upg[$"range"]) {
				    hits = 2;
					image_angle = point_direction(x,y, near.x, near.y - 8);
					direction = point_direction(x,y, near.x, near.y - 8);
				}
				else{
					instance_destroy();
				}
			}			
			break;
		case Weapons.HoloBomb:
			image_xscale = originalSize[0];
			image_yscale = originalSize[1];
			sprite_index = sBombExplosion;
			level = upg[$"level"];
				for (var i = 0; i < array_length(Bonuses[BonusType.WeaponSize]); ++i) {
					if (Bonuses[BonusType.WeaponSize][i] != 0) {
					    image_xscale = image_xscale * Bonuses[BonusType.WeaponSize][i];
						image_yscale = image_yscale * Bonuses[BonusType.WeaponSize][i];
					}			    
				}
				if (level >= 2 and level < 6) {
				    image_xscale = image_xscale * 1.15;
					image_yscale = image_yscale * 1.15;
				}
				if (level >= 6) {
				    image_xscale = image_xscale * 1.35;
					image_yscale = image_yscale * 1.35;
				}
			break;
	    default:
	        break;
	}
	hits-=1;
}