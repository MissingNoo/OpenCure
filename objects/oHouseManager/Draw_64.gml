if (!editHouse) { return; }
var _yoff = 0;
//draw_set_valign(fa_center);
draw_set_halign(fa_center);
for (var i = 0; i < array_length(houseOptions); ++i) {
	var _spr = selectedMenu == i ? 1 : 0;
	var _color = selectedMenu== i ? c_black : c_white;
	var _x = GW/6;
	var _y = GW/12.60;
	draw_sprite_ext(sHudButton, _spr, _x, _y + 35 + _yoff, 1.5, 2, 0, c_white, 1);
	draw_set_color(_color);
	draw_text_transformed(_x, _y+35+_yoff, lexicon_text("HouseManager." + houseOptions[i]), 2,2,0);
	draw_set_color(c_white);
	_yoff += 75;
}
//items
var _x = GW/3.69
var _y = GH/7.18;
draw_sprite_ext(sHudShopArea, 0, _x, _y, 25, 30.25, 0, c_white, 1);
var _xoff = 0;
_yoff = 0;
for (var i = 0; i < array_length(HouseInventory[selectedMenu]); ++i) {
	if (selectedMenuConfirm and selectedItem == i) {
	    draw_sprite_ext(sItemSquare, 0, _x + 45 + _xoff, _y + 40 + _yoff, 2, 2, 0, c_white, 1);
	}    
    draw_sprite_ext(HouseItems[HouseInventory[selectedMenu][i][$"itemId"]][$"thumb"], 0, _x + 45 + _xoff, _y + 40 + _yoff, 2, 2, 0, c_white, 1);
	_xoff += 85;
	if (i == 6 or i == 13 or i == 19 or i == 25 or i == 31) {
		_xoff = 0;
	    _yoff += 75;
	}
	
}
//preview
draw_sprite_ext(sHudShopArea, 0, GW/1.39, GH/7.18, 13, 22.50, 0, c_white, 1);
_x = GW/1.39 + ((sprite_get_width(sHudShopArea) * 13) / 2);
_y = GH/7.18 + 70;
draw_text_transformed(_x, _y, "Preview:", 3, 3, 0);
if (variable_struct_exists(HouseItems[HouseInventory[selectedMenu][selectedItem][$"itemId"]], "sprite")) {
	var _spr = HouseItems[HouseInventory[selectedMenu][selectedItem][$"itemId"]][$"sprite"];
    draw_sprite_ext(_spr, 0, _x - (sprite_get_width(_spr) / 2), _y + 150, 2, 2, 0, c_white, 1);
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);