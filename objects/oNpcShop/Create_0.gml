firstitem = 0;
maxitem = 3;
shopOptions = [ShopOption.Talk, ShopOption.Quit];
shopSprSize = sprite_get_width(sHudShopArea);
justOpened = true;
alarm[0] = 10;

function draw_simple_items(arr){
	var _yoff = 0;
	if (maxitem > array_length(arr)) {
	    maxitem = array_length(arr);
	}
	for (var i = firstitem; i < maxitem; ++i) {
		if (selectedItem == i) {
			draw_set_alpha(.1);
			draw_rectangle(GW/3.23 + 60, GH/13.97 + 130 + _yoff, GW/1.09, GH/2.25 + _yoff, false);
			draw_set_alpha(1);
		}
		draw_sprite_ext(sItemSquare, 0, GW/3.23 + 100, GH/13.97 + 170 + _yoff, 2, 2, 0, c_white, 1);
		draw_sprite_ext(arr[i][$"sprite"], 0, GW/3.23 + 100, GH/13.97 + 170 + _yoff, 2, 2, 0, c_white, 1);
		draw_set_color(c_yellow);
		draw_text_transformed(GW/3.23 + 140, GH/13.97 + 130 + _yoff, lexicon_text(string(shopName) + "." +  arr[i][$"name"] + ".name"), 3, 3, 0);
		draw_set_color(c_white);
		draw_text_ext_transformed(GW/3.23 + 140, GH/13.97 + 160 + _yoff, lexicon_text(string(shopName) + "." +  arr[i][$"name"] + ".desc"),10, 220, 3, 3, 0);
		_yoff += 170;
	}
}

if (is_array(shopItemsSell)) {
    array_insert(shopOptions, 0, ShopOption.Sell);
}
if (is_array(shopItemsBuy)) {
    array_insert(shopOptions, 0, ShopOption.Buy);
}