var _updown = - input_check_pressed("up") + input_check_pressed("down");
var _leftright = - input_check_pressed("left") + input_check_pressed("right");
#region Menu
if (onMenu) {    
	optionSelected += _updown;
	if (optionSelected < 0) { optionSelected = 0; }
	var _maxOption = array_length(menuOptions) - 1;
	if (optionSelected > _maxOption) { optionSelected = _maxOption; }	
	if (input_check_pressed("cancel")) {
		room_goto(rInicio);
	}
	if (input_check_pressed("accept")) {
	    onMenu = false;
		if (optionSelected == 3) {
		    room_goto(rInicio);
		}
		return;
	}
}
#endregion
#region Gacha
if (!onMenu and optionSelected == 0) {
	if (!gachaInteract) {
	    selectedGacha += _leftright;
		if (selectedGacha < 0) { selectedGacha = 0;} 
		var _maxGacha = array_length(gachas) - 1;
		if (selectedGacha > _maxGacha) { selectedGacha = _maxGacha;} 
		if (input_check_pressed("accept")) {
			gachaInteract = true;
			isOutfit = false;
			return;
		}
	}
	if (gachaInteract) {
		if (!gachaDebut and !gachaPrize) {
		    gachaButton += _leftright;
			if (gachaButton < 0) { gachaButton = 0;} 
			if (gachaButton > 1) { gachaButton = 1;} 
		    if (input_check_pressed("cancel")) {
				gachaInteract = false;
				return;
			}
			if (input_check_pressed("accept")) {
				switch (gachaButton) {
				    case 0:
						global.holocoins -= gachas[selectedGacha][$"cost"];
				        gachaDebut = true;
				        break;
				    case 1:
				        show_message_async("Redeem");
				        break;
				}
				return;
			}
		}
		if (gachaDebut) {
		    if (input_check_pressed("accept")) {
				gachaDebut = false;
				var _rnd = irandom_range(0, array_length(gachas[selectedGacha][$"prizes"]) -1);
				gotPrize = gachas[selectedGacha][$"prizes"][_rnd];
				if (!UnlockableCharacters[gotPrize[$"character"]]) {
				    UnlockableCharacters[gotPrize[$"character"]] = true;
				}
				else{
					Granks[gotPrize[$"character"]] += 1;
				}
				prizeIdleAnimation[1] = sprite_get_number(CHARACTERS[gotPrize[$"character"]][?"sprite"]);
				prizeIdleSpeed = sprite_get_speed(CHARACTERS[gotPrize[$"character"]][?"sprite"]);
				gachaPrize = true;
				isOutfit = false;
				var _outfits = array_length(CHARACTERS[gotPrize[$"character"]][?"outfits"]);
				var _allUnlocked = true;
				var _notUnlocked = [];
				for (var i = 0; i < _outfits; ++i) {
				    if (!CHARACTERS[gotPrize[$"character"]][?"outfits"][i][$"unlocked"]) {
					    _allUnlocked = false;
						array_push(_notUnlocked, i);
					}
				}
				if (_outfits  > 1 and !_allUnlocked) {
					_rnd = irandom_range(0, 10);
					isOutfit = _rnd <= 1 ? true : false;
					if (isOutfit) {
					    outfitPrizeNumber = _notUnlocked[irandom_range(0, array_length(_notUnlocked) - 1)];
						UnlockableOutfits[CHARACTERS[gotPrize[$"character"]][?"outfits"][outfitPrizeNumber][$"id"]] = true;
						unlocked_outfits_load();
					}
				}
				return;
			}
		}
		if (gachaPrize) {
		    if (input_check_pressed("accept")) {
			    gachaPrize = false;
			}
		}
	}
	if (!gachaInteract and input_check_pressed("cancel")) {
	    onMenu = true;
	}
}
#endregion
