
isP=global.gamePaused;

#region Start Menu
	if (room = rInicio and !global.gamePaused) {
	    if (keyboard_check_pressed(ord("Z"))) {
	        switch (menu_options[selected]) {
	            case "Play":
					selected=0;
	                room_goto(Room2);
	                break;
				case "Settings":
					keyboard_clear(ord("Z"));
					PauseGame();					
					activeMenu = pMenus.Settings;
					break;
	            case "Quit":	
	                game_end();
	                break;
	        }
	    }
	}
#endregion

#region LevelUp control
	if (global.upgrade == 1) // after level up
	{
		if (holoarrowspr <= 8) { holoarrowspr+=.25; } else { holoarrowspr=0; } // arrow sprite index
	    if (keyboard_check(ord("Z"))) {
			for (var i = 0; i < 6; i++) 
			{	
				if (global.upgrade_options[selected][?"style"] == ItemTypes.Weapon) {
					#region Upgrade existing weapon
						if (UPGRADES[i][?"name"] == global.upgrade_options[selected][?"name"] ) 
						{
							UPGRADES[i] = global.upgradesAvaliable[UPGRADES[i][?"id"]][UPGRADES[i][?"level"]]+1;
							break;
						}			
					#endregion
			
					#region new weapon
						if (UPGRADES[i][?"name"] == "") 
						{
						    for (var j=0; j<array_length(global.upgradesAvaliable); j++) 
							{
							    if (global.upgradesAvaliable[j][1][?"name"] == global.upgrade_options[selected][?"name"]) 
								{
									UPGRADES[i]=global.upgradesAvaliable[j][1];
								}
							}
							break;
						}
					#endregion			
				}
				else if (global.upgrade_options[selected][?"style"] == ItemTypes.Item) {
				    #region Upgrade existing item
						if (playerItems[i][?"name"] == global.upgrade_options[selected][?"name"] ) 
						{
							playerItems[i] = ItemList[playerItems[i][?"id"]][playerItems[i][?"level"]]+1;
							break;
						}			
					#endregion
			
					#region new item
						if (playerItems[i][?"name"] == "") 
						{
						    for (var j=0; j<array_length(ItemList); j++) 
							{
							    if (ItemList[j][1][?"name"] == global.upgrade_options[selected][?"name"]) 
								{
									playerItems[i]=ItemList[j][1];
								}
							}
							break;
						}
					#endregion			
				}
				else if (global.upgrade_options[selected][?"style"] == ItemTypes.Perk) {
					#region Upgrade existing item
							if (playerPerks[i][?"name"] == global.upgrade_options[selected][?"name"] ) 
							{
								playerPerks[i] = PerkList[playerPerks[i][?"id"]][playerPerks[i][?"level"]]+1;
								break;
							}			
						#endregion		
				}
			}
			global.xp = 0;
			
	        global.upgrade = 0;
	        PauseGame();
			if (instance_exists(oJoystick)) { oJoystick.mode = "stage"; }
	    }
}
#endregion

#region Select Character room
	if (room = Room2) {
	    if (keyboard_check_pressed(ord("Z"))) {
	        global.Player=CHARACTERS[selected];
			//show_message(string(Characters.Amelia));
			//show_message(string(CHARACTERS[selected][?"id"]));
			playerPerks = global.characterPerks[CHARACTERS[selected][?"id"]];
			if (instance_exists(oJoystick)) { oJoystick.mode = "stage"; }
			audio_stop_sound(global.musicPlaying);
			room_goto(Room1);
	    }
	}
#endregion

#region Android buttons
	if (os_type == os_android) {
		if (TouchY1 > zButtonY and TouchY1 < zButtonYEnd and TouchX1 > zButtonX and TouchX1 < zButtonXEnd and device_mouse_check_button(0,mb_left)) {
			keyboard_key_press(ord("Z"));
			keyboard_key_release(ord("Z"));
			show_debug_message("Pressed Z");
		}

		if (TouchY1 > xButtonY and TouchY1 < xButtonYEnd and TouchX1 > xButtonX and TouchX1 < xButtonXEnd and device_mouse_check_button(0,mb_left)) {
			keyboard_key_press(ord("X"));
			keyboard_key_release(ord("X"));
			show_debug_message("Pressed X");
			global.xp=1600;
			//game_restart();
		}
	
		if (TouchY1 > pButtonY and TouchY1 < pButtonYEnd and TouchX1 > pButtonX and TouchX1 < pButtonXEnd and device_mouse_check_button(0,mb_left)) {
			keyboard_key_press(vk_escape);
			keyboard_key_release(vk_escape);
			show_debug_message("Pressed Escape");
		}
}
#endregion

#region PauseMenu
if (global.gamePaused and !global.upgrade) {
	pauseMenu[activeMenu][pM.yScale] = 0.75;
	for (var i = 1; i < array_length(pauseMenu[activeMenu][pM.Options]); ++i) {
		if (i < 5) {
		    pauseMenu[activeMenu][pM.yScale] += .1 * i;
		}			
	}
	
	if (keyboard_check_pressed(ord("K"))){
		pauseMenu[activeMenu][pM.Options][array_length(pauseMenu[activeMenu][pM.Options])] = "teste " + string(irandom_range(0,99));
	}
    if (keyboard_check_pressed(ord("Z"))){
		var optionIs = "";
		for (var i = 1; i < string_length(pauseMenu[activeMenu][pM.Options][selected]); ++i) {
			if (string_copy(pauseMenu[activeMenu][pM.Options][selected],i,1) == ":") {
			    break;
			}
		    optionIs = optionIs + string_copy(pauseMenu[activeMenu][pM.Options][selected],i,1);
		}
		switch (optionIs) {
			case "Damage Numbers":{
		        global.damageNumbers = !global.damageNumbers;
				loadSettingValues();
		        break;} 
			case "Screen Shake":{
		        global.canShake= !global.canShake;
				loadSettingValues();
		        break;} 
		}
		
		var lastmenu = activeMenu;
		switch (pauseMenu[activeMenu][pM.Options][selected]) {
			case "Skills":{
		        show_message("a");
		        break;}
			case "????":{
		        show_message("b");
		        break;}
			case "Resume":{
		        show_message("c");
		        break;}
		    case "Settings":{
		        activeMenu = pMenus.Settings;
		        break;}
			case "Quit":{
		        game_restart();
		        break;}
		}
		
		#region settings controlaudio_sound_get_gain(global.musicPlaying));
		#endregion
		if (activeMenu != lastmenu) {
			loadSettingValues();
		    selected=0;
			startOption = 0;
			totaloptions = array_length(pauseMenu[activeMenu][pM.Options]);
		}		
		
	}		
	if (keyboard_check_pressed(LEFTKEY) or keyboard_check_pressed(RIGHTKEY)){
		var optionIs = "";
		for (var i = 1; i < string_length(pauseMenu[activeMenu][pM.Options][selected]); ++i) {
			if (string_copy(pauseMenu[activeMenu][pM.Options][selected],i,1) == ":") {
			    break;
			}
		    optionIs = optionIs + string_copy(pauseMenu[activeMenu][pM.Options][selected],i,1);
		}
		switch (optionIs) {
		    case "Music Volume":{
		        global.musicVolume += (keyboard_check_pressed(RIGHTKEY)*0.1) - (keyboard_check_pressed(LEFTKEY)*0.1);
				if (global.musicVolume > 1) {
				    global.musicVolume = 1;
				}
				if (global.musicVolume < 0) {
				    global.musicVolume = 0;
				}
				loadSettingValues();
		        break;}
			case "Sound Volume":{
		        global.soundVolume += (keyboard_check_pressed(RIGHTKEY)*0.1) - (keyboard_check_pressed(LEFTKEY)*0.1);
				if (global.soundVolume > 1) {
				    global.soundVolume = 1;
				}
				if (global.soundVolume < 0) {
				    global.soundVolume = 0;
				}
				loadSettingValues();
		        break;}
		}
	}
}
#endregion


#region Debug
	if (global.debug) {
		if(keyboard_check(ord("L"))) game_restart();
		//if(keyboard_check(ord("Q"))) a -=1;
		if(keyboard_check(ord("Q"))) a -=0.005;
		//if(keyboard_check(ord("W"))) a +=1;
		if(keyboard_check(ord("W"))) a += 0.005;
		if(keyboard_check(ord("E"))) b -=.05;
		//if(keyboard_check(ord("E"))) b -=1;
		if(keyboard_check(ord("R"))) b +=.05;
		//if(keyboard_check(ord("R"))) b +=1;
		if(keyboard_check(ord("T"))) c -=.1;
		if(keyboard_check(ord("Y"))) c +=.1;
		if(keyboard_check(ord("U"))) d -=.1;
		if(keyboard_check(ord("I"))) d +=.1;
		if(keyboard_check_pressed(ord("O"))) e -=.5;
		if(keyboard_check(ord("P"))) e +=1;
		if((keyboard_check(vk_escape) and room == Room2)) {room_goto(rInicio)}
		//if (keyboard_check_pressed(ord("V"))) {
		//    display_set_gui_size(640,360);
		//}
		//if (keyboard_check_pressed(ord("B"))) {
		//    display_set_gui_size(1280,720);
		//}
		//if (keyboard_check_pressed(ord("N"))) {
		//    display_set_gui_size(1920,1080);
		//}
		if (global.debug and instance_exists(oPlayer)) {
		    revives = oPlayer.revives;
		}
		if (global.debug and instance_exists(oEvents)) {
		    event= oEvents.event;
		}
		
	}
#endregion





