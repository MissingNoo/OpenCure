var _colour = draw_get_colour();
draw_set_colour(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_example);
draw_set_colour(_colour);
var _string = "Press Enter!\n";
if(state == 0){
	_string+="CURRENT: BELOW IMGUI | NEXT: ABOVE IMGUI";	
}else{
	_string+="CURRENT: ABOVE IMGUI | NEXT: END TEST";		
}
draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()-32, _string, 2, 2, 0);