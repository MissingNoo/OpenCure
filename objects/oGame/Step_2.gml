// Feather disable GM1044
if (input_check_pressed("pause") and !global.upgrade and !ANVIL) {
	if (global.gamePaused and room == rInicio ) {
	    PauseGame();
	}
	
	switch (room) {
	    case rCharacterSelect:
	        room_goto(rInicio);
	        break;
		case rShop:
			break;
	    default:
	        if (room != rInicio) {
			    PauseGame();
			}
	        break;
	}
}