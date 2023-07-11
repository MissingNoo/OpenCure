///@desc tab lines
var _window_pos = imguigml_get_window_pos(),
	_colouru32 = $ffffffff,
	_cell_size = 32, 
	_rows = 10, 
	_cols = 10, 
	// _width = _cell_size * _cols,
	// _height = _cell_size * _rows,
	_ox1 = _window_pos[0] + 100, 
	_oy1 = _window_pos[1] + 80;
	// _ox2 = _ox1 + _width,
	// _oy2 = _oy1 + _height,
	// _xx, 
	// _yy;

var _t = imguigml_mem("drawlist_line_t", 0);
var _increment = imguigml_mem("drawlist_line_incr", 5); //degrees -- freq = 1 oscillation per second (1Hz)
var _amplitude = imguigml_mem("drawlist_line_amp", 18); //pixels of peak oscillation

_t = (_t + _increment) mod 360;

imguigml_memset("drawlist_line_t", _t);

var _ix = 0;
repeat(_cols){
	var _iy = 0;
	repeat(_rows){
		var _x1 = _ox1 + _ix * _cell_size,
			_y1 = _oy1 + _iy * _cell_size,
			_x2 = _x1 + _cell_size,
			_y2 = _y1 + _cell_size;
		
		var _shift1 = _amplitude * dsin(_t + (_ix-1) * _cell_size);
		var _shift2 = _amplitude * dsin(_t + (_ix) * _cell_size);
		//_y1 += _shift;
		////var _shift = _amplitude * dsin(_t + _is * _cell_size);
		//_y2 += _shift;
		
		//Top horizontal 
		imguigml_drawlist_add_line(_x1, _y1 + _shift1, _x2, _y1 + _shift2 , _colouru32,  1);	
		
		//Bottom horizontal
		imguigml_drawlist_add_line(_x1, _y2 + _shift1, _x2, _y2 + _shift2, _colouru32,  1);	
		
		//Left Vertical
		imguigml_drawlist_add_line(_x1, _y1 + _shift1, _x1, _y2 + _shift1, _colouru32, 1);
		
		//Right vertical
		imguigml_drawlist_add_line(_x2, _y1 + _shift2, _x2, _y2 + _shift2, _colouru32, 1);
		
		++_iy;
	}
	
	++_ix;	
}

	