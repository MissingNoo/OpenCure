///@desc base imguigml functions

global.___imguiIg = undefined;
#macro __ImguiIg global.___imguiIg =

#region general functions

///@function imguigml_activate()
///@desc helper function to simply activate imguigml again
function imguigml_activate() {
	with (ImGuiGML) {
	  return;
	}

	if (ImGuiGML != noone) 
	  instance_activate_object(ImGuiGML);
}
__ImguiIg(imguigml_activate)

///@function imguigml_deactivate()
///@desc helper function to simply deactivate imguigml again
function imguigml_deactivate() {
	with (ImGuiGML) {
	  if (imguigml_ready()) {
	    event_perform(ev_step, ev_step_end);
		}
    
	  instance_deactivate_object(id);
	}

	global.__imguigml_payloads = [ 
		[ ],
		[ ],	
		0,	
	];
}
__ImguiIg(imguigml_deactivate)

///@function imguigml_ready()
///@desc returns true if imguigml is ready for commands to be called
///@returns {Boolean}
function imguigml_ready() {
	with (ImGuiGML)
	  return NewFrame;

	return false;
}
__ImguiIg(imguigml_ready)

///@function imguigml_color_convert_gml_to_u32(_color, [_alpha=1.0])
///@desc get an ImGui color from a gml color
///@param {Real} _color
///@param {Real} [_alpha=1.0]   alpha value from 0 - 1
///@returns {Real} ImGui U32 color
function imguigml_color_convert_gml_to_u32(_col, _alpha = 1) {
	var r = (_col >>  0) & $FF;
	var g = (_col >>  8) & $FF;
	var b = (_col >> 16) & $FF;
	var a = round(_alpha * 255) & $FF; // normalize it

	return r + (g << 8) + (b << 16) + (a << 24);
}
__ImguiIg(imguigml_color_convert_gml_to_u32)

///@function imguigml_color_convert_gml_to_float4(_color, [_alpha=1.0]
///@desc get an ImGui color4 from a gml color 
///@param {Real} _color
///@param {Real} [_alpha=1.0]   alpha value from 0 - 1
///@returns {Array} [_r,_g,_b,_a]
function imguigml_color_convert_gml_to_float4(_color, _alpha = 1) {
	var	_u32 = imguigml_color_convert_gml_to_u32(_color, _alpha);
		return imguigml_color_convert_u32_to_float4(_u32);
}
__ImguiIg(imguigml_color_convert_gml_to_float4)

///@function imguigml_color_convert_float4_to_gml(_r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined])
///@desc get an gml color from a ImGui color4
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined]
///@param {Real} [_b=undefined]
///@param {Real} [_a=undefined]
///@returns {Array} [gml_colour,_alpha]
function imguigml_color_convert_float4_to_gml() {
	var _argi = 0, _r, _g, _b, _a;

	if(argument_count > 1){
		_r = argument[_argi++];
		_g = argument[_argi++];
		_b = argument[_argi++];
		_a = argument[_argi++]; 
	}else{
		var _array = argument[0];
		_r = _array[_argi++];
		_g = _array[_argi++];
		_b = _array[_argi++];
		_a = _array[_argi++];	
	}

	return imguigml_color_convert_u32_to_gml(imguigml_color_convert_float4_to_u32(_r, _g, _b, _a));
}
__ImguiIg(imguigml_color_convert_float4_to_gml)

///@function imguigml_color_convert_u32_to_gml(_color)
///@desc get gml color from an imgui color
///@param {Real} _color   u32 color from imgui
///@returns {Array:[ _gml_color, _alpha]}
function imguigml_color_convert_u32_to_gml(_col) {
	gml_pragma("forceinline");
	var _r = (_col >>  0) & $FF,
	    _g = (_col >>  8) & $FF,
	    _b = (_col >> 16) & $FF,
	    _a = (_col >> 24) & $FF;
	return [ make_color_rgb(_r, _g, _b), _a / 255 ];
}
__ImguiIg(imguigml_color_convert_u32_to_gml)

///@function imguigml_toggle_cursor([_force])
///@desc Toggle whether or not ImGui will touch the cursor or not
///@param {Boolean} [_force]   if passed, will set the cursor visibility accordingly
function imguigml_toggle_cursor() {
	var _forced = argument_count > 1 ? argument[0] : undefined;

	with (ImGuiGML) {
	  if (_forced == undefined)
	    _forced = !Should_update_cursor;
  
	  Should_update_cursor = _forced;
	}
}
__ImguiIg(imguigml_toggle_cursor)

///@function imguigml_enable_depth([_enabled])
///@desc if enabled, setting the `depth` of the `imgui` instance will change the `z-value` imgui renders, otherwise it's at z=1.0
///@param {Boolean} [_enabled]   enable depth - if not passed, returns value currently set
///@returns {Boolean} _enabled
function imguigml_enable_depth() {
	var _enabled = argument_count > 0 ? argument[0] : undefined;
	with (ImGuiGML) {
		if (_enabled == undefined)
			_enabled = Use_depth;
		else
			Use_depth = _enabled;
	
		Imgui_shader = Use_depth ? _EImGuiShader.Depth : _EImGuiShader.Normal;
	}

	return _enabled;
}
__ImguiIg(imguigml_enable_depth)

///@function imguigml_set_display_mode(_display_mode, [_display_view=0])
///@desc set the imguigml display mode - this affects how the window is resized / handled.
///      currently there's the 3 display modes: 
///      *  GUIAspect     - ImGuiGML Draws on the GUI layer, but corrects for aspect ratio according to the viewport of view passed. **DEFAULT**
///      *  View          - ImGuiGML will Draw in a normal Draw call **NOT** Draw GUI, the mouse will scale to the view given. **Use if you want to Draw ImGuiGML during the Draw event (application surface).**
///      **NOTE: This should be set before or after `Begin Step` and `Draw` of the `imgui` object, 
///      it affects both mouse (Begin Step) and rendering (Draw)**
///      _If you're using `EImGui_DisplayMode.View` you may want to experiment with [imguigml_set_display_scale](#imguigml_set_display_scale)_
///@param {Real:EImGui_DisplayMode} _display_mode   display mode to set 
///@param {Real} [_display_view=0]                  which view imgui respects viewport aspect ratio - defaults to view 0.
function imguigml_set_display_mode() {
	var _display_mode = argument[0],
	    _display_view = argument_count > 1 ? argument[1] : 0;
		
	with (ImGuiGML) {
		Display_mode = _display_mode;
		Display_view = _display_view;
	}
}
__ImguiIg(imguigml_set_display_mode)

///@function imguigml_get_display_mode()
///@desc returns the current set display mode
///@returns {Real:EImGui_DisplayMode} ImGuIGML's current `Display_mode`
function imguigml_get_display_mode() {
	with (ImGuiGML)
		return Display_mode;
}
__ImguiIg(imguigml_get_display_mode)

///@function imguigml_get_display_view()
///@desc returns the current set display view - the view who's viewport we respect the aspect ratio of with using `EImGui_DisplayMode.GUIWindowSize` or `EImGui_DisplayMode.GUIAspect`
///@returns {Real:EImGui_DisplayMode} ImGuIGML's current `Display_mode`
function imguigml_get_display_view() {
	with (ImGuiGML)
		return Display_view;
}
__ImguiIg(imguigml_get_display_view)

///@function imguigml_set_display_scale([_x], [_y])
///@desc set the imguigml display scaling - it will scale the mouse and the vertex buffer ImGui passes ImGuiGML by this much.
///      if you pass no arguments, Scale will no longer be overriden
///@param {Real} _x    width  (%) to scale (Default = 1.0)
///@param {Real} _y    height (%) to scale (Default = 1.0)
function imguigml_set_display_scale() {
	var _x = argument_count > 1 ? argument[0] : undefined,
	    _y = argument_count > 1 ? argument[1] : undefined;
		
	with (ImGuiGML) {
		Override_scale = _x != undefined;

		Scale_x = Override_scale ? _x : 1.0;
		Scale_y = Override_scale ? _y : 1.0;
	}
}
__ImguiIg(imguigml_set_display_scale)

///@function imguigml_get_display_scale_width()
///@desc get the scale % we scale the width of
///@returns {Real}
function imguigml_get_display_scale_width() {
	with (ImGuiGML)
		return Scale_x;
}
__ImguiIg(imguigml_get_display_scale_width)

///@function imguigml_get_display_scale_height()
///@desc get the scale % we scale the height of
///@returns {Real}
function imguigml_get_display_scale_height() {
	with (ImGuiGML)
		return Scale_y;
}
__ImguiIg(imguigml_get_display_scale_height)

///@function imguigml_set_display_size([_width], [_height])
///@desc set the display size (how imgui will clamp windows). 
///      by default, ImGuiGML automatically sets the display size to the window size each step. using this function disables that behavior.
///      calling this fucntion with **NO** params, re-enables that functionality.
///@param {Real} [_width] 
///@param {Real} [_height]
function imguigml_set_display_size() {
	//with (ImGuiGML) {
	//	Display_override = argument_count > 1;
	//}
	
	if (argument_count < 2)
		return;

	if (!__imguigml_ext_call(_extImguiGML_set_display_size(argument[0], argument[1])))
		return;
}
__ImguiIg(imguigml_set_display_size)

///@function imguigml_get_display_size()
///@desc get the display size (how imgui will clamp windows)
///@returns {Array:[x, y]}
function imguigml_get_display_size() {
	if (!__imguigml_ext_call(_extImguiGML_get_display_size()))
		return;
	
	var out = __Imgui_out;
	var ret = array_create(2)
	ret[@ 0] = buffer_read(out, buffer_f32);
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_get_display_size)

#endregion
#region drawlist functions

///@function imguigml_drawlist_add_line(_x1, _y1, _x2, _y1, _color, [_thickness=1.0])
///@desc adds a line to the draw list 
///@param {Real} _x1 
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2 
///@param {Real} _color  
///@param {Real} [_thickness = 1.0]
function imguigml_drawlist_add_line() {
	var in = __Imgui_in, argi = 0;

	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);

	if(argument_count > argi){
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
	}else{
		sr_buffer_write(in, 1, ERousrData.Float);	
	}

	__imguigml_ext_call(_extImguiGML_drawlist_add_line());
}
__ImguiIg(imguigml_drawlist_add_line)

///@function imguigml_drawlist_add_rect(_x1, _y1, _x2, _y2, _col, [_rounding = 0.0], [_rounding_corner_flags = ~0], [_thickness = 1.0])
///@desc Adds a rectangle to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _col
///@param {Real} [_rounding=0.0]
///@param {Real:EImGui_DrawFlags} [_rounding_corner_flags=0]
///@param {Real} [_thickness=1.0]
function imguigml_drawlist_add_rect() {
	var _in = __Imgui_in, argi = 0;
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Uint32);

	sr_buffer_write(_in, argument_count > 5 ? argument[argi++] : 0,   ERousrData.Float);
	sr_buffer_write(_in, argument_count > 6 ? argument[argi++] : 0,  ERousrData.Int32);
	sr_buffer_write(_in, argument_count > 7 ? argument[argi++] : 1.0, ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_add_rect());
}
__ImguiIg(imguigml_drawlist_add_rect)

///@function imguigml_drawlist_add_rect_filled(_x1, _y1, _x2, _y2, _col, [_rounding = 0.0], [_rounding_corner_flags = ~0])
///@desc Adds a filled rectangle to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _col
///@param {Real} [_rounding=0.0]
///@param {Real:EImGui_DrawFlags} [_rounding_corner_flags=0]
function imguigml_drawlist_add_rect_filled() {
	var _in = __Imgui_in, argi = 0;
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Uint32);

	sr_buffer_write(_in, argument_count > 5 ? argument[argi++] : 0, ERousrData.Float);
	sr_buffer_write(_in, argument_count > 6 ? argument[argi++] : 0, ERousrData.Int32);
	__imguigml_ext_call(_extImguiGML_drawlist_add_rect_filled());
}
__ImguiIg(imguigml_drawlist_add_rect_filled)

///@function imguigml_drawlist_add_rect_filled_multicolor(_x1, _y1, _x2, _y2, _colUL, _colUR, _colBR, _colBL);
///@desc Adds a multicolored filled rectangle to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _colUL
///@param {Real} _colUR
///@param {Real} _colBR
///@param {Real} _colBL
function imguigml_drawlist_add_rect_filled_multicolor() {
	var _in = __Imgui_in, argi=0;
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Float);
	sr_buffer_write(_in, argument[argi++], ERousrData.Uint32);
	sr_buffer_write(_in, argument[argi++], ERousrData.Uint32);
	sr_buffer_write(_in, argument[argi++], ERousrData.Uint32);
	sr_buffer_write(_in, argument[argi++], ERousrData.Uint32);
	__imguigml_ext_call(_extImguiGML_drawlist_add_rect_filled_multicolor());
}
__ImguiIg(imguigml_drawlist_add_rect_filled_multicolor)

///@function imguigml_drawlist_add_quad(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, _col, [_thickness = 1.0])
///@desc Adds a quad to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y5
///@param {Real} _col
///@param {Real} [_thickness=1.0]
function imguigml_drawlist_add_quad() {
	var _in = __Imgui_in;
	sr_buffer_write(_in, argument[0], ERousrData.Float);
	sr_buffer_write(_in, argument[1], ERousrData.Float);
	sr_buffer_write(_in, argument[2], ERousrData.Float);
	sr_buffer_write(_in, argument[3], ERousrData.Float);
	sr_buffer_write(_in, argument[4], ERousrData.Float);
	sr_buffer_write(_in, argument[5], ERousrData.Float);
	sr_buffer_write(_in, argument[6], ERousrData.Float);
	sr_buffer_write(_in, argument[7], ERousrData.Float);
	sr_buffer_write(_in, argument[8], ERousrData.Uint32);
	sr_buffer_write(_in, argument_count > 9 ? argument[9] : 1.0, ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_add_quad());
}
__ImguiIg(imguigml_drawlist_add_quad)

///@function imguigml_drawlist_add_quad_filled(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, _col, [_thickness = 1.0])
///@desc Adds a filled quad to the draw list
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y5
///@param {Real} _col
///@param {Real} [_thickness=1.0]
function imguigml_drawlist_add_quad_filled() {
	var _in = __Imgui_in;
	sr_buffer_write(_in, argument[0], ERousrData.Float);
	sr_buffer_write(_in, argument[1], ERousrData.Float);
	sr_buffer_write(_in, argument[2], ERousrData.Float);
	sr_buffer_write(_in, argument[3], ERousrData.Float);
	sr_buffer_write(_in, argument[4], ERousrData.Float);
	sr_buffer_write(_in, argument[5], ERousrData.Float);
	sr_buffer_write(_in, argument[6], ERousrData.Float);
	sr_buffer_write(_in, argument[7], ERousrData.Float);
	sr_buffer_write(_in, argument[8], ERousrData.Uint32);
	sr_buffer_write(_in, argument_count > 9 ? argument[9] : 1.0, ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_add_quad_filled());
}
__ImguiIg(imguigml_drawlist_add_quad_filled)

///@function imguigml_drawlist_add_triangle(_x1, _y1, _x2, _y2, _x3, _y3, _col, [_thickness=1.0])
///@desc Adds a triangle to the draw list
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _col
///@param {Real} [_thickness=1.0]
function imguigml_drawlist_add_triangle() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument[6], ERousrData.Uint32);
	sr_buffer_write(in, argument_count > 7 ? argument[7] : 1.0, ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_add_triangle());
}
__ImguiIg(imguigml_drawlist_add_triangle)

///@function imguigml_drawlist_add_triangle_filled(_x1, _y1, _x2, _y2, _x3, _y3, _col)
///@desc Adds a filled triangle to the draw list
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _col
function imguigml_drawlist_add_triangle_filled() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument[6], ERousrData.Uint32);
	__imguigml_ext_call(_extImguiGML_drawlist_add_triangle_filled());
}
__ImguiIg(imguigml_drawlist_add_triangle_filled)

///@function imguigml_drawlist_add_circle(_center_x, _center_y, _radius, _col, [_num_segments=12], [_thickness=1.0])
///@desc Adds a circle to the drawlist
///@param {Real} _center_x
///@param {Real} _center_y
///@param {Real} _radius
///@param {Real} _col
///@param {Real} [_num_segments=12]
///@param {Float} [_thickness = 1.0]
function imguigml_drawlist_add_circle() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Uint32);
	sr_buffer_write(in, argument_count > 4 ? argument[4] : 12, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 5 ? argument[5] : 1.0, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_drawlist_add_circle()))
		return;
}
__ImguiIg(imguigml_drawlist_add_circle)

///@function imguigml_drawlist_add_circle_filled(_center_x, _center_y, _radius, _col, [_num_segments=12])
///@desc Adds a circle to the drawlist
///@param {Real} _center_x
///@param {Real} _center_y
///@param {Real} _radius
///@param {Real} _col
///@param {Real} [_num_segments=12]
function imguigml_drawlist_add_circle_filled() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Uint32);
	sr_buffer_write(in, argument_count > 4 ? argument[4] : 12, ERousrData.Int32);
	__imguigml_ext_call(_extImguiGML_drawlist_add_circle_filled());
}
__ImguiIg(imguigml_drawlist_add_circle_filled)

///@function imguigml_drawlist_add_text(_pos_x, _pos_y, _col, _text, _wrap_width) 
///@desc Adds text to the drawlist
///@param {Real} _pos_x
///@param {Real} _pos_y
///@param {Real} _col
///@param {String} _text
///@param {Real} _wrap_width
function imguigml_drawlist_add_text() {
	var in = __Imgui_in, argi = 0;
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);
	sr_buffer_write(in, argument[argi++], ERousrData.String);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_add_text());
}
__ImguiIg(imguigml_drawlist_add_text)

///@function imguigml_drawlist_add_surface(_surface, _x, _y, [_width=undefined], [_height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [color=c_white])
///@param {Real} _surface             surface
///@param {Real} _x                   x
///@param {Real} _y                   y
///@param {Real} [_width=undefined]   width uses surface_get_width if undefined
///@param {Real} [_height=undefined]  height uses surface_get_height if undefined
///@param {Real} [_u0=0.0]            texture u0
///@param {Real} [_v0=0.0]            texture v0
///@param {Real} [_u1=1.0]            texture u1
///@param {Real} [_v1=1.0]            texture v1
///@param {Real} [_col=c_white]       image_blend
function imguigml_drawlist_add_surface() {
	var argi = 0,
		surface = argument[argi++],
		x1 = argument[argi++],
		y1 = argument[argi++],
		x2 = x1,
		y2 = y1,
		width = (argument_count > 3) ? argument[argi++] : undefined,
		height = (argument_count > 4) ? argument[argi++] : undefined,
		texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface),
		_exists = surface_exists(surface);
	
	if is_undefined(width)  width =  (_exists) ? surface_get_width(surface)  : 0;
	if is_undefined(height) height = (_exists) ? surface_get_height(surface) : 0;

	x2 += width;
	y2 += height;

	__imguigml_drawlist_add_image(texture_id,
					//Coords
					x1, y1, x2, y2,
					//UVs
					argument_count > 5 ? argument[argi++] : 0.0, 
					argument_count > 6 ? argument[argi++] : 0.0, 
					argument_count > 7 ? argument[argi++] : 1.0, 
					argument_count > 8 ? argument[argi++] : 1.0, 
					//Color
					argument_count > 9 ? argument[argi++] : 0xFFFFFFFF);
}
__ImguiIg(imguigml_drawlist_add_surface)

///@function imguigml_drawlist_add_surface_quad(surface, _x1, _y1, _x2, _y2, x3, _y3, _x4, _y4, [_u1=0], [_v1=0], [_u2=1], [_v2=0], [_u3=1], [_v3=1], [_u4=0], [_v4=1], [_col=c_white])
///@desc Adds an image quad to the draw list 
///@param {Real} _surface
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2 
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y4
///@param {Real} [_col=c_white]
///@param {Real} [_u1=0] 
///@param {Real} [_v1=0] 
///@param {Real} [_u2=1] 
///@param {Real} [_v2=0]
///@param {Real} [_u3=1]
///@param {Real} [_v3=1]
///@param {Real} [_u4=0]
///@param {Real} [_v4=1]
function imguigml_drawlist_add_surface_quad() {
	var argi = 0,
		surface = argument[argi++],
		x1 = argument[argi++],
		y1 = argument[argi++],
		x2 = argument[argi++],
		y2 = argument[argi++],
		x3 = argument[argi++],
		y3 = argument[argi++],
		x4 = argument[argi++],
		y4 = argument[argi++],
		col = (argument_count > 9) ? argument[argi++] : 0xFFFFFFFF,
		u1 = (argument_count > 10) ? argument[argi++] : 0,
		v1 = (argument_count > 11) ? argument[argi++] : 0,
		u2 = (argument_count > 12) ? argument[argi++] : 1,
		v2 = (argument_count > 13) ? argument[argi++] : 0,
		u3 = (argument_count > 14) ? argument[argi++] : 1,
		v3 = (argument_count > 15) ? argument[argi++] : 1,
		u4 = (argument_count > 16) ? argument[argi++] : 0,
		v4 = (argument_count > 17) ? argument[argi++] : 1,
		texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface);

	__imguigml_drawlist_add_image_quad(texture_id, x1, y1, x2, y2, x3, y3, x4, y4, u1, v1, u2, v2, u3, v3, u4, v4, col);
}
__ImguiIg(imguigml_drawlist_add_surface_quad)

///@function imguigml_drawlist_add_sprite(_sprite_index, _sub_img, _x, _y, [_width=undefined], [_height=undefined], [_col=c_white])
///@desc Adds an image to the draw list 
///@param {Real} _sprite_index
///@param {Real} _image_index
///@param {Real} _x
///@param {Real} _y
///@param {Real} [_width=undefined]
///@param {Real} [_height=undefined] 
///@param {Real} [_col=c_white]
function imguigml_drawlist_add_sprite() {

	var argi = 0,
		sprite = argument[argi++],
		sub_img = argument[argi++],
		x1 = argument[argi++],
		y1 = argument[argi++],
		width = (argument_count > 4)  ? argument[argi++] : undefined,
		height = (argument_count > 5) ? argument[argi++] : undefined,
		color = (argument_count > 6) ? argument[argi++] : 0xFFFFFFFF,

	with(ImGuiGML) {
	  var cached     = sr_sprite_cache_push_sprite(Sprite_cache, sprite, sub_img);
	  var uvs        = sr_sprite_cache_get_uvs(Sprite_cache, cached);
	  var texture_id = __imguigml_texture_id(sr_sprite_cache_get_surface(Sprite_cache, cached), EImGuiGML_TextureType.Surface);
  
	  width  = is_undefined(width)  ? sprite_get_width(sprite)  : width;
	  height = is_undefined(height) ? sprite_get_height(sprite) : height;
  
	  var uv1 = uvs[0],
	      uv2 = uvs[1];
			
	  var u1 = uv1[0];
	  var v1 = uv1[1];
	  var u2 = uv2[0];
	  var v2 = uv2[1];
  
		var x2 = x1 + width,
	      y2 = y1 + height; 

	  __imguigml_drawlist_add_image(texture_id, x1, y1, x2, y2, u1, v1, u2, v2, color);
	}
}
__ImguiIg(imguigml_drawlist_add_sprite)

///@function imguigml_drawlist_add_polyline(_points, _col, [_closed=true], [_thickness=1.0], [_anti_aliased=true])
///@desc add a line in a polygonal shape to the draw list
///@param {Array:[_x, _y]} _points      an array of points, each point being an array: [x, y]
///@param {Real} _col                   
///@param {Real} [_closed=true]         is the shape closed?
///@param {Real} [_thickness=1.0]
function imguigml_drawlist_add_polyline() {
	var in = __Imgui_in, argi = 0;

	//Points
	var _points = argument[argi++],
		_num_points = array_length(_points);

	sr_buffer_write(in, _num_points, ERousrData.Int32);
	for (var i = 0; i < _num_points; ++i) {
	  var pt = _points[i];
	  sr_buffer_write(in, pt[0], ERousrData.Float); 
	  sr_buffer_write(in, pt[1], ERousrData.Float);
	}

	//Color
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);

	//Optionals
	sr_buffer_write(in, argument_count > 2 ? argument[argi++] : true, ERousrData.Bool);
	sr_buffer_write(in, argument_count > 3 ? argument[argi++] : 1.0, ERousrData.Float);

	__imguigml_ext_call(_extImguiGML_drawlist_add_polyline());
}
__ImguiIg(imguigml_drawlist_add_polyline)

///@function imguigml_drawlist_add_convex_poly_filled(_points, _col, [_anti_aliased=true])
///@desc add filled convex polygonal shape to the draw list
///@param {Array:[_x,_y]} _points      an array of points, each point being an array: [x, y]
///@param {Real} _col                   
function imguigml_drawlist_add_convex_poly_filled() {
	var in = __Imgui_in, argi = 0;
	var _points = argument[argi++],
		_num_points = array_length(_points);
	
	//Points
	sr_buffer_write(in, _num_points, ERousrData.Int32);
	for (var i = 0; i < _num_points; ++i) {
	  var pt = _points[i];
	  sr_buffer_write(in, pt[0], ERousrData.Float); 
	  sr_buffer_write(in, pt[1], ERousrData.Float);
	}

	//Color
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);

	//Optional AA
	if(argument_count > argi){
		sr_buffer_write(in, argument[argi++], ERousrData.Bool);
	}else{
		sr_buffer_write(in, 1, ERousrData.Bool);
	}

	__imguigml_ext_call(_extImguiGML_drawlist_add_convex_poly_filled());
}
__ImguiIg(imguigml_drawlist_add_convex_poly_filled)

///@function imguigml_drawlist_add_bezier_curve(_pos_x1, _pos_y1, _curve_x1, _curve_y1, _curve_x2, _curve_y2, _pos_x2, _pos_y2, _col, _thickness, [_num_segments=0]) 
///@desc Adds a bezier curve to the drawlist
///@param {Real} _pos_x1
///@param {Real} _pos_y1
///@param {Real} _curve_x1
///@param {Real} _curve_y1
///@param {Real} _curve_x2
///@param {Real} _curve_y2
///@param {Real} _pos_x2
///@param {Real} _pos_y2
///@param {Real} _col
///@param {Real} _thickness
///@param {Real} [_num_segments=0])
function imguigml_drawlist_add_bezier_curve() {
	var in = __Imgui_in, argi = 0;
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0, ERousrData.Int32); argi++;
	__imguigml_ext_call(_extImguiGML_drawlist_add_bezier_curve());
}
__ImguiIg(imguigml_drawlist_add_bezier_curve)

///@function imguigml_drawlist_path_clear()
///@desc Clears the current path
function imguigml_drawlist_path_clear() {
	__imguigml_ext_call(_extImguiGML_drawlist_path_clear());
}
__ImguiIg(imguigml_drawlist_path_clear)

///@function imguigml_drawlist_path_line_to(_x, _y)
///@desc add a line to the current path
///@param {Real} _x
///@param {Real} _y
function imguigml_drawlist_path_line_to() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_path_line_to());
}
__ImguiIg(imguigml_drawlist_path_line_to)

///@function imguigml_drawlist_path_line_to_merge_duplicate(_x, _y)
///@desc add a line to the current path, merging any duplicate lines this creates
///@param {Real} _x
///@param {Real} _y
function imguigml_drawlist_path_line_to_merge_duplicate() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_path_line_to_merge_duplicate());
}
__ImguiIg(imguigml_drawlist_path_line_to_merge_duplicate)

///@function imguigml_drawlist_path_fill_convex(_col)
///@desc add fill the current convex shape created bhy the path
///@param {Real} _col
function imguigml_drawlist_path_fill_convex() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Uint32);
	__imguigml_ext_call(_extImguiGML_drawlist_path_fill_convex());
}
__ImguiIg(imguigml_drawlist_path_fill_convex)

///@function imguigml_drawlist_path_stroke(_col, _closed, [_thickness=1.0])
///@desc set the stroke settings for drawing paths
///@param {Real} _col
///@param {Boolean} _closed
///@param {Real} [_thickness=1.0])
function imguigml_drawlist_path_stroke() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Uint32);
	sr_buffer_write(in, argument[1], ERousrData.Bool);
	sr_buffer_write(in, argument_count > 2 ? argument[2] : 1.0, ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_path_stroke());
}
__ImguiIg(imguigml_drawlist_path_stroke)

///@function imguigml_drawlist_path_arc_to(_center_x, _center_y, _radius, _min, _max, [_num_segments=10])
///@desc Adds an arc to a path 
///@param {Real} _center_x 
///@param {Real} _center_y 
///@param {Real} _radius 
///@param {Real} _min 
///@param {Real} _max 
///@param {Real} [_num_segments=10]
function imguigml_drawlist_path_arc_to() {
	var in = __Imgui_in;
	var argi = 0;
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 10, ERousrData.Int32); argi++;
	__imguigml_ext_call(_extImguiGML_drawlist_path_arc_to());
}
__ImguiIg(imguigml_drawlist_path_arc_to)

///@function imguigml_drawlist_path_arc_to_fast(_center_x, _center_y, _radius, _min_of_12, _max_of_12)
///@desc More performant path_arc
///@param {Real} _center_x 
///@param {Real} _center_y 
///@param {Real} _radius 
///@param {Real} _min_of_12 
///@param {Real} _max_of_12
function imguigml_drawlist_path_arc_to_fast() {
	var in = __Imgui_in;
	var argi = 0;
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_drawlist_path_arc_to_fast());
}
__ImguiIg(imguigml_drawlist_path_arc_to_fast)

///@function imguigml_drawlist_path_bezier_curve_to(_x1, _y1, _x2, _y2, _x3, _y3, [_num_segments=0])
///@desc Curve path to 
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2 
///@param {Real} _y2 
///@param {Real} _x3 
///@param {Real} _y3 
///@param {Real} [_num_segments=0]
function imguigml_drawlist_path_bezier_curve_to() {
	var in = __Imgui_in, argi = 0;
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0, ERousrData.Int32);
	__imguigml_ext_call(_extImguiGML_drawlist_path_bezier_curve_to());
}
__ImguiIg(imguigml_drawlist_path_bezier_curve_to)

///@function imguigml_drawlist_path_rect(_x1, _x2, _y1, _y2, [_rounding=0.0], [_rounding_corner_flags=-1])
///@desc draw a rect on the path 
///@param {Real} _min_x
///@param {Real} _min_y
///@param {Real} _max_x 
///@param {Real} _max_y 
///@param {Real} [_rounding=0]
///@param {Real:EImGui_DrawFlags} [_round_corner_flags=0]
function imguigml_drawlist_path_rect() {
	var in = __Imgui_in, argi = 0;
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float); argi++;
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0, ERousrData.Int32); argi++;
	if (!__imguigml_ext_call(_extImguiGML_drawlist_path_rect()))
		return;
}
__ImguiIg(imguigml_drawlist_path_rect);

///@function imguigml_drawlist_channels_split(_channels_count)
///@desc merge channels
///      Channels:
///      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)
///      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)
///@param {Real} _channels_count 
function imguigml_drawlist_channels_split() {
	sr_buffer_write(__Imgui_in, argument[0], ERousrData.Int32);
	__imguigml_ext_call(_extImguiGML_drawlist_channels_split());
}
__ImguiIg(imguigml_drawlist_channels_split)

///@function imguigml_drawlist_channels_merge()
///@desc merge channels
///      Channels:
///      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)
///      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)
function imguigml_drawlist_channels_merge() {
	__imguigml_ext_call(_extImguiGML_drawlist_channels_merge());
}
__ImguiIg(imguigml_drawlist_channels_merge)

///@function imguigml_drawlist_channels_set_current(_channel_index)
///@desc merge channels
///      Channels:
///      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)
///      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)
///@param {Real} _channel_index
function imguigml_drawlist_channels_set_current() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Int32);
	__imguigml_ext_call(_extImguiGML_drawlist_channels_set_current());
}
__ImguiIg(imguigml_drawlist_channels_set_current)

///@function imguigml_drawlist_push_clip_rect(_min_x, _min_y, _max_x, _max_y, [_intersect_with_clip_plane=false])
///@desc Render-level scissoring
///@param {Real} _min_x
///@param {Real} _min_y
///@param {Real} _max_x
///@param {Real} _max_y
///@param {Boolean} [_intersect_with_clip_plane=false]
function imguigml_drawlist_push_clip_rect() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument_count > 4 ? argument[4] : false, ERousrData.Bool);
	if (!__imguigml_ext_call(_extImguiGML_drawlist_push_clip_rect()))
		return;
}
__ImguiIg(imguigml_drawlist_push_clip_rect)

///@function imguigml_drawlist_pop_clip_rect()
///@desc End Render-level scissoring
function imguigml_drawlist_pop_clip_rect() {
	__imguigml_ext_call(_extImguiGML_drawlist_pop_clip_rect());
}
__ImguiIg(imguigml_drawlist_pop_clip_rect)

///@function imguigml_drawlist_push_clip_rect_fullscreen()
///@desc Push the clip rect for the fullscreen 
function imguigml_drawlist_push_clip_rect_fullscreen() {
	if (!__imguigml_ext_call(_extImguiGML_drawlist_push_clip_rect_fullscreen()))
		return;
}
__ImguiIg(imguigml_drawlist_push_clip_rect_fullscreen);

///@function imguigml_drawlist_get_clip_rect_min()
///@desc Gets the max pos of clipping rectangle
///@returns {Array:[ _min_x, _min_y ]
function imguigml_drawlist_get_clip_rect_min() {
	if (!__imguigml_ext_call(_extImguiGML_drawlist_get_clip_rect_min()))
		return;
	var out = __Imgui_out, ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_f32);
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_drawlist_get_clip_rect_min);

///@function imguigml_drawlist_get_clip_rect_max()
///@desc Gets the max pos of clipping rectangle
///@returns {Array:[ _max_x, _max_y ]
function imguigml_drawlist_get_clip_rect_max() {
	if (!__imguigml_ext_call(_extImguiGML_drawlist_get_clip_rect_max()))
		return;
	var out = __Imgui_out, ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_f32);
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_drawlist_get_clip_rect_max)

///@function imguigml_drawlist_push_texture_id(_tex_id)
///@desc Pushes a texture to the drawlist 
///@param {Real} _tex_id
function imguigml_drawlist_push_texture_id() {
	var texture_id = __imguigml_texture_id(argument[0]);
	sr_buffer_write(__Imgui_in, texture_id, ERousrData.Uint32);
	__imguigml_ext_call(_extImguiGML_drawlist_push_texture_id());
}
__ImguiIg(imguigml_drawlist_push_texture_id)

///@function imguigml_drawlist_pop_texture_id()
///@desc Pops texture from drawlist 
function imguigml_drawlist_pop_texture_id() {
	__imguigml_ext_call(_extImguiGML_drawlist_pop_texture_id());
}
__ImguiIg(imguigml_drawlist_pop_texture_id)

///@function imguigml_drawlist_set_flags(_flags)
///@desc set the antialising flags [per primitive]
///@param {Real:EImGui_DrawListFlags} _flags
function imguigml_drawlist_set_flags(argument0) {
	var in = __Imgui_in;
	sr_buffer_write(in, argument0, ERousrData.Uint32);
	__imguigml_ext_call(_extImguiGML_drawlist_set_flags());
}
__ImguiIg(imguigml_drawlist_set_flags)

///@function imguigml_drawlist_get_flags()
///@desc get the antialising flags [per primitive]
///@returns {Real:EImGui_DrawListFlags} _flags
function imguigml_drawlist_get_flags() {
	if (!__imguigml_ext_call(_extImguiGML_drawlist_set_flags()))
		return;
	return buffer_read(__Imgui_out, buffer_u32);
}
__ImguiIg(imguigml_drawlist_get_flags)

///@function imguigml_drawlist_use_overlay()
///@desc use imgui's overlay drawlist ontop of the screen
function imguigml_drawlist_use_overlay() {
	_extImguiGML_drawlist_use_overlay();
}
__ImguiIg(imguigml_drawlist_use_overlay);

///@function imguigml_drawlist_use_window()
///@desc use imgui's active window drawlist with drawlist functions
function imguigml_drawlist_use_window() {
	_extImguiGML_drawlist_use_window();
}
__ImguiIg(imguigml_drawlist_use_window);

///@function __imguigml_drawlist_add_image_quad(_texture_id, _x1, _y1, _x2, _y2, x3, _y3, _x4, _y4, [_u1=0], [_v1=0], [_u2=1], [_v2=0], [_u3=1], [_v3=1], [_u4=0], [_v4=1], [_col=c_white])
///@desc Adds an image quad to the draw list 
///@param {Real} _texture_id created from _imguigml_texture_id
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2 
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y4
///@param {Real} [_u1=0] 
///@param {Real} [_v1=0] 
///@param {Real} [_u2=1] 
///@param {Real} [_v2=1]
///@param {Real} [_u3=1]
///@param {Real} [_v3=1]
///@param {Real} [_u4=0]
///@param {Real} [_v4=1]
///@param {Real} [_col=c_white]
///@extensionizer { "docs": false }
function __imguigml_drawlist_add_image_quad() {
	var in = __Imgui_in, argi = 0;

	//Texture
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);

	//Top Left
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);

	//Top Right
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);

	//Bottom Right
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);

	//Bottom Left
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);

	//Top Left UV
	sr_buffer_write(in, argument_count > 9  ? argument[argi++] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 10 ? argument[argi++] : 0.0, ERousrData.Float);

	//Top Right UV
	sr_buffer_write(in, argument_count > 11 ? argument[argi++] : 1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 12 ? argument[argi++] : 0.0, ERousrData.Float);

	//Bottom Right UV
	sr_buffer_write(in, argument_count > 13 ? argument[argi++] : 1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 14 ? argument[argi++] : 1.0, ERousrData.Float);

	//Bottom Left UV
	sr_buffer_write(in, argument_count > 15 ? argument[argi++] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 16 ? argument[argi++] : 1.0, ERousrData.Float);

	//Colour
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0xFFFFFFFF, ERousrData.Uint32);

	__imguigml_ext_call(_extImguiGML_drawlist_add_image_quad());
}
__ImguiIg(__imguigml_drawlist_add_image_quad)

///@function __imguigml_drawlist_add_image(_texture_id, _x1, _y1, _x2, _y2, [_u1=0], [_v1=0], [_u2=1], [_v2=1], [_col=c_white])
///@desc Adds an image to the draw list 
///@param {Real} _texture_id   texture id is a generated id from __imguigml_texture_id
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2  
///@param {Real} _y2 
///@param {Real} [_u1=0] 
///@param {Real} [_v1=0] 
///@param {Real} [_u2=1] 
///@param {Real} [_v2=1] 
///@param {Real} [_col=c_white]
///@extensionizer { "docs": false }
function __imguigml_drawlist_add_image() {
	var in = __Imgui_in, argi = 0;

	//Texture
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);

	//Coords 
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);

	//UVs
	sr_buffer_write(in, argument_count > 5 ? argument[argi++] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 6 ? argument[argi++] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 7 ? argument[argi++] : 1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 8 ? argument[argi++] : 1.0, ERousrData.Float);

	//Colour
	sr_buffer_write(in, argument_count > 9 ? argument[argi++] : 0xFFFFFFFF, ERousrData.Uint32);
	__imguigml_ext_call(_extImguiGML_drawlist_add_image());
}
__ImguiIg(__imguigml_drawlist_add_image)

#endregion
#region io functions

///@function imguigml_io_ini_saving_rate([_time])
///@desc Maximum time between saving positions/sizes to .ini file, in seconds.
///@param {Real} [_time]  sets time to use if passed (= 5.0)
///@param returns { Real } current time to use 
function imguigml_io_ini_saving_rate() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_ini_saving_rate()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_ini_saving_rate()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_f32);
}
__ImguiIg(imguigml_io_ini_saving_rate)

///@function imguigml_io_mouse_double_click_time([_time])
///@desc Time for a double-click, in seconds.
///@param {Real} [_time]  sets time to use if passed (= 0.30)
///@param returns { Real } current time to use 
function imguigml_io_mouse_double_click_time() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_mouse_double_click_time()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_mouse_double_click_time()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_f32);
}
__ImguiIg(imguigml_io_mouse_double_click_time)

///@function imguigml_io_mouse_double_click_max_dist([_distance])
///@desc Distance threshold to stay in to validate a double-click, in pixels.
///@param {Real} [_distance]  sets max distance if passed (= 6.0)
///@param returns { Real } current max distance
function imguigml_io_mouse_double_click_max_dist() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_mouse_double_click_max_dist()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_mouse_double_click_max_dist()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_f32);
}
__ImguiIg(imguigml_io_mouse_double_click_max_dist)

///@function imguigml_io_mouse_drag_threshold([_distance])
///@desc Distance threshold before considering we are dragging
///@param {Real} [_distance]  sets distance threshold if passed (= 6.0)
///@param returns { Real } current distance threshold
function imguigml_io_mouse_drag_threshold() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_mouse_drag_threshold()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_mouse_drag_threshold()))
		return;
	
	var out = __Imgui_out;
	return buffer_read(out, buffer_f32);
}
__ImguiIg(imguigml_io_mouse_drag_threshold)

///@function imguigml_io_key_repeat_delay([_time])
///@desc When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
///@param {Real} [_time] sets time before repeating if passed (= 0.250)
///@param returns { Real } current time
function imguigml_io_key_repeat_delay() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_key_repeat_delay()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_key_repeat_delay()))
		return;	
	var out = __Imgui_out;
	return buffer_read(out, buffer_f32);
}
__ImguiIg(imguigml_io_key_repeat_delay)

///@function imguigml_io_key_repeat_rate([_time])
///@desc When holding a key/button, rate at which it repeats, in seconds.
///@param {Real} [_time] sets repeat rate if passed (0.050)
///@param returns { Real } current repeat rate
function imguigml_io_key_repeat_rate() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_key_repeat_rate()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_key_repeat_rate()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_f32);
}
__ImguiIg(imguigml_io_key_repeat_rate)

///@function imguigml_io_font_global_scale([_scale])
///@desc Global scale all fonts
///@param {Real} [_scale] sets scale for all fonts if passed (= 1.0)
///@param returns { Real } current font scale
function imguigml_io_font_global_scale() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_font_global_scale()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_font_global_scale()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_f32);
}
__ImguiIg(imguigml_io_font_global_scale);

///@function imguigml_io_font_allow_user_scaling([_boolean])
///@desc Allow user scaling text of individual window with CTRL+Wheel.
///@param {Boolean} [_boolean] sets allow user scaling if passed (=false)
///@param returns { Boolean } current value
function imguigml_io_font_allow_user_scaling() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0], ERousrData.Bool);
		if (!__imguigml_ext_call(_extImguiGML_set_font_allow_user_scaling()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_font_allow_user_scaling()))
		return;
	var out = __Imgui_out;
	return (buffer_read(out, buffer_s8) != 0);
}
__ImguiIg(imguigml_io_font_allow_user_scaling)

///@function imguigml_io_display_framebuffer_scaling([_x=1.0],[_y=1.0])
///@desc **NOTE: DOES NOTHING FOR NOW** For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui.
///@param {Float} [_x=1.0] sets x value if passed
///@param {Float} [_y=1.0] sets y value if passed
///@param returns { Array } [x value, y value]
function imguigml_io_display_framebuffer_scaling() {
	if(argument_count > 0){
		var in = __Imgui_in,
			_x = (argument_count > 0) ? argument[0] : 1.0,
			_y = (argument_count > 1) ? argument[1] : 1.0;
		
		sr_buffer_write(in, _x, ERousrData.Float);
		sr_buffer_write(in, _y, ERousrData.Float);
		if (!__imguigml_ext_call(_extImguiGML_set_display_framebuffer_scaling()))
			return;
		return [_x, _y];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_display_framebuffer_scaling()))
		return;
	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_f32);
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_io_display_framebuffer_scaling)

///@function imguigml_io_osx_behaviors([_boolean])
///@desc OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start 
/// and End using Cmd+Arrows instead of Home/End, ouble click selects by word instead of selecting whole text, 
/// Multi-selection in lists uses Cmd/Super instead of Ctrl
///@param {Boolean} [_boolean]  boolean (=IsApple)
///@param returns { Boolean } current value 
function imguigml_io_osx_behaviors() {
	if(argument_count > 0){
		var in = __Imgui_in;
		sr_buffer_write(in, argument[0] ? 1 : 0, ERousrData.Int8);
		if (!__imguigml_ext_call(_extImguiGML_set_osx_behaviors()))
			return;
		return argument[0];
	}

	if (!__imguigml_ext_call(_extImguiGML_get_osx_behaviors()))
		return;
	var out = __Imgui_out;
	return (buffer_read(out, buffer_s8)!=0);
}
__ImguiIg(imguigml_io_osx_behaviors)

///@function imguigml_io_ini_filename([_path])
///@desc Path to .ini file. NULL to disable .ini saving.
///@param {String} [_filename]  sets ini filename if passed
///@returns {String} current ini filename
function imguigml_io_ini_filename() {
	if (argument_count > 0) {
	  var in = __Imgui_in;
	  sr_buffer_write(in, argument[0], ERousrData.String);
	  if (!__imguigml_ext_call(_extImguiGML_set_ini_filename()))
			return;
	  return argument[0];
	} 

	if (!__imguigml_ext_call(_extImguiGML_get_ini_filename()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_string);
}
__ImguiIg(imguigml_io_ini_filename)

///@function imguigml_io_log_filename([_path])
///@desc Path to .log file - default parameter to ImGui::LogToFile when no file is specified. defaults to "imgui_log.txt
///@param {String} [_path]  sets path if passed
///@returns {String} current log filename path
function imguigml_io_log_filename() {
	if (argument_count > 0) {
	  var in = __Imgui_in;
	  sr_buffer_write(in, argument[0], ERousrData.String);
	  if (!__imguigml_ext_call(_extImguiGML_set_log_filename()))
			return;
	  return argument[0];
	} 

	if (!__imguigml_ext_call(_extImguiGML_get_log_filename()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_string); 
}
__ImguiIg(imguigml_io_log_filename)

///@function imguigml_io_cursor_blink([_enabled])
///@desc allow input currsors to blink
///@param {Bool} [_enabled]   if passed, sets cursor blink to `_enabled`
///@returns {Bool} 
function imguigml_io_cursor_blink() {
	if (argument_count > 0) {
	  var in = __Imgui_in;
	  sr_buffer_write(in, argument[0], ERousrData.Int8);
	  if (!__imguigml_ext_call(_extImguiGML_set_cursor_blink()))
			return;
	  return argument[0];
	} 

	if (!__imguigml_ext_call(_extImguiGML_get_cursor_blink()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_string);
}
__ImguiIg(imguigml_io_cursor_blink)

#endregion
#region mem functions

///@function imguigml_mem(key, [default_value])
///@desc Get a value from the memory map
///@param {String} key
///@param {Real|String} [default_value] 
///@returns {Real|String|undefined}
function imguigml_mem(_key, _default_value = undefined) {
	var _value = global.__imguigml.memory[? _key];

	if (is_undefined(_value) && !is_undefined(_default_value)) {
		global.__imguigml.memory[? _key] = _default_value;
		return _default_value;
	}
	
	return _value;	
}
__ImguiIg(imguigml_mem)

///@function imguigml_memset(_key, _val)
///@desc Sets a value in the memory map
///@param {String} key  
///@param {*} _val
///@returns {*} _val
function imguigml_memset(_key, _value) {
	global.__imguigml.memory[? _key] = _value;
	return _value;
}
__ImguiIg(imguigml_memset)

///@function imguigml_secure_load_mem(filename)
///@desc loads imguigml memory from the filesystem
///@param filename {String} the path to use 
function imguigml_secure_load_mem(_filename) {
	if (file_exists(_filename)){
		ds_map_destroy(global.__imguigml.memory);
		global.__imguigml.memory = ds_map_secure_load(_filename);
	}
}
__ImguiIg(imguigml_secure_load_mem)

///@function imguigml_secure_save_mem(filename)
///@desc saves imguigml memory onto the filesystem
///@param filename {String} the path to use 
function imguigml_secure_save_mem(_filename) {
	ds_map_secure_save(global.__imguigml.memory, _filename);
}
__ImguiIg(imguigml_secure_save_mem)

#endregion
