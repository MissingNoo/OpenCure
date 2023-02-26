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
	
function summonCircle(){
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
		instance_create_layer(a,b,"Instances",oEnemy);
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
	HP += amount * Bonuses[BonusType.Healing][ItemIds.Full_Meal];
}