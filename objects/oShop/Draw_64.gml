#region AChan
if (!variable_instance_exists(self, "achansubimage")) {
   achansubimage = 0; // code here
}
if (achansubimage < 20) {
    achansubimage += 7.10/game_get_speed(gamespeed_fps);
}
else{achansubimage = 0;}
draw_sprite_stretched(sAChan, achansubimage, GW/-9, GH/46, 850, 850);
#endregion

#region Holocoins
if (!variable_instance_exists(self, "holocoinsubimage")) {
   holocoinsubimage= 0;
}
if (holocoinsubimage < 8) {
    holocoinsubimage += 12/game_get_speed(gamespeed_fps);
}
else{holocoinsubimage = 0;}
var _x = GW/1.16;
var _y = GH/13.10;
draw_sprite_ext(sHolocoin, holocoinsubimage, _x - 195, _y, 4, 4, 0, c_white, 1);
draw_sprite_ext(sHudButton, 0, _x, _y, 1.72, 1.8, 0, c_white, 1);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text_transformed(_x + 138 - oGui.guiOffset, _y - 3, global.holocoins, 5, 5, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
#endregion

#region Menu
if (onMenu) {
	var _yoffset = 0;
	_x = GW/1.42;
	_y = GH/2.36;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    for (var i = 0; i < array_length(menuOptions); ++i) {
		var _size = (optionSelected == i) ? 2 : 1.80;
		var _spr = (optionSelected == i) ? 1 : 0;
		draw_set_color((optionSelected == i) ? c_black : c_white);
	    draw_sprite_ext(sHudButton, _spr, _x, _y + _yoffset, _size, 1.80, 0, c_white, 1);
		draw_text_transformed(_x, _y + _yoffset, lexicon_text("ShopMenu." + menuOptions[i]), 2, 2, 0);
		_yoffset += 66;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
#endregion

if (!onMenu) {
	switch (optionSelected) {
		case 0:{//gacha
			_x = GW/1.45;
			_y = GH/2.47;
			draw_sprite_ext(gachas[selectedGacha][$"sprite"], 0, _x, _y, 2, 2, 0, c_white, 1);
			_y += 265;
			draw_sprite_ext(sHudShopNew, 0, _x - 5, _y, 32, 6.60, 0, c_white, 1);
			draw_rectangle(_x - 371, _y - 38, _x + 358 , _y - 37, false);
			draw_text_transformed(_x - 353, _y - 71, gachas[selectedGacha][$"name"], 2.50, 2.50, 0);
			draw_set_halign(fa_right);
			draw_text_transformed_color(_x + 359, _y + 26, string($"Cost: {gachas[selectedGacha][$"cost"]}"), 2.50, 2.50, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_halign(fa_left);
			if (gachaInteract) {
				draw_set_valign(fa_middle);
				draw_set_halign(fa_center);
			    draw_sprite_ext(sHudButton, (gachaButton == 0) ? 1 : 0, _x - 102, _y + 103, (gachaButton == 0) ? 1 : 0.8, (gachaButton == 0) ? 2 : 1.30, 0, c_white, 1);
			    draw_sprite_ext(sHudButton, (gachaButton == 1) ? 1 : 0, _x + 102, _y + 103, (gachaButton == 1) ? 1 : 0.8, (gachaButton == 1) ? 2 : 1.30, 0, c_white, 1);
				var _color = (gachaButton == 0) ? c_black : c_white;
				draw_text_transformed_color(_x - 102, _y + 103, gachaInteractButtons[0], 2, 2, 0, _color, _color, _color, _color, 1);
				_color = (gachaButton == 1) ? c_black : c_white;
				draw_text_transformed_color(_x + 102, _y + 103, gachaInteractButtons[1], 2, 2, 0, _color, _color, _color, _color, 1);
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
			}
			if (gachaDebut) {
				draw_set_alpha(0.80);
			    draw_rectangle_color(0, 0, GW, GH, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_sprite_ext(sGachaLogo, 0, GW/2, GH/2, 2, 2, 0, c_white, 1);
				_x = GW/2;
				_y = GH/1.20;
				draw_sprite_ext(sHudButton, 1, _x, _y, 1, 2, 0, c_white, 1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_text_transformed_color(_x, _y, "DEBUT!", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
			}
			if (gachaPrize) {
				draw_set_alpha(0.80);
			    draw_rectangle_color(0, 0, GW, GH, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				_x = GW/2;
				_y = GH/5.95;
				draw_text_transformed_color(_x, _y, "CONGRATULATIONS!", 5, 5, 0, c_white, c_white, c_white, c_white, 1);
				_y = GH/1.28;
				var _name = CHARACTERS[gotPrize[$"character"]][?"name"]
				draw_text_transformed_color(_x, _y, $"{string_upper(_name)} RANK UP!!!", 5, 5, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
				if (isOutfit) {
				    draw_text_transformed_color(_x, _y + 75, "OUTFIT GET!!!", 5, 5, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
				}
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				if (prizeIdleAnimation[0] < prizeIdleAnimation[1]) {
				    prizeIdleAnimation[0] += prizeIdleSpeed / game_get_speed(gamespeed_fps) * Delta;
				}
				else{ prizeIdleAnimation[0] = 0; }
				var _spr = CHARACTERS[gotPrize[$"character"]][?"sprite"];
				if (isOutfit) {
					_spr = CHARACTERS[gotPrize[$"character"]][?"outfits"][outfitPrizeNumber][$"sprite"];   
				}				
			    draw_sprite_ext(_spr, prizeIdleAnimation[0], GW/2, GH/2 + (sprite_get_height(_spr) * 2), 6, 6, 0, c_white, 1);
			}
			break;}
			
	    case 1:{ //shop
			draw_text(GW/2, GH/2, string(array_length(variable_struct_get_names(global.shopUpgrades))));
			hoffset = 0;
			voffset = 0;
			var ups = variable_struct_get_names(global.shopUpgrades);
			draw_set_color(c_black);
			draw_set_alpha(.5);
			draw_rectangle(GW/2.45, GH/7.75, GW/1.05, GH/1.50, false);
			for (var i = 0; i < array_length(ups); ++i) {
				//show_message(string(global.shopUpgrades[$ ups[i]]));	
				draw_set_alpha(.5);
				draw_rectangle(GW/2.35 + hoffset, GH/5.95 + voffset, GW/2.08 + hoffset, GH/3.70 + voffset, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
				draw_sprite_ext(sShopIcon,0,GW/2.35 + hoffset, GH/6 + voffset, 2.1, 2.1, 0, c_white, 1);
				if (i == selected) {
				    draw_sprite_ext(sShopIconSelected,0,GW/2.35 + hoffset, GH/6 + voffset, 2.1, 2.1, 0, c_white, 1);
				}
				draw_sprite_ext(global.shopUpgrades[$ ups[i]][$ "sprite"],0,GW/2.20 + hoffset, GH/4.55 + voffset, 2, 2, 0, c_white, 1);
				draw_set_color(c_black);
				draw_text(GW/2.35 + hoffset, GH/3.60 + voffset, "LV:" + string(global.shopUpgrades[$ ups[i]][$ "level"]) + "/" + string(global.shopUpgrades[$ ups[i]][$ "maxlevel"]));
				if (hoffset >= GW/2.60) {
				    hoffset = -102.5;
					voffset += GH/6;
				}
				hoffset += 102.5;
				draw_set_color(c_white);
			}
			#region Item Info
			var _xx = GW/1.45;
			var _yy = GH/1.35;
			draw_sprite_ext(sUpgradeBackground, 0, _xx, _yy, 2.10, 1.25, 0, c_black, .75);//upgrade background
			draw_sprite_ext(sUpgradeBackground, 2, _xx, _yy, 2.10, 1.25, 0, c_white, .75);//upgrade line for the text
			draw_sprite_ext(sUpgradeBackground, 1, _xx, _yy, 2.10, 1.25, 0, c_white, 1); 
			var names = variable_struct_get_names(global.shopUpgrades);
			selectedThing = global.shopUpgrades[$ names[selected]];
			draw_text_transformed(_xx - 385, _yy - 59.50 , string(selectedThing[?"name"]), 1, 1, 0); // draw the name
			draw_sprite_ext(selectedThing[$ "sprite"],0, _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb
			draw_sprite_ext(sItemType, 0, _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb type	
			drawDesc(_xx - 290,_yy - 35, selectedThing[$ "desc"], GW/2 - oGui.guiOffset, 2);
			//feather disable once GM2017
			var LEVEL = selectedThing[$ "level"];
			//feather disable once GM2017
			var MAXLEVEL = selectedThing[$ "maxlevel"];
			draw_set_color(c_yellow);
			draw_set_halign(fa_right);
			//feather disable once GM2017
			if (LEVEL < MAXLEVEL) {
				draw_text_transformed(GW/1.05, GH/1.28, "Cost: " + string(selectedThing[$ "costs"][selectedThing[$ "level"]]), 2, 2, 0);	
			}
			else{
				draw_text_transformed(GW/1.05, GH/1.28, "SOLD OUT!", 2, 2, 0);	
			}
			draw_set_halign(fa_left);
			draw_set_color(c_white);
			#endregion
			if (interact) {
				draw_set_color(interactSelected == 0 ? c_black : c_white);
			    draw_sprite(sHudButton, interactSelected == 0 ? 1 : 0, GW/1.70, GH/1.15);
				draw_set_halign(fa_center);
				draw_text(GW/1.70, GH/1.15, "Buy");
				draw_set_color(interactSelected == 1 ? c_black : c_white);
				draw_sprite(sHudButton, interactSelected == 1 ? 1 : 0, GW/1.30, GH/1.15);
				draw_text(GW/1.30, GH/1.15, "Refund");
				draw_set_halign(fa_left);
			}
	        break;}
	}
}
