#region critChance
var calc = 0;
calc += real(string_replace(string(global.player[?"crit"]), "1.", ""));
for (var i = 0; i < array_length(Bonuses[BonusType.Critical]); ++i) {
	if (!is_array(Bonuses[BonusType.Critical][i])) {
		if (Bonuses[BonusType.Critical][i] != 0) {
			if (Bonuses[BonusType.Critical][i] > 1) {
				calc += (real(string_replace(string(Bonuses[BonusType.Critical][i]), "1.", "")));
			}
			else{
				calc -= (1 - Bonuses[BonusType.Critical][i]) * 100;
			}							
		}
	}
	else{
		for (var j = 0; j < array_length(Bonuses[BonusType.Critical][i]); ++j) {
			if (Bonuses[BonusType.Critical][i][j] != 0) {
				if (Bonuses[BonusType.Critical][i][j] > 1) {
					calc += (real(string_replace(string(Bonuses[BonusType.Critical][i][j]), "1.", "")));
				}
				else{
					calc -= (1 - Bonuses[BonusType.Critical][i][j]) * 100;
				}							
			}
		}
	}						
}
for (var i = 0; i < array_length(PerkBonuses[BonusType.Critical]); ++i) {
	if (PerkBonuses[BonusType.Critical][i] != 0) {
		calc += real(string_replace(string(PerkBonuses[BonusType.Critical][i]), "1.", ""));
	}
}
if (global.shopUpgrades[$ "Crit"].level > 0) {		
	for (var i = 0; i < global.shopUpgrades[$ "Crit"].level; ++i) {
		calc+=2;
	}
}
critChance = calc;
#endregion
#region Haste
var down = 0;
for (var i = 0; i < array_length(Bonuses[BonusType.Haste]); ++i) {
	if (Bonuses[BonusType.Haste][i] != 0) {
		if (Bonuses[BonusType.Haste][i] > 0) {
			down += real("." + string_replace(Bonuses[BonusType.Haste][i], "1.", ""));
		}
		if (Bonuses[BonusType.Haste][i] < 0) {
			down -= real("." + string_replace(Bonuses[BonusType.Haste][i], "0.", ""));
		}
	}
}
for (var i = 0; i < global.shopUpgrades[$ "Haste"][$ "level"]; ++i) {
	down = down + ((down * 4) / 100);
}
if (down > 0 and string_starts_with(down, "0.")) {
    down = real(string_replace(down, "0.", "1."));
}
if (down < 0) {
    down = down * -1;
}
weaponHaste = down;
#endregion
image_speed = oImageSpeed * Delta;
//oCam.x = oPlayer.x;
//oCam.y = oPlayer.y;
socket = global.socket;
if (immortal) {
    HP = MAXHP;
}
// Feather disable GM201
//HP=MAXHP;
if (!global.gamePaused) {
	for (var i = 0; i < array_length(dAlarm); ++i) {
	    if (dAlarm[i] != -1) {
		    dAlarm[i] -= 1 * Delta;
		}
		if (dAlarm[i] < 0 and dAlarm[i] != -1) {
		    dAlarm[i] = -1;
			event_user(i);
		}
	}
	if (skilltimer < specialcooldown + 10) { skilltimer+=1/60; }
	//if (skilltimer < special.cooldown + 10) { skilltimer+=100; }
	tickPowers();
	tickItems();
	tick_perks();
	Movement();
	
	if (keyboard_check_pressed(ord("X")) and skilltimer > specialcooldown and global.shopUpgrades[$ "SpecialAtk"][$ "level"] == 1) {
	//if (keyboard_check_pressed(ord("X"))) {
	    use_special(special);
	}
	#region RedGura
	if(redgura){
		//feather disable once GM2017
		part_red ??= part_system_create(part_GuraRed);
		//feather disable once GM2017
		part_system_position(part_red, x, y);
		// show_debug_message(time_source_get_time_remaining(redtime));
		var _timestate = time_source_get_state(redtime);
		if(_timestate == time_source_state_initial or _timestate == time_source_state_stopped){
			time_source_start(redtime);
		}
	}
	#endregion
	
	if (global.lastsequence != undefined) {
	    layer_sequence_x(global.lastsequence, oPlayer.x);
	    layer_sequence_y(global.lastsequence, oPlayer.y);
	}
	
	sendMessage({
		command : Network.Move,
		socket : socket,
		x : x,
		y : y, 
		image_xscale : image_xscale,
		sprite : sprite_index,
		
	});
	
	#region XP Range
		var inRange = collision_circle(x,y-16,pickupRadius, oXP, false, true);
		if (inRange != noone) { inRange.onArea = true; }
	#endregion
	
	if (global.xp >= neededxp) {
		global.level += 1;
		global.xp-=neededxp;
		neededxp += round((4*(global.level + 1)) *2.1) - round((4*global.level)*2.1);
		randomUpgrades();
		keyboard_clear(ord("Z"));
		audio_play_sound(snd_lvl_up,0,0);
		//if (instance_exists(oJoystick)) { global.mode = "menu"; }
		global.upgrade=1;	
		oGui.selected=0;
		pause_game();
	}
	
	if (global.hp <= 0) {
		if (revives <= 0 and !dead) {
			canMove = false;
			dead = true;
			global.mode = "menu";
			global.holocoins += global.newcoins;
			image_alpha = 0;
			var heartOff = 0;
			for (var i = 0; i < 8; ++i) {
				var inst = instance_create_depth(x,y,depth, oDeathHeart,{direction : heartOff});
				heartOff += 45;
			}
			//if (alarm_get(3) == -1) {
			if (dAlarm[3] == -1) {
			    //alarm[3] = 60;
			    dAlarm[3] = 60;
			}
		    //game_restart();
		}
		else if (revives > 0){
		    HP = MAXHP/2;
			revives -= 1;
			with (oEnemy) {
			   if (!boss) {
			       instance_destroy();
			   }
			}
		}
		
	}
	#region heal every five seconds if shop upgrade
	if (global.shopUpgrades[$ "Regeneration"][$ "level"] > 0 and !global.gamePaused) {
	    healSeconds+=1/60 * Delta;
		if (healSeconds > 5) {
		    HP += 1 * global.shopUpgrades[$ "Regeneration"][$ "level"];
			healSeconds = 0;
			//show_message("healed: " + string(1 * global.shopUpgrades[$ "Regeneration"][$ "level"]));
		}
	}
	#endregion
	#region Just Bandage Healing
	if (haveBandage and justBandageHealing > 0) {
	    bandageHealSeconds+=1/60 * Delta;
		if (bandageHealSeconds > 3) {
			var _amount = (HP * 10) / 100;
			if (_amount < 1) {
			    _amount = 1;
			}
		    HP += _amount;
			bandageHealSeconds = 0;
			justBandageHealing -= _amount;
			if (justBandageHealing < 0) {
			    justBandageHealing = 0;
			}
			//show_message("healed: " + string(1 * global.shopUpgrades[$ "Regeneration"][$ "level"]));
		}
	}
	#endregion
	
}
if (global.debug) {
    HP=999999;
}
if (global.xp<0) {
    global.xp = 0;
}
if (HP > MAXHP) {
    HP=MAXHP;
}
#region spd calc
	calc = 0;
	for (var i = 0; i < array_length(Bonuses[BonusType.Speed]); ++i) {
		if (Bonuses[BonusType.Speed][i] != 0) {
		    calc += Bonuses[BonusType.Speed][i];
		}    
	}
	for (var i = 0; i < array_length(PerkBonuses[BonusType.Speed]); ++i) {
		if (PerkBonuses[BonusType.Speed][i] != 0) {
		    calc += PerkBonuses[BonusType.Speed][i];
		}    
	}
	for (var i = 0; i < global.shopUpgrades[$ "Spd"][$ "level"]; ++i) {
	    calc = calc + ((calc * 6) / 100);
	}
	if (calc == 0) {
	    calc = 1;
	}
	var shopBonus = ospd;
	for (var i = 0; i < global.shopUpgrades[$ "Spd"][$ "level"]; ++i) {
	    shopBonus = shopBonus + ((shopBonus* 6) / 100);
	}
	shopBonus = shopBonus - ospd;
	//if (calc != 0) {
	    spd = (ospd + shopBonus) * calc;
		//show_message(shopBonus);
	//}
#endregion

#region pickup calc
	calc = 1;
	for (var i = 0; i < array_length(Bonuses[BonusType.PickupRange]); ++i) {
		if (Bonuses[BonusType.PickupRange][i] != 0) {
		    calc += Bonuses[BonusType.PickupRange][i];
		}
	}
	//for (var i = 0; i < array_length(PerkBonuses[BonusType.PickupRange]); ++i) {
	//	if (PerkBonuses[BonusType.PickupRange][i] != 0) {
	//	    calc += PerkBonuses[BonusType.PickupRange][i];
	//	}    
	//}//TODO: if there is a pickuprange bonus perk
	shopBonus = originalPickupRadius;
	for (var i = 0; i < global.shopUpgrades[$ "PickUp"][$ "level"]; ++i) {
	    shopBonus = shopBonus + ((shopBonus* 10) / 100);
	}
	shopBonus = shopBonus - originalPickupRadius;
	if (calc != 0) {
	    pickupRadius = (originalPickupRadius + shopBonus) * calc;
	}
#endregion
if (global.gamePaused) {
    image_speed=0;
}else{
	image_speed=1;
}