var _timestate = time_source_get_state(keepalive);
if(_timestate == time_source_state_initial or _timestate == time_source_state_stopped){
	time_source_start(keepalive);
}

if (inRoom != room and room == Room1) {
	inRoom = room;
	sendMessage({command : Network.PlayerConnect});	
	var player = instance_create_layer(playerSpawn[0], playerSpawn[1], "Instances", oPlayer);
	with (player) {
	    socket = oClient.connected;
	}
}