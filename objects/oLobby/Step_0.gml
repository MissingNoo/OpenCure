/// @description Insert description here
// You can write your code in this editor
if (string_length(keyboard_string) > 15)
{
    keyboard_string = string_copy(keyboard_string, 1, 15);
}
global.roomname = oLobby.roomname;
if (!joinedRoom and !creatingroom and !typepassword) {
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

	if (point_in_rectangle(oGui.x, oGui.y, joinx1, createy1, joinx2, createy2)  or input_check_pressed("accept")) {
		global.roomname = rooms[selectedroom][$"name"];
		if (rooms[selectedroom][$"password"] == "") {
		    sendMessage({
				command : Network.JoinRoom,
				username : global.username,
				character : global.player[?"id"],			
			});
		}
		else{keyboard_string = ""; passwordselected = 0; typepassword = true; if (os_type == os_android) { keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false); }}
	}
}

if (creatingroom) {
	#region selected
    if (input_check_pressed("down")) {
	    if (creatingselected < 2) {
		    creatingselected++;
			if (creatingselected == 1) {
			    keyboard_string = password;
				if (os_type == os_android) { keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false); }
			}
		}
	}
	if (input_check_pressed("up")) {
	    if (creatingselected > 0) {
		    creatingselected--;
			if (creatingselected == 1) {
			    keyboard_string = password;
				if (os_type == os_android) { keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false); }
			}
			if (creatingselected == 0) {
			    keyboard_string = roomname;
				if (os_type == os_android) { keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false); }
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
	
}

if (typepassword) {
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
			if (os_type == os_android) { keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false); }
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
		global.IsHost = ishost;
		sprites += .25;
		if (ishost and input_check_pressed("accept")) {
			sendMessage({command : Network.StartGame});
		}
}