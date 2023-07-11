if(!instance_exists(imgui)){
	exit;	
}

if(!imguigml_ready()){
	exit;	
}

imguigml_set_next_window_size(640, 360, EImGui_Cond.FirstUseEver);
var _window = imguigml_begin("ColorTest",true);
if(_window[0]){
	var _input, _colour;
	imguigml_text("Expanding Arrays");
	var _i=0;
	
	//Edit 3
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_edit3("edit3##expand", _colour[0], _colour[1], _colour[2]);
	if(_input[0]){
		_colour = imguigml_color_convert_float4_to_gml(_input[1], _input[2], _input[3], 1);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	
	//Edit 4
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_edit4("edit4##expand", _colour[0], _colour[1], _colour[2], _colour[3]);
	if(_input[0]){
		_colour = imguigml_color_convert_float4_to_gml(_input[1], _input[2], _input[3], _input[4]);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	
	//Pick 3
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_picker3("picker3##expand", _colour[0], _colour[1], _colour[2]);
	if(_input[0]){
		_colour = imguigml_color_convert_float4_to_gml(_input[1], _input[2], _input[3], 1);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	
	//Pick 4
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_picker4("pick4##expand", _colour[0], _colour[1], _colour[2], _colour[3]);
	if(_input[0]){
		_colour = imguigml_color_convert_float4_to_gml(_input[1], _input[2], _input[3], _input[4]);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	
	
	imguigml_spacing();
	imguigml_separator();
	imguigml_spacing();
	
	imguigml_text("Passing Arrays");

	//Edit 3
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_edit3("edit3##pass", _colour);
	if(_input[0]){
		_input = [_input[1], _input[2], _input[3], 1];
		_colour = imguigml_color_convert_float4_to_gml(_input);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	
	//Edit 4
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_edit4("edit4##pass", _colour);
	if(_input[0]){
		_input = [_input[1], _input[2], _input[3], _input[4]];
		_colour = imguigml_color_convert_float4_to_gml(_input);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	
	//Pick 3
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_picker3("picker3##pass", _colour);
	if(_input[0]){
		_input = [_input[1], _input[2], _input[3], 1];
		_colour = imguigml_color_convert_float4_to_gml(_input);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	
	//Pick 4
	_colour = imguigml_color_convert_gml_to_float4(colours[_i], alphas[_i]);
	_input = imguigml_color_picker4("picker4##pass", _colour);
	if(_input[0]){
		_input = [_input[1], _input[2], _input[3], _input[4]];
		_colour = imguigml_color_convert_float4_to_gml(_input);	
		colours[_i] = _colour[0];
		alphas[_i] = _colour[1];
	}
	++_i;
	

	
	if(!_window[1]){
		instance_destroy();	
	}
}



imguigml_end();