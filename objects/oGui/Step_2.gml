// Feather disable GM2016
var _left = (keyboard_check_pressed(LEFTKEY) or gamepad_button_check_pressed(global.gPnum,gp_padl));
var _right = (keyboard_check_pressed(RIGHTKEY) or gamepad_button_check_pressed(global.gPnum,gp_padr));
var _up = (keyboard_check_pressed(UPKEY) or gamepad_button_check_pressed(global.gPnum,gp_padu));
var _down = (keyboard_check_pressed(DOWNKEY) or gamepad_button_check_pressed(global.gPnum, gp_padd));
//if (keyboard_check_pressed(LEFTKEY)) {
//    show_message_async("left");
//}
//if (keyboard_check_pressed(DOWNKEY)) {
//    show_message_async("d");
//}
//if (keyboard_check_pressed(UPKEY)) {
//    show_message_async("u");
//}
//if (keyboard_check_pressed(RIGHTKEY)) {
//    show_message_async("r");
//}
if (isP != global.gamePaused) {
    loadSettingValues();
}
if (room = rInicio) {
	if (!global.gamePaused) {
	    if (_up) { if (selected == 0) { selected = array_length(menu_options) - 1; } else selected -= 1 }
		if (_down) { if (selected < array_length(menu_options) - 1) { selected += 1; } else selected = 0 }
		//mouseOnButton(GW/1.25, GW/6, 55, sHudButton, 1.75, 1.5, menu_options);
	}
}

if (room = rCharacterSelect) {
	if (!characterSelected) {
	    if (_left) {
	        if (selectedCharacter == 0) {
	            selectedCharacter = Characters.Lenght - 1;
	        } else selectedCharacter -= 1;
			NAME=CHARACTERS[selectedCharacter][?"name"];
			audio_play_sound(snd_charSelectWoosh,0,0);
	    }
	    if (_right) {
	        if (selectedCharacter < Characters.Lenght - 1) {
	            selectedCharacter += 1;
	        } else selectedCharacter = 0;
			//mouseOnButton(GW/3.10,GH/3.75, GW/13, sAmePortrait, 2, 2, array_create(Characters.Lenght, 0), "horizontal");
			NAME=CHARACTERS[selectedCharacter][?"name"];
			audio_play_sound(snd_charSelectWoosh,0,0);
	    }
	}
	if (!stageSelected and characterSelected) {
	    if (_up) {
	        if (selected == 0) {
	            selected = array_length(stageModes) - 1;
	        } else selected -= 1
	    }
	    if (_down) {
	        if (selected < array_length(stageModes) - 1) {
	            selected += 1;
	        } else selected = 0
	    }
	}
}


if (instance_exists(oPlayer) and global.upgrade==1) {
    if (_up) {
        if (selected == 0) {
            selected = array_length(global.upgradeOptions) - 1;
        } else selected -= 1
    }
    if (_down) {
        if (selected < array_length(global.upgradeOptions) - 1) {
            selected += 1;
        } else selected = 0
    }
}

#region Anvil
if (instance_exists(oPlayer) and ANVIL) {
	if (_left) {
		if (anvilSelected == 0) {
			anvilSelected = 5;
		} else anvilSelected -= 1
	}
	if (_right) {
		if (anvilSelected < 5) {
			anvilSelected += 1;
		} else anvilSelected = 0
	}

	if (_up) {
		if (anvilSelectedCategory == 0) {
			anvilSelectedCategory = 1;
		} else  anvilSelectedCategory = 0;
	}
	if (_down) {
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
		if (_up)
		{
			if (selected == 0)
			{ 
				selected = array_length(pauseMenu[activeMenu][PM.Options]) - 1; 
				maxselected = selected; 
				} else selected -= 1;
			}
	    if (_down)
		{
			if (selected < (array_length(pauseMenu[activeMenu][PM.Options])) - 1)
			{
				selected += 1; 
			
				} 
			else {selected = 0; maxselected = selected; }
		}	
	}
#endregion







