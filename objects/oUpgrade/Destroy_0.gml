/// @description Insert description here
// You can write your code in this editor
buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
buffer_write(oClient.clientBuffer, buffer_u8, Network.DestroyUpgrade);
buffer_write(oClient.clientBuffer, buffer_u16, upgID);
buffer_write(oClient.clientBuffer, buffer_string, global.roomname);
network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));