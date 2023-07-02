global.serverip = "192.168.15.9";
//global.serverip = "140.238.187.191";
global.port = 64198;
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

client = network_create_socket(network_socket_udp);
clientBuffer = buffer_create(4098, buffer_fixed, 1);
//if (global.server) {
try{
	if (!global.server) {
		connected = network_connect_raw(client, global.serverip, global.port);
		sendMessage({command : Network.Connection, username : global.username});
		keepalive = time_source_create(time_source_game, 5, time_source_units_seconds,function(){ sendMessage({command : Network.KeepAlive, roomname : global.roomname})});
		//connected = network_connect_raw(client, "opencure.ddns.net", 64198);
		//connected = network_connect(client, "140.238.187.191", 64198);
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

if (room == rLobby) {
    instance_create_depth(x,y,depth,oLobby);
}
socketToInstanceID = ds_map_create();
inRoom = room;
