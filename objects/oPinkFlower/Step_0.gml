/// @description Insert description here
var _timestate = time_source_get_state(source);
if(_timestate == time_source_state_initial or _timestate == time_source_state_stopped){
	time_source_start(source);
}