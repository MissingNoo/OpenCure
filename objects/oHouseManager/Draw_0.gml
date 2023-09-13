var floorSpr = HouseItems[houseInfo[$ "floor"]][$ "sprite"];
draw_sprite_ext(floorSpr, 0, room_width / 2 - 12, room_height / 2 + 23, 1, 1, 0, c_white, 1);
var wallSpr = HouseItems[houseInfo[$ "wall"]][$ "sprite"];
draw_sprite_ext(wallSpr, 0, room_width / 2 - 12, room_height / 2 - 113, 1, 1, 0, c_white, 1);
if (showGrid) {
	var _x = 84;
	var _y = 36;
	var _offset = 0;
	var _yoffset = 0;
	var _max = 518;	
    for (var i = 0; i < 416; ++i) {
		if (_x + _offset > _max) {
		    _offset = 0;
			_yoffset+=18;
		}
		draw_sprite(sHouseGrid, 0, _x + _offset, _y + _yoffset);
	    _offset+= 18;
	}
}
if (placingObject) {
	showGrid = true;
    draw_sprite(objectSprite, 0, round((mouse_x/grid)) * grid, round((mouse_y/grid)) * grid);
}
else{showGrid = false;}
