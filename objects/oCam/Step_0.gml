if (!done) {
	var aspect = display_get_width() / display_get_height();
	var h = view_hport[0];
	while (view_wport[0] / h < aspect) {
		h-=.1;
		view_hport[0] = h;
	}
    view_camera[0] = camera_create_view(0, 0, view_wport[0], h, 0, oCam, -1, -1, 400, 250);
	done = true;
}

//var xTo, yTo;
//move_towards_point(mouse_x, mouse_y, 0);
//xTo=oPlayer.x + lengthdir_x(min(dis, distance_to_point(mouse_x, mouse_y)), direction);
//yTo=oPlayer.y + lengthdir_y(min(dis, distance_to_point(mouse_x, mouse_y)), direction);

//x += (xTo - x) / 25;
//y += (yTo - y) / 25;

//var vpos_x = camera_get_view_x(view_camera[target_view]);
//var vpos_y = camera_get_view_y(view_camera[target_view]);
//var vpos_w = camera_get_view_width(view_camera[target_view]) * 0.5;
//var vpos_h = camera_get_view_height(view_camera[target_view]) * 0.5;

//var new_x = lerp(vpos_x, oCam.x - vpos_w, rate);
//var new_y = lerp(vpos_y, oCam.y - vpos_h, rate);

//camera_set_view_pos(view_camera[target_view], new_x, new_y);