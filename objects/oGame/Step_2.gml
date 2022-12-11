if (keyboard_check_pressed(vk_escape) and global.upgrade == false and !ANVIL) {
	if (room != rInicio ) {
	    PauseGame();
	}
	if (global.gamePaused and room == rInicio ) {
	    PauseGame();
	}		
}