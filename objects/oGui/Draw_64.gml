if (room == rInicio) {
    offset = 0;
    for (i = 0; i < array_length(menu_options); i++) {
        if (i = global.selected) color = c_blue;
        else color = c_white;
        draw_rectangle(
            ((room_width / 2) - string_width(menu_options[i]) - 5),
            (room_height / 2) + offset,
            (room_width / 2) + string_width(menu_options[i]) + 5,
            room_height / 2 + string_height(menu_options[i]) + offset,
            true)
        draw_text_color(
            (room_width / 2) - string_width(menu_options[i]) / 2,
            room_height / 2 + offset,
            menu_options[i],
            color, color, color, color, 1)
        offset += 30;
    }
}

if (room == Room1) {
    
    #region Upgrades
	draw_rectangle(5, 40, 165, 160, true);
	offset=0
    for (i = 0; i < array_length(global.upgrades); i++) {
		draw_rectangle(185+offset, 40,225+offset, 80, true);
		draw_sprite(global.upgrades[i][? "thumb"],0,185+offset,40)
		draw_text(185+offset, 75, global.upgrades[i][? "level"])
        offset+=50;
    }
    #endregion	
    #region XP
    draw_rectangle_color(5, 5, 5 + global.xp, 30, c_blue, c_blue, c_blue, c_blue, false);
    draw_rectangle(5, 5, room_width - 5, 30, true);
    #endregion
	#region LevelUP	
	 if (global.upgrade == 1) {
        offset = 0;
        draw_set_alpha(.75)
        draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1)
        for (i = 0; i < array_length(global.upgrade_options); i++) {
            if (i = global.selected) color = c_blue;
            else color = c_white;
            draw_rectangle(
                ((room_width / 2) - string_width(global.upgrade_options[i]) - 5),
                (room_height / 2) + offset,
                (room_width / 2) + string_width(global.upgrade_options[i]) + 5,
                room_height / 2 + string_height(global.upgrade_options[i]) + offset,
                true)
            draw_text_color(
                (room_width / 2) - string_width(global.upgrade_options[i]) / 2,
                room_height / 2 + offset,
                global.upgrade_options[i],
                color, color, color, color, 1)
            offset += 30;
        }
    }
	#endregion
	#region Timer
	time = string(global.minutes) + ":" + string(string_format(global.seconds,2,0));
	
	draw_text_transformed(room_width/2-(string_width(time)/2),35,time,1,1,0)
	#endregion
	
}

