image_speed = oImageSpeed * Delta;
oCam.x = oPlayer.x;
oCam.y = oPlayer.y;
socket = global.socket;
if (immortal) {
    HP = MAXHP;
}
// Feather disable GM2016
//HP=MAXHP;
if (!global.gamePaused) {
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
		inRange = collision_circle(x,y-16,pickupRadius, oXP, false, true);
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
		PauseGame();
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
			if (alarm_get(3) == -1) {
			    alarm[3] = 60;
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
	var calc = 0;
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

#region heal every five seconds if shop upgrade
if (global.shopUpgrades[$ "Regeneration"][$ "level"] > 0 and !global.gamePaused) {
    healSeconds+=1/60;
	if (healSeconds > 5) {
	    HP += 1 * global.shopUpgrades[$ "Regeneration"][$ "level"];
		healSeconds = 0;
		//show_message("healed: " + string(1 * global.shopUpgrades[$ "Regeneration"][$ "level"]));
	}
}
#endregion