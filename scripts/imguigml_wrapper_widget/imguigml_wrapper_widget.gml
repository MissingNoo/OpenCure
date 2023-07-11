///@desc imguigml wrapper functions for widgets

#region standard widgets 

///@function imguigml_button(_label, [_size_x=0], [_size_y=0])
///@desc ImGui::Button()
///@param {String} _label        button label
///@param {Real} [_size_x=0.0]   width
///@param {Real} [_size_y=0.0]   height
///@returns {Boolean} pressed
function imguigml_button() {
	var in = __Imgui_in;
	sr_buffer_write(in, string(argument[0]));                                   
	sr_buffer_write(in, argument_count > 1 ? argument[1] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_button()))
		return;
	return buffer_read(__Imgui_out, buffer_s8) != 0;
}
__ImguiIg(imguigml_button)

///@function imguigml_small_button(_label)
///@desc button with FramePadding=(0,0) to easily embed within text
///@param {String} _label   button label
///@returns {Boolean}
function imguigml_small_button() {
	sr_buffer_write(__Imgui_in, string(argument[0]));                                   
	if (!__imguigml_ext_call(_extImguiGML_small_button()))
		return;
	return buffer_read(__Imgui_out, buffer_s8) != 0;
}
__ImguiIg(imguigml_small_button)

///@function imguigml_invisible_button(_str_id, [_size_x=0], [_size_y=0])
///@desc ImGui::InvisibleButton()
///@param {String} _str_id       string id
///@param {Real} [_size_x=0.0]   width
///@param {Real} [_size_y=0.0]   height
///@returns {Boolean}
function imguigml_invisible_button() {
	var in = __Imgui_in;
	sr_buffer_write(in, string(argument[0]));                                   
	sr_buffer_write(in, argument_count > 2 ? argument[1] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_invisible_button()))
		return;
	return buffer_read(__Imgui_out, buffer_s8) != 0;
}
__ImguiIg(imguigml_invisible_button);

///@function imguigml_image(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::Image()
///@param {Real} _texture_id       texture id
///@param {Real} _size_x           width
///@param {Real} _size_y           height
///@param {Real} [_u0=0.0]         texture u0
///@param {Real} [_v0=0.0]         texture v0
///@param {Real} [_u1=1.0]         texture u1
///@param {Real} [_v1=1.0]         texture v1
///@param {Real} [_tint_r=1.0]     tint color r
///@param {Real} [_tint_g=1.0]     tint color g
///@param {Real} [_tint_b=1.0]     tint color b
///@param {Real} [_tint_a=1.0]     tint color a
///@param {Real} [_border_r=0.0]   border color r
///@param {Real} [_border_g=0.0]   border color g
///@param {Real} [_border_b=0.0]   border color b
///@param {Real} [_border_a=0.0]   border color a
function imguigml_image() {
	var texture_id = __imguigml_texture_id(argument[0], EImGuiGML_TextureType.Texture);
	__imguigml_image(texture_id, 
	                  argument[1],
	                  argument[2],
	                  argument_count > 4  ? argument[3] : 0.0, 
	                  argument_count > 4  ? argument[4] : 0.0, 
	                  argument_count > 6  ? argument[5] : 1.0, 
	                  argument_count > 6  ? argument[6] : 1.0, 
	                  argument_count > 10 ? argument[7]  : 1.0, 
	                  argument_count > 10 ? argument[8]  : 1.0, 
	                  argument_count > 10 ? argument[9]  : 1.0, 
	                  argument_count > 10 ? argument[10] : 1.0, 
	                  argument_count > 14 ? argument[11] : 0.0, 
	                  argument_count > 14 ? argument[12] : 0.0, 
	                  argument_count > 14 ? argument[13] : 0.0, 
	                  argument_count > 14 ? argument[14] : 0.0); 
}
__ImguiIg(imguigml_image);

///@function imguigml_surface(_surface, [width=undefined], [height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::Image()
///@param {Real} _surface            surface
///@param {Real} [width=undefined]   width - will use surface_width if undefined
///@param {Real} [height=undefined]  height - will use surface_height if undefined
///@param {Real} [_u0=0.0]           texture u0
///@param {Real} [_v0=0.0]           texture v0
///@param {Real} [_u1=1.0]           texture u1
///@param {Real} [_v1=1.0]           texture v1
///@param {Real} [_tint_r=1.0]       tint color r
///@param {Real} [_tint_g=1.0]       tint color g
///@param {Real} [_tint_b=1.0]       tint color b
///@param {Real} [_tint_a=1.0]       tint color a
///@param {Real} [_border_r=0.0]     border color r
///@param {Real} [_border_g=0.0]     border color g
///@param {Real} [_border_b=0.0]     border color b
///@param {Real} [_border_a=0.0]     border color a
function imguigml_surface() {
	var argi=0,
		surface = argument[argi++],
		width = (argument_count > 1)  ? argument[argi++] : undefined,
		height = (argument_count > 2) ? argument[argi++] : undefined,
		texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface),
		_exists = surface_exists(surface);
	
	if is_undefined(width)  width =  (_exists) ? surface_get_width(surface)  : 0;
	if is_undefined(height) height = (_exists) ? surface_get_height(surface) : 0;


	var texture_id = __imguigml_texture_id(argument[0], EImGuiGML_TextureType.Surface);
	__imguigml_image(texture_id,
					  //Size 
	                  width,
	                  height,
					  //uv0
	                  argument_count > 4  ? argument[argi++]  : 0.0, 
	                  argument_count > 4  ? argument[argi++]  : 0.0, 
	                  //uv1
					  argument_count > 6  ? argument[argi++]  : 1.0, 
	                  argument_count > 6  ? argument[argi++]  : 1.0, 
	                  //tint
					  argument_count > 10  ? argument[argi++]  : 1.0,
	                  argument_count > 10  ? argument[argi++]  : 1.0, 
	                  argument_count > 10  ? argument[argi++]  : 1.0, 
	                  argument_count > 10  ? argument[argi++] : 1.0, 
					  //border
	                  argument_count > 14 ? argument[argi++] : 0.0, 
	                  argument_count > 14 ? argument[argi++] : 0.0, 
	                  argument_count > 14 ? argument[argi++] : 0.0, 
	                  argument_count > 14 ? argument[argi++] : 0.0); 
}
__ImguiIg(imguigml_surface)

///@function imguigml_sprite(_sprite_index, _sub_img, [_width=undefined], [_height=undefiend], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::Image()
///@param {Real} _sprite_index         sprite
///@param {Real} _sub_img              sprite_index
///@param {Real} [_width=undefined]    width will use sprite_get_width if undefined
///@param {Real} [_height=undefined]   height will use sprite_get_height if undefined
///@param {Real} [_tint_r=1.0]         tint color r
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@param {Real} [_border_r=0.0]       border color r
///@param {Real} [_border_g=0.0]       border color g
///@param {Real} [_border_b=0.0]       border color b
///@param {Real} [_border_a=0.0]       border color a
function imguigml_sprite() {
	var argi = 0,
		sprite = argument[argi++],
		sub_img = argument[argi++],
		width = (argument_count > 2) ? argument[argi++] : undefined,
		height = (argument_count > 3) ? argument[argi++] : undefined,
		tintr = (argument_count > 4) ? argument[argi++] : 1.0, 
		tintg = (argument_count > 5) ? argument[argi++] : 1.0, 
		tintb = (argument_count > 6) ? argument[argi++] : 1.0, 
		tinta = (argument_count > 7) ? argument[argi++] : 1.0,
		borderr = (argument_count > 8)  ? argument[argi++] : 0,
		borderg = (argument_count > 9)  ? argument[argi++] : 0,
		borderb = (argument_count > 10) ? argument[argi++] : 0,
		bordera = (argument_count > 11) ? argument[argi++] : 0;
	
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
  
		imguigml_push_id(string(sprite) + "_" + string(sub_img));
	  __imguigml_image(texture_id, width, height, u1, v1, u2, v2, tintr, tintg, tintb, tinta, borderr, borderg, borderb, bordera);
		imguigml_pop_id();
	}
}
__ImguiIg(imguigml_sprite)

///@function imguigml_image_button(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
///@desc ImGui::ImageButton()
///@param {Real} _texture_id           texture id
///@param {Real} _size_x               width
///@param {Real} _size_y               height
///@param {Real} [_u0=0.0]             texture u0
///@param {Real} [_v0=0.0]             texture v0
///@param {Real} [_u1=1.0]             texture u1
///@param {Real} [_v1=1.0]             texture v1
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           bg color r
///@param {Real} [_bg_g=0.0]           bg color g
///@param {Real} [_bg_b=0.0]           bg color b
///@param {Real} [_bg_a=0.0]           bg color a
///@param {Real} [_tint_r=1.0]         tint color r 
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
function imguigml_image_button() {
	var texture_id = __imguigml_texture_id(argument[0], EImGuiGML_TextureType.Texture);
	return __imguigml_image_button(texture_id,
	                  // Size
	                  argument[1],
	                  argument[2],
	                  // uv0
	                  argument_count > 4 ? argument[3] : 0.0, 
	                  argument_count > 4 ? argument[4] : 0.0, 
	                  // uv0
	                  argument_count > 6 ? argument[5] : 1.0, 
	                  argument_count > 6 ? argument[6] : 1.0, 
	                  // frame_padding
	                  argument_count > 7 ? argument[7] : -1,  
	                  // bg
	                  argument_count > 11 ? argument[8]  : 0.0, 
	                  argument_count > 11 ? argument[9]  : 0.0, 
	                  argument_count > 11 ? argument[10] : 0.0, 
	                  argument_count > 11 ? argument[11] : 0.0, 
	                  // tint
	                  argument_count > 15 ? argument[12] : 1.0, 
	                  argument_count > 15 ? argument[13] : 1.0, 
	                  argument_count > 15 ? argument[14] : 1.0, 
	                  argument_count > 15 ? argument[15] : 1.0);
}
__ImguiIg(imguigml_image_button)

///@function imguigml_surface_button(_surface, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
///@desc Add an ImGui button that uses a surface for its appearance
///@param {Real} _surface              surface index
///@param {Real} [width=undefined]     width - will use surface_width if undefined
///@param {Real} [height=undefined]    height - will use surface_height if undefined
///@param {Real} [_u0=0.0]             texture u0
///@param {Real} [_v0=0.0]             texture v0
///@param {Real} [_u1=1.0]             texture u1
///@param {Real} [_v1=1.0]             texture v1
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           bg color r
///@param {Real} [_bg_g=0.0]           bg color g
///@param {Real} [_bg_b=0.0]           bg color b
///@param {Real} [_bg_a=0.0]           bg color a
///@param {Real} [_tint_r=1.0]         tint color r 
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
function imguigml_surface_button() {
	var argi=0,
		surface = argument[argi++],
		width = (argument_count > 1)  ? argument[argi++] : undefined,
		height = (argument_count > 2) ? argument[argi++] : undefined,
		texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface),
		_exists = surface_exists(surface);
	
	if is_undefined(width)  width =  (_exists) ? surface_get_width(surface)  : 0;
	if is_undefined(height) height = (_exists) ? surface_get_height(surface) : 0;


	return __imguigml_image_button(texture_id,
	                   // Size
	                   width,
					   height,
	                   // uv0
	                   argument_count > 4 ? argument[argi++] : 0.0, 
	                   argument_count > 4 ? argument[argi++] : 0.0, 
	                   // uv0
	                   argument_count > 6 ? argument[argi++] : 1.0, 
	                   argument_count > 6 ? argument[argi++] : 1.0, 
	                   // frame_padding
	                   argument_count > 7 ? argument[argi++] : -1,  
	                   // bg
	                   argument_count > 11 ? argument[argi++] : 0.0, 
	                   argument_count > 11 ? argument[argi++] : 0.0, 
	                   argument_count > 11 ? argument[argi++] : 0.0, 
	                   argument_count > 11 ? argument[argi++] : 0.0, 
	                   // tint
	                   argument_count > 15 ? argument[argi++] : 1.0, 
	                   argument_count > 15 ? argument[argi++] : 1.0, 
	                   argument_count > 15 ? argument[argi++] : 1.0, 
	                   argument_count > 15 ? argument[argi++] : 1.0);
}
__ImguiIg(imguigml_surface_button)

///@function imguigml_sprite_button(_sprite_index, _sub_img, [_width=undefined], [_height=undefiend], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
///@desc ImGui::ImageButton()
///@param {Real} _sprite_index         sprite
///@param {Real} _sub_img              image_index
///@param {Real} [_width=undefined]    width will use sprite_get_width if undefined
///@param {Real} [_height=undefined]   height will use sprite_get_height if undefined
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           bg color r
///@param {Real} [_bg_g=0.0]           bg color g
///@param {Real} [_bg_b=0.0]           bg color b
///@param {Real} [_bg_a=0.0]           bg color a
///@param {Real} [_tint_r=1.0]         tint color r
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
function imguigml_sprite_button() {
	var argi = 0,
		sprite = argument[argi++],
		sub_img = argument[argi++],
		width = (argument_count > 2) ? argument[argi++] : undefined,
		height = (argument_count > 3) ? argument[argi++] : undefined,
		frame_padding = (argument_count > 4) ? argument[argi++] : -1,
		bgr = (argument_count > 5) ? argument[argi++] : 0,
		bgg = (argument_count > 6) ? argument[argi++] : 0,
		bgb = (argument_count > 7) ? argument[argi++] : 0,
		bga = (argument_count > 8) ? argument[argi++] : 0, 
		tintr = (argument_count > 9)  ? argument[argi++] : 1.0, 
		tintg = (argument_count > 10) ? argument[argi++] : 1.0, 
		tintb = (argument_count > 11) ? argument[argi++] : 1.0, 
		tinta = (argument_count > 12) ? argument[argi++] : 1.0,

	if is_undefined(width) width = sprite_get_width(sprite);
	if is_undefined(height) height = sprite_get_height(sprite);

	var ret = false;
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
  
		imguigml_push_id(string(sprite) + "_" + string(sub_img));
	  ret = __imguigml_image_button(texture_id, width, height, u1, v1, u2, v2, frame_padding, bgr, bgg, bgb, bga, tintr, tintg, tintb, tinta);
		imguigml_pop_id();
	}

	return ret;
}
__ImguiIg(imguigml_sprite_button)

///@function imguigml_checkbox(_label, _val)
///@desc ImGui::Checkbox()
///@param {String}  _label    button label
///@param {Boolean} _val      checked    
///@returns {Array: [_changed, _val] } checked
function imguigml_checkbox() {
	var in = __Imgui_in;
	sr_buffer_write(in, string(argument[0]));                                   
	sr_buffer_write(in, argument[1], ERousrData.Int8);
	if (!__imguigml_ext_call(_extImguiGML_checkbox()))
		return;
	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s8) != 0;
	return ret;
}
__ImguiIg(imguigml_checkbox)

///@function imguigml_checkbox_flags(_label, _flags, _flag_val)
///@desc Show a checkbox with multiple flags
///@param {String}  _label     button label
///@param {Real}    _flags     check flags
///@param {Real}    _flag_val  current value of flags
///@returns {Real} _flags result
function imguigml_checkbox_flags() {
	var in = __Imgui_in;
	sr_buffer_write(in, string(argument[0]));                                   
	sr_buffer_write(in, argument[1], ERousrData.Uint32);
	sr_buffer_write(in, argument[2], ERousrData.Uint32);
	if (!__imguigml_ext_call(_extImguiGML_checkbox_flags()))
		return;
	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_u32) != 0;
	return ret;
}
__ImguiIg(imguigml_checkbox_flags)

///@function imguigml_radio_button(_label, _active, [_current_val])
///@desc Show a radio button (multiple choice, single answer)
///@param {String}        _label          button label
///@param {Real|Boolean}  _activeOrVal    pass true/false or the index of the active radio button in a group
///@param {Real}          [_current_val]  current value of radio buttons, if passed, will return the index of the active radio in a group
///@returns {Boolean|[Boolean, Real]} pressed, or if a value is passed, the value of the radio button.
function imguigml_radio_button() {
	var in = __Imgui_in;
	sr_buffer_write(in, string(argument[0]), ERousrData.String); 

	if (argument_count == 2) {
	  sr_buffer_write(in, argument[1] ? 1 : 0, ERousrData.Int8);
	  if (!__imguigml_ext_call(_extImguiGML_radio_button()))
			return;
		
	  return buffer_read(__Imgui_out, buffer_s8) != 0;
	} else if (argument_count == 3) {
	  sr_buffer_write(in, argument[1], ERousrData.Int32);
	  sr_buffer_write(in, argument[2], ERousrData.Int32);
	  if (!__imguigml_ext_call(_extImguiGML_radio_button()))
			return;	

		var out = __Imgui_out;
		var pressed = buffer_read(out, buffer_s8) != 0;
		var val = buffer_read(__Imgui_out, buffer_s32);
	  return [ pressed, val ];
	} 
}
__ImguiIg(imguigml_radio_button)

///@function imguigml_plot_lines(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)]
///@desc Plots a line graph, index as x axis values for y
///@param {String} _label
///@param {Array}  _values
///@param {Real}   [_values_offset=0]
///@param {String} [_overlay=undefined]
///@param {Real}   [_scale_min=undefined]
///@param {Real}   [_scale_max=undefined]
///@param {Real}   [_graph_size_x=0]
///@param {Real}   [_graph_size_y=0]
///@param {Real}   [_stride=sizeof(float)]
function imguigml_plot_lines() {
	var in = __Imgui_in;

	var _label         = argument[0];
	var _items         = argument[1];
	var _values_offset = argument_count > 2 ? argument[2] : 0;
	var _overlay       = argument_count > 3 ? argument[3] : undefined; if (!is_string(_overlay)) _overlay = undefined;	
	var _scale_min     = argument_count > 4 ? argument[4] : undefined;
	var _scale_max     = argument_count > 5 ? argument[5] : undefined;
	var _graph_size_x  = argument_count > 6 ? argument[6] : 0;
	var _graph_size_y  = argument_count > 7 ? argument[7] : 0;
	var _stride        = argument_count > 8 ? argument[8] : 4;
	var num_items = array_length(_items);

	sr_buffer_write(in, _label);
	sr_buffer_write(in, num_items, ERousrData.Int32);
	var i = 0; repeat(num_items) sr_buffer_write(in, _items[i++], ERousrData.Float);
	sr_buffer_write(in, _values_offset, ERousrData.Int32);
	sr_buffer_write(in, _overlay   == undefined ? 0 : _overlay,   _overlay   == undefined ? ERousrData.Int8 : ERousrData.String);
	sr_buffer_write(in, _scale_min == undefined ? 0 : _scale_min, _scale_min == undefined ? ERousrData.Int8 : ERousrData.Float);
	sr_buffer_write(in, _scale_max == undefined ? 0 : _scale_max, _scale_max == undefined ? ERousrData.Int8 : ERousrData.Float);
	sr_buffer_write(in, _graph_size_x, ERousrData.Float);
	sr_buffer_write(in, _graph_size_y, ERousrData.Float);
	sr_buffer_write(in, _stride,       ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_plot_lines());
}
__ImguiIg(imguigml_plot_lines)

///@function imguigml_plot_histogram(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)]
///@desc Plots a histogram.
///@param {String} _label
///@param {Array}  _values
///@param {Real}   [_values_offset=0]
///@param {String} [_overlay=undefined]
///@param {Real}   [_scale_min=undefined]
///@param {Real}   [_scale_max=undefined]
///@param {Real}   [_graph_size_x=0]
///@param {Real}   [_graph_size_y=0]
///@param {Real}   [_stride=sizeof(float)]
function imguigml_plot_histogram() {
	var in = __Imgui_in;

	var _label         = argument[0];
	var _items         = argument[1];
	var _values_offset = argument_count > 2 ? argument[2] : 0;
	var _overlay       = argument_count > 3 ? argument[3] : undefined; if (!is_string(_overlay)) _overlay = undefined;
	var _scale_min     = argument_count > 4 ? argument[4] : undefined;
	var _scale_max     = argument_count > 5 ? argument[5] : undefined;
	var _graph_size_x  = argument_count > 6 ? argument[6] : 0;
	var _graph_size_y  = argument_count > 7 ? argument[7] : 0;
	var _stride        = argument_count > 8 ? argument[8] : 4;
	var num_items = array_length(_items);

	sr_buffer_write(in, _label);
	sr_buffer_write(in, num_items, ERousrData.Int32);
	var i = 0; repeat(num_items) sr_buffer_write(in, _items[i++], ERousrData.Float);
	sr_buffer_write(in, _values_offset, ERousrData.Int32);
	sr_buffer_write(in, _overlay   == undefined ? 0 : _overlay,   _overlay   == undefined ? ERousrData.Int8 : ERousrData.String);
	sr_buffer_write(in, _scale_min == undefined ? 0 : _scale_min, _scale_min == undefined ? ERousrData.Int8 : ERousrData.Float);
	sr_buffer_write(in, _scale_max == undefined ? 0 : _scale_max, _scale_max == undefined ? ERousrData.Int8 : ERousrData.Float);
	sr_buffer_write(in, _graph_size_x, ERousrData.Float);
	sr_buffer_write(in, _graph_size_y, ERousrData.Float);
	sr_buffer_write(in, _stride,       ERousrData.Float);
	__imguigml_ext_call(_extImguiGML_plot_histogram());
}
__ImguiIg(imguigml_plot_histogram);

///@function imguigml_progress_bar(_fraction, [_size_x=-1.0], [_size_y=0.0], [_overlay])
///@desc
///@param {String} _fraction
///@param {Real}   [_size_x=-1.0]              < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size
///@param {Real}   [_size_y=0.0]               < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size
///@param {String} [_overlay=undefined]
function imguigml_progress_bar() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Float);
	sr_buffer_write(in, argument_count > 2 ? argument[1] : -1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 2 ? argument[2] :  0.0, ERousrData.Float);
	if (argument_count > 3 && is_string(argument[3]))
	  sr_buffer_write(in, argument[3]);

	__imguigml_ext_call(_extImguiGML_progress_bar());
}
__ImguiIg(imguigml_progress_bar);

///@function __imguigml_image(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc internal imguigml  call to draw an image using the `_texture_id` texture
///@param {Real} _texture_id       texture id is a generated id from __imguigml_texture_id
///@param {Real} _size_x           width
///@param {Real} _size_y           height
///@param {Real} [_u0=0.0]         texture u0
///@param {Real} [_v0=0.0]         texture v0
///@param {Real} [_u1=1.0]         texture u1
///@param {Real} [_v1=1.0]         texture v1
///@param {Real} [_tint_r=1.0]     tint color r
///@param {Real} [_tint_g=1.0]     tint color g
///@param {Real} [_tint_b=1.0]     tint color b
///@param {Real} [_tint_a=1.0]     tint color a
///@param {Real} [_border_r=0.0]   border color r
///@param {Real} [_border_g=0.0]   border color g
///@param {Real} [_border_b=0.0]   border color b
///@param {Real} [_border_a=0.0]   border color a
///@extensionizer { "docs": false }
function __imguigml_image() {
	var in = __Imgui_in, argi = 0;
	sr_buffer_write(in, argument[argi++], ERousrData.Uint32);

	// Size
	sr_buffer_write(in, argument[argi++], ERousrData.Float);
	sr_buffer_write(in, argument[argi++], ERousrData.Float);

	// uv0
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float); ++argi;
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float); ++argi;

	// uv1
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;

	// tint
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;

	// border
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);

	__imguigml_ext_call(_extImguiGML_image());
}

///@function __imguigml_image_button(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc Add a button using the texture stored at `_texture_id` for the appearance
///@param {Real} _texture_id           texture id
///@param {Real} _size_x               width
///@param {Real} _size_y               height
///@param {Real} [_u0=0.0]             texture u0
///@param {Real} [_v0=0.0]             texture v0
///@param {Real} [_u1=1.0]             texture u1
///@param {Real} [_v1=1.0]             texture v1
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           backgruond color r
///@param {Real} [_bg_g=0.0]           backgruond color g
///@param {Real} [_bg_b=0.0]           backgruond color b
///@param {Real} [_bg_a=0.0]           backgruond color a
///@param {Real} [_tint_r=1.0]         tint color r 
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
///@extensionizer { "docs": false }
function __imguigml_image_button() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Uint32);

	// Size
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);

	// uv0
	sr_buffer_write(in, argument_count > 4 ? argument[3] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 4 ? argument[4] : 0.0, ERousrData.Float);

	// uv0
	sr_buffer_write(in, argument_count > 6 ? argument[5] : 1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);

	// frame_padding
	sr_buffer_write(in, argument_count > 7 ? argument[7] : -1, ERousrData.Int32);

	// bg
	sr_buffer_write(in, argument_count > 11 ? argument[8]  : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 11 ? argument[9]  : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 11 ? argument[10] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 11 ? argument[11] : 0.0, ERousrData.Float);
  
	// tint
	sr_buffer_write(in, argument_count > 15 ? argument[12] : 1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 15 ? argument[13] : 1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 15 ? argument[14] : 1.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 15 ? argument[15] : 1.0, ERousrData.Float);

	if (!__imguigml_ext_call(_extImguiGML_image_button()))
		return;
	return buffer_read(__Imgui_out, buffer_s8) != 0;
}

#endregion
#region color picker widgets

///@function imguigml_color_edit3(_label, _r_or_array3, [_g=undefined], [_b=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array3
///@param {Real} [_g=undefined]
///@param {Real} [_b=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
function imguigml_color_edit3() {
	var in = __Imgui_in, argi = 0;

	sr_buffer_write(in, argument[argi++], ERousrData.String);

	if(argument_count > 2){
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
	}else{
		var _array = argument[1];
		argi--;
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		argi++;
	}

	sr_buffer_write(in, argument_count > 4 ? argument[argi++] : 0, ERousrData.Int32); 
	if (!__imguigml_ext_call(_extImguiGML_color_edit3()))
		return;

	var out = __Imgui_out, outi = 0;
	var ret = array_create(4);
	ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	return ret; 
}
__ImguiIg(imguigml_color_edit3)

///@function imguigml_color_edit4(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined]
///@param {Real} [_b=undefined]
///@param {Real} [_a=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
function imguigml_color_edit4() {
	var in = __Imgui_in, argi = 0;

	sr_buffer_write(in, argument[argi++], ERousrData.String);

	if(argument_count > 2){
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
	}else{
		var _array = argument[1];
		argi--;
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		argi++;
	}

	sr_buffer_write(in, argument_count > 5 ? argument[argi++] : 0, ERousrData.Int32); 
	if (!__imguigml_ext_call(_extImguiGML_color_edit4()))
		return;

	var out = __Imgui_out, outi = 0;
	var ret = array_create(5);
	ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_color_edit4)

///@function imguigml_color_picker3(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined] 
///@param {Real} [_b=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
function imguigml_color_picker3() {
	var in = __Imgui_in, argi = 0;

	sr_buffer_write(in, argument[argi++], ERousrData.String);

	if(argument_count > 2){
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
	}else{
		var _array = argument[1];
		argi--;
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		argi++;
	}

	sr_buffer_write(in, argument_count > 4 ? argument[argi++] : 0, ERousrData.Int32); 
	if (!__imguigml_ext_call(_extImguiGML_color_picker3()))
		return;

	var out = __Imgui_out, outi = 0;
	var ret = array_create(4);
	ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_color_picker3)

///@function imguigml_color_picker4(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined] 
///@param {Real} [_b=undefined]
///@param {Real} [_a=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
function imguigml_color_picker4() {
	var in = __Imgui_in, argi = 0;

	sr_buffer_write(in, argument[argi++], ERousrData.String);

	if(argument_count > 2){
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
		sr_buffer_write(in, argument[argi++], ERousrData.Float);
	}else{
		var _array = argument[1];
		argi--;
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		sr_buffer_write(in, _array[argi++], ERousrData.Float);
		argi++;
	}

	sr_buffer_write(in, argument_count > 5 ? argument[argi++] : 0, ERousrData.Int32); 
	if (!__imguigml_ext_call(_extImguiGML_color_picker4()))
		return;

	var out = __Imgui_out, outi = 0;
	var ret = array_create(5);
	ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	ret[@ outi++] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_color_picker4)

///@function imguigml_color_button(_desc_id, _r, _g, _b, _a, [_flags=0], [_size_x=0], [_size_y=0])
///@desc display a colored square/button, hover for details, return true when pressed.
///@param {String} _desc_id
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
///@param {Real} [_size_x=0]
///@param {Real} [_size_y=0])
function imguigml_color_button() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : 0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 7 ? argument[7] : 0, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_color_button()))
		return;
	return buffer_read(__Imgui_out, buffer_s8) != 0;
}
__ImguiIg(imguigml_color_button)

///@function imguigml_set_color_edit_options
///@desc initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.
function imguigml_set_color_edit_options() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0], ERousrData.Int32);
	__imguigml_ext_call(_extImguiGML_set_color_edit_options());
}
__ImguiIg(imguigml_set_color_edit_options)

#endregion
#region combo widgets

///@function imguigml_combo(_label, _current_item, _items, [_height_in_items = -1]);
///@desc
///@param {String} _label
///@param {Real} _current_item
///@param {Array:String} _items   [string unsupported] if a string, separate each item with a 0
///@returns {Array:[_changed, current_item]
function imguigml_combo() {
	var in = __Imgui_in;
	var _items = argument[2];
	var num_items = array_length(_items);
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, num_items, ERousrData.Int32);
	var i = 0; repeat(num_items) sr_buffer_write(in, string(_items[i++]));
	sr_buffer_write(in, argument_count > 2 ? argument[2] : -1, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_combo()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_combo)

///@function imguigml_begin_combo(_label, _preview_value, [_flags=0])
///@desc begin a combo widget
///@param {String} _label
///@param {String} _preview_val
///@param {Real:EImGui_ComboFlags} [_flags=0]
///@returns {Bool} 
function imguigml_begin_combo() {
	var _label = argument[0],
	    _preview_val = argument[1],
			_flags = argument_count > 2 ? argument[2] : 0;
		
	var in = __Imgui_in;
	sr_buffer_write(in, _label,       ERousrData.String);
	sr_buffer_write(in, _preview_val, ERousrData.String);
	sr_buffer_write(in, _flags,       ERousrData.Uint32);
	__imguigml_ext_call(_extImguiGML_begin_combo());
	var out = __Imgui_out;
	var _ret = buffer_read(out, buffer_s8) == 1;
	return _ret;
}
__ImguiIg(imguigml_begin_combo)
///@function imguigml_end_combo()
///@desc end a combo widget
function imguigml_end_combo() {
	__imguigml_ext_call(_extImguiGML_end_combo());
}
__ImguiIg(imguigml_end_combo)
///@function imguigml_set_item_default_focus()
///@desc set the default item focus (temp function until nav update)
function imguigml_set_item_default_focus() {
	__imguigml_ext_call(_extImGuiGML_set_item_default_focus());
}
__ImguiIg(imguigml_set_item_default_focus)

#endregion
#region widgets that use dragging for input

///@function imguigml_drag_float(_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_flags=EImGui_SliderFlags.None]);
///@desc  If v_min >= v_max we have no bound
///@param {String}                  _label
///@param {Real}                    _v
///@param {Real}                    [_v_speed=1.0]
///@param {Real}                    [_v_min=0.0]
///@param {Real}                    [_v_max=0.0]
///@param {String}                  [_displayFmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _v]}
function imguigml_drag_float() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument_count > 5 ? argument[5] : "%.3f");
	sr_buffer_write(in, argument_count > 6 ? argument[6] : EImGui_SliderFlags.None, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_drag_float()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_drag_float)

///@function imguigml_drag_float2(_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_flags=EImGui_SliderFlags.None]);
///@desc  If v_min >= v_max we have no bound
///@param {String}                  _label
///@param {Real}                    _v
///@param {Real}                    _v2
///@param {Real}                    [_v_speed=1.0]
///@param {Real}                    [_v_min=0.0]
///@param {Real}                    [_v_max=0.0]
///@param {String}                  [_displayFmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _v, _v2]}
function imguigml_drag_float2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.3f");
	sr_buffer_write(in, argument_count > 7 ? argument[7] : EImGui_SliderFlags.None, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_drag_float2()))
		return;

	var out = __Imgui_out;
	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_drag_float2)

///@function imguigml_drag_float3(_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_flags=EImGui_SliderFlags.None]);
///@desc  If v_min >= v_max we have no bound
///@param {String}                  _label
///@param {Real}                    _v
///@param {Real}                    _v2
///@param {Real}                    _v3
///@param {Real}                    [_v_speed=1.0]
///@param {Real}                    [_v_min=0.0]
///@param {Real}                    [_v_max=0.0]
///@param {String}                  [_displayFmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _v, _v2, _v3]}
function imguigml_drag_float3() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument[6], ERousrData.Float);
	sr_buffer_write(in, argument_count > 7 ? argument[7] : "%.3f");
	sr_buffer_write(in, argument_count > 8 ? argument[8] : EImGui_SliderFlags.None, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_drag_float3()))
		return;

	var out = __Imgui_out;
	var ret = array_create(4);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	ret[@ 3] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_drag_float3)

///@function imguigml_drag_float4(_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_flags=EImGui_SliderFlags.None]);
///@desc  If v_min >= v_max we have no bound
///@param {String}                  _label
///@param {Real}                    _v
///@param {Real}                    _v2
///@param {Real}                    _v3
///@param {Real}                    _v4
///@param {Real}                    [_v_speed=1.0]
///@param {Real}                    [_v_min=0.0]
///@param {Real}                    [_v_max=0.0]
///@param {String}                  [_displayFmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _v, _v2, _v3, _v4]}
function imguigml_drag_float4() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument[6], ERousrData.Float);
	sr_buffer_write(in, argument[7], ERousrData.Float);
	sr_buffer_write(in, argument_count > 8 ? argument[8] : "%.3f");
	sr_buffer_write(in, argument_count > 9 ? argument[9] : EImGui_SliderFlags.None, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_drag_float4()))
		return;

	var out = __Imgui_out;
	var ret = array_create(5);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	ret[@ 3] = buffer_read(out, buffer_f32);
	ret[@ 4] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_drag_float4)

///@function imguigml_drag_float_range2(_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_display_fmt="%.0f"], [_display_fmt_max=undefined], [_flags=EImGui_SliderFlags.None]);
///@desc drag an integer range 2?
///@param {String}                  _label
///@param {Real}                    _v_current_min
///@param {Real}                    _v_current_max
///@param {Real}                    [_v_speed=1.0]
///@param {Real}                    [_v_min=0.0]
///@param {Real}                    [_v_max=0.0]
///@param {String}                  [_displayFmt="%.0f"]
///@param {String}                  [_displayFmtMax=undefined]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _min, _max]}
function imguigml_drag_float_range2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.0f");
	if (argument_count > 7 && is_string(argument[7])) 
	  sr_buffer_write(in, argument[7]);
	else 
	  sr_buffer_write(in, 0, ERousrData.Int8);
	sr_buffer_write(in, argument_count > 8 ? argument[8] : EImGui_SliderFlags.None, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_drag_float_range2()))
		return;
	var out = __Imgui_out;
	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_drag_float_range2)

///@function imguigml_drag_int(_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"]);
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v]}
function imguigml_drag_int() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 5 ? argument[5] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_drag_int()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_drag_int)

///@function imguigml_drag_int2(_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"]);
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v, _v2]}
function imguigml_drag_int2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument[5], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_drag_int2()))
		return;

	var out = __Imgui_out;
	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_drag_int2)

///@function imguigml_drag_int3(_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"]);
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   _v3
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v, _v2, _v3]}
function imguigml_drag_int3() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Int32);
	sr_buffer_write(in, argument[6], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 7 ? argument[7] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_drag_int3()))
		return;

	var out = __Imgui_out;
	var ret = array_create(4);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	ret[@ 3] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_drag_int3)

///@function imguigml_drag_int4(_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"]);
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   _v3
///@param {Real}   _v4
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v, _v2, _v3, _v4]}
function imguigml_drag_int4() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument[6], ERousrData.Int32);
	sr_buffer_write(in, argument[7], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 8 ? argument[8] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_drag_int4()))
		return;

	var out = __Imgui_out;
	var ret = array_create(5);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	ret[@ 3] = buffer_read(out, buffer_s32);
	ret[@ 4] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_drag_int4)

///@function imguigml_drag_int_range2(_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_display_fmt="%.0f"], [_display_fmt_max=undefined])
///@desc drag an integer range 2?
///@param {String} _label
///@param {Real}   _v_current_min
///@param {Real}   _v_current_max
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0]
///@param {Real}   [_v_max=0]
///@param {String} [_displayFmt="%.0f"]
///@param {String} [_displayFmtMax=undefined]
///@returns {Array:[_changed, _min, _max]}
function imguigml_drag_int_range2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument[5], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.0f");
	if (argument_count > 7) 
	  sr_buffer_write(in, argument[7]);
	else 
	  sr_buffer_write(in, 0, ERousrData.Int8);
	if (!__imguigml_ext_call(_extImguiGML_drag_int_range2()))
		return;
	var out = __Imgui_out;

	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_drag_int_range2)

#endregion
#region widgets that are input (with a keyboard)

///@function imguigml_input_text(_label, _text, _max_length, [_flags=0], [_callback=undefined], [_user_data=undefined])
///@desc add an input text field
///@param {String} _label                           label to show next to the input
///@param {String} _text                            text to pre-fill field with
///@param {Real} _max_length                        max length to allow text
///@param {Real:EImGui_InputTextFlags} [_flags=0]   input text flags (see enum)
///@param {Real} [_callback=noone]                  a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored)
///@param {*} [_userdata=undefined]                 data passed to the callback   
///@returns {Array:[_changed, _text]}
function imguigml_input_text() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1]);
	sr_buffer_write(in, argument[2], ERousrData.Uint32);
	sr_buffer_write(in, argument_count > 3 ? argument[3] : 0, ERousrData.Int32);
	var callback = argument_count > 4 ? argument[4] : noone;
	var user_data = argument_count > 5 ? argument[5] : undefined;

	var call_id = _extImguiGML_input_text();
	__imguigml_handle_text_callback(call_id, callback, user_data);

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_string);
	return ret;
}
__ImguiIg(imguigml_input_text)

///@function imguigml_input_text_multiline(_label, _text, _max_len, _size_x, _size_y, [_flags=0], [_callback=undefined], [_user_data=undefined])
///@desc add an input text field
///@param {String} _label
///@param {String} _text
///@param {Real} _max_len
///@param {Real} _size_x
///@param {Real} _size_y
///@param {Real:EImGui_InputTextFlags} [_flags=0]
///@param {Real} [_callback=noone]                  a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored)
///@param {*} [_userdata=undefined]                 data passed to the callback   
///@returns {Array:[_changed, _text]}
function imguigml_input_text_multiline() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1]);
	sr_buffer_write(in, argument[2], ERousrData.Uint32);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32);
	var callback = argument_count > 6 ? argument[6] : noone;
	var user_data = argument_count > 7 ? argument[7] : undefined;

	var call_id = _extImguiGML_input_text_multiline();
	__imguigml_handle_text_callback(call_id, callback, user_data);

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_string);
	return ret;
}
__ImguiIg(imguigml_input_text_multiline)

///@function imguigml_input_float(_label, _val, [_step=0.0f], [_step_fast=0.0f], [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} [_step=0.0f]
///@param {Real} [_step_fast=0.0f]
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_WindowFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val]}
function imguigml_input_float() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 3 ? argument[3] : 0.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 4 ? argument[4] :  -1, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_input_float()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_input_float)

///@function imguigml_input_float2(_label, _val, _val2, [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2]}
function imguigml_input_float2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument_count > 3 ? argument[3] :  -1, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_input_float2()))
		return;

	var out = __Imgui_out;
	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_input_float2)

///@function imguigml_input_float3(_label, _val, _val2, _val3, [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3]}
function imguigml_input_float3() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument_count > 4 ? argument[4] :  -1, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_input_float3()))
		return;

	var out = __Imgui_out;
	var ret = array_create(4);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	ret[@ 3] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_input_float3)

///@function imguigml_input_float4(_label, _val, _val2, _val3, _val4, [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2 
///@param {Real} _val3
///@param {Real} _val4
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3, _val4]}
function imguigml_input_float4() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument_count > 5 ? argument[5] :  -1, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 6 ? argument[6] :   0, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_input_float4()))
		return;

	var out = __Imgui_out;
	var ret = array_create(5);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	ret[@ 3] = buffer_read(out, buffer_f32);
	ret[@ 4] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_input_float4)

///@function imguigml_input_int(_label, _val, [_step=1], [_step_fast=100], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} [_step=1]
///@param {Real} [_step_fast=100]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val]}
function imguigml_input_int() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 2 ? argument[2] :   1, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 3 ? argument[3] : 100, ERousrData.Int32);
	sr_buffer_write(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_input_int()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_input_int)

///@function imguigml_input_int2(_label, _val, _val2, [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2]}
function imguigml_input_int2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 3 ? argument[3] :   0, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_input_int2()))
		return;

	var out = __Imgui_out;
	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_input_int2)

///@function imguigml_input_int3(_label, _val, _val2, _val3, [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3]}
function imguigml_input_int3() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_input_int3()))
		return;
	
	var out = __Imgui_out;
	var ret = array_create(4);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	ret[@ 3] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_input_int3)

///@function imguigml_input_int4(_label, _val, _val2, _val3, _val4, [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} _val4
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3, _val4]}
function imguigml_input_int4() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_input_int3()))
		return;
	var out = __Imgui_out;
	var ret = array_create(5);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	ret[@ 3] = buffer_read(out, buffer_s32);
	ret[@ 4] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_input_int4)

#endregion
#region slider widgets

///@function imguigml_slider_float(_label, _val, _min, _max, [_display_fmt="%.3f"], [_flags=EImGui_SliderFlags.None]);
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. 
///@param {String} _label
///@param {Real} _val
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _val]} 
function imguigml_slider_float() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument_count > 4 ? argument[4] : "%.3f");
	sr_buffer_write(in, argument_count > 5 ? argument[5] : EImGui_SliderFlags.None, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_slider_float()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_slider_float)

///@function imguigml_slider_float2(_label, _val, _val2, _min, _max, [_display_fmt="%.3f"], [_flags=EImGui_SliderFlags.None]);
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. 
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _val]}
function imguigml_slider_float2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument_count > 5 ? argument[5] : "%.3f");
	sr_buffer_write(in, argument_count > 6 ? argument[6] : EImGui_SliderFlags.None, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_slider_float2()))
		return;

	var out = __Imgui_out;
	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_slider_float2)

///@function imguigml_slider_float3(_label, _val, _val2, _val3, _min, _max, [_display_fmt="%.3f"], [_flags=EImGui_SliderFlags.None])
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display.
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _val]}
function imguigml_slider_float3() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.3f");
	sr_buffer_write(in, argument_count > 7 ? argument[7] : EImGui_SliderFlags.None, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_slider_float3()))
		return;
	var out = __Imgui_out;
	var ret = array_create(4);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	ret[@ 3] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_slider_float3)

///@function imguigml_slider_float4(_label, _val, _val2, _val3, _val4, _min, _max, [_display_fmt="%.3f"], [_flags=EImGui_SliderFlags.None])
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. 
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} _val4
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _val]}
function imguigml_slider_float4() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument[6], ERousrData.Float);
	sr_buffer_write(in, argument_count > 7 ? argument[7] : "%.3f");
	sr_buffer_write(in, argument_count > 8 ? argument[8] : EImGui_SliderFlags.None, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_slider_float4()))
		return;

	var out = __Imgui_out;
	var ret = array_create(5);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	ret[@ 2] = buffer_read(out, buffer_f32);
	ret[@ 3] = buffer_read(out, buffer_f32);
	ret[@ 4] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_slider_float4)

///@function imguigml_slider_angle(_label, _rad, [_degree_min=-360.0], [_degree_max=360.0])
///@desc angle slider
///@param {String} _label
///@param {Real} _rad
///@param {Real} [_degree_min=-360.0]
///@param {Real} [_degree_max=360.0]
///@returns {Array:[_changed, _rad]}
function imguigml_slider_angle() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0])
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument_count > 2 ? argument[2] : -360.0, ERousrData.Float);
	sr_buffer_write(in, argument_count > 3 ? argument[3] : 360.0, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_slider_angle()))
		return;
	
	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_slider_angle)

///@function imguigml_slider_int(_label, _v, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
function imguigml_slider_int() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 4 ? argument[4] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_slider_int()))
		return;
		
	var out = __Imgui_out;  
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32)
	return ret;
}
__ImguiIg(imguigml_slider_int)

///@function imguigml_slider_int2(_label, _v, _v2, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v2
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
function imguigml_slider_int2() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 5 ? argument[5] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_slider_int2()))
		return;

	var out = __Imgui_out;
	var ret = array_create(3);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_slider_int2)

///@function imguigml_slider_int3(_label, _v, _v2, _v3, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v2
///@param {Real} _v3
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
function imguigml_slider_int3() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument[5], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_slider_int3()))
		return;

	var out = __Imgui_out;
	var ret = array_create(4);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	ret[@ 3] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_slider_int3)

///@function imguigml_slider_int4(_label, _v, _v2, _v3, _v4, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v2
///@param {Real} _v3
///@param {Real} _v4
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
function imguigml_slider_int4() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument[5], ERousrData.Int32);
	sr_buffer_write(in, argument[6], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 7 ? argument[7] : "%.0f");

	if (!__imguigml_ext_call(_extImguiGML_slider_int4()))
		return;

	var out = __Imgui_out;
	var ret = array_create(5);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	ret[@ 2] = buffer_read(out, buffer_s32);
	ret[@ 3] = buffer_read(out, buffer_s32);
	ret[@ 4] = buffer_read(out, buffer_s32);
	return ret;
}
__ImguiIg(imguigml_slider_int4)

///@function imguigml_vslider_float(_label, _size_x, _size_y,  _v, _v_min, _v_max, [_display_fmt="%.0f"], [_flags=EImGui_SliderFlags.None])
///@desc a vslider float?
///@param {String} _label
///@param {Real} _size_x
///@param {Real} _size_y
///@param {Real} _v
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@param {Real:EImGui_SliderFlags} [_flags=EImGui_SliderFlags.None]
///@returns {Array:[_changed, _v]}
function imguigml_vslider_float() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Float);
	sr_buffer_write(in, argument[2], ERousrData.Float);
	sr_buffer_write(in, argument[3], ERousrData.Float);
	sr_buffer_write(in, argument[4], ERousrData.Float);
	sr_buffer_write(in, argument[5], ERousrData.Float);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.0f");
	sr_buffer_write(in, argument_count > 7 ? argument[7] : EImGui_SliderFlags.None, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_vslider_float()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_f32);
	return ret;
}
__ImguiIg(imguigml_vslider_float)

///@function imguigml_vslider_int(_label, _size_x, _size_y,  _v, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc a vslider int?
///@param {String} _label
///@param {Real} _size_x
///@param {Real} _size_y
///@param {Real} _v
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
function imguigml_vslider_int() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0]);
	sr_buffer_write(in, argument[1], ERousrData.Int32);
	sr_buffer_write(in, argument[2], ERousrData.Int32);
	sr_buffer_write(in, argument[3], ERousrData.Int32);
	sr_buffer_write(in, argument[4], ERousrData.Int32);
	sr_buffer_write(in, argument[5], ERousrData.Int32);
	sr_buffer_write(in, argument_count > 6 ? argument[6] : "%.0f");
	if (!__imguigml_ext_call(_extImguiGML_vslider_int()))
		return;

	var out = __Imgui_out;
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	ret[@ 1] = buffer_read(out, buffer_s32);
	return ret; 
}
__ImguiIg(imguigml_vslider_int)

#endregion
#region text widgets

///@function imguigml_text(_text)
///@desc simple formatted text
///@param {String} _text
function imguigml_text() {
	var buff = __imguigml_wrapper_buffer();
	sr_buffer_write(buff, string(argument[0]));
	__imguigml_ext_call(_extImguiGML_text());
}
__ImguiIg(imguigml_text)

///@function imguigml_text_colored(_r, _g, _b, _a, _text)
///@desc shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@param {String} _text
function imguigml_text_colored() {
	var buff = __imguigml_wrapper_buffer();
	sr_buffer_write(buff, argument[0], ERousrData.Float);
	sr_buffer_write(buff, argument[1], ERousrData.Float);
	sr_buffer_write(buff, argument[2], ERousrData.Float);
	sr_buffer_write(buff, argument[3], ERousrData.Float);
	sr_buffer_write(buff, string(argument[4]));
	__imguigml_ext_call(_extImguiGML_text_colored());
}
__ImguiIg(imguigml_text_colored)

///@function imguigml_text_disabled(_text)
///@desc shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
///@param {String} _text
function imguigml_text_disabled() {
	var buff = __imguigml_wrapper_buffer();
	sr_buffer_write(buff, string(argument[0]));
	__imguigml_ext_call(_extImguiGML_text_disabled());
}
__ImguiIg(imguigml_text_disabled)

///@function imguigml_text_wrapped(_text)
///@desc shortcut for `imguigml_push_text_wrap_pos(0.0f); imguigml_text(_text); imguigml_pop_text_wrap_pos();`. 
///@param {String} _text
///@Note: this won't work on an auto-resizing window if there's no other widgets to 
function imguigml_text_wrapped() {
	//         extend the window width, you may need to set a size using `imguigml_set_next_window_size()`
	var buff = __imguigml_wrapper_buffer();
	sr_buffer_write(buff, string(argument[0]));
	__imguigml_ext_call(_extImguiGML_text_wrapped());
}
__ImguiIg(imguigml_text_wrapped)

///@function imguigml_label_text(_label, _text)
///@desc display text+label aligned the same way as value+label widgets
///@param {String} _label
///@param {String} _text
function imguigml_label_text() {
	var buff = __imguigml_wrapper_buffer();
	sr_buffer_write(buff, string(argument[0]));
	sr_buffer_write(buff, string(argument[1]));
	__imguigml_ext_call(_extImguiGML_label_text());
}
__ImguiIg(imguigml_label_text)

///@function imguigml_bullet_text(_text)
///@desc shortcut for Bullet()+Text()
///@param {String} _text
function imguigml_bullet_text() {
	var buff = __imguigml_wrapper_buffer();
	sr_buffer_write(buff, string(argument[0]));
	__imguigml_ext_call(_extImguiGML_bullet_text());
}
__ImguiIg(imguigml_bullet_text)

///@function imguigml_bullet()
///@desc draw a small circle and keep the cursor on the same line. 
///      advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses
function imguigml_bullet() {
	__imguigml_ext_call(_extImguiGML_bullet());
}
__ImguiIg(imguigml_bullet)

#endregion
#region tree widgets

///@function imguigml_tree_node(_labelOrId)
///@desc begin a tree node
///@param {String|Real} _labelOrId   a label or id to use - used as id if passed real
///@returns {Boolean} if returning 'true' the node is open and the tree id is pushed into the id stack. user is responsible for calling TreePop().
function imguigml_tree_node() {
	var in = __Imgui_in;
	var _id = argument[0];
	if (is_real(_id) || is_int32(_id) || is_int64(_id)) sr_buffer_write(in, _id, ERousrData.Int32);
	else                                                sr_buffer_write(in, string(_id));
	if (!__imguigml_ext_call(_extImguiGML_tree_node()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_s8) != 0;;
}
__ImguiIg(imguigml_tree_node)

///@function imguigml_tree_node_ex(_labelOrId, [_flags=0])
///@desc begin a tree node
///@param {String|Real}               _labelOrId   a label or id to use - used as id if passed real
///@param {Real:EImGui_TreeNodeFlags} [_flags=0]
///@returns {Boolean} if returning 'true' the node is open and the tree id is pushed into the id stack. user is responsible for calling TreePop().
function imguigml_tree_node_ex() {
	var in = __Imgui_in;
	var _id = argument[0];
	var _flags = argument_count > 1 ? argument[1] : 0;
	if (is_real(_id) || is_int32(_id) || is_int64(_id)) sr_buffer_write(in, _id, ERousrData.Int32);
	else                                                sr_buffer_write(in, string(_id));
	sr_buffer_write(in, _flags, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_tree_node_ex()))
		return;
	var out = __Imgui_out;
	return buffer_read(out, buffer_s8) != 0;;
}
__ImguiIg(imguigml_tree_node_ex)

///@function imguigml_tree_push(_labelOrId)
///@desc Indent()+PushId(). Already called by TreeNode() when returning true, but you can call Push/Pop yourself for layout purpose
///@param {String|Real} _labelOrId   a label or id to use - used as id if passed real
function imguigml_tree_push(_id) {
	var in = __Imgui_in;
	if (is_real(_id) || is_int32(_id) || is_int64(_id)) sr_buffer_write(in, _id, ERousrData.Int32);
	else                                                sr_buffer_write(in, string(_id));
	__imguigml_ext_call(_extImguiGML_tree_push());
}
__ImguiIg(imguigml_tree_push)

///@function imguigml_tree_pop()
///@desc ~ Unindent()+PopId()
function imguigml_tree_pop() {
	__imguigml_ext_call(_extImguiGML_tree_pop());
}
__ImguiIg(imguigml_tree_pop)

///@function imguigml_tree_advance_to_label_pos
///@desc advance cursor x position by GetTreeNodeToLabelSpacing()
function imguigml_tree_advance_to_label_pos() {
	__imguigml_ext_call(_extImguiGML_tree_advance_to_label_pos());
}
__ImguiIg(imguigml_tree_advance_to_label_pos)

///@function imguigml_get_tree_node_to_label_spacing()
///@desc horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode
///@returns {Real}
function imguigml_get_tree_node_to_label_spacing() {
	if (!__imguigml_ext_call(_extImguiGML_get_tree_node_to_label_spacing()))
		return;
	return buffer_read(__Imgui_out, buffer_f32);
}
__ImguiIg(imguigml_get_tree_node_to_label_spacing)

///@function imguigml_set_next_tree_node_open(_is_open, [_cond=0])
///@desc set next TreeNode/CollapsingHeader open state.
///@param {Boolean} _is_open
///@param {Real:EImGui_Cond} [_cond=0]
function imguigml_set_next_tree_node_open() {
	var in = __Imgui_in;
	sr_buffer_write(in, argument[0] ? 1 : 0, ERousrData.Int8);
	sr_buffer_write(in, argument_count > 1 ? argument[1] : 0, ERousrData.Int32);
	if (!__imguigml_ext_call(_extImguiGML_set_next_tree_node_open()))
		return;
}
__ImguiIg(imguigml_set_next_tree_node_open)

///@function imguigml_collapsing_header(_label, [_p_open=undefined], [_flags=0])
///@desc add a collapsing header
///@param {String}                     _label
///@param {Boolean}                    [_open=undefined]   when `open` isn't `undefined`, display an additional small close button on upper right of the header
///@param {Real:EImGui_TreeNodeFlags]} [_flags=0]
///@returns {Array:[_collapsed, [_open]} if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().
function imguigml_collapsing_header() {
	var in = __Imgui_in;
	var _label = argument[0];
	var _open  = argument_count > 1 ? argument[1] : undefined;
	var _flags = argument_count > 2 ? argument[2] : 0;

	sr_buffer_write(in, _label);
	sr_buffer_write(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);
	sr_buffer_write(in, _flags, ERousrData.Int32);

	if (!__imguigml_ext_call(_extImguiGML_collapsing_header()))
		return;
	var out = __Imgui_out;
	var ret = [ ];
	ret[@ 0] = buffer_read(out, buffer_s8) != 0;
	if (_open != undefined)
	  ret[@ 1] = buffer_read(out, buffer_s8) != 0;

	return ret;
}
__ImguiIg(imguigml_collapsing_header)

#endregion
