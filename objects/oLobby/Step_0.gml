/// @description Insert description here
// You can write your code in this editor

global.roomname = oLobby.roomname;
if (!joinedRoom) {
	if (keyboard_check_pressed(ord("C"))) {
		global.roomname = string(irandom_range(0,1000));
	    sendMessage({
			command : Network.CreateRoom			
		});
	}
	
	if (input_check_pressed("down")) {
	    if (selectedroom < array_length(rooms) - 1) {
		    selectedroom++;
		}
	}
	if (input_check_pressed("up")) {
	    if (selectedroom > 0) {
		    selectedroom--;
		}
	}

	if (input_check_pressed("accept")) {
		global.roomname = rooms[selectedroom][$"name"];
		sendMessage({
			command : Network.JoinRoom,
			username : global.username,
			character : global.player[?"id"],			
		});
	}
}

if (joinedRoom) {
		global.IsHost = ishost;
		sprites += .25;
		if (ishost and keyboard_check_pressed(ord("Z"))) {
			sendMessage({
				command : Network.StartGame,
				roomname : oLobby.roomname
			});
		}
}