/// @description 

//x -= dcos(point_direction(x, y, other.x, other.y))
//y += dsin(point_direction(x, y, other.x, other.y))
var canCollide = true;
switch (pattern) {
    case Patterns.Cluster:
        canCollide = true;
        break;
    case Patterns.StampedeLeft:
        canCollide = false;
        break;
    case Patterns.StampedeRight:
        canCollide = false;
        break;
    case Patterns.StampedeTop:
        canCollide = false;
        break;
    case Patterns.StampedeDown:
        canCollide = false;
        break;
    case Patterns.WallLeftRight:
        canCollide = false;
        break;
    case Patterns.WallTopBottom:
        canCollide = true;
        break;
    default:
        canCollide = true;
        break;
}
if (canwalk and canCollide and other.pattern == pattern) {
	//if (pattern == Patterns.Cluster and other.pattern == Patterns.Cluster or pattern != Patterns.Cluster and other.pattern != Patterns.Cluster ) {
		var _push = .5;

		var _dir = point_direction(other.x, other.y, x, y);
		var _hspd = lengthdir_x(_push, _dir);
		var _vspd = lengthdir_y(_push, _dir);
 
		 x+=_hspd;
		 y+=_vspd;
	//}
}