//switch (upg[?"name"]) {
//default:
if (variable_struct_exists(upg, "afterimage") and upg[$"afterimage"] and image_alpha == 1) {
draw_sprite_ext(sprite_index, image_index-2, xpreviousprevious, ypreviousprevious, image_xscale, image_yscale, 0, upg[$"afterimageColor"], .5);
draw_sprite_ext(sprite_index, image_index-1, xprevious, yprevious, image_xscale, image_yscale, 0, upg[$"afterimageColor"], .75);
}

if (upg[$"id"] != Weapons.SpiderCooking) {
    draw_self();
}
else{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, .5);
	//draw_circle(x,y, )
}

if (global.debug) {
	draw_text(x, y - 20, upgID);
	//draw_text(x,y-30, string(alarm_get(1)));
	//draw_text(x,y-60, string(upg[?"duration"]));
	draw_text(x,y-30, string(direction));
	draw_text(x,y-50, string(image_xscale));
	draw_text(x,y-70, string(image_yscale));
	draw_text(x,y-90, string(global.player[?"ballsize"]));
}		
//		break
//}

