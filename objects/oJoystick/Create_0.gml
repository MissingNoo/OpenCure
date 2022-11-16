/// @description Insert description here
// You can write your code in this editor
//debug
#macro UPKEY vk_up
#macro DOWNKEY vk_down
#macro LEFTKEY vk_left
#macro RIGHTKEY vk_right
canrelease=true;
limit = 137;
ativation = 37;
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

