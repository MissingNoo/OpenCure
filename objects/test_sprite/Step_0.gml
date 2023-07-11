if(!instance_exists(imgui)){
	exit;	
}

if(!imguigml_ready()){
	exit;	
}

imguigml_set_next_window_size(640, 360, EImGui_Cond.FirstUseEver);
var _window = imguigml_begin("Sprite Test",true);
if(_window[0] && _window[1]){
	var sprites = [
		[ "Test 1 - Normal Sprite", doggo ],
		[ "Test 2 - Normal Sprite With Trim", doggo_head ],
		[ "Test 3 - Added Sprite", added_sprite ]
	];
	
	if (imguigml_button("Test Sprite Atlas Overflow"))
		test_overflow = !test_overflow
		
	if (test_overflow) 
		for (var i = 0; i < 10; ++i) {
			imguigml_sprite(doggo_big, i);
		}

	
	var _i=0;
	repeat(array_length(sprites)){
		var _pckg = sprites[_i++],
			_title = _pckg[0],
			_sprite = _pckg[1];
			imguigml_text(_title);
			var texture_id = __imguigml_texture_id(_sprite, 0, EImGuiGML_TextureType.Sprite);
			var width = sprite_get_width(_sprite);
			var height = sprite_get_height(_sprite);
			var uvs = sprite_get_uvs(_sprite, 0);
			var gml_id = sprite_get_texture(_sprite, 0);
			var u1 = uvs[0];
			var v1 = uvs[1];
			var u2 = uvs[2] * (texture_get_width(gml_id)/uvs[6]);
			var v2 = uvs[3] * (texture_get_height(gml_id)/uvs[7]);
			width *= uvs[6];
			height *= uvs[7];
			__imguigml_image(texture_id, width, height, u1, v1, u2, v2);
			imguigml_same_line();
			imguigml_sprite(_sprite, 0);
      
      //imguigml_begin_child(string(_i)+"##"+_title+"##content", 0, 0, true, EImGui_WindowFlags.AlwaysAutoResize);
			imguigml_label_text("RAW", "");
			imguigml_label_text("sprite_size", string(sprite_get_width(_sprite)) + ", " + string(sprite_get_height(_sprite)));
			imguigml_label_text("uv1", string(uvs[0]) + ", " + string(uvs[1]));
			imguigml_label_text("uv2", string(uvs[2]) + ", " + string(uvs[3]));
			imguigml_label_text("uv trim", string(uvs[4]) + ", " + string(uvs[5]));
			imguigml_label_text("uv size normal", string(uvs[6]) + ", " + string(uvs[7]));
			imguigml_label_text("texture size", string(texture_get_width(gml_id)) + ", " + string(texture_get_height(gml_id)));
			imguigml_label_text("CORRECTED", "");
			imguigml_label_text("sprite_size", string(width) + ", " + string(height));
			imguigml_label_text("uv1", string(u1) + ", " + string(v1));
			imguigml_label_text("uv2", string(u2) + ", " + string(v2));

			//imguigml_end_child();
			imguigml_spacing();
			imguigml_separator();
			imguigml_spacing();
	}
}
imguigml_end();

if (!_window[1])
	instance_destroy(id);