if (!global.singleplayer) {
	var _timestate = time_source_get_state(keepalive);
	if(_timestate == time_source_state_initial or _timestate == time_source_state_stopped){
		time_source_start(keepalive);
	}
}
if (!instance_exists(oPlayer) and instance_exists(oClient) and room == rStage1) {
	    instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oPlayer,{socket : oClient.connected});
	}
if (inRoom != room and room == rStage1) {
	inRoom = room;
	sendMessage({command : Network.PlayerConnect});	
	show_message("test");
	if (!instance_exists(oPlayer) and instance_exists(oClient)) {
	    instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oPlayer,{socket : oClient.connected});
	}
	
	//with (player) {
	//    socket = oClient.connected;
	//}
}