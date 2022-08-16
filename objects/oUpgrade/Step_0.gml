/// @description 
/// @description ;
//show_message(upg[?"speed"])

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
    case "Knife":
        if (oPlayer.image_xscale==1) {
		    image_xscale = 1;
			direction = point_direction(x,y,x+10,y)
		}
		else
		{
			image_xscale = -1;
			direction = point_direction(x,y,x-10,y)
		}
        break;
}
if (sprite_index==blank) {
    instance_destroy();
}
}
if (hits <= 0) {
    instance_destroy();
}


