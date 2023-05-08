/// @description Insert description here
// You can write your code in this editor
var _my_method = function()
{
    event = true;
}

var _time_source = time_source_create(time_source_game, 60, time_source_units_seconds, _my_method);

time_source_start(_time_source);
event = true;
