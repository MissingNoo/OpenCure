var _yoffset = 0;
var _x = GW/2;
var _y = GH/3.56;
for (var i = 0; i < array_length(Achievements); ++i) {
    draw_sprite_ext(sAchievementBackground, 0, _x, _y + _yoffset, 87, 12, 0, c_white, 1);
	draw_rectangle(_x - 262, _y - 16 + _yoffset, _x + 251, _y - 15 + _yoffset, false);
	_yoffset += 106;
}