// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro GW display_get_gui_width()
#macro GH display_get_gui_height()
function DrawWindow(x, y, w, h, title){
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
var base_w = 480;
var base_h = 270;
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
