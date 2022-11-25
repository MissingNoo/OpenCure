// Feather disable GM2043
// Feather disable GM2017
#macro GW display_get_gui_width()
#macro GH display_get_gui_height()
function drawWindow(x, y, w, h, title){
	//background
	draw_set_alpha(.35);
	draw_set_color(c_black);
	draw_rectangle(x,y,x+w,y+h,false);
	//
	draw_set_alpha(1);
	draw_set_color(c_white);
	//title
	draw_rectangle(x,y,x+w,y+25,false);
	//window
	draw_rectangle(x,y,x+w,y+h,true);
	draw_set_color(c_black);
	draw_text(x+5,y+5,title);
}
function gameWindow(){
//window_set_size( 960, 540 );
var base_w = 640;
var base_h = 360;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = display_get_width() / display_get_height();
if (max_w < max_h)
    {
    // portait
     var VIEW_WIDTH = min(base_w, max_w);
    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
    }
else
    {
    // landscape
    var VIEW_HEIGHT = min(base_h, max_h);
    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
    }
camera_set_view_size(view_camera[0], floor(VIEW_WIDTH), floor(VIEW_HEIGHT))
view_wport[0] = max_w;
view_hport[0] = max_h;
surface_resize(application_surface, view_wport[0], view_hport[0]);
}
function drawDesc(_xx, _yy, _string, maxX){
	draw_set_font(fnt_font1);
	draw_set_halign(fa_center);
	var xt=0;
	var yt=0;
	var char = "";
	for (var i = 1; i < string_length(_string); ++i) {
		char = string_copy(_string, i, 1);
		if (_xx + xt >= _xx + maxX) { // past max x jump line
		    xt = 0;
			yt+=15
		}
		if (char == " ") { //if word wont fit jump line
			var totalx = 0
		    for (var j = i+1; j < string_length(_string); ++j) {
				char2 = string_copy(_string, j, 1);
			    if (char2 != " ") {
				    totalx += 10.5;
				}
				else {
				    break;
				}
			}
			if (_xx + xt + totalx >= _xx + maxX) {
				xt = -10.5;
				yt+=15
			}
		}
		switch (char) {
		    case "[":
		        draw_set_color(c_green);
				i++
		        break;
		    case "]":
		        draw_set_color(c_white);
				i++
		        break;
		}
		char = string_copy(_string, i, 1);
		if (xt == 0 and char == " ") {
		    xt = -10.5;
		}
	    draw_text(_xx+xt, _yy+yt, char);
		xt+=10.5;
	}
	draw_set_halign(fa_left);
}


