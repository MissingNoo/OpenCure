
if (isP != global.gamePaused) {
    loadSettingValues();
}
if (room = rInicio) {
	if (!global.gamePaused) {
	    if (keyboard_check_pressed(vk_up)) { if (selected == 0) { selected = array_length(menu_options) - 1; } else selected -= 1 }
		if (keyboard_check_pressed(vk_down)) { if (selected < array_length(menu_options) - 1) { selected += 1; } else selected = 0 }
	}
    
}

if (room = Room2) {
    if (keyboard_check_pressed(vk_left)) {
        if (selected == 0) {
            selected = Characters.Lenght - 1;
        } else selected -= 1
		NAME=CHARACTERS[selected][?"name"];
    }
    if (keyboard_check_pressed(vk_right)) {
        if (selected < Characters.Lenght - 1) {
            selected += 1;
        } else selected = 0
		NAME=CHARACTERS[selected][?"name"];
    }
}

if (instance_exists(oPlayer) and global.upgrade==1) {
    if (keyboard_check_pressed(vk_up)) {
        if (selected == 0) {
            selected = array_length(global.upgradeOptions) - 1;
        } else selected -= 1
    }
    if (keyboard_check_pressed(vk_down)) {
        if (selected < array_length(global.upgradeOptions) - 1) {
            selected += 1;
        } else selected = 0
    }
}

#region Anvil
if (instance_exists(oPlayer) and ANVIL) {
	if (keyboard_check_pressed(vk_left)) {
		if (anvilSelected == 0) {
			anvilSelected = 5;
		} else anvilSelected -= 1
	}
	if (keyboard_check_pressed(vk_right)) {
		if (anvilSelected < 5) {
			anvilSelected += 1;
		} else anvilSelected = 0
	}

	if (keyboard_check_pressed(vk_up)) {
		if (anvilSelectedCategory == 0) {
			anvilSelectedCategory = 1;
		} else  anvilSelectedCategory = 0;
	}
	if (keyboard_check_pressed(vk_down)) {
		if (anvilSelectedCategory == 1) {
			anvilSelectedCategory = 0;
		} else  anvilSelectedCategory = 1;
	}
}
#endregion

if (room == Room2) {
    if (sprindex < sprite_get_number(CHARACTERS[selected][?"sprite"])) {
		sprindex+=1/10;
	}
	else sprindex=0;
}

#region PausedMenu
	if (global.gamePaused and !global.upgrade) {
		if (keyboard_check_pressed(vk_up))
		{
			if (selected == 0)
			{ 
				selected = array_length(pauseMenu[activeMenu][pM.Options]) - 1; 
				maxselected = selected; 
				} else selected -= 1;
			}
	    if (keyboard_check_pressed(vk_down))
		{
			if (selected < (array_length(pauseMenu[activeMenu][pM.Options])) - 1)
			{
				selected += 1; 
			
				} 
			else {selected = 0; maxselected = selected; }
		}	
	}
#endregion







