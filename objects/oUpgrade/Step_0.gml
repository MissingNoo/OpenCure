//show_message(upg[?"speed"])
//Feather disable GM1043
if (a==0) {
a=1;
sprite_index=upg[?"sprite"];
speed=upg[?"speed"];
atk=upg[?"dmg"];
hits=upg[?"hits"];
switch (upg[?"name"]) {
    case "AsaCoco":
		n = instance_nearest(x,y,oEnemy);
        direction=point_direction(x,y,n.x,n.y);
		image_angle=point_direction(x,y,n.x,n.y);
        break;
    case "Flying Knife":
        if (oPlayer.image_xscale==1) {
		    image_xscale = 1;
			direction = point_direction(x,y,x+100,y)
		}
		else
		{
			image_xscale = -1;
			direction = point_direction(x,y,x-100,y)
		}
        break;
}

if (upg[?"speed"] == 0) {
    switch (global.arrow_dir) {
            case 90:
                x = x + 32;
                break;
            case -90:
                x = x - 32;
                image_xscale = -1;
                break;
            case 0:
                y = y + 32;
                image_angle = point_direction(x, y, x, y + 90);
                break;
            case 180:
                y = y - 32;
                image_angle = point_direction(x, y, x, y - 90);
                break;
        }
}


if (sprite_index==blank) {
    instance_destroy();
}
}
if (hits <= 0) {
    instance_destroy();
}









