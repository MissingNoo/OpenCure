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
			for (var i = 0; i < array_length(global.upgradeCooldown); ++i) {
				if (global.upgradeCooldown[i] > 0) {
				    global.upgradeCooldown[i] -= 1;
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






