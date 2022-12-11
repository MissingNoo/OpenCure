//gameWindow();
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 640;
view_hport[0] = 360;
if (os_type == os_android) {
	view_wport[0] = display_get_width()/3;
	view_hport[0] = display_get_height()/3;
	//show_message_async(string(view_wport[0]) + ":" + string(view_hport[0]));
}
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, oCam, -1, -1, 400, 250);
