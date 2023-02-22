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
	StartGame
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
				var total = instance_number(oUpgrade);
				for (var i = 0; i < total; ++i) {
					var ftotal = instance_number(oUpgrade);
					if (ftotal != total) {
					    i = 0;
						total = ftotal;
					}
				    var inst = instance_find(oUpgrade, i);
					if (inst.upgID == _id) {
						//show_message("destroyed");
					    instance_destroy(inst);
					}
				}
				break;}
			
			case Network.UpdateUpgrade:{
				var _owner = buffer_read(_buffer, buffer_u8);
				if (oPlayer.socket == _owner) { break; }
				var _id = buffer_read(_buffer, buffer_u16);
				var _x = buffer_read(_buffer, buffer_u16);
				var _y = buffer_read(_buffer, buffer_u16);
				var _dir = buffer_read(_buffer, buffer_u16);
				var _angle = buffer_read(_buffer, buffer_u16);
				var total = instance_number(oUpgrade);
				for (var i = 0; i < total; ++i) {
					var ftotal = instance_number(oUpgrade);
					if (ftotal != total) {
					    i = 0;
						total = ftotal;
					}
				    var inst = instance_find(oUpgrade, i);
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
				var _spd = buffer_read(_buffer, buffer_u16);
				var _dir = buffer_read(_buffer, buffer_s16);
				var _angle = buffer_read(_buffer, buffer_s16);
				var _vars = buffer_read(_buffer, buffer_string);
				//var _upginfo = buffer_read(_buffer, buffer_string);
				if (_s != oPlayer.socket) {
					var upgvars = json_parse(_vars);
					var upgvarnames = variable_struct_get_names(upgvars)
					var _upg = instance_create_layer(_x, _y, "Instances", oUpgrade);
					for (var i = 0; i < variable_struct_names_count(upgvars); ++i) {
						if (upgvarnames[i] != "id") {
							variable_instance_set(_upg, upgvarnames[i], variable_struct_get(upgvars, upgvarnames[i]));
						}
					}
					_upg.sprite_index = _spr;
					_upg.speed = _spd;
					_upg.direction = _dir;
					_upg.image_angle = _angle;
					_upg.ghost = true;
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
				if (_s != oPlayer.socket) {
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
				}
				break;}
				
		    case Network.PlayerConnect:{
				resetTimer();
				var _socket = buffer_read(_buffer, buffer_u8);
				var _player = instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oPlayer);
				_player.socket = _socket;
				break;}
				
		    case Network.PlayerJoined:{
				resetTimer();
				ResetPool();
				with (oEnemy) {
				    instance_destroy();
				}
				var _socket = buffer_read(_buffer, buffer_u8);
				var _slave = instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oSlave);
				ds_map_add(socketToInstanceID, _socket, _slave.id);
				//show_message(_socket);
				_slave.socket = _socket;
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
			
				//show_debug_message("S:{0} X: {1} Y:{2}", _s, _x, _y);
				if (_s != oPlayer.socket and instance_exists(oSlave)) {
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
		}
	}
}