/// @description Insert description here
// You can write your code in this editor

global.roomname = oLobby.roomname;
if (!joinedRoom) {
	if (keyboard_check_pressed(ord("C"))) {
	    buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
		buffer_write(oClient.clientBuffer, buffer_u8, Network.CreateRoom);
		buffer_write(oClient.clientBuffer, buffer_string, string(irandom_range(0,1000)));
		network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
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
		buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
		buffer_write(oClient.clientBuffer, buffer_u8, Network.JoinRoom);
		buffer_write(oClient.clientBuffer, buffer_string, global.username);
		buffer_write(oClient.clientBuffer, buffer_u8, global.player[?"id"]);
		buffer_write(oClient.clientBuffer, buffer_string, rooms[selectedroom][$"name"]);
		network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
		buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
		buffer_write(oClient.clientBuffer, buffer_u8, Network.ListRooms);
		network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
	}
}

if (joinedRoom) {
		global.IsHost = ishost;
		sprites += .25;
		if (ishost and keyboard_check_pressed(ord("Z"))) {
		    buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
			buffer_write(oClient.clientBuffer, buffer_u8, Network.StartGame);
			buffer_write(oClient.clientBuffer, buffer_string, oLobby.roomname);
			network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
		}
}