if (room == rInicio) {
    var offset = 0;
	var xoffset = 10
    for (i = 0; i < array_length(menu_options); i++) {
        if (i = selected) {color = c_blue; xoffset = 10}
        else { color = c_white; xoffset = 0}
        draw_rectangle(
            x - 50 - xoffset,
            y - 5 + offset,
            x + 50 + xoffset,
            y + 25 + offset,
            true)
        draw_text_color(
            x - string_width(menu_options[i]) / 2,
            y + offset,
            menu_options[i],
            color, color, color, color, 1)
        offset += 40;
    }
}

if (room == Room1) {
	
    #region Upgrades
	//picture
	//draw_rectangle(5, 40, 165, 160, true);
	draw_sprite_part_ext(sGuiSlots,0,15,0,sprite_get_width(sGuiSlots),sprite_get_height(sGuiSlots),14,40,3,3,c_white,1);
	draw_sprite_ext(global.Player[?"portrait"],0,75,100,1.75,1.75,0,c_white,1);
	draw_sprite_part_ext(sGuiSlots,2,15,0,sprite_get_width(sGuiSlots),sprite_get_height(sGuiSlots),14,40,3,3,c_white,1);
	var offset=0;
    for (i = 0; i < array_length(global.upgrades); i++) {
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
    draw_rectangle(5, 5, GW - 5, 30, true);
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
            if (i = selected) 
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
		 draw_text_transformed(120,250,NAME,2.5,2.5,0);
		 //hp
		 draw_sprite_stretched(heart_shaded,0,75,355,30,30);
		 draw_text_transformed(110,353,"HP",1.5,1.5,0);
		 draw_line(110,381,340,381);
		 var str = string(HP) + "/" + string(MAXHP);
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
	
	draw_text_transformed(GW/2-(string_width(time)/2),35,time,1,1,0)
	#endregion
	
}
draw_set_alpha(.5);
	draw_set_color(c_white)
	draw_rectangle(5,debugy-5,150,debugy + 130,false);
	draw_set_alpha(1);	
	draw_text(10,debugy,a);
	draw_text(10,debugy+20,b);
	draw_text(10,debugy+40,c);
	draw_text(10,debugy+60,d);
	draw_text(10,debugy+80,e);	
	
if (room == Room2) {	
	str="Select your Character";
	draw_text_transformed((GW/2)- string_width(str),50,str,2,2,0);
	var _x = GW / 64;
	var _y = GH / 6;
	var _hh = GH / 1.5;
	var _ww = GW / 4;
	DrawWindow(_x,_y,_ww,_hh,global.name); //Character window
	draw_set_color(c_white);
	draw_text_transformed((GW/2)-285, 140,"Characters",.75,.75,0);
	draw_line((GW/2)-285,160,(GW/2)+285,160);	
	offset=0
	//characters
	draw_text(10,10,selected);
	for (i=0; i < Characters.lenght; i++) {
		draw_sprite_ext(CHARACTERS[i][?"portrait"],0,435+offset,200,1,1,0,c_white,1);
		if (selected == i) {
		    draw_rectangle(435+offset-32,200-32,435+offset,200-30,false);
		draw_rectangle(435+offset-32,200-32,435+offset-30,200,false);
		draw_rectangle(435+offset+32,200+30,435+offset,200+32,false);
		draw_rectangle(435+offset+30,200+32,435+offset+32,200,false);
		}
		
	    offset+=80;
	}
	//DrawWindow(a,b,c,d,"teste");
}







