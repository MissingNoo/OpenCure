///@desc imgui template
if(!instance_exists(imgui)){
	exit;	
}

if(!imguigml_ready()){
	exit;	
}

var _colouru32 = $ffffffff;

imguigml_set_next_window_size(640, 500, EImGui_Cond.FirstUseEver);
var _window = imguigml_begin("DrawlistWindow",true);
if(_window[0]){
	
	var _current_pos = imguigml_get_window_pos();
	var _tabs = ["Circles", "Lines", "Rectangles", "Poly Functions", "Images", "Quads", "Triangles"];

	var _tab_active = imguigml_mem("test_drawlist_tab", 0);
	imguigml_begin_tab_bar("DrawlistTabs");
	var _i=0;
	repeat(array_length(_tabs)) {
		var _ret = imguigml_begin_tab_item(_tabs[_i], undefined, ( _tab_active == 0));
		if (_ret[0]) {
			imguigml_memset("test_drawlist_tab", _i);

			//Render tab ( tests stored in user events ) 
			event_user(_i);
			imguigml_end_tab_item();
		}
		++_i;
	}
	imguigml_end_tab_bar();
	_tab_active = imguigml_mem("test_drawlist_tab");
}

if(!_window[1]){
	instance_destroy();	
}

var _pos = imguigml_get_window_pos();
// _size = imguigml_get_window_size();
imguigml_end();

imguigml_set_next_window_size(150, 360, EImGui_Cond.FirstUseEver);
imguigml_set_next_window_pos(_pos[0] - 200, _pos[1], EImGui_Cond.FirstUseEver);
var _flags = EImGui_WindowFlags.NoCollapse | EImGui_WindowFlags.NoResize | EImGui_WindowFlags.NoTitleBar;

//BEZIER LINE TEST AND TEST TEXT 
var _window = imguigml_begin("Drawlist Window", false, _flags);
if(_window[0]){
	imguigml_drawlist_push_clip_rect(0, 0, imgui._Display_scale_x, imgui._Display_scale_y, false);
	imguigml_text_wrapped("Wow bezeir curvers are neat");
	var _current_pos = imguigml_get_window_pos();
	imguigml_set_window_pos("Drawlist Window", _pos[0] - 200, _current_pos[1] - (last_y - _pos[1]));
	_current_pos = imguigml_get_window_pos();
	
	imguigml_drawlist_add_text(_current_pos[0], _current_pos[1], _colouru32, "Drawlist Text Success!", 100); 
	
	var _x1 = _current_pos[0] + imguigml_get_window_width(),
		_y1 = _current_pos[1] + imguigml_get_window_height()/2,
		_cx1 = _x1 + 50,
		_cy1 = _y1,
		_x2 = _pos[0],
		_y2 = _pos[1] + imguigml_get_window_height()/2,
		_cx2 = _x2 - 50,
		_cy2 = _y2;
	
	imguigml_drawlist_add_bezier_curve(
		_x1, _y1, _cx1, _cy1, _cx2, _cy2, _x2, _y2,
		_colouru32,
		1
	);
	
	imguigml_drawlist_pop_clip_rect();
}





imguigml_end();

last_y = _pos[1];