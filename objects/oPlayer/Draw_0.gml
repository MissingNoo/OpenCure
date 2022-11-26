
/// @description Insert description here	
// You can write your code in this editor
draw_sprite_ext(spr_shadow, 0, x, y, 1, 1, 0, c_white, 0.8)
if (global.debug) {
    draw_text(x,y-40, string(global.xp) + "/" + string(neededxp));
	draw_circle(x,y-16,pickupRadius,true);
}

draw_self();
//if (damaged) {
//	gpu_set_fog(true,c_white,0,0)
//    draw_self()
//	gpu_set_fog(false,c_white,0,0)
//}
//draw_sprite_ext(Arrow,0,x,y,.25,.25,arrow_dir,c_red,1);
draw_healthbar((x - 13), ((y - 16) - 20), (x + 13), ((y - 16) - 23), ((HP / MAXHP) * 100), c_red, c_lime, c_lime, 0, 1, 0);
if (Shield > 0) {
    draw_healthbar((x - 13), ((y - 19) - 20), (x + 13), ((y - 19) - 23), ((Shield / MaxShield) * 100), c_red, c_blue, c_blue, 0, 1, 0);
}

draw_set_color(c_black);
//draw_rectangle(x-15,y-10-(sprite_height/4),x+15,y-12-(sprite_height/4),true);
draw_set_color(c_white);
//draw_text(x,y-20,image_speed);
var strafing = global.strafe ? 1 : 0;
draw_sprite_ext(sArrow,strafing,x,y-16,1,1,global.arrowDir,c_white,1);
/*
//draw_text_transformed(x,y-20,coords[0][?"x"],.5,.5,1)
if (ds_list_size(coordsx) > 0) {
	c = ds_list_size(coordsx);
	for (var i = 0; i < c; ++i) {
		a=oPlayer.x + ds_list_find_value(coordsx,i)
		b=oPlayer.y + ds_list_find_value(coordsy,i)
		draw_circle(a,b,5,1)
	}
}

//draw_circle(x+10,y,5,1)
//draw_circle(x,y-10,5,1)
//draw_circle(x+7,y-7,5,1)














