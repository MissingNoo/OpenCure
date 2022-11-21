#region Connected to Character
if (!global.gamePaused) {
	switch (upg[?"name"]) {
		case "GuraTrident":
			x=oPlayer.x;
			y=oPlayer.y-8;
			break;
		case "InaTentacle":
			//var dirr = (image_xscale > 0) ? 32 : -32;
			//x=oPlayer.x+dirr;
			x=oPlayer.x;
			y=oPlayer.y-8;
			break;
		case "Plug-type Asacoco":
			if (alarm_get(0) > 0) {
			    y-=1.75;
			}		
			break;
		case "BL Book":
			x = oPlayer.x + lengthdir_x(orbit_length, orbit_place);
			y = oPlayer.y - 16 + lengthdir_y(orbit_length, orbit_place);
			
			orbit_place-=3;
			break;
	}
}
#endregion
if (hits <= 0) {
    image_alpha=0;
}

