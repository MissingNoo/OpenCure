if (instance_exists(oClient)) {
	sendMessage({command : Network.Disconnect});
    network_destroy(oClient.client);
	network_destroy(oClient.connected);
}
Save_Data_Structs();