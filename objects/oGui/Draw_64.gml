if(global.upgrade){
	draw_text(10,100,a);
	draw_text(10,120,b);
	draw_text(10,140,c);
	draw_text(10,160,d);
}

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
		 #region UpgradeList
        offset = 0;
        draw_set_alpha(.75)
		// Darken the screen
        draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1)
        for (i = 0; i < array_length(global.upgrade_options); i++) {
            if (i = global.selected) 
			{
				draw_set_color(c_blue);
				draw_rectangle(
                515,
                100+offset,
                1275,
                220+offset,
                true)
			}
			draw_set_alpha(.50)
            draw_rectangle_color(
                515,
                100+offset,
                1275,
                220+offset,
				c_black, c_black, c_black, c_black,
                false)
				draw_set_alpha(1)
            draw_text(
                540,
                108 + offset,
                global.upgrade_options[i])
            offset += 150;
			draw_set_color(c_white);
        }
		#endregion
		 #region Stats
		 draw_text_transformed(120,200,"LevelUP",3,3,0);
		 draw_text_transformed(120,250,global.nome,2.5,2.5,0);
		 //hp
		 draw_sprite_stretched(heart_shaded,0,75,355,30,30);
		 draw_text_transformed(110,353,"HP",1.5,1.5,0);
		 draw_line(110,381,340,381);
		 var str = string(global.hp) + "/" + string(global.maxhp);
		 draw_text_transformed(333-string_width(str)*1.5,353,str,1.5,1.5,0);
		 //atk
		 draw_sprite_stretched(sword_blue,0,75,395,30,30);
		 draw_text_transformed(110,393,"ATK",1.5,1.5,0);		 
		 draw_line(110,421,340,421);
		 var str = "+" + string(oPlayer.atkpercentage) + "%";
		 draw_text_transformed(333-string_width(str)*1.5,393,str,1.5,1.5,0);
		 #endregion
    }
	#endregion
	#region Timer
	time = string(global.minutes) + ":" + string(string_format(global.seconds,2,0));
	
	draw_text_transformed(room_width/2-(string_width(time)/2),35,time,1,1,0)
	#endregion
	
}





