/// @description Insert description here
// You can write your code in this editor]
sendMessage({command : Network.Disconnect});
if (instance_exists(oClient)) {
    network_destroy(oClient.client);
	network_destroy(oClient.connected);
}



Save_Data_Structs();
