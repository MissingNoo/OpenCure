// Feather disable GM1044
if (input_check_pressed("pause") and !global.upgrade and !ANVIL and !GoldenANVIL) {
	if (global.gamePaused and room == rInicio) {
	    pause_game();
	}
	
	switch (room) {
	    case rCharacterSelect:
	        room_goto(rInicio);
	        break;
		case rShop:
			break;
	    default:
	        if (room != rInicio and room != rLobby) {
			    pause_game();
			}
	        break;
	}
}