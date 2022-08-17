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
	//picture
	//draw_rectangle(5, 40, 165, 160, true);
	draw_sprite_part_ext(sGuiSlots,0,15,0,sprite_get_width(sGuiSlots),sprite_get_height(sGuiSlots),14,40,3,3,c_white,1);
	draw_sprite_ext(oPlayer.sprite_index,0,74,105,6.8,6.8,0,c_white,1);
	draw_sprite_part_ext(sGuiSlots,2,15,0,sprite_get_width(sGuiSlots),sprite_get_height(sGuiSlots),14,40,3,3,c_white,1);
	var offset=0
	var spr;
    for (i = 0; i < array_length(global.upgrades); i++) {		
		var slot = [190, 230];
		if (i == 0) {
		    draw_sprite_ext(sGuiSlots,0,135+offset,40,1,1,0,c_white,1);
		}
		else {
			draw_sprite_ext(sGuiSlots,1,147+offset,40,1,1,0,c_white,1);
		}
		//draw_rectangle(190+offset, 40,230+offset, 80, true);
		draw_sprite(global.upgrades[i][? "thumb"],0,153+offset,43)
		draw_text_transformed(155+offset, 60, global.upgrades[i][? "level"],.8,.8,0);
        offset+=43;
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
			draw_line(525,130+offset,1265,130+offset);
			//icon
			draw_sprite_ext(sGuiSlots,3,542,145+offset,1.5,1.5,0,c_white,1);
			//draw_text(542,145+offset,global.upgrade_options[i]);			
			for (var j = 0; j<=array_length(global.upgradesAvaliable) -1; j++) {
				if (global.upgradesAvaliable[j][? "name"] == global.upgrade_options[i]) {
				    draw_sprite_ext(global.upgradesAvaliable[j][? "thumb"],0,545,151+offset,1.5,1.5,0,c_white,1);
				}
			}
			
			//
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
	draw_text(10,100,a);
	draw_text(10,120,b);
	draw_text(10,140,c);
	draw_text(10,160,d);
	draw_text(10,180, array_length(global.upgradesAvaliable));
