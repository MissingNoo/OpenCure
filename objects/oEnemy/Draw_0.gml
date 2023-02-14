/// @description Insert description here
// You can write your code in this editor                         
//draw_text(x,y-60, enemyID);
if (damaged) {
	gpu_set_fog(true,c_white,0,0);
    draw_self();
	gpu_set_fog(false,c_white,0,0);
}
else{draw_self();}
var _vars = ["speed", "atk", "hp"]
if (global.debug) {
	for (var i = 0; i < array_length(_vars); ++i) {
		if (variable_instance_exists(self, _vars[i])) {
		    draw_text(x - 20, y - 30 + (i * 10),_vars[i] + ": " +  string(variable_instance_get(self, _vars[i])));
		}	    
	}
}
//draw_text(x,y-32,string(atk));
for (var i = 0; i < array_length(debuffs); ++i) {
    draw_sprite(debuffs[i].icon,0,x,y+30);
	draw_text(x,y+35, debuffs[i].marks);
}

