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
	DestroyUpgrade,
	UpdateUpgrade,
	Destroy,
	HostDisconnected,
	LobbyConnect,
	IsHost,
	StartGame,
	CreateRoom,
	ListRooms,
	JoinRoom,
	Disconnect,
	Connection,
	UpdateRoom,
	KeepAlive,
	UpdateOptions,
}
function clientReceivedPacket2(_response)
{
	//show_debug_message(string(_response));
	var r = json_parse(_response);
	switch (r[$"command"]) {
	    case Network.ListRooms:
	        oLobby.rooms = r[$"rooms"];
			//show_debug_message(oLobby.rooms);
	        break;
			
		case Network.JoinRoom:{
			show_debug_message(r);
			oLobby.roomname = r[$"roomname"];
			oLobby.players = json_parse(r[$"players"]);
			oLobby.ishost = r[$"isHost"];
			show_debug_message(r[$"isHost"]);
			oLobby.joinedRoom = true;
			break;
		}
		
		case Network.StartGame:{
			room_goto(Room1);
			break;}
			
		 case Network.PlayerJoined:{
				resetTimer();
				ResetPool();
				with (oEnemy) {
				    instance_destroy();
				}
				var _sockett = r[$"socket"];
				var _slave = instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oSlave);
				ds_map_add(socketToInstanceID, _sockett, _slave.id);
				//show_message(_socket);
				_slave.socket = _sockett;
				break;}
				
		case Network.PlayerMoved:{
			//show_debug_message(r);
			var _s = r[$"socket"];
			var _x = r[$"x"];
			var _y = r[$"y"];
			var _spr = r[$"sprite"];
			var _scale = r[$"image_xscale"];
			var _sock = r[$"socket"];
			
			if (!instance_exists(oSlave)) {
				instance_create_layer(0,0, "Instances", oSlave,{socket : _sock});
			}
			
			//show_debug_message("S:{0} X: {1} Y:{2}", _s, _x, _y);
			if (instance_exists(oPlayer) and _sock != oClient.connected and instance_exists(oSlave)) {
				oSlave.x = _x;
				oSlave.y = _y;
				oSlave.sprite_index = _spr;
				oSlave.image_xscale = _scale;
			}
			break;
		}
		
		case Network.SpawnUpgrade:{
			var _upg = instance_create_layer(r[$"x"], r[$"y"], "Instances", oSlaveUpgrade);
			_upg.upgID = r[$"upgID"];
			_upg.sprite_index = r[$"sprite_index"];
			_upg.direction = r[$"direction"];
			_upg.image_angle = r[$"image_angle"];
			_upg.speed = 0;
			break;
		}
		
		case Network.UpdateUpgrade:{
			var total = instance_number(oSlaveUpgrade);
				for (var i = 0; i < total; ++i) {
					var ftotal = instance_number(oSlaveUpgrade);
					if (ftotal != total) {
					    i = 0;
						total = ftotal;
					}
				    var inst = instance_find(oSlaveUpgrade, i);
					if (inst.upgID == r[$"upgID"]) {
					    inst.x = r[$"x"];
						inst.y = r[$"y"];
						inst.image_alpha = r[$"image_alpha"];
						inst.sprite_index = r[$"sprite_index"];
						inst.image_angle = r[$"image_angle"];
						inst.direction= r[$"direction"];
					}
				}
			break;
		}
		
		case Network.DestroyUpgrade:{
				var total = instance_number(oSlaveUpgrade);
				for (var i = 0; i < total; ++i) {
					var ftotal = instance_number(oSlaveUpgrade);
					if (ftotal != total) {
					    i = 0;
						total = ftotal;
					}
				    var inst = instance_find(oSlaveUpgrade, i);
					if (inst.upgID == r[$"upgID"]) { instance_destroy(inst); }
				}
				break;}
				
		 case Network.Spawn:{
				var enemyvars = json_parse(r[$"sendvars"]);
				var enemyvarnames = variable_struct_get_names(enemyvars)
				var _enemy = instance_create_layer(r[$"x"], r[$"y"], "Instances", oEnemy);
				for (var i = 0; i < variable_struct_names_count(enemyvars); ++i) {
				    variable_instance_set(_enemy, enemyvarnames[i], variable_struct_get(enemyvars, enemyvarnames[i]));
				}
				_enemy.target = instance_nearest(x,y,oSlave);
				with (_enemy) {
					try{
						initiateEnemy(ds_list_find_value(global.enemyPool, variable_struct_get(enemyvars, "enemynum")));
					}
					catch(error){
						initiateEnemy(ds_list_find_value(global.enemyPool, 0));
					}				
				}
				//}
				break;}
		
		case Network.Destroy:{
			if (instance_exists(oEnemy)) {
			    with (oEnemy) {
				    if (enemyID == r[$"enemyID"]) {
					    hp = 0;
					}
				}
			}
			break;
		}
		
		case Network.UpdateRoom:{
			if (r[$"roomname"] == global.roomname) {
			    oLobby.players = json_parse(r[$"players"]);
				oLobby.IsHost = r[$"isHost"];
			}
			break;
		}
		
		case Network.UpdateOptions:{
			if (r[$"roomname"] == global.roomname) {
				variable_instance_set(oLobby, r[$"option"], r[$"value"]);
			}
			break;
		}
		
	    default:
	        // code here
	        break;
	}
}
function clientReceivedPacket(_buffer)
{
	if (!global.server) {
		var msgid = buffer_read(_buffer, buffer_u8);
	
		switch (msgid) {
			case Network.Destroy:{
				var _id = buffer_read(_buffer, buffer_u16);
				var total = instance_number(oEnemy);
				for (var i = 0; i < total; ++i) {
					var ftotal = instance_number(oEnemy);
					if (ftotal != total) {
					    i = 0;
						total = ftotal;
					}
				    var inst = instance_find(oEnemy, i);
					if (inst.enemyID == _id) {
						//show_message("destroyed");
					    //instance_destroy(inst);
						inst.hp = 0;
					}
				}
				break;}
				
			case Network.DestroyUpgrade:{
				var _id = buffer_read(_buffer, buffer_u16);
				var total = instance_number(oSlaveUpgrade);
				for (var i = 0; i < total; ++i) {
					var ftotal = instance_number(oSlaveUpgrade);
					if (ftotal != total) {
					    i = 0;
						total = ftotal;
					}
				    var inst = instance_find(oSlaveUpgrade, i);
					if (inst.upgID == _id) {
						//show_message("destroyed");
					    instance_destroy(inst);
					}
				}
				break;}
			
			case Network.UpdateUpgrade:{
				var _owner = buffer_read(_buffer, buffer_u8);
				if (instance_exists(oPlayer) and oPlayer.socket == _owner) { break; }
				var _id = buffer_read(_buffer, buffer_u16);
				var _x = buffer_read(_buffer, buffer_u16);
				var _y = buffer_read(_buffer, buffer_u16);
				var _dir = buffer_read(_buffer, buffer_u16);
				var _angle = buffer_read(_buffer, buffer_u16);
				var total = instance_number(oUpgrade);
				for (var i = 0; i < total; ++i) {
					var ftotal = instance_number(oSlaveUpgrade);
					if (ftotal != total) {
					    i = 0;
						total = ftotal;
					}
				    var inst = instance_find(oSlaveUpgrade, i);
					if (inst.upgID == _id) {
						//show_message("destroyed");
					    inst.x = _x;
						inst.y = _y;
						inst.speed=0;
						inst.image_alpha = _dir;
						inst.image_angle = _angle;
					}
				}
				break;}
			
			case Network.HostDisconnected:{
				network_destroy(oClient.client);
				network_destroy(oClient.connected);
				instance_destroy(oClient);
				game_restart();
				break;}
			
			case Network.SpawnUpgrade:{
				var _s = buffer_read(_buffer, buffer_u8);
				var _x = buffer_read(_buffer, buffer_u16);
				var _y = buffer_read(_buffer, buffer_u16);
				var _spr = buffer_read(_buffer, buffer_u16);
				//var _spd = buffer_read(_buffer, buffer_u16);
				var _dir = buffer_read(_buffer, buffer_s16);
				var _angle = buffer_read(_buffer, buffer_s16);
				var _speed = buffer_read(_buffer, buffer_u8);
				var _vars = buffer_read(_buffer, buffer_string);
				var _upgid = buffer_read(_buffer, buffer_u8);
				if (_s != oClient.connected) {
					//show_message(_vars);
					var upgvars = json_parse(_vars);
					//show_message(upgvars[$"upg"]);
					//show_debug_message(upgvars[]);
					var upgvarnames = variable_struct_get_names(upgvars)
					var _upg = instance_create_layer(_x, _y, "Instances", oSlaveUpgrade);
					for (var i = 0; i < variable_struct_names_count(upgvars); ++i) {
						if (upgvarnames[i] != "id") {
							variable_instance_set(_upg, upgvarnames[i], variable_struct_get(upgvars, upgvarnames[i]));
						}
					}
					_upg.sprite_index = _spr;
					//_upg.speed = _spd;
					_upg.direction = _dir;
					_upg.image_angle = _angle;
					_upg.speed = _speed;
					_upg.ghost = true;
					//_upg.upg = global.upgradesAvaliable[_upgid];
					//var sidevars = ["upg", "speed", "hits", "sprite_index", "level", "mindmg", "maxdmg"];
					//for (var i = 0; i < array_length(sidevars); ++i) {
					//	variable_instance_set(_upg, sidevars[i], buffer_read(_buffer, buffer_u16));
					//}
					//_upg.target = instance_nearest(x,y,oSlave);
					with (_upg) {
						try{
							a = 0;
							sent = true;
							alarm[1]=200;
							shoots = 0;
							//show_message(_upg);
							//show_message(json_parse(_upginfo));
							
							//upg = json_parse(_upginfo);
						
							event_perform(ev_step, ev_step_begin);
						}
						catch(error){
							show_debug_message("error");
						}
					
					}
				}
				break;}
		
		    case Network.Spawn:{
				var _s = buffer_read(_buffer, buffer_u8);
				var _x = buffer_read(_buffer, buffer_u16);
				var _y = buffer_read(_buffer, buffer_u16);
				var _vars = buffer_read(_buffer, buffer_string);
				//if (_s != oClient.connected) {
					var enemyvars = json_parse(_vars);
					var enemyvarnames = variable_struct_get_names(enemyvars)
					var _enemy = instance_create_layer(_x, _y, "Instances", oEnemy);
					for (var i = 0; i < variable_struct_names_count(enemyvars); ++i) {
					    variable_instance_set(_enemy, enemyvarnames[i], variable_struct_get(enemyvars, enemyvarnames[i]));
					}
					_enemy.target = instance_nearest(x,y,oSlave);
					with (_enemy) {
						try{
							initiateEnemy(ds_list_find_value(global.enemyPool, variable_struct_get(enemyvars, "enemynum")));
						}
						catch(error){
							initiateEnemy(ds_list_find_value(global.enemyPool, 0));
						}
					
					}
				//}
				break;}
				
		    case Network.PlayerConnect:{
				resetTimer();
				var _socket = buffer_read(_buffer, buffer_u8);
				instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oPlayer, {socket : _socket});
				break;}
				
		    case Network.PlayerJoined:{
				resetTimer();
				ResetPool();
				with (oEnemy) {
				    instance_destroy();
				}
				var _sockett = buffer_read(_buffer, buffer_u8);
				var _slave = instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oSlave);
				ds_map_add(socketToInstanceID, _sockett, _slave.id);
				//show_message(_socket);
				_slave.socket = _sockett;
				break;}
				
			case Network.Message:{
				var _s = buffer_read(_buffer, buffer_u8);
				var message = buffer_read(_buffer, buffer_string);
				show_message(message + string(_s));
				break;}
				
			case Network.PlayerMoved:{
				var _s = buffer_read(_buffer, buffer_u8);
				var _x = buffer_read(_buffer, buffer_u16);
				var _y = buffer_read(_buffer, buffer_u16);
				var _spr = buffer_read(_buffer, buffer_u16);
				var _scale = buffer_read(_buffer, buffer_s8);
				var _sock = buffer_read(_buffer, buffer_u8);
			
				if (!instance_exists(oSlave)) {
				    instance_create_layer(0,0, "Instances", oSlave,{socket : _sock});
				}
			
				//show_debug_message("S:{0} X: {1} Y:{2}", _s, _x, _y);
				if (instance_exists(oPlayer) and _sock != oClient.connected and instance_exists(oSlave)) {
				    oSlave.x = _x;
					oSlave.y = _y;
					oSlave.sprite_index = _spr;
					oSlave.image_xscale = _scale;
				}
			
			
				//with (oSlave) {
					//show_message(string(socket) + " : " + string(_socket));
				//    //if (socket == _s) {
				//	    x = _x;
				//		y = _y;
				//	}
				//}
				break;}
				
			case Network.PlayerDisconnect:{
				var _socket = buffer_read(_buffer, buffer_u8);
				show_message(_socket);
				instance_destroy(ds_map_find_value(socketToInstanceID, _socket));
				break;}
				
			case Network.IsHost:{
				var _host = buffer_read(_buffer, buffer_string);
				//show_message_async(_host);
				oLobby.ishost = _host;
				break;}
			
			case Network.LobbyConnect:{
				var _json = buffer_read(_buffer, buffer_string);
				oLobby.players = json_parse(_json);
				//show_message_async("socket:" + string(_socket) + " username:" + string(_username) + " id:" + string(_playerID));
				break;}
				
			case Network.StartGame:{
				room_goto(Room1);
				break;}
				
			case Network.ListRooms:{
				var _json = buffer_read(_buffer, buffer_string);
				oLobby.rooms = json_parse(_json);
				break;
			}
			
			case Network.JoinRoom:{
				oLobby.roomname = buffer_read(_buffer, buffer_string);
				oLobby.players = json_parse(buffer_read(_buffer, buffer_string));
				oLobby.ishost = buffer_read(_buffer, buffer_u8);
				oLobby.joinedRoom = true;
				break;
			}
		}
	}
}


/// @function                sendMessage(data)
/// @description             Data to send server
/// @param {any}     data data to send
function sendMessage(data){
	if (!instance_exists(oClient)) { return; }
	data.roomname = global.roomname;
	buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
	var _json = json_stringify(data);
	buffer_write(oClient.clientBuffer, buffer_text, _json);	
	network_send_udp_raw(oClient.client, global.serverip, global.port, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
}