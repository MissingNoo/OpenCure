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
	
	draw_set_alpha(.35);
	draw_rectangle_color(reloadx1, createy1, reloadx2, createy2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle_color(reloadx1, createy1, reloadx2, createy2, c_white, c_white, c_white, c_white, true);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_middle);
	draw_text_transformed_color((reloadx1+reloadx2)/2, (createy1 + createy2) /2, "Reload", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
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
		if (rooms[i][$"password"] != "") {
		    draw_sprite_ext(sLockIcon, 0, GW/1.08, GH/13.25 + _offset, 1, 1, 0, c_white, 1);
		}
	    draw_text_transformed_color(GW/1.02, GH/13.25 + _offset, string(rooms[i][$"totalplayers"]) + "/2",2.05, 2.05, 0, _color, _color, _color, _color, 1);
		draw_set_halign(fa_left);
		_offset += 55;
		
	}
}

if (creatingroom) {
	draw_set_alpha(.5);
    draw_rectangle_color(GW/2 - 200, GH/2- 120, GW/2 + 200, GH/2 + 120, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle_color(GW/2 - 200, GH/2- 120, GW/2 + 200, GH/2 + 120, c_white, c_white, c_white, c_white, true);
	draw_set_halign(fa_center);
	draw_text_transformed(GW/2, GH/2.75, "Create Room", 3, 3, 0);
	
	draw_text_transformed(GW/2, GH/2.35, "Name", 2, 2, 0);
	var _color = (creatingselected == 0) ? c_yellow : c_white;
	draw_rectangle_color(GW/2 - 100, GH/2.15, GW/2 + 100, GH/2.15 + 32, _color, _color, _color, _color, true);
	openKeyboard(GW/2 - 100, GH/2.15, GW/2 + 100, GH/2.15 + 32, "creatingselected", 0, "roomname");
	draw_text_transformed(GW/2, GH/2.15, roomname, 2, 2, 0);
	
	draw_text_transformed(GW/2, GH/1.92, "Password", 2, 2, 0);
	_color = (creatingselected == 1) ? c_yellow : c_white;
	draw_rectangle_color(GW/2 - 100, GH/1.79, GW/2 + 100, GH/1.79 + 32, _color, _color, _color, _color, true);
	openKeyboard(GW/2 - 100, GH/1.79, GW/2 + 100, GH/1.79 + 32, "creatingselected", 1, "password");
	draw_text_transformed(GW/2, GH/1.79, password, 2, 2, 0);
	
	var cx = GW/2 - 55;
	var cy = GH/1.59;
	var cs = 45;
	var ax = GW/2 + 55;
	var ay = cy;
	var as = cs;
	
	draw_set_valign(fa_center);
	_color = (creatingselectedyesno == 0) ? c_yellow : c_white;
	if (creatingselected != 2) { _color = c_white;}
	draw_rectangle_color(cx - cs, cy - 14.5, cx + cs, cy + 14.5, _color, _color, _color, _color, true);
	if (point_in_rectangle(oGui.x, oGui.y,cx - cs, cy - 14.5, cx + cs, cy + 14.5)) {
	    creatingroom = false;
	}
	draw_text_transformed(cx, cy, "Cancel", 2, 2, 0);
	_color = (creatingselectedyesno == 1) ? c_yellow : c_white;
	if (creatingselected != 2) { _color = c_white;}
	draw_rectangle_color(ax - as, cy - 14.5, ax + as, cy + 14.5, _color, _color, _color, _color, true);
	if (point_in_rectangle(oGui.x, oGui.y,ax - as, cy - 14.5, ax + as, cy + 14.5)) {
		    if (roomname != "") {
				creatingroom = false;
			    sendMessage({
					command : Network.CreateRoom,
					password
				});
				sendMessage({
					command : Network.JoinRoom,
					username : global.username,
					character : global.player[?"id"],
					password
				});
			}
	}
	draw_text_transformed(ax, cy, "Accept", 2, 2, 0);
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}

if (typepassword) {
	var _x = GW/2;
	var _xoff = 150;
	var _y = GH/2;
	var _yoff = 75;
	
	draw_set_alpha(.5);
    draw_rectangle_color(_x - _xoff, _y - _yoff, _x + _xoff, _y + _yoff, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle_color(_x - _xoff, _y - _yoff, _x + _xoff, _y + _yoff, c_white, c_white, c_white, c_white, true);
	openKeyboard(_x - _xoff, _y - _yoff, _x + _xoff, _y + _yoff, "passwordselected", 0, "password");
	draw_set_halign(fa_center);
	var _ytext = (_y - _yoff) + string_height("Password");
	draw_text_transformed(_x, _ytext, "Password", 3, 3, 0);
	
	var _color = (passwordselected == 0) ? c_yellow : c_white;
	var _passcampy = _ytext + 40;
	draw_rectangle_color(_x - 100, _passcampy, _x + 100, _passcampy + 32, _color, _color, _color, _color, true);
	draw_text_transformed(_x, _passcampy, password, 2, 2, 0);
	
	var cx = _x - 55;
	var cy = _passcampy + 65;
	var cs = 45;
	var ax = _x + 55;
	var ay = cy;
	var as = cs;
	
	draw_set_valign(fa_center);
	_color = (passwordselectedyesno == 0) ? c_yellow : c_white;
	if (passwordselected != 1) { _color = c_white;}
	draw_rectangle_color(cx - cs, cy - 14.5, cx + cs, cy + 14.5, _color, _color, _color, _color, true);
	if (point_in_rectangle(oGui.x, oGui.y,ax - as, cy - 14.5, ax + as, cy + 14.5)) {
		typepassword = false;
	}
	draw_text_transformed(cx, cy, "Cancel", 2, 2, 0);
	_color = (passwordselectedyesno == 1) ? c_yellow : c_white;
	if (passwordselected != 1) { _color = c_white;}
	draw_rectangle_color(ax - as, cy - 14.5, ax + as, cy + 14.5, _color, _color, _color, _color, true);
	if (point_in_rectangle(oGui.x, oGui.y,ax - as, cy - 14.5, ax + as, cy + 14.5)) {
		if (rooms[selectedroom][$"password"] == password) {
			typepassword = false;
			global.roomname = rooms[selectedroom][$"name"];
			sendMessage({
				command : Network.JoinRoom,
				username : global.username,
				character : global.player[?"id"],			
			});
		}
	}
	draw_text_transformed(ax, cy, "Accept", 2, 2, 0);
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}

if (joinedRoom) {
	draw_text(20, display_get_gui_height() - 50, "Z to start game");
	draw_text(20, display_get_gui_height() - 10, players);
    draw_set_color(c_white);
	draw_text(200,50,"Connection: " + string(ishost));
	//draw_text(10,100, players);
	var offset = 0;
	var biggername = 0;
	for (var i = 0; i < array_length(players); ++i) {
		var len = string_length(players[i][$"username"]);
		if (len > biggername) {
		    biggername = len;
		}
		draw_rectangle(GW/137, GH/70+offset, GW/4 + len, GH/6 + offset, true);
		draw_set_alpha(.35);
		draw_rectangle_color(GW/137, GH/70+offset, GW/4+len, GH/6 + offset, c_gray, c_gray, c_gray, c_gray, false);
		draw_set_alpha(1);
		draw_sprite_stretched(CHARACTERS[players[i].character][?"sprite"], sprites, GW/50, GH/25 + offset, 100, 100);
		draw_text_transformed(GW/10, GH/43+offset, players[i][$"username"], 3, 3, 0);
		draw_text_transformed(GW/10, GH/43+40+offset, CHARACTERS[players[i].character][?"name"], 3, 3, 0);
		offset += 140;
	}
		
	var _x = GW/1.25;
	var _tx = _x + 5;
	var _y = GH/59.08;
	var _yo = _y + 4;
	var _xx = GW/1.01;
	var _yy = GH/2.90;
	draw_set_alpha(0.35);
	draw_rectangle_color(_x, _y, _xx, _yy, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle_color(_x, _y, _xx, _yy, c_white, c_white, c_white, c_white, true);
	draw_set_halign(fa_center);
	draw_text_transformed((_x + _xx) /2, _yo, "Options", 2, 2, 0);
	draw_set_halign(fa_left);
	for (var i = 0; i < array_length(options); ++i) {
		_yo += 22;
		draw_text_transformed(_tx, _yo, options[i][0], 2, 2, 0);
		var _sy = _yo + 3.50;
		draw_rectangle_color(_xx - 45, _sy, _xx - 5, _sy + 17, c_white, c_white, c_white, c_white, true);
		var _color = c_white;
		if (variable_instance_get(self, options[i][1])) {
			_color = c_green;
		    draw_rectangle_color(_xx - 25, _sy + 1, _xx - 6 - 1 , _sy + 15, _color, _color, _color, _color, false);
		}
		else{			
			_color = c_red;
			draw_rectangle_color(_xx - 44, _sy + 1, _xx - 25 - 1, _sy + 15, _color, _color, _color, _color, false);
		}		
	}
	
}