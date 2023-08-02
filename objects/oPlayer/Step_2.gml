if (!instance_exists(oSlave)) {
    oCam.x += (oPlayer.x - oCam.x) / 16;
	oCam.y += (oPlayer.y - oCam.y) / 16;
}
//else{
//	var x_middle = (oPlayer.x+oSlave.x)*0.5;
//	var y_middle = (oPlayer.y+oSlave.y)*0.5;
//    oCam.x += (x_middle - oCam.x) / 16;
//	oCam.y += (y_middle - oCam.y) / 16;
//	//if (distance_to_object(oSlave) > 260) {
//	//	direction = point_direction(x, y, oSlave.x, oSlave.y);
//	//	speed = 1.5;
//	//}
//	//else{speed=0;}
//}
//if (keyboard_check_pressed(vk_alt)) {
//    instance_create_depth(x,y, depth, oSlave);
//}
