// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Feather disable GM1019
// Feather disable GM1049
// Feather disable GM2016

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
		oGui.activeMenu=pMenus.Pause;
		oGui.selected=0;
		maxselected = 0;
		global.gamePaused = !global.gamePaused;		
		if(global.gamePaused)
		{			
				with(all)
				{				
					for (var i = 0; i < 12; i++)
					{
						alarms[i] = alarm_get(i);
						alarm_set(i,-1);
					}
					pausedSpeed = speed;
					speed = 0;
					gamePausedImageSpeed =	image_speed;		
					image_speed=0;	
				}
		}
		else
		{
				with(all)
				{	
					for (var i = 0; i < 12; i++)
					{
						alarm_set(i,alarms[i]);
					}
					speed=pausedSpeed;
					image_speed=gamePausedImageSpeed;
				}
		}
}		
	
function summonCircle(){
	var coordsx = ds_list_create();
	var coordsy = ds_list_create()	
	var r=270;
	ds_list_clear(coordsy)
	ds_list_clear(coordsx)			
    var N = 2*r+1;
    for (var i = 0; i < N; i+=3)
    {
        for (var j = 0; j < N; j+=3)
        {
			var xx = i-r;
            var yy = j-r;
			show_debug_message(string(r*r+1) )
			var v=xx*xx + yy*yy 			
            if (v <= r*r+1 and v>72800)	
			{	
				ds_list_add(coordsx, xx);
				ds_list_add(coordsy, yy);
			}					
        }
    }	
	var c = ds_list_size(coordsx);
	for (var i = 0; i < c; ++i) {
		var a=oPlayer.x + ds_list_find_value(coordsx,i)
		var b=oPlayer.y + ds_list_find_value(coordsy,i)
		instance_create_layer(a,b,"Instances",oEnemy)
	}	
}











