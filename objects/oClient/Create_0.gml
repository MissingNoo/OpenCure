playerSpawn = [1895, 1880];
if (instance_number(oClient) > 1) {
    instance_destroy();
}
//if (global.server) {
//    port = 64198;
//	maxClients = 1;
//	try{
//		//server = network_create_server(network_socket_tcp, port, maxClients);
//	}
//	catch(error){
//		//i don't care bro
//	}
//}

client = network_create_socket(network_socket_tcp);
//if (global.server) {
try{
	if (!global.server) {
		connected = network_connect(client, "opencure.ddns.net", 64198);
	}
	else{
		connected = 0;
	}
}
catch(error){
	//i don't care bro
}
//}
//else {
    //connected = network_connect(client, "192.168.15.3", 64198);
//}

//show_message_async("Client: " + string(connected));
clientBuffer = buffer_create(4098, buffer_fixed, 1);
if (room == rLobby) {
    instance_create_depth(x,y,depth,oLobby);
}
socketToInstanceID = ds_map_create();
inRoom = room;
