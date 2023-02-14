// Feather disable GM2043
// Feather disable GM2044
enum Network {
	Move,
	Message,
	PlayerMoved,
	PlayerConnect,
	PlayerJoined,
	PlayerDisconnect,
	Spawn,
	SpawnUpgrade,
	Destroy,
	HostDisconnected
}
function receivedPacket(_buffer, _socket){
	if (!global.server) {
		msgid = buffer_read(_buffer, buffer_u8);
		var _s;
		switch (msgid) {
			case Network.Destroy:
				_id = buffer_read(_buffer, buffer_u16);
				var i = 0;
				repeat (ds_list_size(socketList)) {
					socket = ds_list_find_value(socketList, i);
					buffer_seek(serverBuffer, buffer_seek_start, 0);
					buffer_write(serverBuffer, buffer_u8, Network.Destroy);
					buffer_write(serverBuffer, buffer_u16, _id);
					network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
					i++;
				}
		        break;
		
			case Network.SpawnUpgrade:
				_s = buffer_read(_buffer, buffer_u8);
				_x = buffer_read(_buffer, buffer_u16);
				_y = buffer_read(_buffer, buffer_u16);
				_spr = buffer_read(_buffer, buffer_u16);
				_spd = buffer_read(_buffer, buffer_u16);
				_dir = buffer_read(_buffer, buffer_s16);
				_angle = buffer_read(_buffer, buffer_s16);
			
				var _vars = buffer_read(_buffer, buffer_string);
				//if (_s == 1) {
					var i = 0;
					repeat (ds_list_size(socketList)) {
						socket = ds_list_find_value(socketList, i);
					    buffer_seek(serverBuffer, buffer_seek_start, 0);
						buffer_write(serverBuffer, buffer_u8, Network.SpawnUpgrade);
						buffer_write(serverBuffer, buffer_u8, _s);
						buffer_write(serverBuffer, buffer_u16, _x);
						buffer_write(serverBuffer, buffer_u16, _y);
						buffer_write(serverBuffer, buffer_u16, _spr);
						buffer_write(serverBuffer, buffer_u16, _spd);
						buffer_write(serverBuffer, buffer_s16, _dir);
						buffer_write(serverBuffer, buffer_s16, _angle);
						buffer_write(serverBuffer, buffer_string, _vars);
						network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
						i++;
					}
				//}
		        break;
		
			case Network.Spawn:
				_s = buffer_read(_buffer, buffer_u8);
				_x = buffer_read(_buffer, buffer_u16);
				_y = buffer_read(_buffer, buffer_u16);
				var _vars = buffer_read(_buffer, buffer_string);
				//if (_s == 1) {
					var i = 0;
					repeat (ds_list_size(socketList)) {
						socket = ds_list_find_value(socketList, i);
					    buffer_seek(serverBuffer, buffer_seek_start, 0);
						buffer_write(serverBuffer, buffer_u8, Network.Spawn);
						buffer_write(serverBuffer, buffer_u8, _s);
						buffer_write(serverBuffer, buffer_u16, _x);
						buffer_write(serverBuffer, buffer_u16, _y);
						buffer_write(serverBuffer, buffer_string, _vars);
						network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
						i++;
					}
				//}
		        break;
		
		
		
			case Network.Message:
				_s = buffer_read(_buffer, buffer_u8);
				var message = buffer_read(_buffer, buffer_string);
				buffer_seek(serverBuffer, buffer_seek_start, 0);
				buffer_write(serverBuffer, buffer_u8, Network.Message);
				buffer_write(serverBuffer, buffer_u8, _s);
				buffer_write(serverBuffer, buffer_string, message);
				network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
			
				break;
		    case Network.Move:
				_s = buffer_read(_buffer, buffer_u8);
				var _x = buffer_read(_buffer, buffer_u16);
				var _y = buffer_read(_buffer, buffer_u16);
				var _spr = buffer_read(_buffer, buffer_u16);
				var _scale = buffer_read(_buffer, buffer_s8);
				global.px[_s] = _x;
				global.py[_s] = _y;
				var i = 0;
				repeat (ds_list_size(socketList)) {
					socket = ds_list_find_value(socketList, i);
				    buffer_seek(serverBuffer, buffer_seek_start, 0);
					buffer_write(serverBuffer, buffer_u8, Network.PlayerMoved);
					buffer_write(serverBuffer, buffer_u8, _s);
					buffer_write(serverBuffer, buffer_u16, _x);
					buffer_write(serverBuffer, buffer_u16, _y);
					buffer_write(serverBuffer, buffer_u16, _spr);
					buffer_write(serverBuffer, buffer_s8, _scale);
					network_send_packet(socket, serverBuffer, buffer_tell(serverBuffer));
					i++;
				}
			
				//show_debug_message(sucess);
				ds_map_set(socketToInstanceID, string(socket) + "X", _x); 
				ds_map_set(socketToInstanceID, string(socket) + "Y", _y); 
		        break;
	    
		}
	}
}