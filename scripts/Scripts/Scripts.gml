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
		//if (!global.gamePaused) {
		//	if (variable_global_exists("aim")) {
		//    //global.pad.destroy();
		//	}
		//}
		//else{
		//	if (variable_global_exists("aim")) {
		//		//global.pad.destroy();
		//	}
		//	//global.pad = input_virtual_create();
		//	//global.pad.circle(GW/oGui.a, GH/oGui.b, 60);
		//	//global.pad.follow(false);
		//	//global.pad.release_behavior(INPUT_VIRTUAL_RELEASE.RESET_POSITION);
		//	//global.pad.dpad("", "left", "right", "up", "down");
		//}
}		
	
function summonCircle(walk = true){

}
enum Patterns{
	Cluster,
	Horde,
	Ring,
	WallRight,
	WallLeft,
	WallLeftRight,
	WallTop,
	WallBottom,
	WallTopBottom,
	StampedeRight,
	StampedeLeft,
	StampedeTop,
	StampedeDown,
	Wave,
	Airdrop,
	Fastball,
	Ambush
}

function spawnEvent(monster, type, hp, atk, spd, xp, lifetime, quantity, r = 400, distanceDie = "-", followPlayer = false, offset = 2){
//function spawnEvent(monster, quantity, type, hp = 0, spd = 0, xp = 0){
	if (!global.singleplayer) { return; }
	var enemy = global.enemies[monster];
	var wallSprOffset = sprite_get_height(enemy[?"sprite"]);
	var aa, bb;
	//if (xp == "-") {
	//    xp = EnemyList[enemy][? "exp"];
	//}
	switch (type) {
		case Patterns.WallLeftRight:{
			var _wh = view_wport[0] / 2 + offset;
			aa = oPlayer.x + _wh;
			var ab = oPlayer.x - _wh;
			bb = oPlayer.y;
			var part = quantity / 4;
			var dieAtX = oPlayer.x + 999999;
			if (distanceDie != "-") {
				dieAtX = oPlayer.x + distanceDie;
			}
			
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
		case Patterns.WallTopBottom:{
			var _vh = view_hport[0] / 2 + offset;
			aa = oPlayer.x;
			var ba = oPlayer.y - _vh;
			bb = oPlayer.y + _vh;
			var part = quantity / 4;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(aa,ba,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime, followPlayer});
				aa -= wallSprOffset;
			}
			aa = oPlayer.x;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(aa,ba,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime, followPlayer});
				aa += wallSprOffset;
			}
			aa = oPlayer.x;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(aa,bb,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime, followPlayer});
				aa -= wallSprOffset;
			}
			aa = oPlayer.x;
			for (var i = 0; i < part; ++i) {
				instance_create_layer(aa,bb,"Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime, followPlayer});
				aa += wallSprOffset;
			}
		    break;}
		case Patterns.Ring:{
			var circle = irandom_range(0, 360);
			repeat(quantity) {
				var _x = oPlayer.x + lengthdir_x(r, circle);
				var _y = oPlayer.y + lengthdir_y(r, circle);
				instance_create_layer(_x, _y, "Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime});
				circle += quantity / offset;
			}
			break;}
		case Patterns.StampedeRight:{
			var _y = oPlayer.y;
			var _h = (sprite_get_height(monster[?"sprite"]) * monster[?"yscale"]) * 2;
			if (offset == 2) {
			    _y = oPlayer.y - (_h / 2); 
			}
			for (var i = 0; i < 5; ++i) {
			    _y -= _h;
			}
			for (var i = 0; i < 10; ++i) {
				instance_create_layer(oPlayer.x + 500, _y, "Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime});
				_y += _h;
			}
			break;
		}
		case Patterns.StampedeLeft:{
			var _y = oPlayer.y;
			var _h = (sprite_get_height(monster[?"sprite"]) * monster[?"yscale"]) * 2;
			if (offset == 2) {
			    _y = oPlayer.y - (_h / 2); 
			}
			for (var i = 0; i < quantity / 2; ++i) {
			    _y -= _h;
			}
			for (var i = 0; i < quantity; ++i) {
				instance_create_layer(oPlayer.x - 500, _y, "Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime, followPlayer});
				_y += _h;
			}
			break;
		}
		case Patterns.StampedeTop:{
			var _x = oPlayer.x;
			var _w = (sprite_get_width(monster[?"sprite"]) * monster[?"xscale"]) * 2;
			if (offset == 2) {
			    _x = oPlayer.x - (_w / 2); 
			}
			for (var i = 0; i < quantity / 2; ++i) {
			    _x -= _w;
			}			
			for (var i = 0; i < quantity; ++i) {
				instance_create_layer(_x, oPlayer.y - 500, "Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime, followPlayer});
				_x += _w;
			}
			break;
		}
		case Patterns.StampedeDown:{
			var _x = oPlayer.x;
			var _w = (sprite_get_width(monster[?"sprite"]) * monster[?"xscale"]) * 2;
			if (offset == 2) {
			    _x = oPlayer.x + (_w / 2); 
			}
			for (var i = 0; i < quantity / 2; ++i) {
			    _x -= _w;
			}			
			for (var i = 0; i < quantity; ++i) {
				instance_create_layer(_x, oPlayer.y + 500, "Instances",oEnemy,{customSpawn : true, selectedEnemy : enemy, pattern : type, customHP : hp, customSPD : spd, customXP : xp, lifetime : lifetime, followPlayer});
				_x += _w;
			}
			break;
		}		
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
 * @param {real} _value Description
 */
function openKeyboard(_sx, _sy, _ex, _ey, _var = "nullvar", _value = 0, _varr = ""){
	if (global.debug) {
		draw_set_alpha(.3);
		draw_set_color(c_purple);
	    draw_rectangle(_sx, _sy, _ex, _ey, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	if (point_in_rectangle(oGui.x, oGui.y, _sx, _sy, _ex, _ey)) {
		if (_varr != "") {
		    keyboard_string = variable_instance_get(self, _varr);
		}
		if (_var != "nullvar") {
		    variable_instance_set(self, _var, _value);
		}		
	    keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false);
	}
}