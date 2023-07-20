//feather disable all
if (!instance_exists(oPlayer)) {
    global.mode = "menu";
}
if (!global.gamePaused and instance_exists(oPlayer)) {
    global.mode = "stage";
}
mode = global.mode;
/// @description Insert description here
// You can write your code in this editor
#region Touch1
	//if (device_mouse_check_button(0,mb_left) and !Touch1) {
	//    Touch1 = true;
	//	TouchX1 = device_mouse_x_to_gui(0);
	//	TouchY1 = device_mouse_y_to_gui(0);
	//}else{
	//	Touch1=false;
	//}
	//if (device_mouse_check_button(0,mb_left) and !Touch2) {
	//    Touch2 = true;
	//	TouchX2 = device_mouse_x_to_gui(1);
	//	TouchY2 = device_mouse_y_to_gui(1);
	//}else{
	//	Touch2=false;
	//}
#endregion


if (mode == "stage") {
#region Left Joystick
	if (device_mouse_check_button_pressed(0, mb_left) and !J1Set and TouchX1 < GW/2 and TouchY1 > GH/2) {
	    J1Set = true;
		JoystickCenterX = TouchX1;
		JoystickCenterY = TouchY1;
		JoystickLimitLeft = JoystickCenterX-limit;
		JoystickAtivationLeft = JoystickCenterX-ativation;
		JoystickLimitRight = JoystickCenterX+limit;
		JoystickAtivationRight = JoystickCenterX+ativation;
		JoystickLimitUp = JoystickCenterY-limit;
		JoystickAtivationUp = JoystickCenterY-ativation;
		JoystickLimitDown = JoystickCenterY+limit;
		JoystickAtivationDown = JoystickCenterY+ativation;
	}
	if (!device_mouse_check_button_pressed(0, mb_left)) {
	    J1Set = false;
	}

	//if (TouchY1 > JoystickLimitUp and TouchY1 < JoystickLimitDown and TouchX1 > JoystickLimitLeft and TouchX1 < JoystickLimitRight and device_mouse_check_button(0,mb_left)) {
	if (TouchY1 > JoystickLimitUp and TouchY1 < JoystickLimitDown and TouchX1 > JoystickLimitLeft and TouchX1 < JoystickLimitRight and device_mouse_check_button(0,mb_left) and TouchX1 < GW/2 and TouchY1 > GH/2) {
		canrelease=true;
		//up
		if (TouchY1 > JoystickLimitUp and TouchY1 < JoystickAtivationUp ) {
		    keyboard_key_press(UPKEY);
		}
		else keyboard_key_release(UPKEY);
		//down
		if (TouchY1 < JoystickLimitDown and TouchY1 > JoystickAtivationDown ) {
		    keyboard_key_press(DOWNKEY);
		}
		else keyboard_key_release(DOWNKEY);
		//left
		if (TouchX1 > JoystickLimitLeft and TouchX1 < JoystickAtivationLeft ) {
		    keyboard_key_press(LEFTKEY);
		}
		else keyboard_key_release(LEFTKEY);
		//right
		if (TouchX1 < JoystickLimitRight and TouchX1 > JoystickAtivationRight ) {
		    keyboard_key_press(RIGHTKEY);
		}
		else keyboard_key_release(RIGHTKEY);
	}else{
		if (canrelease) {
		    alarm[0]=5;
			canrelease=false;
		}	
	}
#endregion

#region Right Joystick
	if (device_mouse_check_button_pressed(1, mb_left) and !J2Set and TouchX2 > GW/2 and TouchY2 > GH/2) {
	    J2Set = true;
		Joystick2CenterX = TouchX2;
		Joystick2CenterY = TouchY2;
		Joystick2LimitLeft = Joystick2CenterX-limit;
		Joystick2AtivationLeft = Joystick2CenterX-ativation;
		Joystick2LimitRight = Joystick2CenterX+limit;
		Joystick2AtivationRight = Joystick2CenterX+ativation;
		Joystick2LimitUp = Joystick2CenterY-limit;
		Joystick2AtivationUp = Joystick2CenterY-ativation;
		Joystick2LimitDown = Joystick2CenterY+limit;
		Joystick2AtivationDown = Joystick2CenterY+ativation;
	}
	if (!device_mouse_check_button_pressed(1, mb_left)) {
	    J2Set = false;
	}
	
	if (instance_exists(oPlayer)) {
		//if (TouchY1 > Joystick2LimitUp and TouchY1 < Joystick2LimitDown and TouchX1 > Joystick2LimitLeft and TouchX1 < Joystick2LimitRight) {
		if (TouchY2 > Joystick2LimitUp and TouchY2 < Joystick2LimitDown and TouchX2 > Joystick2LimitLeft and TouchX2 < Joystick2LimitRight and device_mouse_check_button(1,mb_left)) {
			global.arrowDir = point_direction(Joystick2CenterX,Joystick2CenterY, TouchX2, TouchY2);
			if (TouchX2 < Joystick2CenterX) {
			    oPlayer.image_xscale=-1;
			} else oPlayer.image_xscale=1;
		}	
	}
#endregion
}

#region MenuMode
	if (mode == "menu") {
		if (TouchY1 > upButtonY and TouchY1 < upButtonSizeY and TouchX1 > upButtonX and TouchX1 < upButtonSizeX and (device_mouse_check_button(0,mb_left) or mouse_check_button(mb_left))) {
			keyboard_key_press(UPKEY);
			keyboard_key_release(UPKEY);
		}
	    if (TouchY1 > downButtonY and TouchY1 < downButtonSizeY and TouchX1 > downButtonX and TouchX1 < downButtonSizeX and device_mouse_check_button(0,mb_left)) {
			keyboard_key_press(DOWNKEY);
			keyboard_key_release(DOWNKEY);
		}
		if (TouchY1 > leftButtonY and TouchY1 < leftButtonSizeY and TouchX1 > leftButtonX and TouchX1 < leftButtonSizeX and device_mouse_check_button(0,mb_left)) {
			keyboard_key_press(LEFTKEY);
			keyboard_key_release(LEFTKEY);
		}
		if (TouchY1 > rightButtonY and TouchY1 < rightButtonSizeY and TouchX1 > rightButtonX and TouchX1 < rightButtonSizeX and device_mouse_check_button(0,mb_left)) {
			keyboard_key_press(RIGHTKEY);
			keyboard_key_release(RIGHTKEY);
		}
	}
#endregion
//and TouchX1 > GW/10.5 and TouchX1 < GW/4.25
//and TouchX2 > GW/10.5 and TouchX2 < GW/4.25







