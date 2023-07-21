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
//draw_set_valign(fa_center);
draw_set_halign(fa_right);
draw_text_transformed(GW/1.20 - 250 + 185, GH/21.34 + 16, global.holocoins, 3, 3, 0);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if (!optionConfirmed) { return; }
#region Shop Area
draw_sprite_ext(sHudShopArea, 0, GW/3.23, GH/13.97 + 35, 36, 32, 0, c_white, 1);
#region Shop Name
//draw_set_valign(fa_center);
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
		        // Feather disable once GM1041
		        draw_simple_items(shopItemsBuy);
		        break;
			case ShopOption.Sell:
				// Feather disable once GM1041
		        draw_simple_items(shopItemsSell);
		        break;
		}
        break;
		
	case ShopType.Tabbed:
		switch (category) {
			case ShopOption.Buy:
				var _xoff = 0;
				var _x = GW/2.48;
				var _y = GH/3.25;
				// Feather disable once GM1041
				for (var i = 0; i < array_length(shopTabs); ++i) {				
					var _alpha = selectedTab == i ? 1 : .5;
				    draw_sprite_ext(shopTabs[i][$"sprite"], 0, _x + _xoff, _y, 1, 1, 0, c_white, _alpha);
					_xoff += 80;
				}
				_yoff = 0;
				_x = GW/3.10;
				_y = GH/4.71;
				_x = _x + 100;
				_y = _y + 170;
				for (var i = firstitem; i < maxitem; ++i) {
					if (selectedItem == i) {
						draw_set_alpha(.1);
						draw_rectangle(_x - 30, _y - 30 + _yoff, _x + 700, _y + 28 + _yoff, false);
						draw_set_alpha(1);
					}
					var _color = selectedItem == i ? c_yellow : c_white;
					draw_sprite_ext(tabItems[i][$"thumb"], 0, _x, _y + _yoff, 2, 2, 0, c_white, 1);
					draw_text_transformed_color(_x + 40, _y - 25 + _yoff, lexicon_text(string(lexiconIdentifier) + "." +  tabItems[i][$"name"]), 3, 3, 0, _color, _color, _color, _color, 1);
					var haveItem = false;
					var _category = shopTabs[selectedTab][$"category"];
					for (var j = 0; j < array_length(HouseInventory[_category]); ++j) {
					    if (HouseInventory[_category][j][$"itemId"] == tabItems[i][$"itemId"]) {
						    haveItem = true;
						}
					}
					//draw_set_valign(fa_right);
					if (!haveItem) {
						if (selectedItem == i) { haveSelectedItem = haveItem; }
						draw_text_transformed_color(_x + 550, _y - 25 + _yoff, tabItems[i][$"cost"], 3, 3, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
						draw_text_transformed(_x + 400, _y - 25 + _yoff, "COST:", 3, 3, 0);						
					}
					else {					    
						if (selectedItem == i) { haveSelectedItem = haveItem; }
						draw_set_color(c_yellow);
						draw_text_transformed(_x + 550, _y - 25 + _yoff, "SOLD OUT!", 3, 3, 0);						
						draw_set_color(c_white);
					}
					if (buyingItem) {
					    draw_sprite_ext(sHudButton, 1, _x + 525, _y + _yoff, 1.5, 1.5, 0, c_white, 1);
					}
					//draw_set_valign(fa_left);
					_yoff += 80;
				}
				break;
		}
		break;
}
#endregion
#endregion
draw_text(TouchX1, TouchY1, string(
@"selectedItem : {0}
selectedTab : {1}
tabItems : {2}
firstItem : {3}
maxItem : {4}
firstItemTabbed : {5}
maxItemTabbed : {6}
buyingItem : {7}", 
selectedItem, 
selectedTab,
tabItems,
firstitem,
maxitem,
firstitemtabbed,
maxitemtabbed,
buyingItem
));