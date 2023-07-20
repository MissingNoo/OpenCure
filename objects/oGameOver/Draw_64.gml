// Feather disable GM1041
#region Background	
	draw_set_color(c_black);
	draw_set_alpha(image_alpha);
	draw_rectangle(0, 0, GW, GH, false);
	draw_set_alpha(1);
	draw_set_color(c_white)
#endregion

#region Text
	#region Game Over
		draw_set_halign(fa_center);
		draw_text_transformed(GW/2, GH/3.75, "GAME OVER", 4.30, 4.30, 0);
	#endregion
	
	#region Score
		draw_text_transformed(GW/2, GH/2.65, "Score: ", 2, 2, 0);
	#endregion
	
	#region Holocoins
		draw_set_color(c_yellow);
		draw_text_transformed(GW/2, GH/2.30, "HoloCoins Gained: " + string(global.newcoins), 2.25, 2.25, 0);
		draw_set_color(c_white);
	#endregion	
#endregion

#region Buttons
	mouseOnButton(GW/2, GH/1.79, 75, sHudButton, 2.05, 2.10, options, "selectedOption", "vertical");
	draw_set_valign(fa_middle);
	var offset = 0, isSelected, xScale, textcolor;
	for (var i = 0; i < array_length(options); ++i) {
		if (i == selectedOption) {
		    isSelected = 1;
			xScale = 2.10;
			textcolor = c_black;
		}
		else{
			isSelected = 0;
			xScale = 1.80;
			textcolor = c_white;
		}
		var _x = GW/2;
		var _y = GH/1.79 + offset
	    draw_sprite_ext(sHudButton, isSelected, _x, _y, xScale, 2.10, 0, c_white, 1);
		draw_set_color(textcolor);
		draw_text_transformed(_x, _y, options[i], 2.05, 2.05, 0);
		draw_set_color(c_white);
		offset += 75;
}
#endregion
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);