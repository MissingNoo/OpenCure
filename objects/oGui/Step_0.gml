if (room = rInicio) {
    if (keyboard_check_pressed(ord("Z"))) {
        switch (menu_options[selected]) {
            case "Start":
				selected=0;
                room_goto(Room2);
                break;
            case "Exit":	
                game_end();
                break;
        }
    }
}

if (global.upgrade == 1) // after level up
{
    if (keyboard_check(ord("Z"))) {
		for (i = 0; i < 6; i++) 
		{	
			
			#region Upgrade existing weapon
				if (UPGRADES[i][?"name"] == global.upgrade_options[selected] ) 
				{
					UPGRADES[i] = global.upgradesAvaliable[UPGRADES[i][?"id"]][UPGRADES[i][?"level"]]+1;
					break;
				}			
			#endregion
			
			#region new weapon
				if (UPGRADES[i][?"name"] == "") 
				{
				    for (j=0; j<array_length(global.upgradesAvaliable); j++) 
					{
					    if (global.upgradesAvaliable[j][1][?"name"] == global.upgrade_options[selected]) 
						{
							UPGRADES[i]=global.upgradesAvaliable[j][1];
						}
					}
					break;
				}
			#endregion
			
		}
        global.upgrade = 0;
        PauseGame();
    }
}
	
if (room = Room2) {
    if (keyboard_check_pressed(ord("Z"))) {
        global.Player=CHARACTERS[selected];
		room_goto(Room1);
    }
}

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
		game_restart();
	}
}

#region Debug
	if (global.debug) {
		dir = global.arrow_dir;
		//if(keyboard_check(ord("Q"))) a -=1;
		if(keyboard_check(ord("Q"))) a -=.05;
		//if(keyboard_check(ord("W"))) a +=1;
		if(keyboard_check(ord("W"))) a += .05;
		if(keyboard_check(ord("E"))) b -=.05;
		//if(keyboard_check(ord("E"))) b -=1;
		if(keyboard_check(ord("R"))) b +=.05;
		//if(keyboard_check(ord("R"))) b +=1;
		if(keyboard_check_pressed(ord("T"))) c -=1;
		if(keyboard_check_pressed(ord("Y"))) c +=1;
		if(keyboard_check_pressed(ord("U"))) d -=1;
		if(keyboard_check_pressed(ord("I"))) d +=1;
		if(keyboard_check_pressed(ord("O"))) e -=1;
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
	}
#endregion

