// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Feather disable GM2017
global.sprites[0]=0
global.gamePaused = false;
function resetTimer(){
	global.seconds=0;
	global.minutes=0;
	global.hours=0;
	global.minutesPast30 = 0;
	global.hoursPast1= 0 ;
}
#macro Seconds global.seconds
#macro Minutes global.minutes
#macro Hours global.hours
//#macro Hours global.hours
	
	
function PauseGame(){
	if (instance_exists(oGameOver)) {
	    return;
	}
		oGui.activeMenu=PMenus.Pause;
		oGui.selected=0;
		maxselected = 0;
		if (instance_exists(oJoystick)) {
			if (global.mode == "menu") {
			    global.mode = "stage";
			}
			else{global.mode = "menu";}
		}
		
		if (!global.gamePaused) {
		    global.gamePaused = true;
		}
		else if (global.gamePaused and !ANVIL and !global.upgrade) {
		    global.gamePaused = false;
		}
		if (global.singleplayer) {
			if(global.gamePaused)
			{	
					with(all)
					{
						if (speed != 0 and image_speed != 0) {
							for (var i = 0; i < 12; i++)
							{
								if (alarm_get(i) > 0) {
								    setalarms[i] = true;
								}else {setalarms[i] = false;}
								alarms[i] = alarm_get(i);
								alarm_set(i,-1);
							}
							pausedSpeed = speed;
							speed = 0;
							gamePausedImageSpeed = image_speed;		
							image_speed=0;
						}
					}
			}
			else
		{
				with(all)
				{	
					for (var i = 0; i < 12; i++)
					{
						if (variable_instance_exists(self, "setalarms") and setalarms[i] == true) {
						    alarm_set(i,alarms[i]);
						}						
					}
					if (variable_instance_exists(self, "pausedSpeed")) {
					    speed=pausedSpeed;
					}
					if (variable_instance_exists(self, "gamePausedImageSpeed")) {
					    image_speed=gamePausedImageSpeed;
					}					
				}
		}
		}
}		
	
function summonCircle(walk = true){

}
enum Patterns{
	Cluster,
	Horde,
	Ring,
	WallRight,
	WallLeft,
	WallBoth,
	Stampede,
	Wave,
	Airdrop,
	Fastball,
	Ambush
}

function spawnEvent(monster, type, hp, atk, spd, xp, lifetime, quantity){
//function spawnEvent(monster, quantity, type, hp = 0, spd = 0, xp = 0){
	if (!global.singleplayer) { return; }
	var enemy = global.enemies[monster];
	var wallSprOffset = sprite_get_height(enemy[?"sprite"]);
	var aa, bb;
	//if (xp == "-") {
	//    xp = EnemyList[enemy][? "exp"];
	//}
	switch (type) {
		case Patterns.WallBoth:{
			aa = oPlayer.x + 400;
			var ab = oPlayer.x - 400;
			bb = oPlayer.y;
			var part = quantity / 4;
			var dieAtX = oPlayer.x + 50;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(aa,bb,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, dieX : dieAtX, customXP : xp});
				bb -= wallSprOffset;
			}
			bb = oPlayer.y;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(aa,bb,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, dieX : dieAtX, customXP : xp});
				bb += wallSprOffset;
			}
			bb = oPlayer.y;
			dieAtX = oPlayer.x - 50;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(ab,bb,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, dieX : dieAtX, customXP : xp});
				bb -= wallSprOffset;
			}
			bb = oPlayer.y;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(ab,bb,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, dieX : dieAtX, customXP : xp});
				bb += wallSprOffset;
			}
		    break;}
		case Patterns.Ring:{
			var coordsx = ds_list_create();
			var coordsy = ds_list_create();
			var r=270;
			ds_list_clear(coordsy);
			ds_list_clear(coordsx);
			var N = 2*r+1;
			for (var i = 0; i < N; i+=3)
			{
				for (var j = 0; j < N; j+=3)
				{
					var xx = i-r;
				    var yy = j-r;
					//show_debug_message(string(r*r+1) )
					var v=xx*xx + yy*yy;
				    if (v <= r*r+1 and v>72800)	
					{	
						ds_list_add(coordsx, xx);
						ds_list_add(coordsy, yy);
					}					
				}
			}	
			var c = ds_list_size(coordsx);
			for (var i = 0; i < c; ++i) {
				var a=oPlayer.x + ds_list_find_value(coordsx,i);
				var b=oPlayer.y + ds_list_find_value(coordsy,i);
				instance_create_layer(a,b,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp});
			}
			break;}
		default:
			var a = oPlayer.x + choose(-400, 400);
			var b = oPlayer.y + choose(-400, 400);
			for (var i = 0; i < quantity; ++i) {
			    aa = a + irandom_range(-16,16);
				bb = b + irandom_range(-16,16);
				instance_create_layer(aa,bb,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp});
			}
		    break;
			
	}		
}



function copyStruct(struct){
    var key, value;
    var newCopy = {};
    var keys = variable_struct_get_names(struct);
    for (var i = array_length(keys)-1; i >= 0; --i) {
            key = keys[i];
            value = struct[$ key];
            //variable_struct_get(struct, key);
            variable_struct_set(newCopy, key, value)
    }
    return newCopy;
}

function healPlayer(amount){
	if (Bonuses[BonusType.Healing][ItemIds.Full_Meal] != 0) {
	    HP += amount * Bonuses[BonusType.Healing][ItemIds.Full_Meal];
	}else{
		HP += amount;
	}
}
	
function propDraw(){
	var sprw = sprite_width / 2;
	var sprh = sprite_height;
	var alpha = oPlayer.y < y and collision_rectangle(x- sprw,y - sprh, x + sprw, y, oPlayer, false, false) ? 0.35 : 1
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, alpha);
}

function sine_wave(time, period, amplitude, midpoint) {
    return sin(time * 2 * pi / period) * amplitude + midpoint;
}

function sine_between(time, period, minimum, maximum) {
    var midpoint = mean(minimum, maximum);
    var amplitude = maximum - midpoint;
    return sine_wave(time, period, amplitude, midpoint);
}

/**
 * Function Description
 * @param {real} _sx Description
 * @param {real} _sy Description
 * @param {real} _ex Description
 * @param {real} _ey Description
 * @param {string} _var Description
 * @param {any} _value Description
 */
function openKeyboard(_sx, _sy, _ex, _ey, _var, _value, _varr){
	if (global.debug) {
		draw_set_alpha(.3);
		draw_set_color(c_purple);
	    draw_rectangle(_sx, _sy, _ex, _ey, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	if (point_in_rectangle(oGui.x, oGui.y, _sx, _sy, _ex, _ey)) {
		keyboard_string = variable_instance_get(self, _varr);
		variable_instance_set(self, _var, _value);
	    keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false);
	}
}