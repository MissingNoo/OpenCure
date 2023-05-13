//if (instance_exists(oJoystick) and instance_number(oJoystick) > 1) {
	instance_destroy();
//}
/// @description Insert description here
// You can write your code in this editor
//debug
//Touch1 = false;
//TouchX1 = 0;
//TouchY1= 0;
//Touch2 = false;
//TouchX2 = 0;
//TouchY2= 0;
#macro UPKEY vk_up
#macro DOWNKEY vk_down
#macro LEFTKEY vk_left
#macro RIGHTKEY vk_right
//if (variable_global_exists("mode")) {
	mode = global.mode;
//}
//else{
//	mode = "menu";
//}

#region Stage Mode
	canrelease=true;
	//limit = 137;
	limit = 9999;
	ativation = 30;
	J1Set=false;
	JoystickCenterX=GW/6;
	JoystickCenterY=GH/1.25;
	JoystickLimitLeft = JoystickCenterX-limit;
	JoystickAtivationLeft = JoystickCenterX-ativation;
	JoystickLimitRight = JoystickCenterX+limit;
	JoystickAtivationRight = JoystickCenterX+ativation;
	JoystickLimitUp = JoystickCenterY-limit;
	JoystickAtivationUp = JoystickCenterY-ativation;
	JoystickLimitDown = JoystickCenterY+limit;
	JoystickAtivationDown = JoystickCenterY+ativation;

	J2Set=false;
	Joystick2CenterX=GW/1.20;
	Joystick2CenterY=GH/1.25;
	Joystick2LimitLeft = Joystick2CenterX-limit;
	Joystick2AtivationLeft = Joystick2CenterX-ativation;
	Joystick2LimitRight = Joystick2CenterX+limit;
	Joystick2AtivationRight = Joystick2CenterX+ativation;
	Joystick2LimitUp = Joystick2CenterY-limit;
	Joystick2AtivationUp = Joystick2CenterY-ativation;
	Joystick2LimitDown = Joystick2CenterY+limit;
	Joystick2AtivationDown = Joystick2CenterY+ativation;
#endregion
#region Menu Mode
	downButtonX = GW/7.5;
	downButtonY = GW/2.20-64;
	downButtonSizeX = downButtonX + 128;
	downButtonSizeY = downButtonY + 128;
	upButtonX = GW/7.5;
	upButtonY = GW/2.20-74-128;
	upButtonSizeX = upButtonX + 128;
	upButtonSizeY = upButtonY + 128;
	leftButtonX = GW/30;
	leftButtonY = GW/2.20-74-64;
	leftButtonSizeX = leftButtonX + 128;
	leftButtonSizeY = leftButtonY + 128;
	rightButtonX = GW/4.30;
	rightButtonY = GW/2.20-74-64;
	rightButtonSizeX = rightButtonX + 128;
	rightButtonSizeY = rightButtonY + 128;
#endregion



