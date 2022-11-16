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
