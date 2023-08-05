//show_debug_message(string(input_profile_get(0)));
//global.deltaTime = (delta_time / 1000000) * game_get_speed(gamespeed_fps);
//feather disable once GM2016 
if (input_profile_get(0) == "gamepad") {
    global.gamePad = true;
}
else{
	global.gamePad = false;
}
//if (keyboard_check(vk_home)) {
//	for (var i = 0; i < array_length(UnlockableWeapons); ++i) {
//	    UnlockableWeapons[i] = true;
//	}
//	for (var i = 0; i < array_length(UnlockableItems); ++i) {
//	    UnlockableItems[i] = true;
//	}
//	for (var i = 0; i < array_length(Achievements); ++i) {
//	    Achievements[i][$"unlocked"] = true;
//	}
//	load_unlocked();
//	UnlockableOutfits[Outfits.AmeliaO1] = true;
//	UnlockableOutfits[Outfits.AmeliaO2] = true;
//	unlocked_outfits_load();
//}
//if (keyboard_check(vk_end)) {
//	for (var i = 0; i < array_length(UnlockableWeapons); ++i) {
//	    UnlockableWeapons[i] = false;
//	}
//	for (var i = 0; i < array_length(UnlockableItems); ++i) {
//	    UnlockableItems[i] = false;
//	}
//	for (var i = 0; i < array_length(Achievements); ++i) {
//	    Achievements[i][$"unlocked"] = false;
//	}
//	load_unlocked();
//	UnlockableOutfits[Outfits.AmeliaO1] = false;
//	UnlockableOutfits[Outfits.AmeliaO2] = false;
//	unlocked_outfits_load();
//}

//if (instance_exists(oPlayer)) {
    
//}
//if (keyboard_check_pressed(RIGHTKEY) or keyboard_check_pressed(LEFTKEY) or keyboard_check_pressed(UPKEY)  or keyboard_check_pressed(DOWNKEY) or device_mouse_check_button_pressed(0,mb_left)) {
//	global.GamePad = false;
//}
//if (gamepad_button_check_pressed(global.gPnum, gp_start)) {
//	global.GamePad = true;
//}
//if (!//global.padset) {
//	global.GamePad = false;
//    //global.padset = true;
//}

//for (var i = 0; i < gamepad_get_device_count(); i++) {
//	if(gamepad_is_connected(i)){
//		global.gPnum = i;
//		gamepad_set_axis_deadzone(global.gPnum, 0.7);
//	}
//	if (os_type == os_android) {
//		if (device_mouse_check_button(0,mb_left)) {
//		    global.GamePad = false;
//		}
//	    if(global.GamePad){
//			if (instance_exists(oJoystick)) {
//				instance_destroy(oJoystick);
//			}
//		}
//		else{
//			if (!instance_exists(oJoystick)) {
//				instance_create_depth(0,0,0,oJoystick);
//			}
//		}
//	}
//}

#region room limit, TODO: redo all this crap
if (instance_exists(oPlayer)) {
	//if (keyboard_check_pressed(ord("I"))) { oPlayer.y = 610 - oGui.a; }
	//if (keyboard_check_pressed(ord("O"))) { oPlayer.y = 3170; }
	var xx;
	var yy;
	var px;
	var py;
	//yy = oCam.y - oPlayer.y;
	var insts = [oEnemy, oXP, oAnvil, oBurguer, oUpgrade, oHolocoin];
    if (oPlayer.x < 610) {
		xx = oCam.x - oPlayer.x;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.x = 3170;
		oCam.x = oPlayer.x + xx;
		for (var i = 0; i < array_length(insts); ++i) {
		    with (insts[i]) {
			    xx = x - px;
				yy = y - py;
				x = oPlayer.x + xx;
				y = oPlayer.y + yy;
				xstart = xstart + xx;
			}
		}
	}
	if (oPlayer.x > 3170) {
		xx = oCam.x - oPlayer.x;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.x = 610;
		oCam.x = oPlayer.x + xx;
		for (var i = 0; i < array_length(insts); ++i) {
		    with (insts[i]) {
			    xx = x - px;
				yy = y - py;
				x = oPlayer.x + xx;
				y = oPlayer.y + yy;
				xstart = xstart - xx;
				ystart = ystart + yy;
			}
		}
	}
	if (oPlayer.y < 610) {
		xx = oCam.x - oPlayer.x;
		yy = oCam.y - oPlayer.y;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.y = 3170;
		oCam.y = oPlayer.y + yy;
		for (var i = 0; i < array_length(insts); ++i) {
		    with (insts[i]) {
			    xx = x - px;
				yy = y - py;
				x = oPlayer.x + xx;
				y = oPlayer.y + yy;
				ystart = ystart + yy;
			}
		}
	}
	if (oPlayer.y > 3170) {
		xx = oCam.x - oPlayer.x;
		yy = oCam.y - oPlayer.y;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.y = 610;
		oCam.y = oPlayer.y + yy;
		for (var i = 0; i < array_length(insts); ++i) {
		    with (insts[i]) {
			    xx = x - px;
				yy = y - py;
				x = oPlayer.x + xx;
				y = oPlayer.y + yy;
				ystart = ystart - yy;
			}
		}
	}
}
#endregion
// Apply shake
fx_set_parameter(shakeFx, "g_Magnitude", shakeMagnitude);
fx_set_parameter(shakeFx, "g_ShakeSpeed", shakeSpeed);

// Fall to 0
if (shakeMagnitude > 0)
{
	shakeMagnitude -= 0.2;
}
var pressed = (input_check("accept") and !global.gamePaused) ? true : false;
//if (global.GamePad) {
    //pressed = (input_check("accept") and !global.gamePaused) ? true : false
//}else{ pressed = (keyboard_check(ord("Z")) and !global.gamePaused) ? true : false}
	
	global.strafe = pressed;
#region Spawn
if (!instance_exists(oEvents)) {
	    instance_create_layer(0,0,"Instances",oEvents);
	}	
	//feather disable once GM2017
if (instance_exists(oPlayer) and canspawn == true and global.gamePaused == false and room == rStage1 and global.spawnEnemies == 1 and global.IsHost) {
	
	//var a = irandom_range(-1,1)
	//if (a=0) a = 1;
	//var b = irandom_range(-1,1)
	//if (b=0) b = 1;
	var place = irandom_range(1,4);
	var _x = oPlayer.x;
	var _y = oPlayer.y;
	if (place == 1) {
		_y -= 300;
	    _x += random_range(0, view_wport[0]);
	}
	if (place == 2) {
		_y += 300;
	    _x += random_range(0, view_wport[0]);
	}
	if (place== 3) {
		_x -= 400;
	    _y += random_range(0, view_hport[0]);
	}
	if (place == 4) {
		_x += 400;
	    _y += random_range(0, view_hport[0]);
	}
	
	//random_set_seed(current_time);
    canspawn=false;
	alarm[0]=60;
	instance_create_layer(
	_x,
	_y,
	"Instances",
	oEnemy	
	)
}
#endregion

#region Time
	if (global.gamePaused == false) {
	    global.seconds+=(1/60) * Delta ;
		#region Skills Cooldown		
			#region cooldownamount
				var down = 1
				for (var i = 0; i < array_length(Bonuses[BonusType.Haste]); ++i) {
					if (Bonuses[BonusType.Haste][i] != 0) {
					    down = 1 * Bonuses[BonusType.Haste][i];
					}				    
				}
				for (var i = 0; i < global.shopUpgrades[$ "Haste"][$ "level"]; ++i) {
				    down = down + ((down * 4) / 100);
				}
			#endregion
			for (var i = 0; i < array_length(global.perkCooldown); ++i) {
				global.perkCooldown[i] -= .5 * Delta;

			}
			//feather disable once GM1041
			for (var i = 0; i < array_length(UPGRADES); ++i) {
				if (UPGRADES[i] != global.null) {
					if (UPGRADES[i][$"canBeHasted"] == true) {
					    global.upgradeCooldown[UPGRADES[i][$"id"]] -= down * Delta;
						//show_message(string(round(UPGRADES[i][?"cooldown"] / (1 + (1.50/100)))))
					}   
					else{
						global.upgradeCooldown[UPGRADES[i][$"id"]] -= 1 * Delta;
					}
				}
			}
			for (var i = 0; i < array_length(global.itemCooldown); ++i) {
				if (global.itemCooldown[i] > 0) {
				    global.itemCooldown[i] -= (1/60) * Delta;
				}   
			}
		#endregion
		#region buff coldown
			for (var i = 0; i < array_length(Buffs); ++i) {
				if (Buffs[i][$"enabled"] and variable_struct_exists(Buffs[i], "cooldown")) {
					if (Buffs[i].cooldown > 0) {
					    Buffs[i].cooldown -= 1/60;
						switch (Buffs[i][$"id"]) {
						    case BuffNames.SakeFood:
								Bonuses[BonusType.Critical][ItemIds.Sake][1] = 1.05;
								break;
						    default:
						        // code here
						        break;
						}
					}
					if (Buffs[i].cooldown <= 0) {
						if (!variable_struct_exists(Buffs[i], "permanent")) {
						    Buffs[i].enabled = false;
							if (variable_struct_exists(Buffs[i], "count")) {
							    Buffs[i][$"count"] = 0;
							}							
						}
					    switch (Buffs[i][$"id"]) {
						    case BuffNames.ShortHeight:
						        PerkBonuses[BonusType.Speed][PerkIds.ShortSize] = 0;
						        break;
							case BuffNames.Sake:
								if (Buffs[i][$"count"] < Buffs[i][$"maxCount"]) {
								    Buffs[i][$"count"] += 1;
								}
								var _amount = (Buffs[BuffNames.Sake][$"count"] < 10) ? "1.0{0}" : "1.{0}";
								Bonuses[BonusType.Critical][ItemIds.Sake][0] = real(string(_amount, Buffs[BuffNames.Sake][$"count"]));
								Buffs[i][$"cooldown"] = Buffs[i][$"baseCooldown"];
								break;
							case BuffNames.SakeFood:
								Bonuses[BonusType.Critical][ItemIds.Sake][1] = 0;
								break;
						}
					}
				}
				
			}
		#endregion
	}

	if (global.seconds > 59) {
		global.seconds=0;	
		global.minutes+=1;	
		if (Minutes > 30) {
		    global.minutesPast30 += 1;
		}
	}
	
	if (global.minutes > 60) {
	    global.minutes = 0;
		global.hours+=1;
	}
	
	//a b
	global.timeA = max(0, Minutes - 23) + 37 * Hours;
	global.timeB = global.minutesPast30 + 60 * global.hoursPast1;
#endregion

//if (keyboard_check_pressed(ord("V"))) {
//    window_set_size(640,360);
//}
//if (keyboard_check_pressed(ord("B"))) {
//    window_set_size(1280,720);
//}
//if (keyboard_check_pressed(ord("N"))) {
//    window_set_size(1920,1080);
//}



if (keyboard_check(vk_control) and global.debug) {
	Seconds+=1;
}

#region in stage
	//if (instance_exists(oPlayer)) {
	//    if (room == Room1) {
	if (global.musicPlaying != undefined) {
	    audio_sound_gain(global.musicPlaying, global.musicVolume, 0);
	}		    
	//	}
	//}
#endregion