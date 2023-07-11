if(!instance_exists(imgui)){
	exit;	
}

if(!imguigml_ready()){
	exit;	
}

imguigml_set_next_window_size(640, 360, EImGui_Cond.FirstUseEver);
var _window = imguigml_begin("ColorTest",true);
if(_window[0]){
	var _input;
	
	
	_input = imguigml_checkbox("Enable App Surface", application_surface_is_enabled());
	if(_input[0]){
		application_surface_enable(_input[1]);
	}
	
	imguigml_separator();
	imguigml_spacing();
	imguigml_text("EImGui_DisplayMode");
	var _checkboxes = [
		"GUI Aspect Ratio", EImGui_DisplayMode.GUIAspect,
		"View",             EImGui_DisplayMode.View
	];
	var num_checks = array_length(_checkboxes) / 2;
	
	var _i=0;
	repeat(num_checks){
		var _label = _checkboxes[_i++],
			_index = _checkboxes[_i++],
			_value = (imguigml_get_display_mode() == _index);
		_input = imguigml_checkbox(_label,_value);
		
		if(_input[0] && _input[1]){
			imguigml_set_display_mode(_index);	
		}
	}
	
	//imguigml_text("DISPLAY MODE:");
	//_input = imguigml_checkbox("GUI Window Size", (imguigml_get_display_mode() == EI);
	//if(_input[0]){
	//	if(imguigml_get_display_mode() != EImGui_DisplayMode.GUIWindowSize){
			
	//	}
	//}
	
	imguigml_separator();
	var _view = view_current,
		_camera = view_camera[_view];
	imguigml_label_text("viewport_size", string(view_wport[_view]) +", " + string(view_hport[_view]));
	imguigml_label_text("window_mouse", string(mouse_x) + ", " + string(mouse_y));
	imguigml_label_text("gui_mouse", string(device_mouse_x_to_gui(0)) +", " + string(device_mouse_y_to_gui(0)));
	imguigml_label_text("app_surface", string(surface_get_width(application_surface))+", " + string(surface_get_height(application_surface)));
	imguigml_label_text("gui_size", string(display_get_gui_width()) +", " + string(display_get_gui_height()));
	imguigml_label_text("window_size", string(window_get_width()) +", " + string(window_get_height()));
	imguigml_label_text("imgui size", string(imgui._Display_scale_x)+", " + string(imgui._Display_scale_y));
	imguigml_separator();
	imguigml_mem("display_gui_width_orig", display_get_gui_width());
	imguigml_mem("display_gui_height_orig", display_get_gui_height());
	imguigml_mem("display_surface_width_orig", surface_get_width(application_surface));
	imguigml_mem("display_surface_height_orig", surface_get_height(application_surface));
	imguigml_mem("display_view_width_orig", camera_get_view_width(_camera));
	imguigml_mem("display_view_height_height_orig", camera_get_view_height(_camera));
	
	_input = imguigml_input_float2("display_gui_size", imguigml_mem("display_gui_width",display_get_gui_width()), imguigml_mem("display_gui_height",display_get_gui_height()));
	if(_input[0]){ imguigml_memset("display_gui_width", _input[1]); imguigml_memset("display_gui_height", _input[2]); }
	
	_input = imguigml_input_float2("display_view_size", imguigml_mem("display_view_width",camera_get_view_width(_camera)), imguigml_mem("display_view_height", camera_get_view_height(_camera)));
	if(_input[0]){ imguigml_memset("display_view_width", _input[1]); imguigml_memset("display_view_height", _input[2]); }
	
	_input = imguigml_input_float2("display_surface_size", imguigml_mem("display_surface_width",surface_get_width(application_surface)), imguigml_mem("display_surface_height",surface_get_height(application_surface)));
	if(_input[0]){ imguigml_memset("display_surface_width", _input[1]); imguigml_memset("display_surface_height", _input[2]); }
	
	if(imguigml_button("Update")){
		display_set_gui_size(imguigml_mem("display_gui_width"), imguigml_mem("display_gui_height"));	
		camera_set_view_size(_camera, imguigml_mem("display_view_width"), imguigml_mem("display_view_height"));
		surface_resize(application_surface, imguigml_mem("display_surface_width"), imguigml_mem("display_surface_height"));
	}
	imguigml_same_line();
	if(imguigml_button("Reset")){
		display_set_gui_size(imguigml_mem("display_gui_width_orig"), imguigml_mem("display_gui_height_orig"));	
		camera_set_view_size(_camera, imguigml_mem("display_view_width_orig"), imguigml_mem("display_view_height_orig"));
		surface_resize(application_surface, imguigml_mem("display_surface_width_orig"), imguigml_mem("display_surface_height_orig"));
	}
	

	
	if(!_window[1]){
		instance_destroy();	
	}
}



imguigml_end();