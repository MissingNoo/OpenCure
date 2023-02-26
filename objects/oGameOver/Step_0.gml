var zKey, xKey, eKey, upKey, downKey;
zKey = oGui.zKey;
xKey = oGui.xKey;
eKey = oGui.eKey;
upKey = keyboard_check_pressed(vk_up)  or gamepad_button_check_pressed(global.gPnum, gp_padu);
downKey = keyboard_check_pressed(vk_down)  or gamepad_button_check_pressed(global.gPnum, gp_padd);
if (mousein and device_mouse_check_button_released(0,mb_left)) { zKey = true; }
if (image_alpha < 0.65) {
    image_alpha += 0.05;
}

if (downKey) {
    if (selectedOption < array_length(options) - 1) {
	    selectedOption += 1;
	}
	else{
		selectedOption = 0;
	}
}

if (upKey) {
    if (selectedOption > 0) {
	    selectedOption -= 1;
	}
	else{
		selectedOption = array_length(options) - 1;
	}
}


if (zKey) {
    switch (selectedOption) {
	    case 0:
	        show_message_async("not ready yet");
	        break;
	    case 1:
			PauseGame();
			global.gamePaused = false;
	        room_goto(room2);
	        break;
	    case 2:
			PauseGame();
			global.gamePaused = false;
	        room_goto(rInicio);
	        break;
	    default:
	        // code here
	        break;
	}
}