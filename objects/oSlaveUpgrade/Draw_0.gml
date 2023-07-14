if (haveafterimage) {
    var _alpha = .1
	for (var i = 0; i < array_length(afterimage[0]); ++i) {
		draw_sprite_ext(sprite_index, afterimage[2][i], afterimage[0][i], afterimage[1][i], image_xscale, image_yscale, image_angle, c_yellow, _alpha);
		_alpha += .10
	}
}
draw_self();