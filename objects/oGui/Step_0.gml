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

if (global.upgrade == 1) {
    if (keyboard_check(ord("Z"))) {
		for (i = 0; i < 6; i++) 
		{	
			#region Upgrade na lista			
			if (global.upgrades[i][?"name"] == global.upgrade_options[selected] ) 
			{
				global.upgrades[i][?"level"] += 1;
				break;
			}			
			#endregion
			
			#region Upgrade nao existe			
			if (global.upgrades[i][?"name"] == "") 
			{
			    for (j=0; j<array_length(global.upgradesAvaliable); j++) 
				{
				    if (global.upgradesAvaliable[j][?"name"] == global.upgrade_options[selected]) 
					{
						global.upgrades[i]=global.upgradesAvaliable[j];
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

//if(keyboard_check(ord("Q"))) a -=1;
if(keyboard_check_pressed(ord("Q"))) a -=.05;
//if(keyboard_check(ord("W"))) a +=1;
if(keyboard_check_pressed(ord("W"))) a +=.05;
if(keyboard_check_pressed(ord("E"))) b -=.005;
//if(keyboard_check(ord("E"))) b -=1;
if(keyboard_check_pressed(ord("R"))) b +=.005;
//if(keyboard_check(ord("R"))) b +=1;
if(keyboard_check_pressed(ord("T"))) c -=1;
if(keyboard_check_pressed(ord("Y"))) c +=1;
if(keyboard_check(ord("U"))) d -=1;
if(keyboard_check(ord("I"))) d +=1;
if(keyboard_check(ord("O"))) e -=1;
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

