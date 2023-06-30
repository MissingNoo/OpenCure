if (!joinedRoom) {
	var x1;
	var y1;
	var x2;
	var y2;
	draw_text(20, display_get_gui_height() - 50, "C to create room");
	draw_text(20,20, "Rooms:");
	draw_text(40,20, string(selectedroom));

	#region button squares
	
	draw_set_alpha(.35);
	draw_rectangle_color(createx1, createy1, createx2, createy2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle_color(createx1, createy1, createx2, createy2, c_white, c_white, c_white, c_white, true);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_middle);
	draw_text_transformed_color((createx1+createx2)/2, (createy1 + createy2) /2, "Create", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	
	draw_set_alpha(.35);
	draw_rectangle_color(joinx1, createy1, joinx2, createy2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle_color(joinx1, createy1, joinx2, createy2, c_white, c_white, c_white, c_white, true);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_middle);
	draw_text_transformed_color((joinx1+joinx2)/2, (createy1 + createy2) /2, "Join", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	#endregion
	#region Button Text
	var textx = GW/2;
	var texty = GH/30.72;
	draw_set_valign(fa_middle);
	draw_set_halign(fa_middle);
	draw_text_transformed_color(textx, texty, "ROOMS",2.86, 2.86, 0, c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);	
	#endregion
	
	var _offset = 0;
	for (var i = 0; i < array_length(rooms); ++i) {
		draw_set_alpha(.35);
		draw_rectangle_color(GW/54.64, GH/16.35 + _offset, GW/1.02, GH/8.26 + _offset, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_rectangle_color(GW/54.64, GH/16.35 + _offset, GW/1.02, GH/8.26 + _offset, c_white, c_white, c_white, c_white, true);
		var _color = selectedroom == i ? c_yellow : c_white;
	    draw_text_transformed_color(GW/37.95, GH/13.25 + _offset, rooms[i][$"name"],2.05, 2.05, 0, _color, _color, _color, _color, 1);
		draw_set_halign(fa_right);										 
	    draw_text_transformed_color(GW/1.02, GH/13.25 + _offset, string(rooms[i][$"totalplayers"]) + "/2",2.05, 2.05, 0, _color, _color, _color, _color, 1);
		draw_set_halign(fa_left);
		_offset += 55;
	}
}

if (joinedRoom) {
	draw_text(20, display_get_gui_height() - 50, "Z to start game");
	draw_text(20, display_get_gui_height() - 10, players);
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

