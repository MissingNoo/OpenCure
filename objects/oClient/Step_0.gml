if (inRoom != room and room == Room1) {
	inRoom = room;
    buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
	buffer_write(oClient.clientBuffer, buffer_u8, Network.PlayerConnect);
	network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
	
	var player = instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oPlayer);
	var sock;
	if (global.IsHost == "host") {
	    sock = 1;
	}
	else{
		sock = 2;
	}
	with (player) {
	    socket = sock;
	}
}