var _left = input_check_pressed("left");
var _right = input_check_pressed("right");
var _up = input_check_pressed("up");
var _down = input_check_pressed("down");
var xKey = input_check_pressed("cancel");
var zKey= input_check_pressed("accept");

//if (global.GamePad) {
//    zKey = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(global.gPnum, gp_face1);
//}else{zKey = keyboard_check_pressed(ord("Z
#region shop
if (!onMenu and optionSelected == 1) {
	if (!interact) {
		if (xKey) {
		    onMenu = true;
		}
		if (_left) {
		    if (selected == 0) {
			    selected = variable_struct_names_count(global.shopUpgrades) - 1;
			}
			else
			{
				selected -= 1;
			}
		}

		if (_right) {
		    if (selected == variable_struct_names_count(global.shopUpgrades) - 1) {
			    selected = 0;
			}
			else
			{
				selected += 1;
			}
		}
		var newselected = selected;
		if (_up) {
			newselected -= 7;
		    if (newselected < 0) {
			    newselected = 0;
			}
			selected = newselected;
		}
		if (_down) {
			newselected += 7;
			if (newselected >= variable_struct_names_count(global.shopUpgrades)) {
			    newselected = variable_struct_names_count(global.shopUpgrades) -1;
			}
			selected = newselected;
		}
		if (zKey) {
		    interact = true;
		}
	}
	else{
		if (xKey) {
		    interact = false;
		}
	
		if (_left) {
		    interactSelected = interactSelected == 1 ? 0 : 1;
		}
		if (_right) {
		    interactSelected = interactSelected == 0 ? 1 : 0;
		}
	
		if (zKey) {
		
		
			if (interactSelected == 0) {	
			    if (selectedThing[$ "level"] < selectedThing[$ "maxlevel"] and selectedThing[$ "costs"][selectedThing[$ "level"]] < global.holocoins) {
					global.holocoins -= selectedThing[$ "costs"][selectedThing[$ "level"]];
					selectedThing[$ "level"] += 1;
				}
			}
		
			if (interactSelected == 1) {
			    if (selectedThing[$ "level"] > 0) {
					var upgradecost = selectedThing[$ "costs"][selectedThing[$ "level"] - 1];
					if (selectedThing[$ "level"] == selectedThing[$ "maxlevel"]) {
					    upgradecost = selectedThing[$ "costs"][selectedThing[$ "maxlevel"] - 1];
					}
					global.holocoins += upgradecost;
					selectedThing[$ "level"] -= 1;
				}
			}
		}
	}
}
#endregion