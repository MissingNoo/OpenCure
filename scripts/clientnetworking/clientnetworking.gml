// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clientReceivedPacket(_buffer){
	var msgid = buffer_read(_buffer, buffer_u8);
	
	switch (msgid) {
		case Network.Destroy:
			var _id = buffer_read(_buffer, buffer_u16);
			//show_message("destroying: " + string(_id));
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
				    instance_destroy(inst);
				}
			}
			//with (oEnemy) {
			//    if (enemyID == _id) {
			//	    instance_destroy();
			//	}
			//}
			break;
			
		case Network.HostDisconnected:
			network_destroy(oClient.client);
			network_destroy(oClient.connected);
			instance_destroy(oClient);
			game_restart();
			break;
			
		case Network.SpawnUpgrade:
			var _s = buffer_read(_buffer, buffer_u8);
			var _x = buffer_read(_buffer, buffer_u16);
			var _y = buffer_read(_buffer, buffer_u16);
			var _spr = buffer_read(_buffer, buffer_u16);
			var _spd = buffer_read(_buffer, buffer_u16);
			var _dir = buffer_read(_buffer, buffer_s16);
			var _angle = buffer_read(_buffer, buffer_s16);
			var _vars = buffer_read(_buffer, buffer_string);
			if (_s != oPlayer.socket) {
				var upgvars = json_parse(_vars);
				var upgvarnames = variable_struct_get_names(upgvars)
				var _upg = instance_create_layer(_x, _y, "Instances", oUpgrade);
				for (var i = 0; i < variable_struct_names_count(upgvars); ++i) {
				    variable_instance_set(_upg, upgvarnames[i], variable_struct_get(upgvars, upgvarnames[i]));
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
						event_perform(ev_step, ev_step_begin);
					}
					catch(error){
						show_debug_message("error");
					}
					
				}
			}
			break;
		
	    case Network.Spawn:
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
			break;
	    case Network.PlayerConnect:
			resetTimer();
			var _socket = buffer_read(_buffer, buffer_u8);
			var _x = buffer_read(_buffer, buffer_u16);
			var _y = buffer_read(_buffer, buffer_u16);
			var _player = instance_create_layer(_x, _y, "Instances", oPlayer);
			_player.socket = _socket;
			break;
	    case Network.PlayerJoined:
			resetTimer();
			with (oEnemy) {
			    instance_destroy();
			}
			var _socket = buffer_read(_buffer, buffer_u8);
			var _x = buffer_read(_buffer, buffer_u16);
			var _y = buffer_read(_buffer, buffer_u16);
			var _slave = instance_create_layer(_x, _y, "Instances", oSlave);
			ds_map_add(socketToInstanceID, _socket, _slave.id);
			//show_message(_socket);
			_slave.socket = _socket;
			break;
		case Network.Message:
			var _s = buffer_read(_buffer, buffer_u8);
			var message = buffer_read(_buffer, buffer_string);
			show_message(message + string(_s));
			break;
		case Network.PlayerMoved:
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
			break;
		case Network.PlayerDisconnect:
			var _socket = buffer_read(_buffer, buffer_u8);
			show_message(_socket);
			instance_destroy(ds_map_find_value(socketToInstanceID, _socket));
			break;
	}

}