///@desc tab quads
var _window_pos = imguigml_get_window_pos(),
	_colouru32 = $ffffffff,
	_x1 = _window_pos[0] + 64,
	_y1 = _window_pos[1] + 100,
	_x2 = _x1 + 528,
	_y2 = _y1 + 528;
	
imguigml_drawlist_add_quad(
	//Tri 1
	_x1, _y1, 
	_x1, _y2,
	_x2, _y2,
	_x2, _y1,
	_colouru32,
	1
)
 

imguigml_drawlist_add_quad_filled(
	//Tri 1
	_x1, _y1, 
	_x1, _y2,
	_x2, _y2,
	_x2, _y1,
	_colouru32,
	1
)
