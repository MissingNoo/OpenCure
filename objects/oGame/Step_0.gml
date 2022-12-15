

#region 
if (instance_exists(oPlayer)) {
	var xx;
	var yy;
	var px;
	var py;
	//yy = oCam.y - oPlayer.y;
    if (oPlayer.x < 1280) {
		xx = oCam.x - oPlayer.x;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.x = 1280 * 2;
		oCam.x = oPlayer.x + xx;
		with (oEnemy) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oXP) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oAnvil) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oBurguer) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
	}
	if (oPlayer.x > 1280 * 2) {
		xx = oCam.x - oPlayer.x;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.x = 1280;
		oCam.x = oPlayer.x + xx;
		with (oXP) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oEnemy) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oAnvil) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oBurguer) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
	}
	if (oPlayer.y < 1280) {
		xx = oCam.x - oPlayer.x;
		yy = oCam.y - oPlayer.y;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.y = 1280 * 2;
		oCam.y = oPlayer.y + yy;
		with (oEnemy) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oXP) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oAnvil) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oBurguer) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
	}
	if (oPlayer.y > 1280 * 2) {
		xx = oCam.x - oPlayer.x;
		yy = oCam.y - oPlayer.y;
		px = oPlayer.x;
		py = oPlayer.y;
	    oPlayer.y = 1280;
		oCam.y = oPlayer.y + yy;
		with (oXP) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oEnemy) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oAnvil) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
		with (oBurguer) {
		    xx = x - px;
			yy = y - py;
			x = oPlayer.x + xx;
			y = oPlayer.y + yy;
		}
	}
}
#endregion
// Apply shake
fx_set_parameter(shake_fx, "g_Magnitude", shake_magnitude);
fx_set_parameter(shake_fx, "g_ShakeSpeed", shake_speed);

// Fall to 0
if (shake_magnitude > 0)
{
	shake_magnitude -= 0.2;
}
	var pressed = (keyboard_check(ord("Z")) and !global.gamePaused) ? true : false
	global.strafe = pressed;
#region Spawn
if (canspawn == true and global.gamePaused == false and room == Room1 and global.spawnEnemies == 1) {
	if (!instance_exists(oEvents)) {
	    instance_create_layer(0,0,"Instances",oEvents);
	}	
	var a = irandom_range(-1,1)
	if (a=0) a = 1;
	var b = irandom_range(-1,1)
	if (b=0) b = 1;
	
	random_set_seed(current_time);
    canspawn=false;
	alarm[0]=120;
	instance_create_layer(
	oPlayer.x+(225*a),
	oPlayer.y+(225*b),
	"Instances",
	oEnemy	
	)
}
#endregion

#region Time
	if (global.gamePaused == false) {
	    global.seconds+=1/60;
		#region Skills Cooldown
		
			#region cooldownamount
				var down = 1
				for (var i = 0; i < array_length(Bonuses[BonusType.Haste]); ++i) {
					if (Bonuses[BonusType.Haste][i] != 0) {
					    down = 1 * Bonuses[BonusType.Haste][i];
					}				    
				}
			#endregion
			for (var i = 0; i < array_length(global.perkCooldown); ++i) {
				global.perkCooldown[i] -= .5;
			}
			for (var i = 0; i < array_length(UPGRADES); ++i) {
				if (UPGRADES[i] != global.null) {
					if (UPGRADES[i][?"canBeHasted"] == true) {
					    global.upgradeCooldown[UPGRADES[i][?"id"]] -= down;
						//show_message(string(round(UPGRADES[i][?"cooldown"] / (1 + (1.50/100)))))
					}   
					else{
						global.upgradeCooldown[UPGRADES[i][?"id"]] -= 1;
					}
				}
			}
			for (var i = 0; i < array_length(global.itemCooldown); ++i) {
				if (global.itemCooldown[i] > 0) {
				    global.itemCooldown[i] -= 1/60;
				}   
			}
		#endregion
	}

	if (global.seconds > 60) {
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

if (keyboard_check_pressed(ord("V"))) {
    window_set_size(640,360);
}
if (keyboard_check_pressed(ord("B"))) {
    window_set_size(1280,720);
}
if (keyboard_check_pressed(ord("N"))) {
    window_set_size(1920,1080);
}



if (keyboard_check(vk_control)) {
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











