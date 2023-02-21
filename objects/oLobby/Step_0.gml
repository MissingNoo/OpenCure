/// @description Insert description here
// You can write your code in this editor
global.IsHost = ishost;
if (ishost == "host" and keyboard_check_pressed(ord("Z")) and is_struct(players[2])) {
    buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
	buffer_write(oClient.clientBuffer, buffer_u8, Network.StartGame);
	network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
}