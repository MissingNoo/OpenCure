///@desc imgui - Begin Step
///@function __imguigml_event_begin_step
///@desc imguigml begin step event
///@extensionizer { "docs": false } 
	/////////////
#region Update Input
	var mb     = global.__imgui_mouse_buttons; 
	var num_mouse_buttons = global.__imgui_num_mouse_buttons;

	var imkeys = global.__imgui_keys; 
	var num_im_keys = global.__imgui_num_keys;

	var mx = 0,
	    my = 0;

	DrawGUI = Display_mode >= EImGui_DisplayMode.GUIModesStart && Display_mode <= EImGui_DisplayMode.GUIModesEnd;

	if (Display_mode == EImGui_DisplayMode.GUIAspect) {
		var 
			//_wport = view_wport[Display_view],
		    //_hport = view_hport[Display_view],
		    _wport = surface_get_width(application_surface),
			_hport = surface_get_height(application_surface),
			_next_width  = window_get_width(),
		    _next_height = window_get_height();
    
		if (_next_width / _wport > _next_height/ _hport) {
			var _ratio = _wport / _hport;
			_next_width = _next_height * _ratio;
		} else {
			var _ratio = _hport / _wport;
			_next_height = _next_width * _ratio;
		}
	
		if(_next_width & 1){
			++_next_width;	
		}
	
		if(_next_height & 1){
			++_next_height;	
		}

		_Display_scale_x = _next_width;
		_Display_scale_y = _next_height;
	}

	__imguigml_ext_call(_extImguiGML_set_display_size(window_get_width(), window_get_height()));

	if (Should_update_cursor) {
		switch (Display_mode) {
			case EImGui_DisplayMode.GUIAspect: 
			  mx = window_mouse_get_x() / Scale_x;
				my = window_mouse_get_y() / Scale_y;
			
				var pos = application_get_position();
				mx -= pos[0];
				my -= pos[1];
			
				break;
			case EImGui_DisplayMode.View:
				mx = window_view_mouse_get_x(Display_view) / Scale_x;
				my = window_view_mouse_get_y(Display_view) / Scale_y;
				break;
		
			default: break;
		}
	}

	buffer_seek(Input_buffer, buffer_seek_start, 0);

	buffer_write(Input_buffer, buffer_f32, mx);
	buffer_write(Input_buffer, buffer_f32, my);

	for (var mouse_button_index = 0; mouse_button_index < num_mouse_buttons; ++mouse_button_index) {
	  var but = mb[mouse_button_index];
	  buffer_write(Input_buffer, buffer_u8, Should_update_cursor && mouse_check_button(but) ? 1 : 0);
	}

	for (var key_index = 0; key_index < num_im_keys; ++key_index) {
	  var key = imkeys[key_index];
	  buffer_write(Input_buffer, buffer_u8, (key != undefined && keyboard_check(key)) ? 1 : 0);
	}

	var mousewheel = mouse_wheel_up() ? 1 : 0;
	mousewheel = mouse_wheel_down() ? -1 : mousewheel;

	if (!Should_update_cursor) mousewheel = 0;

	buffer_write(Input_buffer, buffer_s8, mousewheel);
	buffer_write(Input_buffer, buffer_u8, (!Using_GM_cursor) ? 1 : 0);

	_extImguiGML_update_input(buffer_get_address(Input_buffer));

	if (WantTextInput || WantCaptureKeyboard) {
	  if (DidWantTextInput) {
			 if (keyboard_string != "")
	      _extImguiGML_update_character_input(keyboard_string);
	     //if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_return))
	     // _extImguiGML_update_character_input("\n");
	  }
	  keyboard_string = "";
	}
	DidWantTextInput = WantTextInput || WantCaptureKeyboard;

#endregion


#region update io
	_extImguiGML_get_io_outputs();
	
	var outputs = __Imgui_out;
	WantCaptureMouse      = sr_buffer_read(outputs);
	WantCaptureKeyboard   = sr_buffer_read(outputs);
	WantTextInput         = sr_buffer_read(outputs);
	WantMoveMouse         = sr_buffer_read(outputs);
	Framerate             = sr_buffer_read(outputs); 
	MetricsAllocs         = sr_buffer_read(outputs); 
	MetricsRenderVertices = sr_buffer_read(outputs);
	MetricsRenderIndices  = sr_buffer_read(outputs);
	MetricsActiveWindows  = sr_buffer_read(outputs);
	MouseDelta = [ ];
	MouseDelta[0]         = sr_buffer_read(outputs);
	MouseDelta[1]         = sr_buffer_read(outputs);

#endregion

	/////////////
#region begin the step (with delta time)
	while (array_length(Deferred_fonts) > 0) {
		var _font_data = array_pop(Deferred_fonts);
		
		var buff = buffer_load(_font_data.filename);
		buffer_seek(buff, buffer_seek_end, 0);
		var size = buffer_tell(buff);
		buffer_seek(buff, buffer_seek_start, 0);
		
		var _font_name = string_replace(_font_data.filename, ".ttf", "");
		_font_name = string_replace(_font_name, ".TTF", "");
		
		var in = __Imgui_in;
		sr_buffer_write(in, size, ERousrData.Int32);
		sr_buffer_write(in, _font_data.fontsize, ERousrData.Float);
		sr_buffer_write(in, _font_data.index, ERousrData.Int32);
		sr_buffer_write(in, _font_name, ERousrData.String);
		
		if (__imguigml_ext_call(_extImguiGML_add_font_from_ttf(buffer_get_address(buff))))
		{
			var out = __Imgui_out;
			var ret = buffer_read(out, buffer_s8) != 0;

			if (ret) {
				// reinitialize font texture
				with (imgui) {
					__imguigml_init_font()
				}
			}
		}
		
		buffer_delete(buff);
	}

	_extImguiGML_begin_step(delta_time/1000000);
#endregion

NewFrame = true;

#region update payloads
	var payload_data = ImGuiGML_PayloadData;
	payload_data[@ EImGuiGML_PayloadData.PayloadID] = 0;
#endregion

