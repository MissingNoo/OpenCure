// Feather disable GM1041
#region Start variables
draw_set_alpha(1);
draw_set_color(c_white);
var header;
var digit;
#endregion
#region black screen below gui
if (global.upgrade == 1 or global.gamePaused and room != rInicio and HP > 0) {
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false); // Darken the screen
	draw_set_alpha(1)
}
#endregion
#region Menu room
if (room == rInicio) {
	#region Menu
	if (!global.gamePaused) {
		mouseOnButton(GW/1.25, GW/6, 55, sHudButton, 1.75, 1.5, menuOptions);
		draw_text_transformed(20,GH-50,"version DEMO 0.4.11072001 ported by Airgeadlamh", 1, 1, 0);
		var offset = 0;
		var thiss=0;
		var scale;
		for (var i = 0; i < array_length(menuOptions); i++) {
		    if (i == selected) { draw_set_color(c_black); thiss = 1; scale = 0.35;}
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
if (room == rCharacterSelect) {
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
	#region Character window
	var _x = GW / 48.79;
	var _y = GH / 5.95;
	var _xx = GW / 3.36;
	var _yy = GH / 1.07;
	var _titleY = GH/4.24;
	var _titlePos = 18.50;
	var _fontSize = 2;
	drawWindow(_x,_y,_xx,_yy,string_upper(global.name), _titleY, _titlePos, _fontSize, 0.15);
	draw_sprite_ext(CHARACTERS[selectedCharacter][?"sprite"], sprindex,GW/6.18, GH/1.79, 4, 4, 0,c_white,1);
	drawStatsSelect(CHARACTERS[selectedCharacter]);
	#endregion
	#region CharacterList
	if (!characterSelected) {
		str="CHOOSE YOUR IDOL";
		draw_text_transformed((GW/2)- string_width(str),50,str,2,2,0);
		draw_set_color(c_white);
		draw_text_transformed(GW/3.12, GH/5.82,"MYTH",2,2,0);
		draw_line(GW/3.12, GH/5, GW/1.46,GH/5);	
		offset=0;
		_x = GW/2.83;
		_y = GH/3.80;
		mouseOnButton(_x,_y, GW/13, sAmePortrait, 2.20, 2.20, array_create(Characters.Lenght, 0),"selectedCharacter", "horizontal");
		for (var i=0; i < Characters.Lenght; i++) {
			draw_sprite_ext(CHARACTERS[i][?"portrait"],0,_x + offset,_y,2.20,2.20,0,c_white,1);
			if (selectedCharacter == i) {
				draw_sprite_ext(sMenuCharSelectCursor,-1,_x + offset, _y,2.20,2.20,0,c_white,1);
			}
			offset+=GW/13;
		}
	}
	#endregion	
	#region Stage
	if (characterSelected) {
		_x = GW/3.27;
		_y = 0;
		_xx = GW/1.43;
		_yy = GH;
		draw_set_color(c_black);
		draw_set_alpha(.55);
		draw_rectangle(_x, _y, _xx, _yy, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		str="CHOOSE MODE";
		draw_set_halign(fa_center);
		draw_text_transformed(GW/2,50,str,4,4,0);
		draw_set_halign(fa_left);
		_x = GW/2;
		_y = GH/2.35;
		if (!stageSelected) {
			offset = 0;
			draw_set_halign(fa_center);
			for (var i = 0; i < array_length(stageModes); ++i) {
				draw_sprite_ext(sUpgradeBackground, 0, _x, _y + offset, 1.55, 1.35, 0, c_black, .75);
				draw_sprite_ext(sUpgradeBackground, 2, _x, _y + 5 + offset, 1.55, 1.35, 0, c_white, .75);
				draw_text(_x, _y - 61 + offset, stageModes[i]);
				draw_text_ext_transformed(_x, _y - 40 + offset, modesDescription[i], 11, 160, 3,3 ,0);
				if (i = selected) {
					draw_sprite_ext(sUpgradeBackground, 1, _x, _y + offset, 1.55, 1.35, 0, c_white, 1);
				}
			offset += 170;
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
	var weaponID = CHARACTERS[selectedCharacter][?"weapon"];
	var weaponSprite = weaponID[1][$"thumb"];
	draw_sprite_ext(weaponSprite, 0,GW/1.37, GH/3.52,2,2,0,c_white,1);
	draw_set_valign(fa_middle); draw_set_color(c_white);
	draw_text_transformed(GW/1.32, GH/3.52, weaponID[1][$"name"], 2, 2, 0);
	//drawDesc(GW/1.39, GH/2.97, weaponID[1][$"desc"], GW/4.10, 2);
	drawDesc(GW/1.39, GH/2.97, lexicon_text("Weapons." + weaponID[1][$"name"] + ".1") , GW/4.10, 2);
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
	var specialID = CHARACTERS[selectedCharacter][?"special"];
	var specialSprite = SPECIAL_LIST[specialID][$"thumb"];
	var specialName = SPECIAL_LIST[specialID][$"name"];
	var specialDesc = SPECIAL_LIST[specialID][$"desc"];
	draw_sprite_ext(specialSprite, 0,_x-sprite_get_width(specialSprite), _y-sprite_get_height(specialSprite),2,2,0,c_white,1);
	draw_set_valign(fa_middle); draw_set_color(c_white);
	draw_text_transformed(_x + 38, _y, specialName, 2, 2, 0);
	drawDesc(_x-18.50, _y + 42, specialDesc, GW/4.10, 2);
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
	var _portraitx = GW/30, _portraity = GH/10;
	var _portraithalf = sprite_get_height(sUiPortraitFrame);
	if (global.showhpui) {
		draw_rectangle_color(_portraitx, _portraity - _portraithalf, _portraitx + 85, _portraity - _portraithalf + 15, c_white, c_white, c_white, c_white, false);		
		draw_text_transformed_color(GW/14, GH/20, "HP", 2, 1.5, 0, c_black, c_black, c_black, c_black, 1);		
	}		
	draw_sprite_ext(sUiPortraitBg,0, _portraitx, _portraity, 2,2,0,c_white,1);
	draw_sprite_ext(global.player[?"portrait"],0,_portraitx, _portraity,2,2,0,c_white,1);
	draw_sprite_ext(sUiPortraitFrame,0,_portraitx, _portraity,2,2,0,c_white,1);
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
		draw_sprite_ext(special[$"thumb"], 0, _sx + 4, _sy, 2, 2, 0, c_white, .5);
		if (global.debug) { draw_text(_sx + 90, _sy + casesize / 2,string(oPlayer.skilltimer) + "/" + string(oPlayer.specialcooldown)); }			
	}
	#endregion
	#region Upgrades
	#region Weapons
	offset=0;
	var yoffset = 0;
	var _itemsx;
	var _itemsy;
	if (global.showhpui) {
		_itemsx = GW/11;
		_itemsy = GH/9;
	}
	else{
		_itemsx = GW/12;
		_itemsy = GH/13;
	}
	for (var i = 0; i < array_length(UPGRADES); i++){ //for the size of the upgrade arrays
		draw_sprite_ext(sUiEmptySlotWeapon,0,_itemsx+offset,_itemsy,1.5,1.5,0,c_white,.5); //draw empty slots background
		if (UPGRADES[i]!=global.null){ //if there is a upgrade in the slot		
			var awakened = (UPGRADES[i][$"level"] < UPGRADES[i][$"maxlevel"]) ? 0 : 1; //check if weapon is awakened
			draw_sprite_ext(UPGRADES[i][$ "thumb"],awakened,_itemsx+offset,_itemsy,2,2,0,c_white,1); //draw weapon sprite
			if (global.debug) {draw_text(_itemsx+offset, _itemsy-15,string(global.upgradeCooldown[UPGRADES[i][$"id"]]));}
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
			var awakened = (playerItems[i][$"level"] < 7) ? 0 : 1; //check if weapon is awakened
			draw_sprite_ext(playerItems[i][$ "thumb"],awakened,_itemsx+offset,_itemsy+yoffset,2,2,0,c_white,1); //draw weapon sprite
			if (global.debug) {draw_text(_itemsx+offset, _itemsy-15+yoffset,string(global.itemCooldown[playerItems[i][$"id"]]));}
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
			var activated = PLAYER_PERKS[i][$"level"] > 0  ? 1 : .5;
			draw_sprite_ext(PLAYER_PERKS[i][$ "thumb"],0,_itemsx+offset,_itemsy+yoffset,2,2,0,c_white, activated); //draw weapon sprite
			if (global.debug) {draw_text(_itemsx+offset, _itemsy-15+yoffset,string(global.perkCooldown[PLAYER_PERKS[i][$"id"]]));}
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
			var _xx = GW/1.52;
			var _yy = GH/4.5;
			mouseOnButton(_xx, _yy, GH/5.30, sUpgradeBackground, 2.1/1.30, 1.25/2, global.upgradeOptions);
			draw_sprite_ext(sUpgradeBackground, 0, _xx, _yy + offset, 2.10, 1.25, 0, c_black, .75);//upgrade background
			draw_sprite_ext(sUpgradeBackground, 2, _xx, _yy + 5 + offset, 2.10, 1.25, 0, c_white, .75);//upgrade line for the text
			if (i = selected) { //if select draw border
				draw_sprite_ext(sUpgradeBackground, 1, _xx, _yy + offset, 2.10, 1.25, 0, c_white, 1); 
				draw_sprite_ext(sHoloCursor, holoarrowspr, _xx - 440, _yy + offset, 2.5, 2.5, 0, c_white, 1); 
			} 
			draw_set_halign(fa_left);
			var uptype = "";
			switch (global.upgradeOptions[i][$"style"]) { // type of upgrade
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
			var _name = lexicon_text(uptype + string(global.upgradeOptions[i][$"name"]) + ".name");
			draw_text_transformed(GW/2.60 + guiOffset, GH/6.65 + offset - androidoffset, _name, 1.5, 1.5, 0); // draw the name
			var style = ""; 
			switch (global.upgradeOptions[i][$"style"]) { // type of upgrade
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
			draw_text_transformed(GW/1.08 - guiOffset, GH/6.65 + offset - androidoffset, string(style), 1.5, 1.5, 0);  // draw type of upgrade
			draw_set_halign(fa_left);
			draw_sprite_ext(global.upgradeOptions[i][$ "thumb"],0,GW/2.45 + guiOffset, _yy + offset,2, 2,0,c_white,1); // item thumb			
			draw_sprite_ext(sItemType, global.upgradeOptions[i][$"style"], GW/2.45 + guiOffset, _yy + offset,2, 2,0,c_white,1); // item thumb type
			var foundup = false;
			var foundlv = 0;
			for (var j = 0; j < array_length(UPGRADES); ++j) {
				if (UPGRADES[j][$"name"] == global.upgradeOptions[i][$"name"]) {
					foundup = true;
					foundlv = UPGRADES[j][$"level"] + 1;
				}
			}			
			var maxx = 0;
			if (os_type == os_android) {
				maxx = GW/2.50;
			}else{
				maxx = GW/2.07;
			}	
			if (foundup) {
				var idd = global.upgradeOptions[i][$"id"];
				draw_text_ext_transformed(GW/2.20+(guiOffset/2) + 5,GH/5.5+offset, lexicon_text(uptype + global.upgradeOptions[i][$"name"] + "." + string(foundlv)), string_width("W"), 327.5, 2,2,0);
			}
			else{
				draw_text_ext_transformed(GW/2.20+(guiOffset/2) + 5,GH/5.5+offset, lexicon_text(uptype + global.upgradeOptions[i][$"name"] + ".1"), string_width("W"), 327.5, 2,2,0);
			}
			offset += GH/5.30;
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
		var _x = GW/1.56;
		var _y = GH/5.30;
		draw_text_transformed_color(_x+1, _y+1, "UPGRADE!", 5, 5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(_x-1, _y-1, "UPGRADE!", 5, 5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed(_x, _y, "UPGRADE!", 5, 5, 0);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);			
		#region Weapons
		for (var i = 0; i < array_length(UPGRADES); ++i) {
			if (!anvilconfirm) { mouseOnButton(GW/2.30 + (GW/12 * i), GH/3, GW/17.50, sItemSquare, 2, 2, array_create(2,0), "anvilSelectedCategory");}
		}
		
		var xoffset = 0;
		var anvilIsSelected = 0;
		for (var i = 0; i < array_length(UPGRADES); ++i){
			if (!anvilconfirm) { mouseOnButton(GW/2.30, GH/3, GW/12, sItemSquare, 2, 2, UPGRADES, "anvilSelected", "horizontal");}
			if (anvilSelectedCategory == 0 and i == anvilSelected){
				anvilIsSelected = 1
			}else{
				anvilIsSelected = 0;
			}
			draw_sprite_ext(sItemSquare, anvilIsSelected, GW/2.30 + xoffset, GH/3, 2, 2, 0, c_white, 1);
			draw_sprite_ext(UPGRADES[i][$"thumb"], 0, GW/2.30 + xoffset, GH/3, 2, 2, 0, c_white, 1);
			xoffset += GW/12;
		}
		#endregion
		#region Items
		xoffset = 0;
		for (var i = 0; i < array_length(playerItems); ++i){
			if (!anvilconfirm) { mouseOnButton(GW/2.30, GH/2.30, GW/12, sItemSquare, 2, 2, playerItems, "anvilSelected", "horizontal");}
			if (anvilSelectedCategory == 1 and i == anvilSelected){
				anvilIsSelected = 1;
			}else{
				anvilIsSelected = 0;
			}
			var _alpha = (playerItems[i][$"level"] < playerItems[i][$"maxlevel"]) ? 1 : 0.5;
			draw_sprite_ext(sItemSquare, anvilIsSelected, GW/2.30 + xoffset, GH/2.30, 2, 2, 0, c_white, 1);
			draw_sprite_ext(playerItems[i][$"thumb"], 0, GW/2.30 + xoffset, GH/2.30, 2, 2, 0, c_white, _alpha);
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
			_name = lexicon_text("Weapons." + selectedThing[$"name"] + ".name");
		}else{
			selectedThing = playerItems[anvilSelected];
			_name = lexicon_text("Items." + selectedThing[$"name"] + ".name");
		}
		var level = selectedThing[$"level"];
		var maxlevel = selectedThing[$"maxlevel"];
		draw_text_transformed(_xx - 385, _yy - 59.50 , _name, 1, 1, 0); // draw the name
		draw_set_color(c_yellow);
		if (level < maxlevel) {
			str = string_ext("LV {0} >> LV {1} ", [string(selectedThing[$"level"]), string(selectedThing[$"level"] + 1)]);
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
		switch (selectedThing[$"style"]) { // type of upgrade
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
		draw_sprite_ext(sItemType, selectedThing[$"style"], _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb type
		if (!anvilconfirm) {
			if (level > maxlevel) {	level -= 1	}
			if (anvilSelectedCategory == 0 and selectedThing != global.null and selectedThing != global.nullitem) {
				drawDesc(_xx - 290,_yy - 35, lexicon_text("Weapons." + selectedThing[$"name"] + "." + string(level)), GW/2, 2);
			}
			if (anvilSelectedCategory == 1 and selectedThing != global.null and selectedThing != global.nullitem) {
				drawDesc(_xx - 290,_yy - 35, lexicon_text("Items." + selectedThing[$"name"] + "." + string(level)), GW/2, 2);
			}
		}
		else {
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
					for (var i = 0; i < selectedThing[$"bonusLevel"]; ++i) {
						_coinValue += 50;
						_chance -= 10;
					}
				}
				if (_chance < 10) {_chance=10;}
				draw_text_transformed_color(_tx, _ty - 40, string("Sucess Rate: {0}%", _chance), 2,2,0,c_white,c_white,c_white,c_white, 1);
				var _confirmstring = string("Cost: {0} to UPGRADE", _coinValue);
				draw_sprite_ext(sHudButton, 1, _tx, _ty, 2, 1.5, 0, c_white, 1);
				draw_text_transformed_color(_tx, _ty, _confirmstring, 2,2,0,c_black,c_black,c_black,c_black, 1);
				draw_set_valign(fa_top);
				draw_set_halign(fa_left);
			}
			level++;
			if (level > maxlevel) {	level -= 1	}
			if (level != maxlevel) {
				if (anvilSelectedCategory == 0 and selectedThing != global.null and selectedThing != global.nullitem) {
					drawDesc(_xx - 290,_yy - 35, lexicon_text("Weapons." + selectedThing[$"name"] + "." + string(level)), GW/2, 2);
				}	
			}
			else{
				if (anvilSelectedCategory == 0 and selectedThing != global.null and selectedThing != global.nullitem) {
					drawDesc(_xx - 290,_yy - 35, lexicon_text("Anvil.Enhance." + string(oPlayer.blacksmithLevel)), GW/2, 2);
				}	
			}
			if (anvilSelectedCategory == 1 and selectedThing != global.null and selectedThing != global.nullitem) {
				drawDesc(_xx - 290,_yy - 35, lexicon_text("Items." + selectedThing[$"name"] + "." + string(level)), GW/2, 2);
			}
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
if (global.gamePaused and !global.upgrade and !ANVIL and HP > 0 and !instance_exists(oGameOver)) {
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
	mouseOnButton(GW/2, (GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90, 45, sHudButton, bigString, 1, array_create(array_length(pauseMenu[activeMenu][PM.Options]),0), "selected");
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
		draw_sprite_ext(sHudButton, spr, GW/2 + _xoff,
		(GH/2 - (sprite_get_height(sMenu) * pauseMenu[activeMenu][PM.YScale])/2) + 90 + mOffset,
		bigString,
		1.35,0,c_white,1);
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
	if (editOption) {
		android_gui_button(plusButton);
		android_gui_button(minusButton);
	}
	if (instance_exists(oHouseManager)) {
		android_gui_button(houseButton);
	}
}
#endregion