/// @description Insert description here
// You can write your code in this editor
///Joystick
draw_set_alpha(.5);
#macro TouchX1 device_mouse_x_to_gui(0)
#macro TouchX2 device_mouse_x_to_gui(1)
#macro TouchY1 device_mouse_y_to_gui(0)
#macro TouchY2 device_mouse_y_to_gui(1)
if (global.debug) {
	//limit
	draw_set_color(c_white);    
	draw_circle(JoystickCenterX,JoystickCenterY-limit,10,false);//top
	draw_circle(JoystickCenterX,JoystickCenterY+limit,10,false);//down
	draw_circle(JoystickCenterX+limit,JoystickCenterY,10,false);//right
	draw_circle(JoystickCenterX-limit,JoystickCenterY,10,false);//left
	draw_set_color(c_red);
	draw_circle(JoystickCenterX,JoystickCenterY-ativation,10,false);//top
	draw_circle(JoystickCenterX,JoystickCenterY+ativation,10,false);//down
	draw_circle(JoystickCenterX+ativation,JoystickCenterY,10,false);//right
	draw_circle(JoystickCenterX-ativation,JoystickCenterY,10,false);//left
	//right
	draw_set_color(c_white);    
	draw_circle(Joystick2CenterX,Joystick2CenterY-limit,10,false);//top
	draw_circle(Joystick2CenterX,Joystick2CenterY+limit,10,false);//down
	draw_circle(Joystick2CenterX+limit,Joystick2CenterY,10,false);//right
	draw_circle(Joystick2CenterX-limit,Joystick2CenterY,10,false);//left
	draw_set_color(c_red);
	draw_circle(Joystick2CenterX,Joystick2CenterY-ativation,10,false);//top
	draw_circle(Joystick2CenterX,Joystick2CenterY+ativation,10,false);//down
	draw_circle(Joystick2CenterX+ativation,Joystick2CenterY,10,false);//right
	draw_circle(Joystick2CenterX-ativation,Joystick2CenterY,10,false);//left
	draw_set_color(c_white);    
}

#region Left Joystick 
	if (TouchY1 > JoystickLimitUp and TouchY1 < JoystickLimitDown and TouchX1 > JoystickLimitLeft and TouchX1 < JoystickLimitRight and device_mouse_check_button(0,mb_left)) {
		draw_set_color(c_aqua);
	    draw_circle(TouchX1,TouchY1,25,false);
	}
	else {draw_set_color(c_white);draw_circle(JoystickCenterX,JoystickCenterY,25,false);}
draw_circle(JoystickCenterX,JoystickCenterY,50,true);
#endregion

#region Right Joystick 
	if (instance_exists(oPlayer)) {
		//if (TouchY1 > Joystick2LimitUp and TouchY1 < Joystick2LimitDown and TouchX1 > Joystick2LimitLeft and TouchX1 < Joystick2LimitRight) {
		if (TouchY2 > Joystick2LimitUp and TouchY2 < Joystick2LimitDown and TouchX2 > Joystick2LimitLeft and TouchX2 < Joystick2LimitRight and device_mouse_check_button(1,mb_left)) {
			draw_set_color(c_aqua);
		    draw_circle(TouchX2,TouchY2,25,false);
		}
		else {draw_set_color(c_white);draw_circle(Joystick2CenterX,Joystick2CenterY,25,false);}
		draw_circle(Joystick2CenterX,Joystick2CenterY,50,true);
	}
#endregion
draw_set_color(c_white);
draw_set_alpha(1);
