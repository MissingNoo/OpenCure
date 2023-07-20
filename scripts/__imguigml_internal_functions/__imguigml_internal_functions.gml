///@desc functions internal to imguigml, you shouldn't have to call these

///@desc imguigml initialization functions

// Feather disable all
enum EImGuiGML_Texture {
	TextureID = 0,
	OwnerID,
	DeleteOnCleanUp,
	Type,
	
	Num
};


enum EImGuiGML_TextureType {
	Invalid = -1,
	
	Sprite = 0,
	Surface,
	Texture,
	
	Num
};

enum __ImGuiKey_ {
	Tab = 0,    // for tabbing through fields
	LeftArrow,  // for text edit
	RightArrow, // for text edit
	UpArrow,    // for text edit
	DownArrow,  // for text edit
	PageUp,     
	PageDown,   
	Home,       // for text edit
	End,        // for text edit
	Insert,     
	Delete,     // for text edit
	Backspace,  // for text edit
	Space,
	Enter,      // for text edit
	Escape,     // for text edit
	KeyPadEnter, 
	A,          // for text edit CTRL+A: select all
	C,          // for text edit CTRL+C: copy
	V,          // for text edit CTRL+V: paste
	X,          // for text edit CTRL+X: cut
	Y,          // for text edit CTRL+Y: redo
	Z,          // for text edit CTRL+Z: undo
  
	ImGuiCount, 
  
	// Additional key checks (modifiers)
	Ctrl = __ImGuiKey_.ImGuiCount,
	Alt,  
	Shift,
	//Super,
  
	Num
};

///@function __imguigml_init_rendering()
///@desc called `with` imguigml - initialize the rendering
///@extensionizer { "docs": false }
function __imguigml_init_rendering() {
	gml_pragma("forceinline");

	Render_buffer = [
	  buffer_create(ImGuiGML_CommandBufferSize, buffer_fixed, 1), 
	  buffer_create(ImGuiGML_VertexBufferSize, buffer_fixed, 1) 
	];

	_extImguiGML_set_render_buffer(
	  buffer_get_address(Render_buffer[ImGuiGML_CommandBuffer]), ImGuiGML_CommandBufferSize, 
	  buffer_get_address(Render_buffer[ImGuiGML_VertexBuffer]),  ImGuiGML_VertexBufferSize
	); 

	vertex_format_begin();  
	vertex_format_add_position();
	vertex_format_add_texcoord();
	Imgui_vertex_fmt_size = 4 + 4            // Position
	                      + 4 + 4;           // U,V

	if (ImGuiGML_UseUByte4) {
	  vertex_format_add_custom(vertex_type_ubyte4, vertex_usage_colour);
	  Imgui_vertex_fmt_size += 4;            // Color
	} else if (ImGuiGML_UseFloat) {
	  vertex_format_add_custom(vertex_type_float4, vertex_usage_colour);
	  Imgui_vertex_fmt_size += 4 + 4 + 4 + 4;  // Color
	}

	Imgui_vertex_fmt  = vertex_format_end();

	enum _EImGuiShader {
		Normal = 0,
		Depth,
	
		Num,
	
		// Shader array
		Shader   = 0, // Shader
		U1,           // Uniforms
		U2, 
		U3,
	
		// labelled uniforms
		ClipRect = _EImGuiShader.U1,     
		Scale    = _EImGuiShader.U2,
		DepthVal = _EImGuiShader.U3,
	
		Params,
	};

	Imgui_Shaders = [
		[ shd_imgui,       shader_get_uniform(shd_imgui,       "u_vClip_rect"), shader_get_uniform(shd_imgui,       "u_vScale"), undefined ],
		[ shd_imgui_depth, shader_get_uniform(shd_imgui_depth, "u_vClip_rect"), shader_get_uniform(shd_imgui_depth, "u_vScale"), shader_get_uniform(shd_imgui_depth, "u_fDepth") ]
	];

	Imgui_shader       = _EImGuiShader.Normal;

	Textures      = [ ];
	Next_texture_id = 0;
	FontTexture   = -1;

//	Offset_x  = 0;
// 	Offset_y  = 0;
	Use_depth = false;

	Sprite_cache = sr_sprite_cache_create();

	__imguigml_ext_call(_extImguiGML_set_display_size(window_get_width(), window_get_height()));
}

///@function __imguigml_init_font()
///@desc called `with` imguigml - load the font texture
///@extensionizer { "docs": false }
function __imguigml_init_font() {
	gml_pragma("forceinline");
	var arg_buffer = buffer_create(1024, buffer_fixed, 1);
	if (FontTexture == -1) {
		FontTexture = Next_texture_id++;
	} else {
		var _tex = Textures[FontTexture];
		sprite_delete(_tex[1]);
	}

	if (!__imguigml_ext_call(_extImguiGML_create_font_texture(FontTexture, buffer_get_address(arg_buffer))))
		return;

	var font_width  = buffer_read(arg_buffer, buffer_u32);
	var font_height = buffer_read(arg_buffer, buffer_u32);
	var font_buffer = buffer_create(font_width * font_height * 4, buffer_fixed, 4);

	if (!__imguigml_ext_call(_extImguiGML_get_font_texture(buffer_get_address(font_buffer))))
		return;

	var font_surface = surface_create(font_width, font_height);
	buffer_set_surface(font_buffer, font_surface, 0);

	var font_sprite = sprite_create_from_surface(font_surface, 0, 0, font_width, font_height, false, false, 0, 0);
	Textures[@ FontTexture] = [ [ font_sprite, 0 ], font_sprite, true, EImGuiGML_TextureType.Sprite ];

	buffer_delete(arg_buffer);
	buffer_delete(font_buffer);
	surface_free(font_surface);
}

///@function __imguigml_init_input()
///@desc called `with` imguigml - initilaize the input stuff
///@extensionizer { "docs": false }
function __imguigml_init_input() {
	gml_pragma("forceinline");

	global.__imgui_num_mouse_buttons = 3;
	global.__imgui_mouse_buttons = [ mb_left, mb_right, mb_middle ]; 

	global.__imgui_num_keys = __ImGuiKey_.Num;
	global.__imgui_keys = [ 
	  vk_tab,
	  vk_left,
	  vk_right,
	  vk_up,
	  vk_down,
	  vk_pageup,
	  vk_pagedown,
	  vk_home,
	  vk_end,
	  vk_insert,
		vk_delete,  
	  vk_backspace,
		vk_space,
	  vk_enter,
		vk_escape,
		undefined,
	  ord("A"),
	  ord("C"),
	  ord("V"),
	  ord("X"),
	  ord("Y"),
	  ord("Z"),
  
	  vk_control,
	  vk_alt,
	  vk_shift,
	   // vk_super,
	];
  
	Input_buffer = buffer_create(ImGuiGML_InputBufferSize, buffer_fixed, buffer_u8);
	Using_GM_cursor      = Imguigml_Use_GM_cursor;
	Should_update_cursor = Imguigml_Show_ImGui_cursor;
	User_cursor_override = Imguigml_User_override;

	DidWantTextInput    = false;
	WantCaptureMouse    = false;  // When io.WantCaptureMouse is true, do not dispatch mouse input data to your main application. This is set by ImGui when it wants to use your mouse (e.g. unclicked mouse is hovering a window, or a widget is active). 
	WantCaptureKeyboard = false;  // When io.WantCaptureKeyboard is true, do not dispatch keyboard input data to your main application. This is set by ImGui when it wants to use your keyboard inputs.
	WantTextInput       = false;  // Mobile/console: when io.WantTextInput is true, you may display an on-screen keyboard. This is set by ImGui when it wants textual keyboard input to happen (e.g. when a InputText widget is active).
	WantMoveMouse       = false;  // [BETA-NAV] MousePos has been altered, back-end should reposition mouse on next frame. Set only when 'NavMovesMouse=true'.
	Framerate               = 0;  // Application framerate estimation, in frame per second. Solely for convenience. Rolling average estimation based on IO.DeltaTime over 120 frames
	MetricsAllocs           = 0;  // Number of active memory allocations
	MetricsRenderVertices   = 0;  // Vertices output during last call to Render()
	MetricsRenderIndices    = 0;  // Indices output during last call to Render() = number of triangles * 3
	MetricsActiveWindows    = 0;  // Number of visible root windows (exclude child windows)
	MouseDelta       = [ 0, 0 ];  // Mouse delta. Note that this is zero if either current or previous position are invalid (undefined, undefined), so a disappearing/reappearing mouse won't have a huge delta.
}

///@function __imguigml_init_wrapper()
///@desc called `with` imguigml - initialize wrapper buffer
///@extensionizer { "docs": false }
function __imguigml_init_wrapper() {
	gml_pragma("forceinline");
	Wrapper_buffer = buffer_create(ImGuiGML_WrapperBufferSize, buffer_fixed, 1);
	_extImguiGML_set_wrapper_buffer(buffer_get_address(Wrapper_buffer), ImGuiGML_WrapperBufferSize);
}

///@function __imguigml_init_debug()
///@desc called `with` imguigml - initialize debug buffer
///@extensionizer { "docs": false }
function __imguigml_init_debug() {
	gml_pragma("forceinline");
	Debug_buffer = buffer_create(ImGuiGML_DebugBufferSize, buffer_fixed, 1);
	_extImGuiGML_set_debug_buffer(buffer_get_address(Debug_buffer), ImGuiGML_DebugBufferSize);
}

///@function __imguigml_draw()
///@desc draw the imgui
///@extensionizer { "docs": false }
function __imguigml_draw() {
	_extImguiGML_wait_for_render();

	sr_sprite_cache_flush(Sprite_cache);  // draw any new things

	var vertex_index = 0;
	var command_buffer = Render_buffer[0];
	var vertex_buffer  = Render_buffer[1];

	buffer_seek(command_buffer, buffer_seek_start, 0);
	buffer_seek(vertex_buffer,  buffer_seek_start, 0);

	var shader = Imgui_Shaders[Imgui_shader];
	shader_set(shader[_EImGuiShader.Shader]);
	while (buffer_read(command_buffer, buffer_u8) == 1) { 
	  var tex_id     = buffer_read(command_buffer, buffer_u32);
	  var elem_count = buffer_read(command_buffer, buffer_u32);
  
	  var vbuff = vertex_create_buffer_from_buffer_ext(vertex_buffer, Imgui_vertex_fmt, vertex_index * Imgui_vertex_fmt_size, elem_count);
	  vertex_index += elem_count;
  
	  var tex = Textures[tex_id];
	  if (tex == undefined) tex = - 1;
	  else switch (tex[EImGuiGML_Texture.Type]) {
	    case EImGuiGML_TextureType.Surface: 
	      tex = tex[EImGuiGML_Texture.TextureID]; 
				tex = surface_get_texture(tex);
	      //tex = surface_exists(tex) ? surface_get_texture(tex) : -1;
				//tex = surface_get_texture(tex);
				//show_message("Was surface!");
		break;
	    case EImGuiGML_TextureType.Sprite:  
	      tex = tex[EImGuiGML_Texture.TextureID]; 
	      tex = sprite_get_texture(tex[0], tex[1]);
	    break;
    
	    case EImGuiGML_TextureType.Texture: tex = tex[EImGuiGML_Texture.TextureID]; break;
	    default: tex = -1; break;
	  };

		if (tex == -1) 
			continue;
		
	  var clip_x1 = buffer_read(command_buffer, buffer_f32);
	  var clip_y1 = buffer_read(command_buffer, buffer_f32);
	  var clip_x2 = buffer_read(command_buffer, buffer_f32);
	  var clip_y2 = buffer_read(command_buffer, buffer_f32);
  
	  shader_set_uniform_f_array(shader[_EImGuiShader.ClipRect], [ clip_x1, clip_y1, clip_x2, clip_y2 ]);
	  shader_set_uniform_f_array(shader[_EImGuiShader.Scale],    [ Scale_x, Scale_y ]);
		if (Use_depth) 
			shader_set_uniform_f(shader[_EImGuiShader.DepthVal], depth);
		
	  vertex_submit(vbuff, pr_trianglelist, tex);  
	  vertex_delete_buffer(vbuff);
	}

	shader_reset();
}

///@function __imguigml_texture_id(_id, _texture_type_or_sub_img, [_texture_type])
///@desc return an index for a texture id so we can render this properly
///@param {Real}                            _id						              sprite index, surface id, or texture ptr
///@param {Real|Real:EImGuiGML_TextureType} _texture_type_or_sub_img    what type `_id` should be treated as, or a sub image if we're the sprite type.
///@param {Real:EImGuiGML_TextureType}      [_texture_type]             what type `_id` should be treated as (or a sprite, really, if 3 passed)
///@returns {Real} _id for texture
///@extensionizer { "docs": false }
function __imguigml_texture_id() {
	var _id      = argument[0],
	    _sub_img = argument[1],
	    _type    = argument[1];

	if (argument_count > 2) _type = EImGuiGML_TextureType.Sprite; // 3 params is only acceptable for a sprite, deal with it.

	with (ImGuiGML) {
	  var num_textures = array_length(Textures);
	  for (var i = 0; i < num_textures; ++i) {
			var tex_data = Textures[i];
			if (tex_data[EImGuiGML_Texture.Type] == _type) {
	      var tex_id = tex_data[EImGuiGML_Texture.TextureID];
      
	      // special handling
	      switch (_type) {
	      case EImGuiGML_TextureType.Sprite:  
	        if (_id == tex_id[0] && _sub_img == tex_id[1]) return i;      
	      break;
	      default: if (_id == tex_id) return i;
	      }
	    }
	  }
    
	  var new_texture = [ _id , _id, false, _type ];
  
	  // special handling
	  switch (_type) {
	   case EImGuiGML_TextureType.Sprite:  new_texture[@ EImGuiGML_Texture.TextureID] = [ _id, _sub_img ]; break;
	   default: break; 
	  }
  
	  Textures[@ Next_texture_id++] = new_texture;
	  return Next_texture_id - 1;
	}

	return undefined;
}

///@function __imguigml_wrapper_buffer()
///@desc prepare the wrapper buffer for next use
///@returns {Real} buffer_index
///@extensionizer { "docs": false }
function __imguigml_wrapper_buffer() {
	gml_pragma("forceinline");

	with (ImGuiGML) {
	  buffer_seek(Wrapper_buffer, buffer_seek_start, 0);
	  return Wrapper_buffer;
	}

	return undefined;
}

///@function __imguigml_handle_text_callback(_call_id, _callback, _user_data)
///@desc handle text input callback functions, the script it supports is:
///      `real _text_input_callback({Array:EImguiGML_TextCallback}_data, [_user_data=_undefined])` - on CallbackCharFilter return 1 to discard. ignored elsewise.
///@param {Real} _call_id    id returned from a text input callback function
///@param {Real} _callback   script_index of callback script to execute
///@extensionizer { "docs": false }
function __imguigml_handle_text_callback() {
	var _call_id = argument[0],
	    _callback = argument[1],
	    _user_data = argument_count > 2 ? argument[2] : undefined;

	while (rousr_callstack_process(_call_id)) {
	  if (_callback == noone)
	    continue;
      
	  var out = rousr_callstack_out();
	  var flag      = buffer_read(out, buffer_s32),
	      flags     = buffer_read(out, buffer_s32);

	  var callback_data = array_create(EImGui_TextCallbackData.Num);
	  callback_data[@ EImGui_TextCallbackData.EventFlag] = flag;      
	  callback_data[@ EImGui_TextCallbackData.Flags] = flags;
  
	  var ret = 0;
	  switch (flag) {
	    case EImGui_InputTextFlags.CallbackAlways:      // Call user function every time. User code may query cursor position, modify text buffer.
	    case EImGui_InputTextFlags.CallbackCompletion:  // Call user function on pressing TAB (for completion handling)
	    case EImGui_InputTextFlags.CallbackHistory:     // Call user function on pressing Up/Down arrows (for history handling)
	      callback_data[@ EImGui_TextCallbackData.Key]            = buffer_read(out, buffer_s32);
	      callback_data[@ EImGui_TextCallbackData.Text]           = buffer_read(out, buffer_string);
	      callback_data[@ EImGui_TextCallbackData.TextMaxLength]  = buffer_read(out, buffer_s32);
	      callback_data[@ EImGui_TextCallbackData.CurPos]         = buffer_read(out, buffer_s32);
	      callback_data[@ EImGui_TextCallbackData.SelectionStart] = buffer_read(out, buffer_s32);
	      callback_data[@ EImGui_TextCallbackData.SelectionEnd]   = buffer_read(out, buffer_s32);
  
	      script_execute(_callback, callback_data, _user_data);
	      var in = rousr_callstack_in();
	      sr_buffer_write(in, ret, ERousrData.Int32);
      
	      sr_buffer_write(in, callback_data[EImGui_TextCallbackData.Text],           ERousrData.String);
	      sr_buffer_write(in, callback_data[EImGui_TextCallbackData.CurPos],         ERousrData.Int32);
	      sr_buffer_write(in, callback_data[EImGui_TextCallbackData.SelectionStart], ERousrData.Int32);
	      sr_buffer_write(in, callback_data[EImGui_TextCallbackData.SelectionEnd],   ERousrData.Int32);

	    break;
      
	    case EImGui_InputTextFlags.CallbackCharFilter: // Call user function to filter character. Modify data->EventChar to replace/filter input, or return 1 to discard character.
	      var wc = buffer_read(out, buffer_u16);
	      var char = chr(wc);
      
	      var callback_data = array_create(EImGui_TextCallbackData.NumCharFilter);
	      callback_data[@ EImGui_TextCallbackData.Char] = char;
      
	      ret = script_execute(_callback, callback_data, _user_data);
	      ret = clamp(ret, -1, 1);
      
	      var out_char = callback_data[EImGui_TextCallbackData.Char];
	      if (is_string(out_char))
	        out_char = ord(string_char_at(out_char, 0));
      
	      var in = rousr_callstack_in();
	      sr_buffer_write(in, ret, ERousrData.Int32);
	      sr_buffer_write(in, out_char, ERousrData.Uint16);
	    break;
      
	    default: break;
	  }
	};  
}

///@function __imguigml_ext_call(_extImguiGML_func_ret)
///@desc wrap a _extImguiGML call in this, handle returns or checking immediately after a call
///@extensionizer { "docs": "false" }
function __imguigml_ext_call(_func_ret) {
	// check if there's any debug messages, return if there are?
	with (ImGuiGML) {
		if (buffer_peek(Debug_buffer, 0, buffer_u32) > 0) {
			var count = buffer_read(Debug_buffer, buffer_u32);
			var msg = "";
			for (var i = 0; i < count; ++i)
				msg += buffer_read(Debug_buffer, buffer_string) + "\n";
		
			buffer_seek(Debug_buffer, buffer_seek_start, 0);
			_extImGuiGML_flush_debug_buffer();

			show_debug_message(msg);
			if (Call_script_on_ImGui_error != noone)
				script_execute(Call_script_on_ImGui_error, msg);
			
			if (Show_Error_on_ImGui_error || Abort_on_ImGui_error)
				show_error(msg, Abort_on_ImGui_error);
			else if (Show_message_on_ImGui_error)
				show_message(msg);
		}	
	}

	// handle input copying.

	// no errors, so continue execution. 
	return _func_ret;
}
