///// @description Insert description here
//network_destroy(server);
//server = undefined;
sendMessage({command : Network.Disconnect});
if (variable_instance_exists(self, "keepalive") and time_source_exists(keepalive)) {
    time_source_destroy(keepalive); 
}
