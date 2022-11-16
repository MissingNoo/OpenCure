/// @description Insert description here
// You can write your code in this editor
///Joystick
draw_set_alpha(.5);
#macro TouchX1 device_mouse_x_to_gui(0)
#macro TouchX2 device_mouse_x_to_gui(1)
#macro TouchY1 device_mouse_y_to_gui(0)
#macro TouchY2 device_mouse_y_to_gui(1)
//debug
//limit
draw_circle(JoystickCenterX,JoystickCenterY-limit,10,false);//top
draw_circle(JoystickCenterX,JoystickCenterY+limit,10,false);//down
draw_circle(JoystickCenterX+limit,JoystickCenterY,10,false);//right
draw_circle(JoystickCenterX-limit,JoystickCenterY,10,false);//left
draw_set_color(c_red);
draw_circle(JoystickCenterX,JoystickCenterY-ativation,10,false);//top
draw_circle(JoystickCenterX,JoystickCenterY+ativation,10,false);//down
draw_circle(JoystickCenterX+ativation,JoystickCenterY,10,false);//right
draw_circle(JoystickCenterX-ativation,JoystickCenterY,10,false);//left
draw_set_color(c_white);
//
if (TouchY1 > JoystickLimitUp and TouchY1 < JoystickLimitDown and TouchX1 > JoystickLimitLeft and TouchX1 < JoystickLimitRight and device_mouse_check_button(0,mb_left)) {
	draw_set_color(c_aqua);
    draw_circle(TouchX1,TouchY1,25,false);
}
else {draw_set_color(c_white);draw_circle(GW/6,GH/1.25,25,false);}
draw_circle(GW/6,GH/1.25,50,true);
draw_set_alpha(1);
