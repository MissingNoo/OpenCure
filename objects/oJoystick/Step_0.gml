/// @description Insert description here
// You can write your code in this editor
///Joystick
if (TouchY1 > JoystickLimitUp and TouchY1 < JoystickLimitDown and TouchX1 > JoystickLimitLeft and TouchX1 < JoystickLimitRight and device_mouse_check_button(0,mb_left)) {
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
//and TouchX1 > GW/10.5 and TouchX1 < GW/4.25
//and TouchX2 > GW/10.5 and TouchX2 < GW/4.25

