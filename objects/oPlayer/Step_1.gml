if (instance_exists(oSlave)) {
    var x_middle = (oPlayer.x+oSlave.x)*0.5;
	var y_middle = (oPlayer.y+oSlave.y)*0.5;
    oCam.x = x_middle;
	oCam.y = y_middle;
    //oCam.x += (x_middle - oCam.x) / 16;
	//oCam.y += (y_middle - oCam.y) / 16;
}

if (keyboard_check_pressed(vk_alt)) {
    instance_create_depth(x,y, depth, oSlave);
}
