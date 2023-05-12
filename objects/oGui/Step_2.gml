// Feather disable GM2016
if (isP != global.gamePaused) {
    loadSettingValues();
}
if (room = rInicio) {
	if (!global.gamePaused) {
	    if (upKey) { if (selected == 0) { selected = array_length(menu_options) - 1; } else selected -= 1 }
		if (downKey) { if (selected < array_length(menu_options) - 1) { selected += 1; } else selected = 0 }
		//mouseOnButton(GW/1.25, GW/6, 55, sHudButton, 1.75, 1.5, menu_options);
	}
}

if (room = rCharacterSelect) {
	if (!characterSelected) {
	    if (leftKey) {
	        if (selectedCharacter == 0) {
	            selectedCharacter = Characters.Lenght - 1;
	        } else selectedCharacter -= 1;
			NAME=CHARACTERS[selectedCharacter][?"name"];
			audio_play_sound(snd_char_select_woosh,0,0);
	    }
	    if (rightKey) {
	        if (selectedCharacter < Characters.Lenght - 1) {
	            selectedCharacter += 1;
	        } else selectedCharacter = 0;
			//mouseOnButton(GW/3.10,GH/3.75, GW/13, sAmePortrait, 2, 2, array_create(Characters.Lenght, 0), "horizontal");
			NAME=CHARACTERS[selectedCharacter][?"name"];
			audio_play_sound(snd_char_select_woosh,0,0);
	    }
	}
	if (!stageSelected and characterSelected) {
	    if (upKey) {
	        if (selected == 0) {
	            selected = array_length(stageModes) - 1;
	        } else selected -= 1
	    }
	    if (downKey) {
	        if (selected < array_length(stageModes) - 1) {
	            selected += 1;
	        } else selected = 0
	    }
	}
}


if (instance_exists(oPlayer) and global.upgrade==1) {
    if (upKey) {
        if (selected == 0) {
            selected = array_length(global.upgradeOptions) - 1;
        } else selected -= 1
    }
    if (downKey) {
        if (selected < array_length(global.upgradeOptions) - 1) {
            selected += 1;
        } else selected = 0
    }
}

#region Anvil
if (instance_exists(oPlayer) and ANVIL) {
	if (leftKey) {
		if (anvilSelected == 0) {
			anvilSelected = 5;
		} else anvilSelected -= 1
	}
	if (rightKey) {
		if (anvilSelected < 5) {
			anvilSelected += 1;
		} else anvilSelected = 0
	}

	if (upKey) {
		if (anvilSelectedCategory == 0) {
			anvilSelectedCategory = 1;
		} else  anvilSelectedCategory = 0;
	}
	if (downKey) {
		if (anvilSelectedCategory == 1) {
			anvilSelectedCategory = 0;
		} else  anvilSelectedCategory = 1;
	}
}
#endregion

if (room == rCharacterSelect) {
    if (sprindex < sprite_get_number(CHARACTERS[selected][?"sprite"])) {
		sprindex+=1/10;
	}
	else sprindex=0;
}

#region PausedMenu
	if (global.gamePaused and !global.upgrade) {
		if (upKey)
		{
			if (selected == 0)
			{ 
				selected = array_length(pauseMenu[activeMenu][PM.Options]) - 1; 
				maxselected = selected; 
				} else selected -= 1;
			}
	    if (downKey)
		{
			if (selected < (array_length(pauseMenu[activeMenu][PM.Options])) - 1)
			{
				selected += 1; 
			
				} 
			else {selected = 0; maxselected = selected; }
		}	
	}
#endregion