event_inherited();
alarm[11] = 1;
partSystem = part_system_create();
part = part_type_create();
part_type_life(part, oGui.a, oGui.b);
upgID = irandom(9999);
originalX = x;
originalY = y;
xpreviousprevious = 0;
ypreviousprevious = 0;
ghost = false;
arrowDir = global.arrowDir;
CE=0;
image_alpha=0;
image_speed=0;	
originalspeed = speed;
a=0;
alarm[1]=200;
AmePistolLastHit=false;
diroffset=0;
//image_xscale=oPlayer.image_xscale;
offset=-16;
b=0;
originaly=0;
//bl
orbitoffset = -90;
orbit_place = 0;
image_speed=0;
image_alpha=0;
//lava
loops = 0;
changeSprite=false;
socket = oPlayer.socket;
owner = instance_nearest(x,y, oPlayer);
originalSize = [0, 0];
if (!variable_instance_exists(self, "idolDir")) {
    idolDir = 0;
}