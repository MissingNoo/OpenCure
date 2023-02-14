var type_event = ds_map_find_value(async_load, "type");
switch (type_event) {
    case network_type_connect:
		socket = ds_map_find_value(async_load, "socket");
        ds_list_add(socketList, socket);
		//ds_map_add(socketToInstanceID, socket, socket);
		buffer_seek(serverBuffer, buffer_seek_start, 0);
		buffer_write(serverBuffer, buffer_u8, Network.PlayerConnect);
		buffer_write(serverBuffer, buffer_u8, socket);
		buffer_write(serverBuffer, buffer_u16, playerSpawn[0]);
		buffer_write(serverBuffer, buffer_u16, playerSpawn[1]);
		network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
		
		var i = 0;
		//show_message_async(ds_list_size(socketList));
		repeat (ds_list_size(socketList)) {
		    var _sock = ds_list_find_value(socketList, i);
			if (_sock != socket) {
				//var _slave = ds_map_find_value(socketToInstanceID, _sock)
			    buffer_seek(serverBuffer, buffer_seek_start, 0);
				buffer_write(serverBuffer, buffer_u8, Network.PlayerJoined);
				buffer_write(serverBuffer, buffer_u8, _sock);
				//buffer_write(serverBuffer, buffer_u16, playerSpawn[0]);
				//buffer_write(serverBuffer, buffer_u16, playerSpawn[1]);
				buffer_write(serverBuffer, buffer_u16, ds_map_find_value(socketToInstanceID, string(_sock) + "X"));
				buffer_write(serverBuffer, buffer_u16, ds_map_find_value(socketToInstanceID, string(_sock) + "Y"));
				network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
			}
			i += 1;
		}
		
		// Feather disable once GM2044
		var i = 0;
		//show_message_async(ds_list_size(socketList));
		repeat (ds_list_size(socketList)) {
		    var _sock = ds_list_find_value(socketList, i);
			if (_sock != socket) {
			    buffer_seek(serverBuffer, buffer_seek_start, 0);
				buffer_write(serverBuffer, buffer_u8, Network.PlayerJoined);
				buffer_write(serverBuffer, buffer_u8, socket);
				buffer_write(serverBuffer, buffer_u16, playerSpawn[0]);
				buffer_write(serverBuffer, buffer_u16, playerSpawn[1]);
				//buffer_write(serverBuffer, buffer_u16, ds_map_find_value(socketToInstanceID, string(socket) + "X"));
				//buffer_write(serverBuffer, buffer_u16, ds_map_find_value(socketToInstanceID, string(socket) + "Y"));
				network_send_packet(_sock, serverBuffer, buffer_tell(serverBuffer));
			}
			i += 1;
		}
		
        break;
		
	case network_type_disconnect:
		socket = ds_map_find_value(async_load, "socket");
		buffer_seek(serverBuffer, buffer_seek_start, 0);
		buffer_write(serverBuffer, buffer_u8, Network.PlayerDisconnect);
		buffer_write(serverBuffer, buffer_u8, socket);
		network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
		ds_list_delete(socketList, ds_list_find_index(socketList, socket));
		break;
		
	case network_type_data:
		buffer = ds_map_find_value(async_load, "buffer");
		socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0);
		receivedPacket(buffer, socket);
		break;
}