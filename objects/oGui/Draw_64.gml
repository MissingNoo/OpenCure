draw_set_font(Font1);
draw_set_alpha(1);
draw_set_color(c_white);
if (room == rInicio) {
	draw_text_transformed(20,GH-50,"Android Demo 0.?.?", 2,2,0);
    var offset = 0;
	var xoffset = 10
	var thiss=0;
    for (i = 0; i < array_length(menu_options); i++) {
        if (i = selected) { color = c_black; thiss = 1; xoffset = 10}
        else {color = c_white; thiss=0; ; xoffset = 5}
		var menuX = GW/1.20;
		var menuY = GW/5;
        //draw_rectangle(menuX -50 - xoffset,menuY -5 + offset,menuX + 50 + xoffset,menuY + 25 + offset,true)
		draw_sprite(sHudButton,thiss,menuX, menuY+offset+10)
        draw_text_color(
            menuX- (string_width(menu_options[i]) / 2),
            menuY + offset,
            menu_options[i],
            color, color, color, color, 1)
        offset += 40;	
    }
}

if (instance_exists(oPlayer)) //while inside a stage
{
	
    #region Upgrades
	
		#region Character Portrait
			draw_sprite_ext(ui_portrait_bg,0,60,90,2,2,0,c_white,1);
			draw_sprite_ext(global.Player[?"portrait"],0,60,90,2,2,0,c_white,1);
			draw_sprite_ext(ui_portrait_frame,0,60,90,2,2,0,c_white,1);
		#endregion
	
		#region Weapons
			var offset=0;			
		    for (i = 0; i < array_length(UPGRADES); i++) //for the size of the upgrade arrays
			{
				draw_sprite_ext(ui_empty_slot_weapon,0,GW/10+offset,GH/12,1.5,1.5,0,c_white,.5); //draw empty slots background
				if (UPGRADES[i]!=global.null) //if there is a upgrade in the slot
				{
					var awakened = (UPGRADES[i][?"level"] < 7) ? 0 : 1; //check if weapon is awakened
					draw_sprite_ext(UPGRADES[i][? "thumb"],awakened,GW/10+offset,GH/12,2,2,0,c_white,1); //draw weapon sprite
					switch (UPGRADES[i][? "type"]) //detect the type of upgrade
					{
					    case "red":
					        draw_sprite_ext(ui_level_header_pink,0,GW/10+offset,GH/12,2,2,0,c_white,1); //draw type sprite
							draw_sprite_ext(uiDigitPink,UPGRADES[i][? "level"],GW/10+5+offset,GH/12,2,2,0,c_white,1); //draw level
					        break;
					    case "yellow":
					        draw_sprite_ext(ui_level_header_yellow,0,GW/10+offset,GH/12,2,2,0,c_white,1); //draw type sprite
							draw_sprite_ext(uiDigitYellow,UPGRADES[i][? "level"],GW/10+5+offset,GH/12,2,2,0,c_white,1); //draw level
					        break;
						case "white":
					        draw_sprite_ext(ui_level_header_white,0,GW/10+offset,GH/12,2,2,0,c_white,1); //draw type sprite
							draw_sprite_ext(uiDigitWhite,UPGRADES[i][? "level"],GW/10+5+offset,GH/12,2,2,0,c_white,1); //draw level
					        break;
					}
				}		
		        offset+=50;
		    }
		#endregion
		
		#region Items
			offset=0;
			for (i = 0; i < array_length(UPGRADES); i++) {
				draw_sprite_ext(ui_empty_slot_item,0,GW/10+offset,GH/7,1.5,1.5,0,c_white,.5);		
				//draw_rectangle(190+offset, 40,230+offset, 80, 1true);
				//draw_sprite(UPGRADES[i][? "thumb"],0,GW/10+offset,GH/12)
				//draw_text_transformed(GW/10+offset, GH/12, UPGRADES[i][? "level"],.8,.8,0);
		        offset+=50;
		    }
		#endregion
		
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
        draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
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
			//draw_sprite_ext(sGuiSlots,3,542,145+offset,1.5,1.5,0,c_white,1); //square
			//draw_text(542,145+offset,global.upgrade_options[i]);			
			for (var j = 0; j<=array_length(global.upgradesAvaliable) -1; j++) {
				if (global.upgradesAvaliable[j][1][? "name"] == global.upgrade_options[i]) {
				    draw_sprite_ext(global.upgradesAvaliable[j][1][? "thumb"],0,545,151+offset,1.5,1.5,0,c_white,1);
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

#region Debug
if (keyboard_check_pressed(ord("M"))) {
	    if (global.debug) {
		    global.debug = false;
		}
		else global.debug=true;
	}
	draw_text(10,10,global.debug);
	var debugy=170;
	var offset = 0;
	if (global.debug) {
		draw_set_alpha(.5);
		draw_set_color(c_white)
		var variables = ["a","b","c","d","e", "dir"];
		var boxsize=0;
		for (var i = 0; i < array_length(variables); ++i) {
		    boxsize += 20;
		}
		draw_rectangle(5,debugy-5,150,debugy + boxsize,false);
		draw_set_alpha(1);
		for (var i = 0; i < array_length(variables); ++i) {
			if (variable_instance_exists(self,variables[i])) {				
			    draw_text(10,debugy+offset,string(variables[i]) + ": " + string(variable_instance_get(self,variables[i])));
				offset += 20;
			}		    
		}
	}
#endregion	
	
if (room == Room2) {	
	str="CHOOSE YOUR IDOL";
	draw_text_transformed((GW/2)- string_width(str),50,str,2,2,0);
	var _x = GW / 64;
	var _y = GH / 6;
	var _hh = GH / 1.5;
	var _ww = GW / 4;
	DrawWindow(_x,_y,_ww,_hh,global.name); //Character window
	draw_sprite_ext(CHARACTERS[selected][?"sprite"], sprindex,_x+(_hh/3), _y+190,3,3,0,c_white,1);
	draw_set_color(c_white);
	draw_text_transformed(GW/3.5, GH/5.7,"Characters",.75,.75,0);
	draw_line(GW/3.5, GH/5, GW/1.4,GH/5);	
	offset=0
	//characters
	draw_text(10,10,selected);
	for (i=0; i < Characters.lenght; i++) {
		draw_sprite_ext(CHARACTERS[i][?"portrait"],0,435+offset,200,2,2,0,c_white,1);
		if (selected == i) {
			draw_sprite_ext(menu_carselec_cursor,-1,435+offset, 200,2,2,0,c_white,1);
		}
		
	    offset+=100;
	}
	//DrawWindow(a,b,c,d,"teste");
	
}

if (os_type == os_android) {
	draw_set_font(Font1);
	draw_set_alpha(0.5);
	draw_set_color(c_white);
	draw_rectangle(zButtonX, zButtonY, zButtonXEnd, zButtonYEnd, false);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(zButtonX, zButtonY, zButtonXEnd, zButtonYEnd, true);	
	draw_text(zButtonX + 70, zButtonY + 22.5, "Z");
	draw_set_color(c_white);
	draw_set_alpha(0.5);
	draw_rectangle(xButtonX, xButtonY, xButtonXEnd, xButtonYEnd, false);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(xButtonX, xButtonY, xButtonXEnd, xButtonYEnd, true);
	draw_text(xButtonX + 70, xButtonY + 22.5, "X");
	draw_set_color(c_white);
}
