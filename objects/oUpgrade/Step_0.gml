if (global.testvar == "") {
    global.testvar = upg;
}
if (socket == oPlayer.socket) {
    owner = instance_nearest(x,y,oPlayer) 
}else{
	owner = instance_nearest(x,y, oSlave);
}
#region Connected to Character
if (!global.gamePaused) {
	switch (upg[$"name"]) {
		case "GuraTrident":{
			x=owner.x;
			y=owner.y-8;
			break;}
		case "InaTentacle":{
			//var dirr = (image_xscale > 0) ? 32 : -32;
			//x=owner.x+dirr;
			x=owner.x;
			y=owner.y-8;
			break;}
		case "Plug-type Asacoco":{
			if (alarm_get(0) > 0) {
			    y-=1.75;
				if (instance_exists(CE)) {
					direction = point_direction(x,y,CE.x, CE.y)
					image_angle = point_direction(x,y,CE.x, CE.y)    
				}				
			}else {image_alpha = 1;}		
			break;}
		case "BL Book":{
			x = owner.x + lengthdir_x(orbit_length, orbit_place);
			y = owner.y - 16 + lengthdir_y(orbit_length, orbit_place);
			orbit_place-=3;
			break;}
		case Weapons.CuttingBoard:{
			if (distance_to_point(originalX, originalY) > oGui.a) {
				speed -= oGui.b;
				if (speed < 0) {
				    speed = 0;
				}
			}
			break;
		}
	}
}
#endregion
if (hits <= 0) {
	image_alpha=0;
}

