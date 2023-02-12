if (global.server) {
			    instance_destroy();
			}
global.px = array_create(3,0);
global.py = array_create(3,0);
port = 64198;
maxClients = 2;
server = network_create_server(network_socket_tcp, port, maxClients);
//show_message_async(server);
socket = noone;
buffer = noone;
serverBuffer = buffer_create(2048, buffer_fixed, 1);
socketList = ds_list_create();
socketToInstanceID = ds_map_create();

playerSpawn = [1895, 1880];