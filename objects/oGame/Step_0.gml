/// @description 

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
if (global.gamePaused == false) {
    global.seconds+=1/60;
}


if (global.seconds > 60) {
	global.seconds=0;	
	global.minutes+=1;	
}

if (keyboard_check_pressed(ord("V"))) {
    window_set_size(640,360);
}
if (keyboard_check_pressed(ord("B"))) {
    window_set_size(1280,720);
}
if (keyboard_check_pressed(ord("N"))) {
    window_set_size(1920,1080);
}

