///@desc tab rectangles
var _window_pos = imguigml_get_window_pos(),
	_colouru32 = $ffffffff,
	// _col1 = imguigml_color_convert_gml_to_u32(c_red, 1),
	// _col2 = imguigml_color_convert_gml_to_u32(c_blue, 1),
	// _col3 = imguigml_color_convert_gml_to_u32(c_yellow, 1),
	// _col4 = imguigml_color_convert_gml_to_u32(c_purple, 1),
	_cell_size = 32, 
	_rows = 10, 
	_cols = 10, 
	// _width = _cell_size * _cols,
	_height = _cell_size * _rows,
	_ox1 = _window_pos[0] + 100, 
	_oy1 = _window_pos[1] + 80, 
	// _ox2 = _ox1 + _width,
	_oy2 = _oy1 + _height;
	// _xx, 
	// _yy;

var _ix = 0;
repeat(_cols){
	var _iy = 0;
	repeat(_rows){
		var _x1 = _ox1 + _ix * _cell_size,
			_y1 = _oy1 + _iy * _cell_size,
			_x2 = _x1 + _cell_size,
			_y2 = _y1 + _cell_size;
		
		var _filled = false;
		if(_iy mod 2 == 0){
			_filled = _ix mod 2 == 0;	
		}else{
			_filled = !(_ix mod 2 ==0);	
		}
		
		if(!_filled){
			imguigml_drawlist_add_rect(_x1, _y1, _x2, _y2 , _colouru32);
		}else{
			imguigml_drawlist_add_rect_filled(_x1, _y1, _x2, _y2, _colouru32);
		}
		++_iy;
	}
	
	++_ix;	
}

_oy1 += _height;
_oy2 += _height;

var _ix = 0;
repeat(_cols){
	var _iy = 0;
	repeat(_rows){
		var _x1 = _ox1 + _ix * _cell_size,
			_y1 = _oy1 + _iy * _cell_size,
			_x2 = _x1 + _cell_size,
			_y2 = _y1 + _cell_size;
		
		var _filled = false;
		if(_iy mod 2 == 0){
			_filled = !(_ix mod 2 == 0);	
		}else{
			_filled = (_ix mod 2 ==0);	
		}
		if(_filled){
			imguigml_drawlist_add_rect(_x1, _y1, _x2, _y2 , _colouru32);
		}else{
			imguigml_drawlist_add_rect_filled_multicolor(_x1, _y1, _x2, _y2, _colouru32, _colouru32, _colouru32, _colouru32);
		}
		++_iy;
	}
	
	++_ix;	
}
