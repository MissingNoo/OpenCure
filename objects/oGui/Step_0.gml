// Feather disable GM2016
if (room = rInicio) {
    if (keyboard_check_pressed(ord("Z"))) {
        switch (global.selected) {
            case 0:
                room_goto(Room1);
                break;
            case 1:	
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
			if (global.upgrades[i][?"name"] == global.upgrade_options[global.selected] ) 
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
				    if (global.upgradesAvaliable[j][?"name"] == global.upgrade_options[global.selected]) 
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







