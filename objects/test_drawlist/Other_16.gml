///@desc tab triangles
var _window_pos = imguigml_get_window_pos(),
	_colouru32 = $ffffffff,
	_x1 = _window_pos[0] + 8,
	_y1 = _window_pos[1] + 100,
	_x2 = _x1 + 64,
	_y2 = _y1 + 64;
	
imguigml_drawlist_add_triangle(_x1, _y1, _x1, _y2, _x2, _y2, _colouru32, 1);

imguigml_drawlist_add_triangle_filled(_x1+ 100, _y1, _x1 + 100, _y2, _x2 + 100, _y2, _colouru32, 1);
