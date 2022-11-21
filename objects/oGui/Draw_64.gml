draw_set_font(Font1);
draw_set_alpha(1);
draw_set_color(c_white);
if (room == rInicio) {
	#region Lines
		var off = 0;
		for (var i = 0; i < 130; ++i) {
		    draw_sprite_ext(menu_charselec_bar,0,-100+off,GH,1.5,1.5,0,c_white,.5);
			off +=16;
		}	
	#endregion
	
	#region Menu
		draw_text_transformed(20,GH-50,"Android Demo 0.?.?", 2,2,0);
	    var offset = 0;
		var thiss=0;
	    for (i = 0; i < array_length(menu_options); i++) {
	        if (i = selected) { color = c_black; thiss = 1; scale = 2}
	        else {color = c_white; thiss=0; scale = 1.8}
			//var menuX = GW/1.20;
			//var menuY = GW/5;
			var menuX = GW/1.25;
			var menuY = GW/6;
			draw_set_valign(fa_center);
			draw_set_halign(fa_center);
			draw_sprite_ext(sHudButton,thiss,menuX, menuY+offset,scale,scale,0,c_white,1);
	        draw_text_color(
	            menuX,
	            menuY + offset,
	            menu_options[i],
	            color, color, color, color, 1)
	        offset += 66;	
			draw_set_valign(fa_left);
			draw_set_halign(fa_left);
	    }
	#endregion
}

if (room == Room2) {	
	str="CHOOSE YOUR IDOL";
	draw_text_transformed((GW/2)- string_width(str),50,str,2,2,0);
	
	#region Character window
		var _x = GW / 64;
		var _y = GH / 6;
		var _hh = GH / 1.5;
		var _ww = GW / 4;
		DrawWindow(_x,_y,_ww,_hh,string_upper(global.name));
		draw_sprite_ext(CHARACTERS[selected][?"sprite"], sprindex,_x+(_hh/3), _y+190,3,3,0,c_white,1);
	#endregion
	
	#region CharacterList
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
	#endregion	
	
	#region Weapon window
		var _x = GW / 1.37;
		var _y = GH / 6;
		var _hh = GH / 3;
		var _ww = GW / 3.85;
		DrawWindow(_x,_y,_ww,_hh,"ATTACK");
		var weaponID = CHARACTERS[selected][?"weapon"];
		//show_message(string(weaponID[1][?"name"]));
		var weaponSprite = weaponID[1][?"thumb"];
		draw_sprite_ext(weaponSprite, 0,_x+30, _y+50,1.5,1.5,0,c_white,1);
		draw_set_valign(fa_center); draw_set_color(c_white);
		draw_text(_x + 60, _y + 50, weaponID[1][?"name"]);
		draw_text(_x + 8, _y + 85, weaponID[1][?"desc"]);
		draw_set_valign(0);
		
	#endregion
}

if (instance_exists(oPlayer)) //while inside a stage
{	
	#region Character Portrait
		draw_sprite_ext(ui_portrait_bg,0,60,90,2,2,0,c_white,1);
		draw_sprite_ext(global.Player[?"portrait"],0,60,90,2,2,0,c_white,1);
		draw_sprite_ext(ui_portrait_frame,0,60,90,2,2,0,c_white,1);
	#endregion
    #region Upgrades	
		#region Weapons
			var offset=0;			
		    for (i = 0; i < array_length(UPGRADES); i++) //for the size of the upgrade arrays
			{
				draw_sprite_ext(ui_empty_slot_weapon,0,GW/10+offset,GH/12,1.5,1.5,0,c_white,.5); //draw empty slots background
				if (UPGRADES[i]!=global.null) //if there is a upgrade in the slot
				{
					var awakened = (UPGRADES[i][?"level"] < 7) ? 0 : 1; //check if weapon is awakened
					draw_sprite_ext(UPGRADES[i][? "thumb"],awakened,GW/10+offset,GH/12,2,2,0,c_white,1); //draw weapon sprite
					if (global.debug) {draw_text(GW/10+offset, GH/12-15,string(global.upgradeCooldown[UPGRADES[i][?"id"]]));}
					
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
			var offset=0;			
			var yoffset = 16;
		    for (i = 0; i < array_length(playerItems); i++) //for the size of the upgrade arrays
			{
				draw_sprite_ext(ui_empty_slot_item,0,GW/10+offset,GH/7+yoffset,1.5,1.5,0,c_white,.5); //draw empty slots background
				if (playerItems[i]!=global.nullitem) //if there is a upgrade in the slot
				{
					var awakened = (playerItems[i][?"level"] < 7) ? 0 : 1; //check if weapon is awakened
					draw_sprite_ext(playerItems[i][? "thumb"],awakened,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw weapon sprite
					if (global.debug) {draw_text(GW/10+offset, GH/7-15+yoffset,string(global.itemCooldown[playerItems[i][?"id"]]));}
					
					switch (playerItems[i][? "type"]) //detect the type of upgrade
					{
					    case "red":
					        draw_sprite_ext(ui_level_header_pink,0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw type sprite
							draw_sprite_ext(uiDigitPink,playerItems[i][? "level"],GW/10+5+offset,GH/7+yoffset+20,2,2,0,c_white,1); //draw level
					        break;
					    case "yellow":
					        draw_sprite_ext(ui_level_header_yellow,0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw type sprite
							draw_sprite_ext(uiDigitYellow,playerItems[i][? "level"],GW/10+5+offset,GH/7+yoffset+20,2,2,0,c_white,1); //draw level
					        break;
						case "white":
					        draw_sprite_ext(ui_level_header_white,0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw type sprite
							draw_sprite_ext(uiDigitWhite,playerItems[i][? "level"],GW/10+5+offset,GH/7+yoffset+20,2,2,0,c_white,1); //draw level
					        break;
					}
				}		
		        offset+=50;
		    }
		#endregion
		
		#region Perks
			var offset=0;			
			var yoffset = 80;
		    for (i = 0; i < array_length(playerPerks); i++) //for the size of the upgrade arrays
			{
				draw_sprite_ext(ui_empty_slot_item,0,GW/10+offset,GH/7+yoffset,1.5,1.5,0,c_white,.5); //draw empty slots background
				if (playerPerks[i]!=global.nullperk) //if there is a upgrade in the slot
				{
					draw_sprite_ext(playerPerks[i][? "thumb"],0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw weapon sprite
					if (global.debug) {draw_text(GW/10+offset, GH/7-15+yoffset,string(global.itemCooldown[playerPerks[i][?"id"]]));}
					draw_sprite_ext(ui_level_header_pink,0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw type sprite
					draw_sprite_ext(uiDigitPink,playerPerks[i][? "level"],GW/10+5+offset,GH/7+yoffset,2,2,0,c_white,1); //draw level
					        
				}		
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
                string(global.upgrade_options[i][?"name"]))
			draw_line(525,130+offset,1265,130+offset);
			draw_sprite_ext(global.upgrade_options[i][? "thumb"],0,545,151+offset,1.5,1.5,0,c_white,1);
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
		var variables = ["a","b","c","d","e", "dir", "revives", "event"];
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
	//p
	draw_set_alpha(0.5);
	draw_rectangle(pButtonX, pButtonY, pButtonXEnd, pButtonYEnd, false);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(pButtonX, pButtonY, pButtonXEnd, pButtonYEnd, true);
	draw_text(pButtonX + 70, pButtonY + 22.5, "P");
	draw_set_color(c_white);
}





