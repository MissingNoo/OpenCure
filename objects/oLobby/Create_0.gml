buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
buffer_write(oClient.clientBuffer, buffer_u8, Network.LobbyConnect);
buffer_write(oClient.clientBuffer, buffer_string, global.username);
buffer_write(oClient.clientBuffer, buffer_u8, global.player[?"id"]);
network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
ishost = "";
players = array_create(3,-1);