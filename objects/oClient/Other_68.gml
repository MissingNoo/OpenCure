var type_event = ds_map_find_value(async_load, "type");
var buffer;
if (async_load[? "size"] > 0) {
    var _buffer = async_load[? "buffer"];
	buffer_seek(_buffer, buffer_seek_start, 0);
	var _response = buffer_read(_buffer, buffer_text);
	clientReceivedPacket2(_response);
	
}
//switch (type_event) {
//    case network_type_data:
//        buffer = ds_map_find_value(async_load, "buffer");
//		buffer_seek(buffer, buffer_seek_start, 0);
//		clientReceivedPacket(buffer);
//        break;
//}