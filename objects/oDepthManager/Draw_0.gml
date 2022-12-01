/// @description Insert description here
// You can write your code in this editor

var g = grid;
var yy = 0;
var inst;
repeat (count) {
	inst = g[# 0, yy];
    with (inst) {
	    event_perform(ev_draw,0);
	}
	yy++;
}




