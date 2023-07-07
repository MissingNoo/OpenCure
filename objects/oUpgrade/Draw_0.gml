//switch (upg[?"name"]) {
//default:
if (variable_struct_exists(upg, "afterimage") and upg[$"afterimage"] and image_alpha == 1) {
//draw_sprite_ext(sprite_index, image_index-2, xpreviousprevious, ypreviousprevious, image_xscale, image_yscale, image_angle, upg[$"afterimageColor"], .5);
//draw_sprite_ext(sprite_index, image_index-1, xprevious, yprevious, image_xscale, image_yscale, image_angle, upg[$"afterimageColor"], .75);
	var _alpha = .1
	for (var i = 0; i < array_length(afterimagex); ++i) {
	    draw_sprite_ext(sprite_index, afterimagespr[i], afterimagex[i], afterimagey[i], image_xscale, image_yscale, image_angle, upg[$"afterimageColor"], _alpha);
		_alpha += .10
	}
}



if (upg[$"id"] != Weapons.SpiderCooking) {
    draw_self();
}
else{
	//image_xscale = image_yscale;
	//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, .5);
	draw_set_color(c_purple);
	draw_set_alpha(.35);
	draw_circle(x,y, (sprite_get_height(sprite_index)/2) * image_yscale,false);
	draw_set_alpha(1);
	draw_circle(x,y, (sprite_get_height(sprite_index)/2) * image_yscale,true);
	draw_set_color(c_white);
}

if (global.debug) {
	if (upg[$"id"] == Weapons.ENsCurse) {
		draw_circle(x,y, upg[$"range"],true)
	}
	draw_text(x, y - 20, upgID);
	//draw_text(x,y-30, string(alarm_get(1)));
	//draw_text(x,y-60, string(upg[?"duration"]));
	draw_text(x,y-30, string(direction));
	draw_text(x,y-50, string(image_xscale));
	draw_text(x,y-70, string(image_yscale));
	draw_text(x,y-90, string(shoots));
}		
//		break
//}

