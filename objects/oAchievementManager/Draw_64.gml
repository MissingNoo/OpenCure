draw_text(display_mouse_get_x(), display_mouse_get_y() + 10, upd);
var _yoffset = 0;
var _x = GW/2;
var _y = GH/3.56;
for (var i = firstItem; i <= lastItem; ++i) {
    draw_sprite_ext(sAchievementBackground, 0, _x, _y + _yoffset, 87, 12, 0, c_white, 1);
	var _unlocked = Achievements[i][$"unlocked"];
	var _amount = Achievements[i][$"amount"];
	draw_set_alpha(_unlocked ? 0.5 : 1);
	var _alpha = _unlocked ? 0.5 : 1;
	var _spr = (_unlocked) ? Achievements[i][$"thumbnail"] : sAchLocked;
	draw_sprite_ext(sItemSquare, 0, _x - 302, _y + _yoffset + 1, 2, 2, 0, c_white, _alpha);
	draw_sprite_ext(_spr, 0, _x - 302, _y + _yoffset + 1, 2, 2, 0, c_white, _alpha);
	if (_amount == 0) {
		draw_sprite_ext(sItemType, 5, _x + 295, _y + _yoffset + 1, 2, 2, 0, c_white, _alpha);
		draw_sprite_ext(Achievements[i][$"reward"], 0, _x + 295, _y + _yoffset + 1, 2, 2, 0, c_white, _alpha);
	}
	else{
		draw_sprite_ext(Achievements[i][$"reward"], 0, _x + 294, _y + _yoffset - 5, 2, 2, 0, c_white, _alpha);
		draw_set_halign(fa_center);
		draw_text_transformed(_x + 295, _y + _yoffset + 15, _amount, 2, 2, 0);
		draw_set_halign(fa_left);
	}
	if (_unlocked) {
	    draw_sprite_ext(sAchUnlocked, 0, _x + 295, _y + _yoffset + 1, 2, 2, 0, c_white, 1);
	}
	draw_rectangle(_x - 263, _y - 16 + _yoffset, _x + 251, _y - 15 + _yoffset, false);
	draw_text_transformed_color(_x - 262, _y + _yoffset - 51, lexicon_text($"Achievements.{Achievements[i][$"name"]}.name"), 2.5, 2.5, 0, c_yellow, c_yellow, c_yellow, c_yellow, _alpha);
	drawDesc(_x - 233, _y - 20 + _yoffset, lexicon_text($"Achievements.{Achievements[i][$"name"]}.desc"), 480, 3);
	_yoffset += 106;
	draw_set_alpha(1);
}
if (keyboard_check_pressed(vk_down)) {
    Achievements[2][$"unlocked"] = true;
}