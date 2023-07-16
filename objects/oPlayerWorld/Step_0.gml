socket = global.socket;
if (global.gamePaused) { return; }
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