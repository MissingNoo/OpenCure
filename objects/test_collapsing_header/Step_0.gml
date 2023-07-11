if(!instance_exists(imgui)){
	exit;	
}

if(!imguigml_ready()){
	exit;	
}

imguigml_set_next_window_size(imguigml_mem("_col_header_width",640),imguigml_mem("_col_header_height",360));
var _window = imguigml_begin("CollapsingHeader",true);
if(_window[0]){
	

	var _i = 1;
	repeat(10){
		var _open = (flags >> _i) & 1;
		imguigml_set_next_tree_node_open(_open);
		var _header = imguigml_collapsing_header("Heading " + string(_i));
		if(_header[0]){
			flags = 1 << _i;
			imguigml_text("This is ("+string(_i)+") sections content");
		}else{
			if(_open){
				flags = 0;	
			}
		}
		++_i;
	}
	
	imguigml_memset("_col_header_width", imguigml_get_window_width());
	imguigml_memset("_col_header_height", imguigml_get_window_height());

	if(!_window[1]){
		instance_destroy();	
	}
}



imguigml_end();