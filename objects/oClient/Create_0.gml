playerSpawn = [1895, 1880];
if (global.server) {
    port = 64198;
	maxClients = 1;
	server = network_create_server(network_socket_tcp, port, maxClients);
}

client = network_create_socket(network_socket_tcp);
//if (global.server) {
    //connected = network_connect(client, "127.0.0.1", 64198);
//}
//else {
    connected = network_connect(client, "192.168.15.3", 64198);
//}

//show_message_async("Client: " + string(connected));
clientBuffer = buffer_create(1024, buffer_fixed, 1);
if (room == rLobby) {
    instance_create_depth(x,y,depth,oLobby);
}
socketToInstanceID = ds_map_create();
inRoom = room;
