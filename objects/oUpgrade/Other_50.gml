switch (upg[$"id"]) {
    case Weapons.XPotato:{
		if (justBounced) { return; }
		if (!justBounced) {
		    justBounced = true;
			dAlarm[2]=50;
		}
		//image_angle += .5;
		direction += 180;
		//var _x1 = oPlayer.x + (view_wport[0] / 2);
		//var _x2 = oPlayer.x - (view_wport[0] / 2);
		//var _y1 = oPlayer.y + (view_hport[0] / 2);
		//var _y2 = oPlayer.y - (view_hport[0] / 2);
		//if (x > _x1) { direction += 180; }
		//if (x < _x2) { direction += 180; }
		//if (y > _y1) { direction += 180; }
		//if (y < _y2) { direction += 180; }
		break;
	}
    default:
        // code here
        break;
}