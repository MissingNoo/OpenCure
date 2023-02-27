/// @description 

//x -= dcos(point_direction(x, y, other.x, other.y))
//y += dsin(point_direction(x, y, other.x, other.y))
if (canwalk and pattern != Patterns.WallBoth) {
	if (pattern == Patterns.Cluster and other.pattern == Patterns.Cluster or pattern != Patterns.Cluster and other.pattern != Patterns.Cluster ) {
		var _push = .5;

		var _dir = point_direction(other.x, other.y, x, y);
		var _hspd = lengthdir_x(_push, _dir);
		var _vspd = lengthdir_y(_push, _dir);
 
		 x+=_hspd;
		 y+=_vspd;
	}
}