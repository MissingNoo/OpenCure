if(keyboard_check_pressed(ord("R"))) v--;
if(keyboard_check_pressed(ord("T"))) v++;
if (keyboard_check_pressed(vk_control)) {
	//summonCircle();
	global.xp=1600;
}
if (keyboard_check_pressed(vk_shift)) {
//show_message(array_length(global.upgrades))
}
if (!global.gamePaused) {
	tickPowers();
	arrowDir();
    //if (input_check_pressed("shoot")) instance_create_layer(mouse_x, mouse_y, "Instances", oEnemy);
	
	if (global.xp >= 1355) {
		global.xp -=1355;
		randomUpgrades()
		global.upgrade=1;	
		PauseGame()
	}
	
	if (global.hp <= 0) {
		game_restart()
	}
}








