///@desc imgui - Draw GUI
if (!DrawGUI)
	return;

var ox = display_get_gui_width(), oy = display_get_gui_height();
display_set_gui_size(_Display_scale_x, _Display_scale_y);
__imguigml_draw();
display_set_gui_size(ox, oy);
