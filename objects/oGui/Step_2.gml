
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
            selected = Characters.lenght - 1;
        } else selected -= 1
		NAME=CHARACTERS[selected][?"name"];
    }
    if (keyboard_check_pressed(vk_right)) {
        if (selected < Characters.lenght - 1) {
            selected += 1;
        } else selected = 0
		NAME=CHARACTERS[selected][?"name"];
    }
}

if (room = Room1 and global.upgrade==1) {
    if (keyboard_check_pressed(vk_up)) {
        if (selected == 0) {
            selected = array_length(global.upgrade_options) - 1;
        } else selected -= 1
    }
    if (keyboard_check_pressed(vk_down)) {
        if (selected < array_length(global.upgrade_options) - 1) {
            selected += 1;
        } else selected = 0
    }
}
	
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







