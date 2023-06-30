// Feather disable GM1044
if (device_mouse_check_button_pressed(0, ev_left_button)) {
    x = device_mouse_x_to_gui(0);
	y = device_mouse_y_to_gui(0);
}
if (device_mouse_check_button_released(0, ev_left_button)) {
    x = 0;
	y = 0;
}

if (instance_number(oTitleRunning) == 0 and room == rInicio) {
    instance_create_layer(0,0, "Instances", oTitleRunning);
}
if (room == rInicio and instance_exists(oClient)) {
    instance_destroy(oClient);
	global.IsHost = true;
}
if (room == Room1 and !instance_exists(oClient)) {
	instance_create_layer(1895, 1880, "Instances", oClient);
    instance_create_layer(1895, 1880, "Instances", oPlayer);
}
if (mouse_check_button(mb_left)) {
    var _xx = GW;
	var _xn = 1;
	var _yy = GH;
	var _yn = 1;
	while (_xx > TouchX1) {
	    _xn += .005;
		_xx = GW/_xn;
	}
	while (_yy > TouchY1) {
	    _yn += .005;
		_yy = GH/_yn;
	}
	a = _xn;
	b = _yn;
	//show_message(string(_xn));
}
if (mouse_check_button(mb_right)) {
    var _xx = GW;
	var _xn = 1;
	var _yy = GH;
	var _yn = 1;
	while (_xx > TouchX1) {
	    _xn += .005;
		_xx = GW/_xn;
	}
	while (_yy > TouchY1) {
	    _yn += .005;
		_yy = GH/_yn;
	}
	c = _xn;
	d = _yn;
	//show_message(string(_xn));
}
isP=global.gamePaused;
//if (global.GamePad) {
//    zKey = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(global.gPnum, gp_face1);
//}else{zKey = keyboard_check_pressed(ord("Z")) or mousein and device_mouse_check_button_released(0,mb_left);}
// Feather disable 2016
zKey = input_check_pressed("accept");
xKey = input_check_pressed("cancel");
eKey = input_check_pressed("action");
leftKey = input_check_pressed("left");
rightKey = input_check_pressed("right");
upKey = input_check_pressed("up");
downKey = input_check_pressed("down");

if (xKey and global.gamePaused) {
	if (!editOption) {
		if (activeMenu != PMenus.Pause) {
		    activeMenu = PMenus.Pause;
		}
		else{
			PauseGame();
		}
	}
	else{
		editOption = false;
	}
}

#region Start Menu
	if (room = rInicio and !global.gamePaused) {
	    if (zKey) {
	        switch (menu_options[selected]) {
	            case "Singleplayer":
					characterSelected = false;
					global.server = true;
					selected=0;
	                room_goto(rCharacterSelect);
	                break;
				case "Multiplayer":
					global.server = false;
					//instance_create_layer(0, 0, "Instances", oClient);
					characterSelected = false;					
					selected=0;
	                room_goto(rCharacterSelect);
	                break;
				case "Settings":
					keyboard_clear(ord("Z"));
					PauseGame();					
					activeMenu = PMenus.Settings;
					break;
				case "Shop":
					keyboard_clear(ord("Z"));
					room_goto(rShop);
					break;
	            case "Quit":	
					Save_Data_Structs();
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
			if (selected == 4) {
				if (global.rerolls > 0) {
					randomUpgrades();
					global.rerolls--;
				}
			    return;				
			}
			for (var i = 0; i < 6; i++) 
			{	
				if (global.upgradeOptions[selected][$"name"] == "null") { break; }
				if (global.upgradeOptions[selected][$"id"] == ItemIds.Holocoin){ 
					var coins = 50;
					for (var i = 1; i < global.ShopUpgrades.MoneyGain.level; ++i) {
						coins = coins + ((coins * 20) / 100);
					}
					global.newcoins += coins;
					break; 
				}
				if (global.upgradeOptions[selected][$"id"] == ItemIds.Hamburguer){ HP += 10; break; }
				
				if (global.upgradeOptions[selected][$"style"] == ItemTypes.Weapon) {
					#region Upgrade existing weapon
						if (UPGRADES[i][$"name"] == global.upgradeOptions[selected][$"name"] ) 
						{
							//show_message(global.upgradesAvaliable[UPGRADES[i][$"id"]]);
							var newlevel = UPGRADES[i][$"level"] + 1;
							UPGRADES[i] = global.upgradesAvaliable[UPGRADES[i][$"id"]][newlevel];
							break;
						}			
					#endregion
			
					#region new weapon
						if (UPGRADES[i][$"name"] == "null") 
						{
						    for (var j=0; j<array_length(global.upgradesAvaliable); j++) 
							{
							    if (global.upgradesAvaliable[j][1][$"name"] == global.upgradeOptions[selected][$"name"]) 
								{
									UPGRADES[i]=global.upgradesAvaliable[j][1];
								}
							}
							break;
						}
					#endregion
				}
				else if (global.upgradeOptions[selected][$"style"] == ItemTypes.Item) {
				    #region Upgrade existing item
						if (playerItems[i][$"name"] == global.upgradeOptions[selected][$"name"] ) 
						{
							var newlevel = playerItems[i][$"level"] + 1;
							playerItems[i] = ItemList[playerItems[i][$"id"]][newlevel];
							break;
						}
					#endregion
			
					#region new item
					//show_message(playerItems[i][$"name"]);
						if (playerItems[i][$"name"] == "") 
						{
						    for (var j=0; j<array_length(ItemList); j++) 
							{
							    if (ItemList[j][1][$"name"] == global.upgradeOptions[selected][$"name"]) 
								{
									playerItems[i]=ItemList[j][1];
								}
							}
							break;
						}
					#endregion
				}
				else if (global.upgradeOptions[selected][$"style"] == ItemTypes.Perk) {
					#region Upgrade existing item
							if (PLAYER_PERKS[i][$"name"] == global.upgradeOptions[selected][$"name"] ) 
							{
								var newlevel = PLAYER_PERKS[i][$"level"]+1;
								PLAYER_PERKS[i] = PERK_LIST[PLAYER_PERKS[i][$"id"]][newlevel];
								break;
							}
						#endregion
				}
			}
			global.xp -= oPlayer.neededxp;
			
	        global.upgrade = 0;
	        PauseGame();
			if (instance_exists(oJoystick)) { global.mode = "stage"; }
	    }
}
#endregion

#region Anvil
//TODO: rankupgrades cost money
if (ANVIL) {
	var selectedThing;
	if (anvilSelectedCategory == 0) {
		selectedThing = UPGRADES[anvilSelected];
	}else{
		selectedThing = playerItems[anvilSelected];
	}
	var level = selectedThing[$"level"];
	var maxlevel = selectedThing[$"maxlevel"];
	if (zKey and level < maxlevel) {
		if (anvilSelectedCategory == 0) {
			UPGRADES[anvilSelected] = global.upgradesAvaliable[UPGRADES[anvilSelected][$"id"]][UPGRADES[anvilSelected][$"level"] + 1];
		}
		if (anvilSelectedCategory == 1) {
			playerItems[anvilSelected] = global.itemList[playerItems[anvilSelected][$"id"]][playerItems[anvilSelected][$"level"] + 1];
		}
	ANVIL = false;//TODO: Cost money
	PauseGame();
	}
}
#endregion

#region Select Character room
	if (room = rCharacterSelect) {
	    if (zKey) {
			if (stageSelected) {
			    room_goto(stages[0].roomname);
			}
			if (!stageSelected and characterSelected) {
			    stageSelected = true;
				if (selected == 0) { global.stageType = StageTypes.Stage; }
				if (selected == 1) { global.stageType = StageTypes.Endless; }
			}
			if (!characterSelected) {
		        global.player=CHARACTERS[selectedCharacter];
				//show_message(global.player[? "name"]);
				//show_message(string(Characters.Amelia));
				//show_message(string(CHARACTERS[selected][?"id"]));
				PLAYER_PERKS = global.characterPerks[CHARACTERS[selectedCharacter][?"id"]];
				audio_stop_sound(global.musicPlaying);
				audio_play_sound(snd_char_selected,0,0);
				switch (global.server) {
				    case true:
				        global.mode = "stage";
						//room_goto(Room1);
						characterSelected = true;
				        break;
				    case false:
				        global.mode = "menu";
						global.username = global.player[?"name"]; //TODO: Remove
						room_goto(rLobby);
				        break;
				}
			}
	    }
	}
#endregion

#region Android buttons
	if (os_type == os_android) {
		
		//if (TouchY1 > zButtonY and TouchY1 < zButtonYEnd and TouchX1 > zButtonX and TouchX1 < zButtonXEnd and device_mouse_check_button(0,mb_left) and released) {
		//	released = false;
		//	//alarm[0]=30;
		//	keyboard_key_press(ord("Z"));
		//	//oGui.zKey = true;
		//	keyboard_key_release(ord("Z"));
		//	//oGui.zKey = false;
		//	keyboard_clear(ord("Z"));
		//	show_debug_message("Pressed Z");
		//}

		//if (TouchY1 > xButtonY and TouchY1 < xButtonYEnd and TouchX1 > xButtonX and TouchX1 < xButtonXEnd and device_mouse_check_button(0,mb_left) and released) {
		//	released = false;
		//	//alarm[0]=30;
		//	keyboard_key_press(ord("X"));
		//	//keyboard_key_press(vk_escape);
		//	//oGui.xKey = true;
		//	keyboard_key_release(ord("X"));
		//	//keyboard_key_release(vk_escape);
		//	//oGui.xKey = false;
		//	keyboard_clear(ord("X"));
		//	show_debug_message("Pressed X");
		//	//instance_create_layer(oPlayer.x+100, oPlayer.y, "Instances", oAnvil);
		//	//var inst = instance_create_layer(oPlayer.x-100, oPlayer.y, "Instances", oXP);
		//	//inst.xp = oPlayer.neededxp;
		//	//game_restart();
		//}
	
		//if (TouchY1 > pButtonY and TouchY1 < pButtonYEnd and TouchX1 > pButtonX and TouchX1 < pButtonXEnd and device_mouse_check_button(0,mb_left)  and released) {
		//	released = false;
		//	//alarm[0]=30;
		//	keyboard_key_press(vk_escape);
		//	//oGui.eKey = true;
		//	keyboard_key_release(vk_escape);
		//	//oGui.eKey = false;
		//	keyboard_clear(vk_escape);
		//	show_debug_message("Pressed Escape");
		//}
		//if (!device_mouse_check_button(0, mb_left) and !released) {
		//	released = true;
		//}
}
#endregion

#region PauseMenu
if (global.gamePaused and !global.upgrade and !ANVIL) {
	pauseMenu[activeMenu][PM.YScale] = 0.75;
	for (var i = 1; i < array_length(pauseMenu[activeMenu][PM.Options]); ++i) {
		if (i < 5) {
		    pauseMenu[activeMenu][PM.YScale] += .1 * i;
		}			
	}
	
    if (zKey){
		if (activeMenu == PMenus.Settings) {
			if (!pauseMenu[PMenus.Settings][PM.Bool][selected]) {
				editOption = true;
			}
		}
		var optionIs = "";
		for (var i = 1; i < string_length(pauseMenu[activeMenu][PM.Options][selected]); ++i) {
			if (string_copy(pauseMenu[activeMenu][PM.Options][selected],i,1) == ":") {
			    break;
			}
			if (string_copy(pauseMenu[activeMenu][PM.Options][selected],i,1) == " ") {
				i++;
			}
		    optionIs = optionIs + string_copy(pauseMenu[activeMenu][PM.Options][selected],i,1);
		}
		
		variable_global_set(optionIs, !variable_global_get(optionIs));
		loadSettingValues();
		
		lastmenu = activeMenu;
		switch (pauseMenu[activeMenu][PM.Options][selected]) {
			case "Skills":{
		        
		        break;}
			case "????":{
		        
		        break;}
			case "Resume":{
		        PauseGame();
		        break;}
		    case "Settings":{
		        activeMenu = PMenus.Settings;
		        break;}
			case "Quit":{
				global.mode = "menu";
		        game_restart();
		        break;}
		}
		
		#region settings controlaudio_sound_get_gain(global.musicPlaying));
		#endregion
		if (activeMenu != lastmenu) {
			loadSettingValues();
		    selected=0;
			startOption = 0;
			totaloptions = array_length(pauseMenu[activeMenu][PM.Options]);
		}
	}	
	if (editOption and (leftKey or rightKey)){
		var optionIs = "";
		for (var i = 1; i < string_length(pauseMenu[activeMenu][PM.Options][selected]); ++i) {
			if (string_copy(pauseMenu[activeMenu][PM.Options][selected],i,1) == ":") {
			    break;
			}
		    optionIs = optionIs + string_copy(pauseMenu[activeMenu][PM.Options][selected],i,1);
		}
		switch (optionIs) {
		    case "Music Volume":{
		        global.musicVolume += (rightKey*0.1) - (leftKey*0.1);
				if (global.musicVolume > 1) {
				    global.musicVolume = 1;
				}
				if (global.musicVolume < 0) {
				    global.musicVolume = 0;
				}
				loadSettingValues();
		        break;}
			case "Sound Volume":{
		        global.soundVolume += (rightKey*0.1) - (leftKey*0.1);
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
if(keyboard_check(ord("L"))) {global.server = false; show_message("Client");}
	if (global.debug) {
		
		//if(keyboard_check(ord("Q"))) a -=1;
		if(keyboard_check_pressed(ord("Q"))) a -=1;
		//if(keyboard_check(ord("W"))) a +=1;
		if(keyboard_check_pressed(ord("W"))) a += 1;
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
		if((keyboard_check(vk_escape) and room == rCharacterSelect)) {room_goto(rInicio)}
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