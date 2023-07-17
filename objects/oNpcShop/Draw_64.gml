var _yoff = 0;
for (var i = 0; i < array_length(shopOptions); ++i) {
	var _spr = selectedOption == i ? 1 : 0;
	var _color = selectedOption == i ? c_black : c_white;
    draw_sprite_ext(sHudButton, _spr, GW/6.76, GH/9.15 + 35 + _yoff, 1.5, 2, 0, c_white, 1);
	draw_set_color(_color);
	var _option = "";
	switch (shopOptions[i]) {
	    case ShopOption.Buy:
	        _option = lexicon_text("ShopOptions.Buy");
	        break;
	    case ShopOption.Sell:
	        _option = lexicon_text("ShopOptions.Sell");
	        break;
	    case ShopOption.Talk:
	        _option = lexicon_text("ShopOptions.Talk");
	        break;
	    case ShopOption.Quit:
	        _option = lexicon_text("ShopOptions.Quit");
	        break;
	}
	draw_text_transformed(GW/6.76, GH/9.15+35+_yoff, _option, 2,2,0);
	draw_set_color(c_white);
	_yoff += 75;
}
//idk
draw_sprite_ext(sHudArea, 0, GW/1.20, GH/21.34, 8, 2, 0, c_white, 1);
//coins
draw_sprite_ext(sHudArea, 0, GW/1.20 - 250, GH/21.34, 8, 2, 0, c_white, 1);
draw_sprite_ext(sHolocoin, 0, GW/1.20 -250 + 30, GH/21.34 + 18, 2, 2, 0, c_white, 1);
draw_set_valign(fa_center);
draw_set_halign(fa_right);
draw_text_transformed(GW/1.20 - 250 + 185, GH/21.34 + 16, global.holocoins, 3, 3, 0);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if (!optionConfirmed) { return; }
#region Shop Area
draw_sprite_ext(sHudShopArea, 0, GW/3.23, GH/13.97 + 35, 36, 32, 0, c_white, 1);
#region Shop Name
shopName = "Bloop's Fish Shop";
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_text_transformed(GW/3.23 + ((shopSprSize * 36) / 2), GH/13.97 + 80, shopName, 6, 6, 0);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
#endregion
#region Shop Items
switch (type) {
    case ShopType.Simple:
		switch (category) {
			case ShopOption.Buy:
		        draw_simple_items(shopItemsBuy);
		        break;
			case ShopOption.Sell:
		        draw_simple_items(shopItemsSell);
		        break;
		}
        break;
}
#endregion
#endregion