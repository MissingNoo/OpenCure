if (keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(global.GP_NUM, gp_start) and global.upgrade == false and !ANVIL) {
	if (room != rInicio ) {
	    PauseGame();
	}
	if (global.gamePaused and room == rInicio ) {
	    PauseGame();
	}		
}