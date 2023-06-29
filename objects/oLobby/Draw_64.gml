if (!joinedRoom) {
	draw_text(20, display_get_gui_height() - 50, "C to create room");
	draw_text(20,20, "Rooms:");
	draw_text(40,20, string(selectedroom));

	var _offset = 0;
	for (var i = 0; i < array_length(rooms); ++i) {
		var _color = selectedroom == i ? c_yellow : c_white;
	    draw_text_color(30, 30 + _offset, rooms[i][$"name"] + " " + string(rooms[i][$"totalplayers"]) + "/2", _color, _color, _color, _color, 1);
		_offset += 10;
	}
}

if (joinedRoom) {
	draw_text(20, display_get_gui_height() - 50, "Z to start game");
    draw_set_color(c_white);
	draw_text(200,50,"Connection: " + string(ishost));
	//draw_text(10,100, players);
	var offset = 0;
	
	for (var i = 0; i < array_length(players); ++i) {
		draw_rectangle(GW/137, GH/70+offset, GW/4, GH/6 + offset, true);
		draw_set_alpha(.35);
		draw_rectangle_color(GW/137, GH/70+offset, GW/4, GH/6 + offset, c_gray, c_gray, c_gray, c_gray, false);
		draw_set_alpha(1);
		draw_sprite_stretched(CHARACTERS[players[i].character][?"sprite"], sprites, GW/50, GH/25 + offset, 100, 100);
		draw_text_transformed(GW/10, GH/43+offset, players[i][$"username"], 3, 3, 0);
		draw_text_transformed(GW/10, GH/43+40+offset, CHARACTERS[players[i].character][?"name"], 3, 3, 0);
		offset += 140;
	}
}

