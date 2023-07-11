///@desc imgui - EndStep

global.___imguiIg = undefined;
if (!NewFrame)
	return;
  
_extImguiGML_end_step();

NewFrame = false;

//If imgui is not rendering mouse cursor then
//set native gml cursor icon
if (Should_update_cursor && Using_GM_cursor && !User_cursor_override) {

	var new_cursor = Last_set_cursor;
	switch (imguigml_get_mouse_cursor()) {
		case EImGui_MouseCursor.Arrow:      new_cursor = cr_arrow;     break;
		case EImGui_MouseCursor.None:       new_cursor = cr_none;      break;
		case EImGui_MouseCursor.ResizeEW:	  new_cursor = cr_size_we;   break;
		case EImGui_MouseCursor.ResizeNESW: new_cursor = cr_size_nesw; break;
		case EImGui_MouseCursor.ResizeNS:   new_cursor = cr_size_ns;   break;
		case EImGui_MouseCursor.ResizeNWSE: new_cursor = cr_size_nwse; break;
		case EImGui_MouseCursor.TextInput:  new_cursor = cr_beam;      break;
		default: new_cursor = cr_arrow; break;
	}
		
	if (new_cursor != Last_set_cursor) {
		Last_set_cursor = new_cursor;
		window_set_cursor(new_cursor);
	}
}
