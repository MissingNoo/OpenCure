/// @description Insert description here
// You can write your code in this editor
count = instance_number(oDepthParent);
ds_grid_resize(grid, 2 , count);
var g = grid;
var yy = 0;
with (oDepthParent) {
	if (!variable_instance_exists(self, "saved") or (variable_instance_exists(self, "saved") and distance_to_object(oPlayer) < oPlayer.renderDistance)) { 
	    g[# 0, yy] = id;
		g[# 1, yy] = y;
		yy++;
	}
}

ds_grid_sort(grid, 1, true);