// Feather disable GM2016
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

draw_sprite_ext(sHolocoin, holocoinsubimage, GW/1.41, GH/19.70, 3.30, 3.30, 0, c_white, 1);
draw_sprite_ext(sHudButton, 0, GW/1.16, GH/19.70, 2, 2, 0, c_white, 1);
draw_set_halign(fa_right);
draw_text_transformed(GW/1.01 - oGui.guiOffset, GH/48, global.holocoins, 4.30, 4.30, 0);
draw_set_halign(fa_left);
#endregion

#region shop items
draw_text(GW/2, GH/2, string(array_length(variable_struct_get_names(global.ShopUpgrades))));
hoffset = 0;
voffset = 0;
var ups = variable_struct_get_names(global.ShopUpgrades);
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(GW/2.45, GH/7.75, GW/1.05, GH/1.50, false);
for (var i = 0; i < array_length(ups); ++i) {
	//show_message(string(global.ShopUpgrades[$ ups[i]]));	
	draw_set_alpha(.5);
	draw_rectangle(GW/2.35 + hoffset, GH/5.95 + voffset, GW/2.08 + hoffset, GH/3.70 + voffset, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_sprite_ext(sShopIcon,0,GW/2.35 + hoffset, GH/6 + voffset, 2.1, 2.1, 0, c_white, 1);
	if (i == selected) {
	    draw_sprite_ext(sShopIconSelected,0,GW/2.35 + hoffset, GH/6 + voffset, 2.1, 2.1, 0, c_white, 1);
	}
	draw_sprite_ext(global.ShopUpgrades[$ ups[i]][$ "sprite"],0,GW/2.20 + hoffset, GH/4.55 + voffset, 2, 2, 0, c_white, 1);
	draw_set_color(c_black);
	draw_text(GW/2.35 + hoffset, GH/3.60 + voffset, "LV:" + string(global.ShopUpgrades[$ ups[i]][$ "level"]) + "/" + string(global.ShopUpgrades[$ ups[i]][$ "maxlevel"]));
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
				var names = variable_struct_get_names(global.ShopUpgrades);
				selectedThing = global.ShopUpgrades[$ names[selected]];
				draw_text_transformed(_xx - 385, _yy - 59.50 , string(selectedThing[?"name"]), 1, 1, 0); // draw the name
				draw_sprite_ext(selectedThing[$ "sprite"],0, _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb
				draw_sprite_ext(sItemType, 0, _xx - 350, _yy, 2, 2,0,c_white,1); // item thumb type	
				drawDesc(_xx - 290,_yy - 35, selectedThing[$ "desc"], GW/2 - oGui.guiOffset, 2);
				LEVEL = selectedThing[$ "level"];
				MAXLEVEL = selectedThing[$ "maxlevel"];
				draw_set_color(c_yellow);
				draw_set_halign(fa_right);
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
#endregion