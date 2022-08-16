// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function resetTimer(){
	global.seconds=0;
	global.minutes=0;
	global.hours=0;
}
	
function PauseGame(){
		global.selected=0;
		global.gamePaused = !global.gamePaused;		
		if(global.gamePaused)
		{
				with	(all)
				{				
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
					speed=pausedSpeed;
					image_speed=gamePausedImageSpeed;
				}
		}
}		
	
function summonCircle(){
	coordsx = ds_list_create();
	coordsy = ds_list_create()	
	r=270;
	ds_list_clear(coordsy)
	ds_list_clear(coordsx)			
    N = 2*r+1;
    for (i = 0; i < N; i+=3)
    {
        for (j = 0; j < N; j+=3)
        {
			xx = i-r;
            yy = j-r;
			show_debug_message(string(r*r+1) )
			v=xx*xx + yy*yy 			
            if (v <= r*r+1 and v>72800)	
			{	
				ds_list_add(coordsx, xx);
				ds_list_add(coordsy, yy);
			}					
        }
    }	
	c = ds_list_size(coordsx);
	for (var i = 0; i < c; ++i) {
		a=oPlayer.x + ds_list_find_value(coordsx,i)
		b=oPlayer.y + ds_list_find_value(coordsy,i)
		instance_create_layer(a,b,"Instances",oEnemy)
	}	
}
