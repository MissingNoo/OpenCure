
#region Start variables
	draw_set_font(global.Font); //draw_set_font(fnt_font1);
	draw_set_alpha(1);
	draw_set_color(c_white);
#endregion

//var lasti = "";
//for (var i = 0; i < array_length(lastinputs); ++i) {
//    lasti = lasti + ":" + string(lastinputs[i]);
//}
//draw_set_color(c_red);
//draw_text(100,100,lasti);
//draw_set_color(c_white);
#region black screen below gui
	if (global.upgrade == 1 or global.gamePaused and room != rInicio) {
		draw_set_alpha(.75)
		// Darken the screen
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1)
	}
#endregion

#region Menu room
	if (room == rInicio) {
	//1.75 1.15
		#region Menu
		if (!global.gamePaused) {
			draw_text_transformed(20,GH-50,"version DEMO 0.4.11072001 ported by Airgeadlamh", 1, 1, 0);
		    var offset = 0;
			var thiss=0;
			var scale;
		    for (var i = 0; i < array_length(menu_options); i++) {
		        if (i = selected) { draw_set_color(c_black); thiss = 1; scale = 0.35;}
		        else {draw_set_color(c_white); thiss=0; scale = 0;}
				//var menuX = GW/1.20;
				//var menuY = GW/5;
				var menuX = GW/1.25;
				var menuY = GW/6;
				draw_set_valign(fa_middle);
				draw_set_halign(fa_center);
				draw_sprite_ext(sHudButton,thiss,menuX, menuY+offset,1.75+scale, 1.5,0,c_white,1);
		        draw_text_transformed(
		            menuX,
		            menuY + offset,
		            menu_options[i],1.85, 1.85,0);
		        offset += 55;	
				draw_set_valign(fa_top);
				draw_set_halign(fa_left);
		    }
		}
		#endregion
	}
#endregion

#region Character Select Room
	var str = ""; var offset = 0;
	if (room == Room2) {	
		str="CHOOSE YOUR IDOL";
		draw_text_transformed((GW/2)- string_width(str),50,str,2,2,0);
	
		#region Character window
			var _x = GW / 64;
			var _y = GH / 6;
			var _hh = GH / 1.5;
			var _ww = GW / 4;
			drawWindow(_x,_y,_ww,_hh,string_upper(global.name));
			draw_sprite_ext(CHARACTERS[selected][?"sprite"], sprindex,_x+(_hh/3), _y+190,3,3,0,c_white,1);
		#endregion
	
		#region CharacterList
			draw_set_color(c_white);
			draw_text_transformed(GW/3.5, GH/5.7,"Characters",.75,.75,0);
			draw_line(GW/3.5, GH/5, GW/1.4,GH/5);	
			offset=0
			//characters
			draw_text(10,10,selected);
			for (var i=0; i < Characters.Lenght; i++) {
				draw_sprite_ext(CHARACTERS[i][?"portrait"],0,GW/3.10 + offset,GH/3.75,2,2,0,c_white,1);
				if (selected == i) {
					draw_sprite_ext(menu_carselec_cursor,-1,GW/3.10 + offset, GH/3.75,2,2,0,c_white,1);
				}
			    offset+=GW/13;
			}
		#endregion	
	
		#region Weapon window
			_x = GW / 1.37;
			_y = GH / 6;
			_hh = GH / 3;
			_ww = GW / 3.85;
			drawWindow(_x,_y,_ww,_hh,"ATTACK");
			var weaponID = CHARACTERS[selected][?"weapon"];
			//show_message(string(weaponID[1][?"name"]));
			var weaponSprite = weaponID[1][?"thumb"];
			draw_sprite_ext(weaponSprite, 0,_x+30, _y+50,1.5,1.5,0,c_white,1);
			draw_set_valign(fa_middle); draw_set_color(c_white);
			draw_text(_x + 60, _y + 50, weaponID[1][?"name"]);
			//draw_text(_x + 8, _y + 85, weaponID[1][?"desc"]);
			drawDesc(_x + 8, _y + 85, weaponID[1][?"desc"], GW/3.35);
			draw_set_valign(0);
		
		#endregion
	}
#endregion

#region Inside Stage
	if (instance_exists(oPlayer))
	{	
		#region Character Portrait
			draw_sprite_ext(ui_portrait_bg,0,60,90,2,2,0,c_white,1);
			draw_sprite_ext(global.player[?"portrait"],0,60,90,2,2,0,c_white,1);
			draw_sprite_ext(ui_portrait_frame,0,60,90,2,2,0,c_white,1);
		#endregion
		#region Upgrades
			#region Weapons
				offset=0;			
			    for (var i = 0; i < array_length(UPGRADES); i++) //for the size of the upgrade arrays
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
				offset=0;			
				var yoffset = 16;
			    for (var i = 0; i < array_length(playerItems); i++) //for the size of the upgrade arrays
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
								draw_sprite_ext(uiDigitPink,playerItems[i][? "level"],GW/10+5+offset,GH/7+yoffset,2,2,0,c_white,1); //draw level
						        break;
						    case "yellow":
						        draw_sprite_ext(ui_level_header_yellow,0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw type sprite
								draw_sprite_ext(uiDigitYellow,playerItems[i][? "level"],GW/10+5+offset,GH/7+yoffset,2,2,0,c_white,1); //draw level
						        break;
							case "white":
						        draw_sprite_ext(ui_level_header_white,0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw type sprite
								draw_sprite_ext(uiDigitWhite,playerItems[i][? "level"],GW/10+5+offset,GH/7+yoffset,2,2,0,c_white,1); //draw level
						        break;
						}
					}		
			        offset+=50;
			    }
			#endregion
		
			#region Perks
				offset=0;			
				yoffset = 80;
			    for (var i = 0; i < array_length(PLAYER_PERKS); i++) //for the size of the upgrade arrays
				{
					draw_sprite_ext(ui_empty_slot_item,0,GW/10+offset,GH/7+yoffset,1.5,1.5,0,c_white,.5); //draw empty slots background
					if (PLAYER_PERKS[i]!=global.nullperk) //if there is a upgrade in the slot
					{
						var activated = PLAYER_PERKS[i][?"level"] > 0  ? 1 : .5;
						draw_sprite_ext(PLAYER_PERKS[i][? "thumb"],0,GW/10+offset,GH/7+yoffset,2,2,0,c_white, activated); //draw weapon sprite
						if (global.debug) {draw_text(GW/10+offset, GH/7-15+yoffset,string(global.perkCooldown[PLAYER_PERKS[i][?"id"]]));}
						draw_sprite_ext(ui_level_header_pink,0,GW/10+offset,GH/7+yoffset,2,2,0,c_white,1); //draw type sprite
						draw_sprite_ext(uiDigitPink,PLAYER_PERKS[i][? "level"],GW/10+5+offset,GH/7+yoffset,2,2,0,c_white,1); //draw level					        
					}		
			        offset+=50;
			    }
			#endregion
		
	    #endregion	

		#region XP
			if (global.xp > 0) {
			    draw_rectangle_color(5, 5, 5 + ((global.xp / oPlayer.neededxp) * GW - 5), 30, c_blue, c_blue, c_blue, c_blue, false);
			}		    
		    draw_rectangle(5, 5, GW - 5, 30, true);
	    #endregion

		#region LevelUP
		 if (global.upgrade == 1) {
			 #region UpgradeList
	        offset = 0;
	        for (var i = 0; i < array_length(global.upgradeOptions); i++) {
				var _xx = GW/1.52;
				var _yy = GH/4.5;
				draw_sprite_ext(sUpgradeBackground, 0, _xx, _yy + offset, 2.10, 1.25, 0, c_black, .75);//upgrade background
				draw_sprite_ext(sUpgradeBackground, 2, _xx, _yy + 5 + offset, 2.10, 1.25, 0, c_white, .75);//upgrade line for the text
	            if (i = selected) { //if select draw border
					draw_sprite_ext(sUpgradeBackground, 1, _xx, _yy + offset, 2.10, 1.25, 0, c_white, 1); 
					draw_sprite_ext(sHoloCursor, holoarrowspr, _xx - 440, _yy + offset, 2.5, 2.5, 0, c_white, 1); 
					} 
				draw_set_halign(fa_left);
	            draw_text_transformed(GW/2.60 + guiOffset, GH/6.65 + offset, string(global.upgradeOptions[i][?"name"]), 1.5, 1.5, 0); // draw the name
				var style = ""; switch (global.upgradeOptions[i][?"style"]) { // type of upgrade
				    case ItemTypes.Weapon:
				        style = " >> Weapon";
				        break;
				    case ItemTypes.Item:
				        style = " >> Item";
				        break;
					case ItemTypes.Perk:
				        style = " >> Skill";
				        break;
				}
				draw_set_halign(fa_right);
				draw_text_transformed(GW/1.08 - guiOffset, GH/6.65 + offset, string(style), 1.5, 1.5, 0);  // draw type of upgrade
				draw_set_halign(fa_left);
				draw_sprite_ext(global.upgradeOptions[i][? "thumb"],0,GW/2.45 + guiOffset, _yy + offset,2, 2,0,c_white,1); // item thumb			
				draw_sprite_ext(sItemType, global.upgradeOptions[i][?"style"], GW/2.45 + guiOffset, _yy + offset,2, 2,0,c_white,1); // item thumb type
				var foundup = false;
				var foundlv = 0;
				for (var j = 0; j < array_length(UPGRADES); ++j) {
				    if (UPGRADES[j][?"name"] == global.upgradeOptions[i][?"name"]) {
					    foundup = true;
						foundlv = UPGRADES[j][?"level"] + 1;
					}
				}			
				if (foundup) {
					var idd = global.upgradeOptions[i][?"id"];
				    drawDesc(GW/2.20+(guiOffset/2),GH/5.5+offset, global.upgradesAvaliable[idd][foundlv][?"desc"], GW/2.20, 2);
				}
				else{
					drawDesc(GW/2.20+(guiOffset/2),GH/5.5+offset, global.upgradeOptions[i][?"desc"], GW/2.20, 2);
				}
	            //offset += 165;
				offset += GH/5.30;
				draw_set_color(c_white);
	        }
			#endregion
			 drawStats();
	    }
		#endregion

		#region Anvil
		if (ANVIL) {
			draw_text_transformed(GW/2, GH/7.25, "UPGRADE!", 4, 4, 0);
			#region Weapons
				var xoffset = 0;
				var anvilIsSelected = 0;
				for (var i = 0; i < array_length(UPGRADES); ++i){
					if (anvilSelectedCategory == 0 and i == anvilSelected){
						anvilIsSelected = 1
					}else{
						anvilIsSelected = 0;
					}
				    draw_sprite_ext(sItemSquare, anvilIsSelected, GW/2.30 + xoffset, GH/3, 2, 2, 0, c_white, 1);
					draw_sprite_ext(UPGRADES[i][?"thumb"], 0, GW/2.30 + xoffset, GH/3, 2, 2, 0, c_white, 1);
					xoffset += GW/12;
				}
			#endregion
			
			#region Items
				xoffset = 0;
				for (var i = 0; i < array_length(playerItems); ++i){
					if (anvilSelectedCategory == 1 and i == anvilSelected){
						anvilIsSelected = 1
					}else{
						anvilIsSelected = 0;
					}
					draw_sprite_ext(sItemSquare, anvilIsSelected, GW/2.30 + xoffset, GH/2.30, 2, 2, 0, c_white, 1);
					draw_sprite_ext(playerItems[i][?"thumb"], 0, GW/2.30 + xoffset, GH/2.30, 2, 2, 0, c_white, 1);
					xoffset += GW/12;
				}
			#endregion
			
			#region Item Info
				var _xx = GW/1.55;
				var _yy = GH/1.60;
				var style;
				draw_sprite_ext(sUpgradeBackground, 0, _xx, _yy, 2.10, 1.25, 0, c_black, .75);//upgrade background
				draw_sprite_ext(sUpgradeBackground, 2, _xx, _yy, 2.10, 1.25, 0, c_white, .75);//upgrade line for the text
				draw_sprite_ext(sUpgradeBackground, 1, _xx, _yy, 2.10, 1.25, 0, c_white, 1); 
				var selectedThing;
				if (anvilSelectedCategory == 0) {
				    selectedThing = UPGRADES[anvilSelected];
				}else{
					selectedThing = playerItems[anvilSelected];
				}
				var level = selectedThing[?"level"] + 1;
				var maxlevel = selectedThing[?"maxlevel"];
				draw_text_transformed(_xx - 385, _yy - 59.50 , string(selectedThing[?"name"]), 1, 1, 0); // draw the name
				draw_set_color(c_yellow);
				if (level -1 < maxlevel) {
					str = string_ext("LV {0} >> LV {1} ", [string(selectedThing[?"level"]), string(selectedThing[?"level"] + 1)]);
				}else{
					str = "MAX LV";
				}
				if (selectedThing != global.null and selectedThing != global.nullitem) {
				    draw_text_transformed(_xx - 385 + (string_width(selectedThing[?"name"]) + 20), _yy - 59.50 , str, 1, 1, 0); // draw the name
				}
				draw_set_color(c_white);
				switch (selectedThing[?"style"]) { // type of upgrade
					case ItemTypes.Weapon:
						style = " >> Weapon";
						break;
				    case ItemTypes.Item:
						style = " >> Item";
						break;
					case ItemTypes.Perk:
						style = " >> Skill";
						break;
				}
				draw_set_halign(fa_right);
				draw_text_transformed(_xx + 370, _yy - 59.50, string(style), 1, 1, 0);  // draw type of upgrade
				draw_set_halign(fa_left);
				draw_sprite_ext(selectedThing[? "thumb"],0, _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb
				draw_sprite_ext(sItemType, selectedThing[?"style"], _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb type
				if (level > maxlevel) {	level -= 1	}
				if (anvilSelectedCategory == 0 and selectedThing != global.null and selectedThing != global.nullitem) {
					drawDesc(_xx - 290,_yy - 35, global.upgradesAvaliable[selectedThing[?"id"]][level][?"desc"], GW/2, 2);
				}
				if (anvilSelectedCategory == 1 and selectedThing != global.null and selectedThing != global.nullitem) {
					
					drawDesc(_xx - 290,_yy - 35, global.itemList[selectedThing[?"id"]][level][?"desc"], GW/2, 2);
				}
			#endregion
			drawStats();
		}
		#endregion

		#region Timer
		var time = string(global.minutes) + ":" + string(string_format(global.seconds,2,0));
	
		draw_text_transformed(GW/2-(string_width(time)/2),35,time,1,1,0);
		#endregion
		
		#region Buffs
			var _xx = 55;
			var _yy = GH - 55;
			for (var i = 0; i < array_length(Buffs); ++i) {
			    if (Buffs[i].enabled == true) {
				    draw_set_alpha(.5);
					draw_rectangle(_xx - 32, _yy - 32, _xx + 32, _yy + 32, false);
					draw_set_alpha(1);
					draw_sprite_stretched(Buffs[i].icon, 0, _xx - sprite_get_width(Buffs[i].icon), _yy - sprite_get_height(Buffs[i].icon), 35, 35);
					draw_set_color(c_blue);
					draw_text(_xx, _yy+10, string(round(Buffs[i].cooldown)));
					draw_set_color(c_white);
					draw_set_alpha(1);
					_xx += 40;
				}
			}
			
		#endregion
	}
#endregion

#region PauseMenu
	if (global.gamePaused and !global.upgrade and !ANVIL) {
		//pauseMenu[PMenus.Pause][pM.xScale] = a;
		//pauseMenu[PMenus.Pause][pM.yScale] = b;
		//pauseMenu[PMenus.Pause][pM.yScale] = array_length(pauseMenu[activeMenu][pM.Options])/(3 - (array_length(pauseMenu[activeMenu][pM.Options])*1.5));
		//pauseMenu[PMenus.Pause][pM.yScale] = b;
		draw_sprite_ext(sMenu, 0,
		GW/2,
		GH/2,
		pauseMenu[activeMenu][pM.xScale],
		pauseMenu[activeMenu][pM.yScale],
		0,c_white,1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		
		draw_text_transformed(GW/2, 
		(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][pM.yScale])/2) + 20,
		pauseMenu[activeMenu][pM.Title], 
		3, 3, 0);
		var mOffset = 0;
		draw_set_valign(fa_middle);
		//draw options
		var startOption = 0;
		var totaloptions = array_length(pauseMenu[activeMenu][pM.Options]);
		if (totaloptions >= 6) {
		    totaloptions=6;
		}
		for (var i = selected; i >= totaloptions - startOption; --i) {
		    startOption++;
			totaloptions++;
		}
		
		
		//draw_text(300, 200,
		//"totaloptions = " + string(array_length(pauseMenu[activeMenu][pM.Options])) +
		//" \n totalOptionsNow= " + string(totaloptions) +
		//" \n startOption= " + string(startOption) +
		//" \n selected= " + string(selected) +
		//" \n t-s= " + string(totaloptions - startOption) +
		//" \n totaloptions = " + string("a")	
		//);
		var bigString = 0;
		for (var i = 0; i < array_length(pauseMenu[activeMenu][pM.Options]); ++i) {
		    if (string_length(pauseMenu[activeMenu][pM.Options][i])/11 > bigString) {
			    bigString = string_length(pauseMenu[activeMenu][pM.Options][i])/11;
			}
		}
		
		for (var i = startOption; i < totaloptions; ++i) {
			var spr = (selected == i) ? 1 : 0;
			draw_sprite_ext(sHudButton, spr, GW/2, 
			//GH/2 - sprite_get_height(sMenu)/3.5+mOffset, 
			(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][pM.yScale])/2) + 90 + mOffset,
			bigString,
			1.35,0,c_white,1);
			
			draw_set_color(selected == i ? c_black : c_white);
			draw_text_transformed(GW/2,
			(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][pM.yScale])/2) + 90 + mOffset,
			pauseMenu[activeMenu][pM.Options][i], 1.5, 1.5, 0);	
			if (activeMenu == PMenus.Settings and pauseMenu[activeMenu][pM.Bool][i] == true) {
				var boolselected = (selected == i) ? 2 : 0;
				var boolv = (pauseMenu[activeMenu][pM.BoolValue][i]) ? 1 : 0;
			    draw_sprite_ext(sToggleButton, boolselected + boolv, GW/1.72, 
				//GH/2 - sprite_get_height(sMenu)/3.5+mOffset, 
				(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][pM.yScale])/2) + 90 + mOffset,
				1,
				1,0,c_white,1);
			}
			
		    mOffset+=45;
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
	}
#endregion

#region Debug
if (keyboard_check_pressed(ord("M"))) {
	    if (global.debug) {
		    global.debug = false;
		}
		else global.debug=true;
	}
	draw_text(10,10,global.debug);
	var debugy=170;
	offset = 0;
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

#region Android Buttons
	if (os_type == os_android) {
		draw_set_font(global.Font); //draw_set_font(fnt_font1);
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
#endregion

#region Functions
	function drawStats(){
		#region Stats
			var str
			draw_set_halign(fa_center);
			draw_text_transformed(GW/5, GH/3.40, "LevelUP", 3, 3, 0);
			draw_text_transformed(GW/5, GH/2.70, NAME, 2, 2, 0);
			var stats_offset=0;
			
			#region HP
				draw_sprite_stretched(heart_shaded, 0, GW/11, GH/2.15, 25, 25);
				draw_text_transformed(GW/8, GH/2.15, "HP", 1.5, 1.5, 0);
				draw_line(GW/8.80, GH/2, GW/3.40, GH/2);
				str = string(HP) + "/" + string(MAXHP);
				draw_set_halign(fa_right);
				draw_text_transformed(GW/3.40, GH/2.15, str, 1.5, 1.5, 0);
				draw_set_halign(fa_left);
			#endregion
			
				#region ATK
					stats_offset += 35;
					draw_sprite_stretched(sword_blue, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
					draw_text_transformed(GW/8, GH/2.15 + stats_offset, "ATK", 1.5, 1.5, 0);
					draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
					var calc = 0;
					for (var i = 0; i < array_length(Bonuses[BonusType.Damage]); ++i) {
						if (Bonuses[BonusType.Damage][i] != 0) {
						    calc += real(string_replace(string(Bonuses[BonusType.Damage][i]), "1.", ""));
						}
					}
					for (var i = 0; i < array_length(PerkBonuses[BonusType.Damage]); ++i) {
						if (PerkBonuses[BonusType.Damage][i] != 0) {
						    calc += real(string_replace(string(PerkBonuses[BonusType.Damage][i]), "1.", ""));
						}
					}
					str = "+" + string(calc) + "%";
					draw_set_halign(fa_right);
					draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
					draw_set_halign(fa_left);
				#endregion
				
				#region SPD
					stats_offset += 35;
					draw_sprite_stretched(sHudSpdIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
					draw_text_transformed(GW/8, GH/2.15 + stats_offset, "SPD", 1.5, 1.5, 0);
					draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
					calc = 0;
					for (var i = 0; i < array_length(Bonuses[BonusType.Speed]); ++i) {
						if (Bonuses[BonusType.Speed][i] != 0) {
						    calc += real(string_replace(string(Bonuses[BonusType.Speed][i]), "1.", ""));
						}
					}
					for (var i = 0; i < array_length(PerkBonuses[BonusType.Speed]); ++i) {
						if (PerkBonuses[BonusType.Speed][i] != 0) {
						    calc += real(string_replace(string(PerkBonuses[BonusType.Speed][i]), "1.", ""));							
						}
					}
					str = "+" + string(calc) + "%";
					draw_set_halign(fa_right);
					draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
					draw_set_halign(fa_left);
				#endregion
				
				#region CRT
					stats_offset += 35;
					draw_sprite_stretched(sHudCrtIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
					draw_text_transformed(GW/8, GH/2.15 + stats_offset, "CRT", 1.5, 1.5, 0);
					draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
					calc = 0;
					for (var i = 0; i < array_length(Bonuses[BonusType.Critical]); ++i) {
						if (Bonuses[BonusType.Critical][i] != 0) {
						    calc += real(string_replace(string(Bonuses[BonusType.Critical][i]), "1.", ""));
						}
					}
					for (var i = 0; i < array_length(PerkBonuses[BonusType.Critical]); ++i) {
						if (PerkBonuses[BonusType.Critical][i] != 0) {
						    calc += real(string_replace(string(PerkBonuses[BonusType.Critical][i]), "1.", ""));
						}
					}
					str = "+" + string(calc) + "%";
					draw_set_halign(fa_right);
					draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
					draw_set_halign(fa_left);
				#endregion
				
				#region Pickup
					stats_offset += 35;
					draw_sprite_stretched(sHudPickupIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
					draw_text_transformed(GW/8, GH/2.15 + stats_offset, "Pickup", 1.5, 1.5, 0);
					draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
					calc = 0;
					for (var i = 0; i < array_length(Bonuses[BonusType.PickupRange]); ++i) {
						if (Bonuses[BonusType.PickupRange][i] != 0) {
						    calc += real(string_replace(string(Bonuses[BonusType.PickupRange][i]), "1.", ""));
						}
					}
					//for (var i = 0; i < array_length(PerkBonuses[BonusType.PickupRange]); ++i) {
					//	if (PerkBonuses[BonusType.PickupRange][i] != 0) {
					//	    calc += real(string_replace(string(PerkBonuses[BonusType.PickupRange][i]), "1.", ""));
					//	}
					//}//TODO: if there is a pickuprange bonus perk
					str = "+" + string(calc) + "%";
					draw_set_halign(fa_right);
					draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
					draw_set_halign(fa_left);
				#endregion

				#region Haste
					stats_offset += 35;
					draw_sprite_stretched(sHudCooldownIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
					draw_text_transformed(GW/8, GH/2.15 + stats_offset, "Haste", 1.5, 1.5, 0);
					draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
					calc = 0;
					for (var i = 0; i < array_length(Bonuses[BonusType.Haste]); ++i) {
						if (Bonuses[BonusType.Haste][i] != 0) {
						    calc += real(string_replace(string(Bonuses[BonusType.Haste][i]), "1.", ""));
						}
					}
					//for (var i = 0; i < array_length(PerkBonuses[BonusType.Haste]); ++i) {
					//	if (PerkBonuses[BonusType.Haste][i] != 0) {
					//	    calc += real(string_replace(string(PerkBonuses[BonusType.Haste][i]), "1.", ""));
					//	}
					//}//TODO: if there is a Haste bonus perk
					str = "+" + string(calc) + "%";
					draw_set_halign(fa_right);
					draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
					draw_set_halign(fa_center);
				#endregion
				draw_set_halign(fa_left);
			#endregion
	}
#endregion


