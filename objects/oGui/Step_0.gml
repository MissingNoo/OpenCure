
isP=global.gamePaused;
zKey = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(global.GP_NUM, gp_face1);
xKey = keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(global.GP_NUM, gp_face2);
eKey = keyboard_check_pressed(vk_escape)  or gamepad_button_check_pressed(global.GP_NUM, gp_start);
#region Start Menu
	if (room = rInicio and !global.gamePaused) {
	    if (zKey) {
	        switch (menu_options[selected]) {
	            case "Play":
					selected=0;
	                room_goto(Room2);
	                break;
				case "Settings":
					keyboard_clear(ord("Z"));
					PauseGame();					
					activeMenu = PMenus.Settings;
					break;
	            case "Quit":	
	                game_end();
	                break;
	        }
	    }
	}
#endregion

#region LevelUp control
	if (global.upgrade) // after level up
	{
		if (holoarrowspr <= 8) { holoarrowspr+=.25; } else { holoarrowspr=0; } // arrow sprite index
	    if (zKey) {
			for (var i = 0; i < 6; i++) 
			{	
				if (global.upgradeOptions[selected][?"name"] == "null") {
				    break;
				}
				if (global.upgradeOptions[selected][?"style"] == ItemTypes.Weapon) {
					#region Upgrade existing weapon
						if (UPGRADES[i][?"name"] == global.upgradeOptions[selected][?"name"] ) 
						{
							UPGRADES[i] = global.upgradesAvaliable[UPGRADES[i][?"id"]][UPGRADES[i][?"level"]]+1;
							break;
						}			
					#endregion
			
					#region new weapon
						if (UPGRADES[i][?"name"] == "null") 
						{
						    for (var j=0; j<array_length(global.upgradesAvaliable); j++) 
							{
							    if (global.upgradesAvaliable[j][1][?"name"] == global.upgradeOptions[selected][?"name"]) 
								{
									UPGRADES[i]=global.upgradesAvaliable[j][1];
								}
							}
							break;
						}
					#endregion			
				}
				else if (global.upgradeOptions[selected][?"style"] == ItemTypes.Item) {
				    #region Upgrade existing item
						if (playerItems[i][?"name"] == global.upgradeOptions[selected][?"name"] ) 
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
							    if (ItemList[j][1][?"name"] == global.upgradeOptions[selected][?"name"]) 
								{
									playerItems[i]=ItemList[j][1];
								}
							}
							break;
						}
					#endregion			
				}
				else if (global.upgradeOptions[selected][?"style"] == ItemTypes.Perk) {
					#region Upgrade existing item
							if (PLAYER_PERKS[i][?"name"] == global.upgradeOptions[selected][?"name"] ) 
							{
								PLAYER_PERKS[i] = PERK_LIST[PLAYER_PERKS[i][?"id"]][PLAYER_PERKS[i][?"level"]]+1;
								break;
							}			
						#endregion		
				}
			}
			global.xp -= oPlayer.neededxp;
			
	        global.upgrade = 0;
	        PauseGame();
			if (instance_exists(oJoystick)) { oJoystick.mode = "stage"; }
	    }
}
#endregion

#region Anvil
if (ANVIL) {
	var selectedThing;
	if (anvilSelectedCategory == 0) {
		selectedThing = UPGRADES[anvilSelected];
	}else{
		selectedThing = playerItems[anvilSelected];
	}
	var level = selectedThing[?"level"];
	var maxlevel = selectedThing[?"maxlevel"];
	if (keyboard_check_pressed(ord("Z")) and level < maxlevel) {
		if (anvilSelectedCategory == 0) {
			UPGRADES[anvilSelected] = global.upgradesAvaliable[UPGRADES[anvilSelected][?"id"]][UPGRADES[anvilSelected][?"level"] + 1];
		}
		if (anvilSelectedCategory == 1) {
			playerItems[anvilSelected] = global.itemList[playerItems[anvilSelected][?"id"]][playerItems[anvilSelected][?"level"] + 1];
		}
	ANVIL = false;//TODO: Cost money
	PauseGame();
	}
}
#endregion

#region Select Character room
	if (room = Room2) {
	    if (zKey) {
	        global.player=CHARACTERS[selected];
			//show_message(string(Characters.Amelia));
			//show_message(string(CHARACTERS[selected][?"id"]));
			PLAYER_PERKS = global.characterPerks[CHARACTERS[selected][?"id"]];
			if (instance_exists(oJoystick)) { oJoystick.mode = "stage"; }
			audio_stop_sound(global.musicPlaying);
			room_goto(Room1);
	    }
	}
#endregion

#region Android buttons
	if (os_type == os_android) {
		//if (global.gamePaused and !released and alarm_get(0) == -1 and !device_mouse_check_button(0, mb_left)) {
		//	released = false;
		//	if (!alarm_get(0) > 0) {
		//	    alarm[0] = 60;
		//	}
		//	//released=true;
		//}
		
		if (TouchY1 > zButtonY and TouchY1 < zButtonYEnd and TouchX1 > zButtonX and TouchX1 < zButtonXEnd and device_mouse_check_button(0,mb_left) and released) {
			released = false;
			//alarm[0]=30;
			keyboard_key_press(ord("Z"));
			//oGui.zKey = true;
			keyboard_key_release(ord("Z"));
			//oGui.zKey = false;
			keyboard_clear(ord("Z"));
			show_debug_message("Pressed Z");
		}

		if (TouchY1 > xButtonY and TouchY1 < xButtonYEnd and TouchX1 > xButtonX and TouchX1 < xButtonXEnd and device_mouse_check_button(0,mb_left) and released) {
			released = false;
			//alarm[0]=30;
			keyboard_key_press(ord("X"));
			//oGui.xKey = true;
			keyboard_key_release(ord("X"));
			//oGui.xKey = false;
			keyboard_clear(ord("X"));
			show_debug_message("Pressed X");
			instance_create_layer(oPlayer.x+100, oPlayer.y, "Instances", oAnvil);
			var inst = instance_create_layer(oPlayer.x-100, oPlayer.y, "Instances", oXP);
			inst.xp = oPlayer.neededxp;
			//game_restart();
		}
	
		if (TouchY1 > pButtonY and TouchY1 < pButtonYEnd and TouchX1 > pButtonX and TouchX1 < pButtonXEnd and device_mouse_check_button(0,mb_left)  and released) {
			released = false;
			//alarm[0]=30;
			keyboard_key_press(vk_escape);
			//oGui.eKey = true;
			keyboard_key_release(vk_escape);
			//oGui.eKey = false;
			keyboard_clear(vk_escape);
			show_debug_message("Pressed Escape");
		}
		if (!device_mouse_check_button(0, mb_left) and !released) {
			released = true;
		}
}
#endregion

#region PauseMenu
if (global.gamePaused and !global.upgrade and !ANVIL) {
	pauseMenu[activeMenu][pM.yScale] = 0.75;
	for (var i = 1; i < array_length(pauseMenu[activeMenu][pM.Options]); ++i) {
		if (i < 5) {
		    pauseMenu[activeMenu][pM.yScale] += .1 * i;
		}			
	}
	
	if (keyboard_check_pressed(ord("K"))){
		//pauseMenu[activeMenu][pM.Options][array_length(pauseMenu[activeMenu][pM.Options])] = "teste " + string(irandom_range(0,99));
	}
    if (zKey){
		var optionIs = "";
		for (var i = 1; i < string_length(pauseMenu[activeMenu][pM.Options][selected]); ++i) {
			if (string_copy(pauseMenu[activeMenu][pM.Options][selected],i,1) == ":") {
			    break;
			}
			if (string_copy(pauseMenu[activeMenu][pM.Options][selected],i,1) == " ") {
				i++;
			}
		    optionIs = optionIs + string_copy(pauseMenu[activeMenu][pM.Options][selected],i,1);
		}
		
		variable_global_set(optionIs, !variable_global_get(optionIs));
		loadSettingValues();
		//switch (optionIs) {
		//	case "Damage Numbers":{
		//        global.DamageNumbers = !global.DamageNumbers;
		//		loadSettingValues();
		//        break;} 
		//	case "Screen Shake":{
		//        global.ScreenShake= !global.ScreenShake;
		//		loadSettingValues();
		//        break;} 
		//	case "SpawnEnemies":{
		//        global.SpawnEnemies= !global.SpawnEnemies;
		//		loadSettingValues();
		//        break;} 
		//}
		
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
		        activeMenu = PMenus.Settings;
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