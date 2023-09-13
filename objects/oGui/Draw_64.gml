// Feather disable GM1041
#region Start variables
draw_set_alpha(1);
draw_set_color(c_white);
var header;
var digit;
#endregion
#region black screen below gui
if (keyboard_check(vk_alt)) {
	
	//feather disable once GM2017
    //draw_sprite_ext(bgtest, 0, 0, 0, 1, 1, 0, c_white, .8);
    draw_sprite_ext(bgtest264, 0, 0, 0, 1, 1, 0, c_white, .8);
}
if (GoldenANVIL or global.upgrade == 1 or global.gamePaused and room != rInicio and HP > 0) {
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false); // Darken the screen
	draw_set_alpha(1);
}
#endregion
#region Menu room
if (room == rInicio) {
	#region Menu
	if (!global.gamePaused) {
		//mouseOnButton(GW/1.25, GW/6, 55, sHudButton, 1.75, 1.5, menuOptions);
		draw_text_transformed(20,GH-50,"version 0.? remake by Airgeadlamh", 1, 1, 0);
		var offset = 0;
		var thiss=0;
		var scale;
		for (var i = 0; i < array_length(menuOptions); i++) {
		    if (i == selected) { draw_set_color(c_black); thiss = 1; scale = 0.35;}
		    else {draw_set_color(c_white); thiss=0; scale = 0;}
			var menuX = GW/1.25;
			var menuY = GW/6;
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_sprite_ext(sHudButton,thiss,menuX, menuY+offset,1.75+scale, 1.5,0,c_white,1);
			mouse_on_button(menuX, menuY + offset, sHudButton, i, 1.75 + scale, 1.5);
		    draw_text_transformed(
		        menuX,
		        menuY + offset,
		        menuOptions[i],1.85, 1.85,0);
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
if (room == rCharacterSelect or room == rAchievements) {
	#region triangles
	
	#endregion
	#region Lines
	var linesoff = 0;
	if (alarm_get(0) == -1) {
		alarm[0]=1;
	}
	for (var i = 0; i < 130; ++i) {
		draw_sprite_ext(sMenuCharselectBar,0,oGame.linespos+linesoff,display_get_gui_height()+60,1.5,2.15,0,c_white,.25);
		linesoff +=16;
	}	
#endregion
}
if (room == rCharacterSelect) {
	NAME=CHARACTERS[selectedCharacter][?"name"];
	var _isUnlocked = UnlockableCharacters[CHARACTERS[selectedCharacter][?"id"]];
	#region Character window
	var _x = GW / 50;
	var _y = GH / 5.97;
	var _xx = GW / 3.38;
	var _yy = GH / 1.07;
	var _titleY = GH/4.24;
	var _titlePos = 18.50;
	var _fontSize = 2;
	drawWindow(_x,_y,_xx,_yy,string_upper(_isUnlocked ? global.name : ""), _titleY, _titlePos, _fontSize, 0.15);
	draw_sprite_ext(CHARACTERS[_isUnlocked ? selectedCharacter : 0][?"sprite"], sprindex,GW/6.18, GH/1.79, 4, 4, 0,c_white,1);
	drawStatsSelect(CHARACTERS[_isUnlocked ? selectedCharacter : 0]);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_transformed_color(_xx - 105, _yy - 40, $"G. RANK: {Granks[CHARACTERS[_isUnlocked ? selectedCharacter : 0][?"id"]]}", 3, 3, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	#endregion
	#region CharacterList
	if (!characterSelected) {
		str="CHOOSE YOUR IDOL";
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text_transformed(GW/2, 60, str, 4.30, 4.30, 0);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		//draw_text_transformed(GW/3.12, GH/5.82,"MYTH",2,2,0);
		//draw_line(GW/3.12, GH/5, GW/1.46,GH/5);
		offset=0;
		_x = GW/2.81;
		_y = GH/4.59;
		//mouseOnButton(_x,_y, GW/oGui.a, sAmePortrait, 2, 2, array_create(Characters.Lenght, 0),"selectedCharacter", "horizontal");
		for (var i=1; i < Characters.Lenght; i++) {
			if (point_in_rectangle(TouchX1, TouchY1, _x - 44 + offset, _y - 38, _x + 44 + offset, _y + 38)) {
			    selectedCharacter = i;
			}
			draw_rectangle(_x - 44 + offset, _y - 38, _x + 44 + offset, _y + 38, true);
			if (UnlockableCharacters[CHARACTERS[i][?"id"]]) {
			    draw_sprite_ext(CHARACTERS[i][?"portrait"], 0, _x - 2 + offset,_y - 1, 2, 2, 0, c_white, 1);
			}
			if (selectedCharacter == i) {
				draw_sprite_ext(sMenuCharSelectCursor,-1,_x - 2 + offset, _y,2,2,0,c_white,1);
			}
			offset+=92;
		}
	}
	#endregion	
	#region Outfit
	if (selectingOutfit) {
	    _x = GW/3.27;
		_y = 0;
		_xx = GW/1.43;
		_yy = GH;
		draw_set_color(c_black);
		draw_set_alpha(.25);
		draw_rectangle(_x, _y, _xx, _yy, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		str="Outfits";
		_x = GW/2;
		_y = GH/2;
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_sprite_ext(sCharacterselected, 0, _x, _y, 6, 6, 0, c_white, 1);
		draw_text_transformed(_x, _y - (sprite_get_height(sCharacterselected) * 6) / 2, str, 4.50, 4.50, 0);		
		draw_set_halign(fa_left);
		outfitIdleAnimation[1] = sprite_get_number(CHARACTERS[selectedCharacter][?"outfits"][selectedOutfit][$ "sprite"]);
		outfitIdleSpeed = sprite_get_speed(CHARACTERS[selectedCharacter][?"outfits"][selectedOutfit][$ "sprite"]);
		if (outfitIdleAnimation[0] < outfitIdleAnimation[1]) {
			outfitIdleAnimation[0] += outfitIdleSpeed / game_get_speed(gamespeed_fps) * Delta;
		}
		else{ outfitIdleAnimation[0] = 0; }
		var _spr = CHARACTERS[selectedCharacter][?"outfits"][selectedOutfit][$ "sprite"];
		var _isUnlocked = CHARACTERS[selectedCharacter][?"outfits"][selectedOutfit][$ "unlocked"] ? c_white : c_black;
		draw_sprite_ext(_spr, outfitIdleAnimation[0], _x, _y + sprite_get_height(_spr) * 3, 6, 6, 0, _isUnlocked, 1);
	}
	#endregion
	#region Stage
	if (characterSelected and outfitSelected) {
		_x = GW/3.27;
		_y = 0;
		_xx = GW/1.43;
		_yy = GH;
		draw_set_color(c_black);
		draw_set_alpha(.25);
		draw_rectangle(_x, _y, _xx, _yy, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		str="CHOOSE MODE";
		draw_set_halign(fa_center);
		draw_text_transformed(GW/2,GH/22.50,str, 4.50, 4.50, 0);
		draw_set_halign(fa_left);
		_x = GW/2;
		_y = GH/3.14;
		if (!stageSelected) {
			offset = 0;
			draw_set_halign(fa_center);
			for (var i = 0; i < array_length(stageModes); ++i) {
				draw_sprite_ext(sUpgradeBackground, 0, _x, _y + offset, 1.495, 1.35, 0, c_black, .75);
				draw_sprite_ext(sUpgradeBackground, 2, _x, _y - 19 + offset, 1.47, 1, 0, c_white, .75);
				draw_text_transformed(_x, _y - 67 + offset, stageModes[i][$ "name"], 2.50, 2.50, 0);
				draw_text_transformed(_x, _y - 35 + offset, stageModes[i][$ "desc"], 2.5, 2.5, 0);
				if (i == selected) {
					draw_sprite_ext(sUpgradeBackground, 1, _x, _y + offset, 1.49, 1.34, 0, c_white, 1);
				}
			offset += 160;
			}
		}
		if (stageSelected) {
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_transformed(GW/2, GH/3.61, string_upper(stages[0].name), 4, 4, 0);
			draw_sprite_ext(stages[0].port, 0, GW/2, GH/2, 2.30, 2.30, 0 ,c_white, 1);
			draw_sprite_ext(sHudButton, 1, GW/2, GH/1.40, 1, 2, 0, c_white, 1);
			draw_set_color(c_black);
			draw_text_transformed(GW/2, GH/1.40, "GO!", 2, 2, 0);
			draw_set_color(c_white);
		}
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	}
	#endregion
	#region Weapon window
	_x = GW / 1.42;
	_y = GH / 5.95;
	_xx = GW / 1.02;
	_yy = GH / 1.88;
	_titleY = GH/4.22;
	_titlePos = 18;
	_fontSize = 2;
	drawWindow(_x,_y,_xx,_yy,"ATTACK", _titleY, _titlePos, _fontSize);
	if (_isUnlocked) {
		var weaponID = CHARACTERS[selectedCharacter][?"weapon"];
		var weaponSprite = weaponID[1][$ "thumb"];
		draw_sprite_ext(weaponSprite, 0,GW/1.37, GH/3.52,2,2,0,c_white,1);
		draw_set_valign(fa_middle); draw_set_color(c_white);
		draw_text_transformed(_x + 66, _y + 77, lexicon_text("Weapons." + weaponID[1][$ "name"] + ".name"), 2.50, 2.50, 0);
		//drawDesc(GW/1.39, GH/2.97, weaponID[1][$"desc"], GW/4.10, 2);
		drawDesc(_x + 13, _y + 118, lexicon_text("Weapons." + weaponID[1][$ "name"] + ".1") , 350, 2);
	}
	draw_set_valign(0);
	#endregion
	#region Special window
	_x = GW / 1.42;
	_y = GH / 1.88;
	_xx = GW / 1.02;
	_yy = GH / 1.07;
	_titleY = GH/1.67;
	_titlePos = 18;
	_fontSize = 2;
	drawWindow(_x,_y,_xx,_yy,"SPECIAL", _titleY, _titlePos, _fontSize);
	_x = GW/1.37;
	_y = GH/1.55;
	if (_isUnlocked) {
		var specialID = CHARACTERS[selectedCharacter][?"special"];
		var specialSprite = SPECIAL_LIST[specialID][$ "thumb"];
		var specialName = lexicon_text("Special." + SPECIAL_LIST[specialID][$ "name"] + ".name");
		var specialDesc = lexicon_text("Special." + SPECIAL_LIST[specialID][$ "name"] + ".desc");
		draw_sprite_ext(specialSprite, 0,_x - 4 - sprite_get_width(specialSprite), _y-sprite_get_height(specialSprite),2,2,0,c_white,1);
		draw_set_valign(fa_middle); draw_set_color(c_white);
		draw_text_transformed(_x + 38, _y, specialName, 2, 2, 0);
		drawDesc(_x - 19, _y + 35, specialDesc, _x + 1, 2);
	}
	draw_set_valign(0);
	#endregion
}
#endregion
#region Inside Stage
if (instance_exists(oPlayer))
{	
	draw_sprite_stretched(sHolocoin, 0, GW/1.25, GH/25, 55, 55);
	draw_text_transformed(GW/1.18, GH/16.35, string(global.newcoins), 2, 2, 0);
	draw_sprite_stretched(sHuddefeatedEnemies, 0, GW/1.25, GH/9, 55, 55);
	draw_text_transformed(GW/1.18, GH/7.60, string(global.defeatedEnemies), 2, 2, 0);
	#region Character Portrait
	var _x = GW/25.10, _y = GH/10.59;
	var _portraithalf = sprite_get_height(sUiPortraitFrame);
	draw_set_alpha(global.debug ? .5 : 1);
	if (global.showhpui) {
		draw_healthbar(_x + 87, _y - 38, _x + 340, _y - 27, ((HP / MAXHP) * 100), c_red, #8cffbd, #8cffbd, 0, 1, 0);
		draw_healthbar(_x + 87, _y - 40, _x + 340, _y - 27, ((HP / MAXHP) * 100), c_red, #069617, #069617, 0, 1, 0);
		draw_healthbar(_x + 87, _y - 38, _x + 340, _y - 29, ((HP / MAXHP) * 100), c_red, c_lime, c_lime, 0, 1, 0);		
		draw_rectangle_color(_x, _y - _portraithalf, _x + 85, _y - _portraithalf + 15, c_white, c_white, c_white, c_white, false);
		draw_text_transformed_color(_x + 57, _y - _portraithalf - 3, "HP", 2, 1.5, 0, c_black, c_black, c_black, c_black, 1);		
	}		
	draw_sprite_ext(sUiPortraitBg,0, _x, _y, 2,2,0,c_white,1);
	draw_sprite_ext(global.player[?"portrait"],0,_x, _y ,2,2,0,c_white,1);
	draw_sprite_ext(sUiPortraitFrame,0,_x, _y,2,2,0,c_white,1);
	#endregion
	#region Special
	if (global.shopUpgrades[$ "SpecialAtk"][$ "level"] == 1) {
		var _sx = GW/273;
		var _sy = GH/6;
		var casesize = 27;
		var special = SPECIAL_LIST[global.player[?"special"]];
		draw_sprite_ext(sHudSpecial,0, _sx + casesize, _sy, 1, 2, 0, c_white, 1);
		var chargeColor = c_white;
		if (oPlayer.skilltimer > oPlayer.specialcooldown) { chargeColor = c_red; }
		draw_sprite_part_ext(sHudSpecial,2, 0, 0, ((oPlayer.skilltimer / oPlayer.specialcooldown) * sprite_get_width(sHudSpecial)), sprite_get_height(sHudSpecial), _sx + casesize, _sy, 1, 2, chargeColor, 1);
		draw_sprite_ext(sHudSpecial,1, _sx + casesize, _sy, 1, 2, 0, c_white, 1);
		if (oPlayer.skilltimer > oPlayer.specialcooldown) { draw_text(_sx+oGui.a, _sy + casesize, "READY"); }
		//draw_sprite_ext(sHudSpecialCase, 0, _sx, _sy, 2.1, 2.1, 0, c_white, 1);
		draw_sprite_ext(special[$ "thumb"], 0, _sx + 4, _sy, 2, 2, 0, c_white, .5);
		if (global.debug) { draw_text(_sx + 90, _sy + casesize / 2,string(oPlayer.skilltimer) + "/" + string(oPlayer.specialcooldown)); }			
	}
	#endregion
	#region Upgrades
	draw_sprite_ext(sItemsArea, 0, _x + 51, _y - 20, 16.45, 6.65, 0, c_white, 1);
	#region Weapons
	offset=0;
	var yoffset = 0;
	var _itemsx;
	var _itemsy;
	if (global.showhpui) {
		_itemsx = _x + 76;
		_itemsy = _y + 4;
	}
	else{
		_itemsx = GW/12;
		_itemsy = GH/13;
	}
	for (var i = 0; i < array_length(UPGRADES); i++){ //for the size of the upgrade arrays
		draw_sprite_ext(sUiEmptySlotWeapon,0,_itemsx+offset,_itemsy,1.5,1.5,0,c_white,.5); //draw empty slots background
		if (UPGRADES[i]!=global.null){ //if there is a upgrade in the slot		
			var awakened = (UPGRADES[i][$ "level"] < UPGRADES[i][$ "maxlevel"]) ? 0 : 1; //check if weapon is awakened
			draw_sprite_ext(UPGRADES[i][$ "thumb"],awakened,_itemsx+offset,_itemsy,2,2,0,c_white,1); //draw weapon sprite
			if (global.debug) {draw_text(_itemsx+offset, _itemsy-15,string(global.upgradeCooldown[UPGRADES[i][$ "id"]]));}
			switch (UPGRADES[i][$ "type"]){ //detect the type of upgrade
				case "red":{
					header = sUiLevelHeaderPink;
					digit = sUiDigitPink;
					break;}
				case "yellow":{
					header = sUiLevelHeaderYellow;
					digit = sUiDigitYellow;
					break;}
				case "white":{
					header = sUiLevelHeaderWhite;
					digit = sUiDigitWhite;
					break;}
			}
			draw_sprite_ext(header,0,_itemsx+offset,_itemsy,2,2,0,c_white,1); //draw type sprite
			draw_sprite_ext(digit,UPGRADES[i][$ "level"],_itemsx+5+offset,_itemsy,2,2,0,c_white,1); //draw level
		}		
		offset+=50;
	}
	#endregion
	
	#region Items
	offset=0;			
	yoffset = 60;
	for (var i = 0; i < array_length(playerItems); i++){ //for the size of the upgrade arrays
		draw_sprite_ext(sUiEmptySlotItem,0,_itemsx+offset,_itemsy+yoffset,1.5,1.5,0,c_white,.5); //draw empty slots background
		if (playerItems[i]!=global.nullitem) //if there is a upgrade in the slot
		{
			var awakened = (playerItems[i][$ "level"] < 7) ? 0 : 1; //check if weapon is awakened
			draw_sprite_ext(playerItems[i][$ "thumb"],awakened,_itemsx+offset,_itemsy+yoffset,2,2,0,c_white,1); //draw weapon sprite
			if (global.debug) {draw_text(_itemsx+offset, _itemsy-15+yoffset,string(global.itemCooldown[playerItems[i][$ "id"]]));}
			switch (playerItems[i][$ "type"]) //detect the type of upgrade
			{
				case "red":{
					header = sUiLevelHeaderPink;
					digit = sUiDigitPink;
					break;}
				case "yellow":{
					header = sUiLevelHeaderYellow;
					digit = sUiDigitYellow;
					break;}
				case "white":{
					header = sUiLevelHeaderWhite;
					digit = sUiDigitWhite;
					break;}
			}
			draw_sprite_ext(header,0,_itemsx+offset,_itemsy+yoffset,2,2,0,c_white,1); //draw type sprite
			draw_sprite_ext(digit,playerItems[i][$ "level"],_itemsx+5+offset,_itemsy+yoffset,2,2,0,c_white,1); //draw level
		}		
		offset+=50;
	}
	#endregion
	
	#region Perks
	offset=150;
	yoffset = 120;
	for (var i = 0; i < array_length(PLAYER_PERKS); i++){ //for the size of the upgrade arrays
		draw_sprite_ext(sUiEmptySlotItem,0,_itemsx+offset,_itemsy+yoffset,1.5,1.5,0,c_white,.5); //draw empty slots background
		if (PLAYER_PERKS[i]!=global.nullperk){ //if there is a upgrade in the slot
			var activated = PLAYER_PERKS[i][$ "level"] > 0  ? 1 : .5;
			draw_sprite_ext(PLAYER_PERKS[i][$ "thumb"],0,_itemsx+offset,_itemsy+yoffset,2,2,0,c_white, activated); //draw weapon sprite
			if (global.debug) {draw_text(_itemsx+offset, _itemsy-15+yoffset,string(global.perkCooldown[PLAYER_PERKS[i][$ "id"]]));}
			draw_sprite_ext(sUiLevelHeaderPink,0,_itemsx+offset,_itemsy+yoffset,2,2,0,c_white,1); //draw type sprite
			draw_sprite_ext(sUiDigitPink,PLAYER_PERKS[i][$ "level"],_itemsx+5+offset,_itemsy+yoffset,2,2,0,c_white,1); //draw level					        
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
			var _xx = GW/1.55;
			var _yy = GH/4.16;
			var _xscale = 2.06;
			var _yscale = 1.32;
			draw_sprite_ext(sUpgradeBackground, 0, _xx, _yy + offset, _xscale, _yscale, 0, c_black, .75);//upgrade background
			//draw_sprite_ext(sUpgradeBackground, 2, _xx, _yy + 5 + offset, _xscale, _yscale, 0, c_white, .75);//upgrade line for the text
			draw_rectangle(_xx - 365, _yy + offset - 35, _xx + 365, _yy + offset - 34, false);			
			mouse_on_button(_xx, _yy + offset, sUpgradeBackground, i, _xscale / 1.32, _yscale / 2.2);
			if (i == selected) { //if select draw border
				draw_sprite_ext(sUpgradeBackground, 1, _xx, _yy + offset, _xscale, _yscale, 0, c_white, 1);//upgrade background
				draw_sprite_ext(sHoloCursor, holoarrowspr, _xx - 415, _yy + 2 + offset, 2, 2, 0, c_white, 1); 
			} 
			draw_set_halign(fa_left);
			var uptype = "";
			switch (global.upgradeOptions[i][$ "style"]) { // type of upgrade
				case ItemTypes.Weapon:{
					uptype = "Weapons.";
					break;}
				case ItemTypes.Item:{
					uptype = "Items.";
					break;}
				case ItemTypes.Perk:{
					uptype = "Perks.";
					break;}
			}
			var _name = lexicon_text(uptype + string(global.upgradeOptions[i][$ "name"]) + ".name");
			draw_text_transformed(_xx - 348 + guiOffset, _yy - 64 + offset - androidoffset, _name, 2, 2, 0); // draw the name
			var style = ""; 
			switch (global.upgradeOptions[i][$ "style"]) { // type of upgrade
				case ItemTypes.Weapon:{
					style = " >> Weapon";
					break;}
				case ItemTypes.Item:{
					style = " >> Item";
					break;}
				case ItemTypes.Perk:{
					style = " >> Skill";
					break;}
			}
			draw_set_halign(fa_right);
			draw_text_transformed(_xx + 340 - guiOffset, _yy - 64 + offset - androidoffset, string(style), 2, 2, 0);  // draw type of upgrade
			draw_set_halign(fa_left);
			draw_sprite_ext(global.upgradeOptions[i][$ "thumb"],0,_xx - 322 + guiOffset, _yy + 8 + offset,2, 2,0,c_white,1); // item thumb			
			draw_sprite_ext(sItemType, global.upgradeOptions[i][$ "style"], _xx - 322 + guiOffset, _yy + 8 + offset,2, 2,0,c_white,1); // item thumb type
			var foundup = false;
			var foundlv = 0;
			switch (global.upgradeOptions[i][$ "style"]) { // type of upgrade
				case ItemTypes.Item:{
					for (var j = 0; j < array_length(playerItems); ++j) {
						if (playerItems[j][$ "id"] == global.upgradeOptions[i][$ "id"]) {
							foundup = true;
							foundlv = playerItems[j][$ "level"] + 1;
						}
					}	
					break;}
				case ItemTypes.Perk:{
					for (var j = 0; j < array_length(PLAYER_PERKS); ++j) {
						if (PLAYER_PERKS[j][$ "id"] == global.upgradeOptions[i][$ "id"]) {
							foundup = true;
							foundlv = PLAYER_PERKS[j][$ "level"] + 1;
						}
					}	
					break;}
				case ItemTypes.Weapon:{
					for (var j = 0; j < array_length(UPGRADES); ++j) {
						if (UPGRADES[j][$ "name"] == global.upgradeOptions[i][$ "name"]) {
							foundup = true;
							foundlv = UPGRADES[j][$ "level"] + 1;
						}
					}	
					break;}
			}		
			var maxx = 600;
			//if (os_type == os_android) {
			//	maxx = GW/2.50;
			//}else{
			//	maxx = GW/2.07;
			//}	
			var desc = "";
			if (foundup) {
				var idd = global.upgradeOptions[i][$ "id"];
				desc = lexicon_text(uptype + global.upgradeOptions[i][$ "name"] + "." + string(foundlv));
				//draw_text_ext_transformed(GW/2.20+(guiOffset/2) + 5,GH/5.5+offset, lexicon_text(uptype + global.upgradeOptions[i][$"name"] + "." + string(foundlv)), string_width("W"), 327.5, 2,2,0);
			}
			else{
				desc = lexicon_text(uptype + global.upgradeOptions[i][$ "name"] + ".1");
				//draw_text_ext_transformed(GW/2.20+(guiOffset/2) + 5,GH/5.5+offset, lexicon_text(uptype + global.upgradeOptions[i][$"name"] + ".1"), string_width("W"), 327.5, 2,2,0);
			}
			drawDesc(_xx- 230, _yy - 28 + offset, desc , maxx, 2);
			offset += 138;
			draw_set_color(c_white);
		}//feather disable once GM2017
		if (global.shopUpgrades.Reroll.level > 0) {
			var _rerollX = GW/2;
			var _rerollY = GH/1.05;
			draw_sprite_ext(sHudButton, selected == 4 ? 1 : 0, _rerollX, _rerollY, 1.15, 2, 0, c_white, 1);
			var color = selected == 4 ? c_black : c_white;
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_transformed_color(_rerollX, _rerollY, $"Reroll ({global.rerolls})",2,2,0,color, color, color, color, 1);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		}
		#endregion
		drawStats();
	}
	#endregion
	#region Anvil
	if (ANVIL) {
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		_x = GW/1.56;
		_y = GH/5.30;
		draw_text_transformed_color(_x+1, _y+1, "UPGRADE!", 5, 5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(_x-1, _y-1, "UPGRADE!", 5, 5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed(_x, _y, "UPGRADE!", 5, 5, 0);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);			
		#region Weapons		
		var xoffset = 0;
		var anvilIsSelected = 0;
		for (var i = 0; i < array_length(UPGRADES); ++i){
			//if (!anvilconfirm) { mouseOnButton(GW/2.30, GH/3, GW/12, sItemSquare, 2, 2, UPGRADES, "anvilSelected", "horizontal");}
			if (anvilSelectedCategory == 0 and i == anvilSelected){
				anvilIsSelected = 1;
			}else{
				anvilIsSelected = 0;
			}
			draw_sprite_ext(sItemSquare, anvilIsSelected, GW/2.30 + xoffset, GH/3, 2, 2, 0, c_white, 1);
			var _sprHalf = (sprite_get_width(sItemSquare) * 2 ) / 2;
			if (button_click([GW/2.30 - _sprHalf + xoffset, GH/3 - _sprHalf, GW/2.30 + _sprHalf + xoffset, GH/3 + _sprHalf])) {
			    anvilSelected = i;
				anvilSelectedCategory = 0;
			}
			draw_sprite_ext(UPGRADES[i][$ "thumb"], 0, GW/2.30 + xoffset, GH/3, 2, 2, 0, c_white, 1);
			xoffset += GW/12;
		}
		#endregion
		#region Items
		xoffset = 0;
		for (var i = 0; i < array_length(playerItems); ++i){
			//if (!anvilconfirm) { mouseOnButton(GW/2.30, GH/2.30, GW/12, sItemSquare, 2, 2, playerItems, "anvilSelected", "horizontal");}
			if (anvilSelectedCategory == 1 and i == anvilSelected){
				anvilIsSelected = 1;
			}else{
				anvilIsSelected = 0;
			}
			var _alpha = (playerItems[i][$ "level"] < playerItems[i][$ "maxlevel"]) ? 1 : 0.5;
			draw_sprite_ext(sItemSquare, anvilIsSelected, GW/2.30 + xoffset, GH/2.30, 2, 2, 0, c_white, 1);
			var _sprHalf = (sprite_get_width(sItemSquare) * 2 ) / 2;
			if (button_click([GW/2.30 - _sprHalf + xoffset, GH/2.30 - _sprHalf, GW/2.30 + _sprHalf + xoffset, GH/2.30 + _sprHalf])) {
			    anvilSelected = i;
				anvilSelectedCategory = 1;
			}
			draw_sprite_ext(playerItems[i][$ "thumb"], 0, GW/2.30 + xoffset, GH/2.30, 2, 2, 0, c_white, _alpha);
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
		var selectedThing, _name;
		if (anvilSelectedCategory == 0) {
			selectedThing = UPGRADES[anvilSelected];
			_name = lexicon_text("Weapons." + selectedThing[$ "name"] + ".name");
		}else{
			selectedThing = playerItems[anvilSelected];
			_name = lexicon_text("Items." + selectedThing[$ "name"] + ".name");
		}
		var level = selectedThing[$ "level"];
		var maxlevel = selectedThing[$ "maxlevel"];
		draw_set_valign(fa_top);
		draw_text_transformed(_xx - 385, _yy - 59.50 , _name, 1, 1, 0); // draw the name
		draw_set_color(c_yellow);
		if (level < maxlevel) {
			str = string_ext("LV {0} >> LV {1} ", [string(selectedThing[$ "level"]), string(selectedThing[$ "level"] + 1)]);
		}else if (anvilSelectedCategory == 0){
			if (!variable_struct_exists(UPGRADES[anvilSelected], "bonusLevel")) {
				str = "+ 1";
			}
			else{
				str = string("+ {0} >> + {1}", variable_struct_get(UPGRADES[anvilSelected], "bonusLevel"), variable_struct_get(UPGRADES[anvilSelected], "bonusLevel") + 1);
			}					
		}
		if (selectedThing != global.null and selectedThing != global.nullitem and anvilconfirm) {
			draw_text_transformed(_xx - 385 + (string_width(_name) + 20), _yy - 59.50 , str, 1, 1, 0); // draw the name
		}
		draw_set_color(c_white);
		switch (selectedThing[$ "style"]) { // type of upgrade
			case ItemTypes.Weapon:{
				style = " >> Weapon";
				break;}
			case ItemTypes.Item:{
				style = " >> Item";
				break;}
			case ItemTypes.Perk:{
				style = " >> Skill";
				break;}
		}
		draw_set_halign(fa_right);
		draw_text_transformed(_xx + 370, _yy - 59.50, string(style), 1, 1, 0);  // draw type of upgrade
		draw_set_halign(fa_left);
		draw_sprite_ext(selectedThing[$ "thumb"],0, _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb
		draw_sprite_ext(sItemType, selectedThing[$ "style"], _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb type
		if (!anvilconfirm) {
			if (level > maxlevel) {	level -= 1;}
			if (anvilSelectedCategory == 0 and selectedThing != global.null and selectedThing != global.nullitem) {
				drawDesc(_xx - 290,_yy - 35, lexicon_text("Weapons." + selectedThing[$ "name"] + "." + string(level)), GW/2, 2);
			}
			if (anvilSelectedCategory == 1 and selectedThing != global.null and selectedThing != global.nullitem) {
				drawDesc(_xx - 290,_yy - 35, lexicon_text("Items." + selectedThing[$ "name"] + "." + string(level)), GW/2, 2);
			}
		}
		else {
			draw_set_valign(fa_middle);
			if (!upgradeconfirm) {
				var _tx = GW/1.53;
				var _ty = GH/1.31;
				draw_sprite_ext(sHudButton, 1, _tx, _ty, 1.5, 1.5, 0, c_white, 1);
				draw_set_halign(fa_center);
				//draw_set_valign(fa_center);
				draw_text_transformed_color(_tx, _ty, "Upgrade", 2,2,0,c_black,c_black,c_black,c_black, 1);
				draw_set_valign(fa_top);
				draw_set_halign(fa_left);
			}
			else{
				var _tx = GW/1.53;
				var _ty = GH/1.29;
				draw_set_halign(fa_center);
				//draw_set_valign(fa_center);
				var _chance = 100;
				var _coinValue = 0;
				if (variable_struct_exists(selectedThing, "bonusLevel")) {
					for (var i = 0; i < selectedThing[$ "bonusLevel"]; ++i) {
						_coinValue += 50;
						_chance -= 10;
					}
				}
				if (_chance < 10) {_chance=10;}
				draw_set_valign(fa_middle);
				draw_text_transformed_color(_tx, _ty - 40, string("Sucess Rate: {0}%", _chance), 2,2,0,c_white,c_white,c_white,c_white, 1);
				var _confirmstring = string("Cost: {0} to UPGRADE", _coinValue);
				draw_sprite_ext(sHudButton, 1, _tx, _ty, 2, 1.5, 0, c_white, 1);
				draw_text_transformed_color(_tx, _ty, _confirmstring, 2,2,0,c_black,c_black,c_black,c_black, 1);
				draw_set_valign(fa_top);
				draw_set_halign(fa_left);
			}
			level++;
			if (level > maxlevel) {	level -= 1;}
			if (level != maxlevel) {
				if (anvilSelectedCategory == 0 and selectedThing != global.null and selectedThing != global.nullitem) {
					drawDesc(_xx - 290,_yy - 35, lexicon_text("Weapons." + selectedThing[$ "name"] + "." + string(level)), GW/2, 2);
				}	
			}
			else{
				if (anvilSelectedCategory == 0 and selectedThing != global.null and selectedThing != global.nullitem) {
					drawDesc(_xx - 290,_yy - 35, lexicon_text("Anvil.Enhance." + string(oPlayer.blacksmithLevel)), GW/2, 2);
				}	
			}
			if (anvilSelectedCategory == 1 and selectedThing != global.null and selectedThing != global.nullitem) {
				drawDesc(_xx - 290,_yy - 35, lexicon_text("Items." + selectedThing[$ "name"] + "." + string(level)), GW/2, 2);
			}
		}
		#endregion
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		drawStats();
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	}
	#endregion
	#region Golden Anvil
	if (GoldenANVIL) {
		_x = GW/2;
		_y = GH/2;
		var _down = 150;
		var _distance = 90;
		var _offset = 0;
		var _sprHalf = (sprite_get_width(sItemSquare) * 2 ) / 2;
		for (var i = 1; i < array_length(UPGRADES); ++i) {
			var _isSelected = (anvilSelected == i) ? true : false;
		    draw_sprite_ext(sItemSquare, _isSelected, _x + _offset, _y, 2, 2, 0, c_white, 1);
			var _alpha = (gAnvilWeapon1 == UPGRADES[i] or gAnvilWeapon2 == UPGRADES[i]) ? 0.5 : 1;
		    draw_sprite_ext(UPGRADES[i][$ "thumb"], 0, _x + _offset, _y, 2, 2, 0, c_white, _alpha);
			if (button_click([_x - _sprHalf + _offset, _y - _sprHalf, _x + _sprHalf + _offset, _y + _sprHalf])) {
				anvilSelected = i;
				if (gAnvilWeapon1 == global.null and gAnvilWeapon2 != UPGRADES[anvilSelected]) {
				    gAnvilWeapon1 = UPGRADES[anvilSelected];
				    gAnvilWeapon1Position = anvilSelected;
					return;
				}
				if (gAnvilWeapon2 == global.null and gAnvilWeapon1 != UPGRADES[anvilSelected]) {
				    gAnvilWeapon2 = UPGRADES[anvilSelected];
					gAnvilWeapon2Position = anvilSelected;
					return;
				}
			}
			if (i == 3) {
				draw_set_hvaling(fa_center, fa_middle);
			    draw_text_transformed(_x + _offset, _y + _down, "+", 4, 4, 0);
				
				draw_sprite_ext(sItemSquare, 0, _x + _offset - _distance, _y + _down, 2, 2, 0, c_white, 1);
				draw_sprite_ext(gAnvilWeapon1[$ "thumb"], 0, _x + _offset - _distance, _y + _down, 2, 2, 0, c_white, 1);
				if (button_click([_x - _sprHalf + _offset - _distance, _y - _sprHalf + _down, _x + _sprHalf + _offset - _distance, _y + _sprHalf + _down])) {
					gAnvilWeapon1 = global.null;
				}
				
				draw_sprite_ext(sItemSquare, 0, _x + _offset + _distance, _y + _down, 2, 2, 0, c_white, 1);
				draw_sprite_ext(gAnvilWeapon2[$ "thumb"], 0, _x + _offset + _distance, _y + _down, 2, 2, 0, c_white, 1);
				if (button_click([_x - _sprHalf + _offset + _distance, _y - _sprHalf + _down, _x + _sprHalf + _offset + _distance, _y + _sprHalf + _down])) {
					gAnvilWeapon2 = global.null;
				}
				canCollab = false;
				if (is_array(gAnvilWeapon1[$ "collabWith"])) {
				    if (array_contains(gAnvilWeapon1[$ "collabWith"], gAnvilWeapon2[$ "id"])) {
					    canCollab = true;
					}
				}
				else{
					if (gAnvilWeapon1[$ "collabWith"] == gAnvilWeapon2[$ "id"]) {
					    canCollab = true;
					}
				}
				if (canCollab) {
				    draw_sprite_ext(sHudButton, 1, _x + _offset, _y + (_down + 70), 1, 1.5, 0, c_white, 1);
					draw_text_transformed_color(_x + _offset, _y + (_down + 70), "COLLAB!", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
				}
				
				draw_set_reset();
			}
			_offset += 90;
		}
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
		if (variable_struct_exists(Buffs[i],"enabled") and Buffs[i].enabled == true) {
			draw_set_alpha(.5);
			draw_rectangle(_xx - 32, _yy - 32, _xx + 32, _yy + 32, false);
			draw_set_alpha(1);
			draw_sprite_stretched(Buffs[i].icon, 0, _xx - sprite_get_width(Buffs[i].icon), _yy - sprite_get_height(Buffs[i].icon), 35, 35);
			draw_set_color(c_blue);
			if (variable_struct_exists(Buffs[i], "cooldown") and !variable_struct_exists(Buffs[i], "permanent")) {
				draw_text(_xx, _yy+10, string(round(Buffs[i].cooldown)));
			}
			if (variable_struct_exists(Buffs[i], "count")) {
				draw_text(_xx - 25, _yy+10, string(round(Buffs[i].count)));
			}					
			draw_set_color(c_white);
			draw_set_alpha(1);
			_xx += 40;
		}
	}
	#endregion
}
#endregion
#region PauseMenu
if (global.gamePaused and !global.upgrade and !ANVIL and !GoldenANVIL and HP > 0 and !instance_exists(oGameOver)) {
	draw_set_halign(fa_left);
	if (instance_exists(oPlayer) and activeMenu == PMenus.Pause) { drawStats(); }
	var startOption = 0;
	var totaloptions = array_length(pauseMenu[activeMenu][PM.Options]);
	var _scaleoff = 0;
	if (totaloptions > 6) {
		_scaleoff = 3;
	}
	draw_sprite_ext(sMenu, 0, GW/2, GH/2, pauseMenu[activeMenu][PM.XScale] + _scaleoff, pauseMenu[activeMenu][PM.YScale], 0,c_white,1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);		
	draw_text_transformed(GW/2, 
	(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 20,
	pauseMenu[activeMenu][PM.Title], 
	3, 3, 0);
	var mOffset = 0;
	draw_set_valign(fa_middle);
	if (global.debug) {
		draw_text(300, 200,
		"totaloptions = " + string(array_length(pauseMenu[activeMenu][PM.Options])) +
		" \n totalOptionsNow= " + string(totaloptions) +
		" \n startOption= " + string(startOption) +
		" \n selected= " + string(selected) +
		" \n t-s= " + string(totaloptions - startOption) +
		" \n totaloptions = " + string("a")	
		);
	}
	var bigString = 0;
	for (var i = 0; i < array_length(pauseMenu[activeMenu][PM.Options]); ++i) {
		if (string_length(pauseMenu[activeMenu][PM.Options][i])/11 > bigString) {
			bigString = string_length(pauseMenu[activeMenu][PM.Options][i])/11;
		}
	}
	//mouseOnButton(GW/2, (GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90, 45, sHudButton, bigString, 1, array_create(array_length(pauseMenu[activeMenu][PM.Options]),0), "selected");
	for (var i = startOption; i < totaloptions; ++i) {
		var _xoff = 0;
		if (totaloptions > 6) {
			if (i <= 5) {
				_xoff = sprite_get_width(sHudButton) * -1;
			}
			else{
				_xoff = sprite_get_width(sHudButton);
			}
		}
		var spr = (selected == i) ? 1 : 0;
		var _ox = GW/2 + _xoff;
		var _oy = (GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90 + mOffset;
		draw_sprite_ext(sHudButton, spr, _ox, _oy, bigString, 1.35,0,c_white,1);	
		mouse_on_button(_ox, _oy, sHudButton, i, bigString, 1.35);
		var _arrowoff = 160;
		if (editOption and selected == i) {
			draw_sprite_ext(sMenuArrow, 0, GW/2 + _xoff - _arrowoff,
			(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90 + mOffset,
			2,
			2,180,c_white,1);
			draw_sprite_ext(sMenuArrow, 0, GW/2 + _xoff + _arrowoff,
			(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90 + mOffset,
			2,
			2,0,c_white,1);
		}
		draw_set_color(selected == i ? c_black : c_white);
		draw_text_transformed(GW/2 + _xoff,
		(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90 + mOffset,
		pauseMenu[activeMenu][PM.Options][i], 1.5, 1.5, 0);	
		if (activeMenu == PMenus.Settings  and pauseMenu[activeMenu][PM.Bool][i] == true) {
			var boolselected = (selected == i) ? 2 : 0;
			var boolv = (pauseMenu[activeMenu][PM.BoolValue][i]) ? 1 : 0;
			draw_sprite_ext(sToggleButton, boolselected + boolv, GW/1.72 + _xoff, 
			(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90 + mOffset,
			1, 1,0,c_white,1);
		}
		if (i == 5) {
			mOffset=-45;
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
	draw_set_color(c_grey);
	draw_set_alpha(.5);
	draw_set_color(c_white);
	//feather disable once GM2017
	var g = time_source_get_state(oEvents._time_source);
	var variables = ["a","b","c","d","e", "dir", "revives", "event", "g"];
	var boxsize=0;
	for (var i = 0; i < array_length(variables); ++i) {
		boxsize += 20;
	}
	draw_rectangle(5,debugy-5,150,debugy + boxsize,false);
	draw_set_alpha(1);
	for (var i = 0; i < array_length(variables); ++i) {
		if (variable_instance_exists(self,variables[i])) {			
			draw_set_color(c_red);
			draw_text(10,debugy+offset,string(variables[i]) + ": " + string(variable_instance_get(self,variables[i])));
			draw_set_color(c_white);
			offset += 20;
		}		    
	}
}
#endregion	
#region Android Buttons
if (os_type == os_android) 
{
	android_gui_button(zButton);
	android_gui_button(xButton);
	android_gui_button(pButton);
	if (editOption or selectingOutfit) {
		android_gui_button(plusButton);
		android_gui_button(minusButton);
	}
	if (instance_exists(oHouseManager)) {
		android_gui_button(houseButton);
	}
}
#endregion
x = 0;
y = 0;