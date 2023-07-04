if (string_length(keyboard_string) > 15)
{
    keyboard_string = string_copy(keyboard_string, 1, 15);
}
global.roomname = oLobby.roomname;
if (!joinedRoom and !creatingroom and !typepassword) {
	if (input_check_pressed("cancel") or input_check_pressed("pause")) {
	    room_goto(rInicio);
	}
	if (point_in_rectangle(oGui.x, oGui.y, createx1, createy1, createx2, createy2) or keyboard_check_pressed(ord("C"))) {
		roomname = "";
		password = "";
		keyboard_string = "";
		creatingselected = 0;
		creatingroom = true;
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

	if (point_in_rectangle(oGui.x, oGui.y, joinx1, createy1, joinx2, createy2)  or input_check_pressed("accept") and array_length(rooms) > 0) {
		global.roomname = rooms[selectedroom][$"name"];
		if (rooms[selectedroom][$"password"] == "") {
		    sendMessage({
				command : Network.JoinRoom,
				username : global.username,
				character : global.player[?"id"],			
			});
		}
		else{keyboard_string = ""; passwordselected = 0; typepassword = true; }
	}
}

if (creatingroom) {
	if (input_check_pressed("cancel") or input_check_pressed("pause")) {
	    creatingroom = false;
	}
	#region selected
    if (input_check_pressed("down")) {
	    if (creatingselected < 2) {
		    creatingselected++;
			if (creatingselected == 1) {
			    keyboard_string = password;
				
			}
		}
	}
	if (input_check_pressed("up")) {
	    if (creatingselected > 0) {
		    creatingselected--;
			if (creatingselected == 1) {
			    keyboard_string = password;
				
			}
			if (creatingselected == 0) {
			    keyboard_string = roomname;
				
			}
		}
	}
	if (creatingselected == 2) {
		if (input_check_pressed("left")) {
		    creatingselectedyesno = 0;
		}
		if (input_check_pressed("right")) {
		    creatingselectedyesno = 1;
		}
		if (input_check_pressed("accept")) {
		    if (creatingselectedyesno == 0) {
			    creatingroom = false;
			}
		    if (creatingselectedyesno == 1) {
				creatingroom = false;
			    sendMessage({
					command : Network.CreateRoom,
					password
				});
				sendMessage({
					command : Network.JoinRoom,
					username : global.username,
					character : global.player[?"id"],
					password
				});
			}
			
		}
	}
	#endregion
	if (creatingselected == 0) {
	    roomname = keyboard_string;
	}
	if (creatingselected == 1) {
	    password = keyboard_string;
	}
	
}

if (typepassword) {
	if (input_check_pressed("cancel") or input_check_pressed("pause")) {
	    typepassword = false;
	}
	#region selected
    if (input_check_pressed("down")) {
	    if (passwordselected == 0) {
		    passwordselected = 1;
		}
	}
	if (input_check_pressed("up")) {
	    if (passwordselected == 1) {
		    passwordselected = 0;
			//if (passwordselected == 0) {
			keyboard_string = password;
			
			//}
		}
	}
	if (passwordselected == 1) {
		if (input_check_pressed("left")) {
		    passwordselectedyesno = 0;
		}
		if (input_check_pressed("right")) {
		    passwordselectedyesno = 1;
		}
		if (input_check_pressed("accept")) {
		    if (passwordselectedyesno == 0) {
			    typepassword = false;
			}
		    if (passwordselectedyesno == 1) {
			    if (rooms[selectedroom][$"password"] == password) {
					typepassword = false;
					global.roomname = rooms[selectedroom][$"name"];
				    sendMessage({
						command : Network.JoinRoom,
						username : global.username,
						character : global.player[?"id"],			
					});
				}
				//sendMessage({
				//	command : Network.JoinRoom,
				//	username : global.username,
				//	character : global.player[?"id"],
				//	password
				//});
			}
			
		}
	}
	#endregion
	if (creatingselected == 0) {
	    roomname = keyboard_string;
	}
	if (creatingselected == 1) {
	    password = keyboard_string;
	}
	if (passwordselected == 0) {
	    password = keyboard_string;
	}
	
}

if (joinedRoom) {
	if (input_check_pressed("cancel") or input_check_pressed("pause")) {
	    room_goto(rInicio);
	}
		global.IsHost = ishost;
		sprites += .25;
		if (ishost and input_check_pressed("accept")) {
			for (var i = 0; i < array_length(options); ++i) {
				variable_global_set(options[i][1], variable_instance_get(self, options[i][1]));
			}
			sendMessage({command : Network.StartGame});			
		}
		
		#region buttons			
		#region options
		if (ishost) {
			var _x = GW/1.25;
			var _tx = _x + 5;
			var _y = GH/59.08;
			var _yo = _y + 4;
			var _xx = GW/1.01;
			var _yy = GH/3.20;	
			for (var i = 0; i < array_length(options); ++i) {
				_yo += 22;
				var _sy = _yo + 3.50;
				if (point_in_rectangle(oGui.x, oGui.y, _xx - 45, _sy, _xx - 5, _sy + 17)) {
					variable_instance_set(self, options[i][1], !variable_instance_get(self, options[i][1]));
					sendMessage({
						command : Network.UpdateOptions,
						option : options[i][1],
						value : variable_instance_get(self, options[i][1])
						});
				}
			}
		}
		#endregion
		#endregion
}
	
if ((os_type == os_android) and input_check_pressed("accept") and (creatingroom and creatingselected != 2) or (typepassword and passwordselected == 0)) {
    keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false);
}

//if (keyboard_check_pressed(vk_home)) {
//    shareItems = !shareItems;
//}

