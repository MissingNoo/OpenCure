
playerSpawn = [1895, 1880];
if (global.server) {
	instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oPlayer);
    //instance_destroy();
}

client = network_create_socket(network_socket_tcp);
if (global.server) {
    connected = network_connect(client, "127.0.0.1", 64198);
}
else {
    connected = network_connect(client, "192.168.15.3", 64198);
}

//show_message_async("Client: " + string(connected));
clientBuffer = buffer_create(1024, buffer_fixed, 1);
playerSpawn = [1895, 1880];
socketToInstanceID = ds_map_create();