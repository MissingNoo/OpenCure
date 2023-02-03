var _left = (keyboard_check_pressed(LEFTKEY) or gamepad_button_check_pressed(global.GP_NUM,gp_padl));
var _right = (keyboard_check_pressed(RIGHTKEY) or gamepad_button_check_pressed(global.GP_NUM,gp_padr));
var _up = (keyboard_check_pressed(UPKEY) or gamepad_button_check_pressed(global.GP_NUM,gp_padu));
var _down = (keyboard_check_pressed(DOWNKEY) or gamepad_button_check_pressed(global.GP_NUM, gp_padd));
var xKey = keyboard_check_pressed(vk_escape)  or keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(global.GP_NUM, gp_face2);
var zKey;
if (global.GamePad) {
    zKey = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(global.GP_NUM, gp_face1);
}else{zKey = keyboard_check_pressed(ord("Z"))}
if (!interact) {
	if (xKey) {
	    room_goto(rInicio);
	}
	if (_left) {
	    if (selected == 0) {
		    selected = variable_struct_names_count(global.ShopUpgrades) - 1;
		}
		else
		{
			selected -= 1;
		}
	}

	if (_right) {
	    if (selected == variable_struct_names_count(global.ShopUpgrades) - 1) {
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
		if (newselected >= variable_struct_names_count(global.ShopUpgrades)) {
		    newselected = variable_struct_names_count(global.ShopUpgrades) -1;
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