/// @description 

#region Spawn
if (canspawn and room == Room1) {
	a = irandom_range(-1,1)
	if (a=0) a = 1;
	b = irandom_range(-1,1)
	if (b=0) b = 1;
	
	random_set_seed(current_time);
    canspawn=false;
	alarm[0]=60;
	instance_create_layer(
	oPlayer.x+(200*a),
	oPlayer.y+(200*b),
	"Instances",
	oEnemy	
	)
}
#endregion

global.seconds+=1/30;
if (global.seconds >60) {
	summonCircle();
	global.seconds=0;	
	global.minutes+=1;	
}
z=0
if (global.seconds >30 and z=0) {
    z=1
	addEnemyToPool(1);
}
zz=0
if (global.seconds >50 and zz=0) {
    zz=1
	removeEnemyFromPool(0)
}


