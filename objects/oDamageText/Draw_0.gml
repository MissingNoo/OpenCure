/// @description Insert description here
// You can write your code in this editor
//draw_set_font(global.Font); //draw_set_font(fnt_font1);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
if (dmg != 0) {
    draw_text_transformed(x,y,string(dmg), 1.25, 1.25, 0);
}
else{
	draw_text_transformed(x,y,string("MISS"), 1.25, 1.25, 0);
}