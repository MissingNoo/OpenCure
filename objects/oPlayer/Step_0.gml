// Feather disable GM2016
if(keyboard_check(ord("R"))) v-=0.01;
if(keyboard_check(ord("T"))) v+=0.01;
if (keyboard_check_pressed(vk_control)) {
	//summonCircle();
	global.xp=1600;
}
if (keyboard_check_pressed(vk_shift)) {
//show_message(array_length(global.upgrades))
}
if (!global.gamePaused) {
	tickPowers();
	tickItems();
	Movement();
    //if (input_check_pressed("shoot")) instance_create_layer(mouse_x, mouse_y, "Instances", oEnemy);
	
	if (global.xp >= 1355) {
		global.xp -=1355;
		randomUpgrades()
		global.upgrade=1;	
		oGui.selected=0;
		PauseGame()
	}
	
	if (global.hp <= 0) {
		if (revives <= 0) {
		    game_restart();
		}
		else {
		    HP = MAXHP/2;
			revives -= 1;
		}
		
	}
}













