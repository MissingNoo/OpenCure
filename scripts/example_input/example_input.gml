///@function example_input_callback(_callback_data)
///@desc input text callback
///@param {Array:EImGui_TextCallbackData}
function example_input_completion_callback(_callback_data) {
	with (example) {
	  Tabs++;
	  _callback_data[@ EImGui_TextCallbackData.CurPos] = Tabs;
	  _callback_data[@ EImGui_TextCallbackData.Text] = "Example callback. Tabs #: " + string(Tabs);
	}
}

///@function example_input_char_filter_test(_callback_data)
///@desc input text callback
///@param {Array:EImGui_TextCallbackData}
function example_input_char_filter_callback() {
	var _callback_data = argument[0];
	// var _user_data = argument[1];
	
	with (example) {
	  var char = _callback_data[@ EImGui_TextCallbackData.Char];
	  if (char == "a")
	    return 1;
  
	  _callback_data[@ EImGui_TextCallbackData.Char] = string_lower(char);
  } 
}

///@function example_input_history_callback(_callback_data)
///@desc input text callback
///@param {Array:EImGui_TextCallbackData}
///@param {Array:[ history_list, current_index ]}
function example_input_history_callback() {
	var _callback_data = argument[0];
	// var _user_data = argument[1];
	
	with (example) {
	  var key = _callback_data[@ EImGui_TextCallbackData.Key];
	  if (key == EImGui_Key.UpArrow) {
	    _callback_data[@ EImGui_TextCallbackData.Text] = "History Up!";
	  } else if (key == EImGui_Key.DownArrow) {
	    _callback_data[@ EImGui_TextCallbackData.Text] = "History Down!"; 
	  }
	} 
}

///@function example_input_always_callback(_callback_data)
///@desc input text callback
///@param {Array:EImGui_TextCallbackData}
function example_input_always_callback() {
	var _callback_data = argument[0];
	// var _user_data = argument[1];
	
	with (example) {
	  var cur_pos = _callback_data[EImGui_TextCallbackData.CurPos]
	  Always_out = "Cursor: " + string(cur_pos);
	  var sel_start = _callback_data[EImGui_TextCallbackData.SelectionStart];
	  var sel_end   = _callback_data[EImGui_TextCallbackData.SelectionEnd];
	  if (sel_start != sel_end) 
	    Always_out += " Selected: " + string (sel_end - sel_start) + " chars.";
	} 
}
