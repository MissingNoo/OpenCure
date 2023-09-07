//event_inherited();
#region EliteCooking
poolSize = 20;
#endregion
#region BreathInAsacoco
asaDirection = undefined;
asaRotationSpeed = undefined;
asaSpeed = undefined;
asaDuration = undefined;
#endregion
#region Ring of Fitness

#endregion
#region I'm Die
explosionSize = .1;
#endregion
wallNumber = -1;
ps = undefined;
ps2 = undefined;
subImg=0;
maxImg = 0;
sprSpeed = 0;
sprSpeedType = gamespeed_fps
sprReset = true;
summoned = false;
#region BoneBros
slashTimer = 0;
bulletTimer = 0;
#endregion
dAlarm = array_create(11, -1);
idolStartX = 0;
gotpaused = false;
imageSpeedOriginal = 0;
hspd = 0;
vspd = 0;
upg??=global.null;
afterimage = [[], [], []];
afterimagecount = 0;
//alarm[11] = 1;
partSystem = part_system_create();
part = part_type_create();
part_type_life(part, oGui.a, oGui.b);
upgID = irandom(9999);
originalX = x;
originalY = y;
xpreviousprevious = 0;
ypreviousprevious = 0;
ghost = false;
if (arrowDir == 0 and shoots > 0) {
    arrowDir = global.arrowDir;
}
ce=0;
image_alpha=0;
image_speed=0;	
originalspeed = speed;
a=0;
//alarm[1]=200;
dAlarm[1]=200;
amePistolLastHit=false;
diroffset=0;
//image_xscale=oPlayer.image_xscale;
offset=-16;
b=0;
originaly=0;
//bl
orbitoffset = -90;
orbitPlace = 0;
orbitLength = 0;
image_speed=0;
image_alpha=0;
//lava
loops = 0;
changeSprite=false;
socket = global.socket;
owner = instance_nearest(x,y, oPlayer);
originalSize = [0, 0];
if (!variable_instance_exists(self, "idolDir")) {
    idolDir = 90;
}
if (upg[$"id"] == Weapons.IdolSong) {
	var totalidols = 0;
    for (var i = 0; i < instance_number(oUpgrade); ++i) {
		try{
			var inst = instance_find(oUpgrade, i);
			if (inst.upg[$"id"] == Weapons.IdolSong) {
			    totalidols++;
			}
		}
		catch (err){ 
			//dont care
		}
	}
	if (totalidols > upg[$"shoots"]) {
	    instance_destroy();
	}
}

if (upg[$"id"] == Weapons.SpiderCooking) {
	x = owner.x;
	y = owner.y - (sprite_get_height(global.player[?"sprite"]) / 3);
	image_xscale = upg[$"size"];
	image_yscale = upg[$"size"];
}