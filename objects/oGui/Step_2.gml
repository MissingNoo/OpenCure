// Feather disable GM2016
var _updown = - upKey + downKey;
var _leftright = - leftKey + rightKey;
if (isP != global.gamePaused) {
    loadSettingValues();
}
if (room == rInicio) {
	if (!global.gamePaused) {
	    if (upKey) { if (selected == 0) { selected = array_length(menuOptions) - 1; } else selected -= 1 }
		if (downKey) { if (selected < array_length(menuOptions) - 1) { selected += 1; } else selected = 0 }
		//mouseOnButton(GW/1.25, GW/6, 55, sHudButton, 1.75, 1.5, menuOptions);
	}
}

if (room == rAchievements) {
	//feather disable once GM1044
	if (input_check_pressed("cancel")) {
	    room_goto(rInicio);
	}
}

if (room == rCharacterSelect) {
	if (!characterSelected) {
		selectedCharacter += _leftright;
	    if (selectedCharacter < 1) { selectedCharacter = Characters.Lenght - 1; }
	    if (selectedCharacter > Characters.Lenght - 1) { selectedCharacter = 1; }
		if (_leftright != 0) {
		    NAME=CHARACTERS[selectedCharacter][?"name"];
			audio_play_sound(snd_char_select_woosh,0,0);
		}		
	}
	if (selectingOutfit) {
		selectedOutfit += _leftright;
		if (selectedOutfit > maxOutfits) { selectedOutfit = 0; }
		if (selectedOutfit < 0) { selectedOutfit = maxOutfits; }
	}
	if (!stageSelected and characterSelected and outfitSelected) {
	    selected += _updown;
		if (selected < 0) { selected = array_length(stageModes) - 1; }
		if (selected > array_length(stageModes) - 1) { selected = 0; }
	}
}
//global.holocoins = 99999;

if (instance_exists(oPlayer) and global.upgrade==1) {
	var istherererolls = -1;
	if (global.rerolls > 0) { istherererolls = 1; }
	selected += _updown;
    if (selected < 0) { selected = array_length(global.upgradeOptions) + istherererolls; }
    if (selected > array_length(global.upgradeOptions) + istherererolls) { selected = 0; }
}

#region Anvil
if (instance_exists(oPlayer) and ANVIL) {
	if (anvilconfirm) { return; }
	anvilSelected += _leftright;
	if (anvilSelected < 0) { anvilSelected = 5; }
	if (anvilSelected > 5) { anvilSelected = 0; }
	anvilSelectedCategory += _updown;
	if (anvilSelectedCategory < 0) { anvilSelectedCategory = 0; }
	if (anvilSelectedCategory > 1) { anvilSelectedCategory = 1; }	
}
#endregion

if (room == rCharacterSelect) {
	var _sprspd = sprite_get_speed(CHARACTERS[selectedCharacter][?"sprite"]);
    if (sprindex < sprite_get_number(CHARACTERS[selectedCharacter][?"sprite"])) {
		sprindex+= _sprspd / game_get_speed(gamespeed_fps) * Delta;
	}
	else sprindex=0;
}

#region PausedMenu
if (global.gamePaused and !global.upgrade and !ANVIL and !editOption) {
	selected += _updown;
	var _maxopt = array_length(pauseMenu[activeMenu][PM.Options]) - 1;
	if (selected < 0) { selected = 0; }
	if (selected > _maxopt) { selected = _maxopt;	}
}
#endregion