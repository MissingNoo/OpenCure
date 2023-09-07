/// @description Insert description here
// You can write your code in this editor                         
//draw_text(x,y-60, enemyID);
if (fanbeamFiring > 0) {
	if (alphaGoingUp) {
		if (warningAlpha < .25) {
		    warningAlpha += .005;
		}
		else{
			alphaGoingUp = false;
		}	    
	}
	if (!alphaGoingUp) {
		if (warningAlpha > .05) {
		    warningAlpha -= .005;
		}
		else{
			alphaGoingUp = true;
		}	    
	}
	draw_set_alpha(warningAlpha);
    draw_rectangle_color(x + (37 * image_xscale), y - 12, x + (view_wport[0] * image_xscale), y-98, c_red, c_red, c_red, c_red, false);
	draw_set_alpha(1);
    draw_rectangle_color(x + (35 * image_xscale), y - 10, x + (view_wport[0] * image_xscale), y-100, c_white, c_white, c_white, c_white, true);	
}

if (damaged) {
	gpu_set_fog(true,c_white,0,0);
    draw_self();
	gpu_set_fog(false,c_white,0,0);
}
else{
	draw_self();
	if (carryingBomb) {
	    draw_sprite(sImDie, 0, x, y - (sprite_get_height(sprite_index) / 2));
	}
}
var _vars = ["speed", "atk", "hp", "image_xscale"];
if (global.debug and distance_to_point(mouse_x, mouse_y) < 10) {
	for (var i = 0; i < array_length(_vars); ++i) {
		if (variable_instance_exists(self, _vars[i])) {
		    draw_text(x - 20, y - 30 + (i * 10),_vars[i] + ": " +  string(variable_instance_get(self, _vars[i])));
		}	    
	}
}
//draw_text(x,y-32,string(atk));
var offset = 0;
for (var i = 0; i < array_length(debuffs); ++i) {
	var iconsize = sprite_get_width(debuffs[i].icon);
    draw_sprite(debuffs[i].icon,0,x+offset,y+30);
	if (variable_struct_exists(debuffs[i], "marks")) {
	    draw_text(x+offset, y+35, debuffs[i].marks);
	}
	offset += iconsize + 5;
}

