done = false;
//gameWindow();
baseW = 640;
baseH = 360;
//show_message_async($"{baseW}:{baseH}/{display_get_gui_width()}:{display_get_gui_height()}");
offsetW = 0;
offsetH = 0;
view_enabled = true;
view_visible[0] = true;
var xport = 0;
var yport = 0;
var wport = baseW;
var hport = baseH;
//if (os_type == os_android) {
//	wport = display_get_width()/3;
//	hport = display_get_height()/3;
//	//show_message_async(string(view_wport[0]) + ":" + string(view_hport[0]));
//}
view_camera[0] = camera_create_view(0, 0, wport, hport, 0, oCam, -1, -1, 400, 250);
//target_view = 0;
//rate = 0.4;
//dis = 40;