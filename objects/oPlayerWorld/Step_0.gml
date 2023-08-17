if (keyboard_check_pressed(vk_home)) {
		    show_message_async(HouseInventory[HouseCategory.Interior]);
		}
socket = global.socket;
if (global.gamePaused) { return; }
if (instance_exists(oNpcShop) or (instance_exists(oHouseManager) and oHouseManager.editHouse)) { return; }
Movement();
sendMessage({
	command : Network.Move,
	socket : socket,
	x : x,
	y : y, 
	image_xscale : image_xscale,
	sprite : sprite_index,		
});
image_speed = global.gamePaused ? 0 : 1;