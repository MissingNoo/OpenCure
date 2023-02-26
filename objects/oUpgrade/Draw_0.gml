//switch (upg[?"name"]) {
	//default:
	if (variable_struct_exists(upg, "afterimage") and upg[$"afterimage"] and image_alpha == 1) {
	    draw_sprite_ext(sprite_index, image_index-2, xpreviousprevious, ypreviousprevious, image_xscale, image_yscale, 0, upg[$"afterimageColor"], .5);
	    draw_sprite_ext(sprite_index, image_index-1, xprevious, yprevious, image_xscale, image_yscale, 0, upg[$"afterimageColor"], .75);
	}
		draw_self();
		if (global.debug) {
			draw_text(x, y - 20, upgID);
		    //draw_text(x,y-30, string(alarm_get(1)));
			//draw_text(x,y-60, string(upg[?"duration"]));
		    draw_text(x,y-30, string(direction));
		}		
//		break
//}

