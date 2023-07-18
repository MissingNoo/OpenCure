if (keyboard_check_pressed(vk_home)) {
	selectedMenu = 0;
	selectedMenuConfirm = false;
    editHouse = true;	
}
if (placingObject and input_check_pressed("accept")) {
	instance_create_depth(round((TouchX1/grid)) * grid, round((TouchY1/grid)) * grid, depth, oHouseItem, {itemId : objectId, sprite_index : objectSprite});
	Save_House();
    alarm[0] = 2;
}
if (editHouse and selectedMenuConfirm and input_check_pressed("accept")) {
    placingObject = true;
	objectSprite = HouseInventory[selectedMenu][selectedItem][$"sprite"];
	objectId = HouseInventory[selectedMenu][selectedItem][$"itemId"];
	editHouse = false;
}
if (input_check_pressed("cancel") and editHouse and !justOpened) {
	if (selectedMenuConfirm) {
	    selectedMenuConfirm = false;
	}
	else{
		 editHouse = false;
	}
}
var _pressed = - input_check_pressed("up") + input_check_pressed("down");
var _vpressed = - input_check_pressed("left") + input_check_pressed("right");

if (editHouse and !selectedMenuConfirm and _pressed != 0) {
	selectedMenu += _pressed;
	if (selectedMenu < 0) { selectedMenu = 0; }
	if (selectedMenu > array_length(houseOptions) - 1) { selectedMenu = array_length(houseOptions) - 1; }
}
if (editHouse and !selectedMenuConfirm and input_check_pressed("accept")) {
    selectedMenuConfirm = true;
}

if (editHouse and selectedMenuConfirm and _vpressed != 0) {
	selectedItem += _vpressed;
	if (selectedItem < 0) { selectedItem = 0; }
	if (selectedItem > array_length(HouseInventory[selectedMenu]) - 1) { selectedItem = array_length(HouseInventory[selectedMenu]) - 1; }
}
//if (!placingObject and input_check_pressed("accept")) {
//    placingObject = true;
//}