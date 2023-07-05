//if (os_type != os_android) {
    //draw_set_font(global.Font); //draw_set_font(fnt_font1);
//}
draw_set_alpha(image_alpha);
draw_set_color(c_yellow);
if (dmg != 0) {
    draw_text_transformed(x,y,string(dmg), 1.25, 1.25, 0);
}
else{
	draw_set_color(c_white);
	draw_text_transformed(x,y,string("MISS"), 1.25, 1.25, 0);
}
draw_set_color(c_white);