///@desc tab circles
var _window_pos = imguigml_get_window_pos(),
	_colouru32 = $ffffffff;
// CIRCLE TEST
imguigml_drawlist_add_circle(_window_pos[0] + imguigml_get_window_width()/2, _window_pos[1] + imguigml_get_window_height()/2, 100, _colouru32);

imguigml_drawlist_add_circle_filled(_window_pos[0] + imguigml_get_window_width()/2, _window_pos[1] + imguigml_get_window_height()/2, 100/4, _colouru32);

