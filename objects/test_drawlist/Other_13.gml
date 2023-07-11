///@desc tab poly
var _window_pos = imguigml_get_window_pos(),
	_colouru32 = $ffffffff,
	_y1 = _window_pos[1] + 100,
	_x2 = _window_pos[0] + 100 + 100,
	_y2 = _y1 + 100,
	_x1 = _x2,

var _t = imguigml_mem("drawlist_poly_t", 0);
var _increment = imguigml_mem("drawlist_poly_incr", 5); //degrees -- freq = 1 oscillation per second (1Hz)
var _amplitude = imguigml_mem("drawlist_poly_amp", 100); //pixels of peak oscillation

_t = (_t + _increment) mod 360;

imguigml_memset("drawlist_poly_t", _t);
var _shift = _amplitude * dsin(_t);
_x1 += _shift;

//Triangle
imguigml_drawlist_add_convex_poly_filled([
		[_x1, _y1],
		[_x2, _y1],
		[_x2, _y2],
	], _colouru32
);

var _xx = _window_pos[0] + 64,
	_yy = _window_pos[1] + 64;
	
imguigml_drawlist_add_polyline(
	[
		[_xx, _yy],
		[_xx+32, _yy],
		[_xx+32, _yy+32],
		[_xx, _yy + 128],
		[_xx, _yy]
	],
	_colouru32);


