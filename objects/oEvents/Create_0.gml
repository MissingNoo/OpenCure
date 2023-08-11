/// @description Insert description here
// You can write your code in this editor
repeatSource = undefined;
enable = true;
var _my_method = function()
{
	if (!global.gamePaused) {
	    event = true;
	}
}
//feather disable GM2017
_time_source = time_source_create(time_source_game, 3, time_source_units_seconds, _my_method);

time_source_start(_time_source);
event = true;
