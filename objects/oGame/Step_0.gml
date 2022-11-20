/// @description 

	var pressed = (keyboard_check(ord("Z"))) ? true : false
	global.strafe = pressed;
#region Spawn
if (canspawn == true and global.gamePaused == false and room == Room1) {
	if (!instance_exists(oEvents)) {
	    instance_create_layer(0,0,"Instances",oEvents);
	}	
	a = irandom_range(-1,1)
	if (a=0) a = 1;
	b = irandom_range(-1,1)
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
				for (var i = 0; i < array_length(Bonuses[bonusType.Haste]); ++i) {
					if (Bonuses[bonusType.Haste][i] != 0) {
					    down = 1 * Bonuses[bonusType.Haste][i];
					}				    
				}
			#endregion
			for (var i = 0; i < array_length(UPGRADES); ++i) {
				if (UPGRADES[i] != global.null) {
					if (global.upgradeCooldown[UPGRADES[i][?"canBeHasted"]] == true) {
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

if (keyboard_check_pressed(vk_escape) and global.upgrade == false) {
		// Feather disable once GM2016
		PauseGame()
}

if (keyboard_check(vk_control)) {
    Seconds+=1;
}







