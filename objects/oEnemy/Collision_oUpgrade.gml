if (!gotknocked) {
    gotknocked = true;
	var _push = other.upg[$"knockbackSpeed"];
	var _dir = point_direction(other.x, other.y, x, y);
	var _hspd = lengthdir_x(_push, _dir);
	var _vspd = lengthdir_y(_push, _dir); 
	x+=_hspd;
	y+=_vspd;
	alarm[2] = other.upg[$"knockbackDuration"]*2;
}
