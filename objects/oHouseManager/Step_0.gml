if (keyboard_check_pressed(vk_f5)) {
	instance_destroy(oHouseItem);
    Save_House();
}
if (keyboard_check_pressed(vk_f6)) {
    Load_House();
}