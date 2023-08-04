var _updown = - input_check_pressed("up") + input_check_pressed("down");
var _leftright = - input_check_pressed("left") + input_check_pressed("right");

if (onMenu) {    
	optionSelected += _updown;
	if (optionSelected < 0) { optionSelected = 0; }
	var _maxOption = array_length(menuOptions) - 1;
	if (optionSelected > _maxOption) { optionSelected = _maxOption; }
	
	if (input_check_pressed("accept")) {
	    onMenu = false;
		if (optionSelected == 4) {
		    room_goto(rInicio);
		}
		return;
	}
}

#region Gacha
if (!onMenu and optionSelected == 0) {
	if (!gachaInteract) {
	    selectedGacha += _leftright;
		if (selectedGacha < 0) { selectedGacha = 0;} 
		var _maxGacha = array_length(gachas) - 1;
		if (selectedGacha > _maxGacha) { selectedGacha = _maxGacha;} 
		if (input_check_pressed("accept")) {
			gachaInteract = true;
			return;
		}
	}
	if (gachaInteract) {
		gachaButton += _leftright;
		if (gachaButton < 0) { gachaButton = 0;} 
		if (gachaButton > 1) { gachaButton = 1;} 
	    if (input_check_pressed("cancel")) {
			gachaInteract = false;
			return;
		}
	}
}
#endregion
