//iniciar variaveis do inimigo
#macro EnemyList global.enemies
#macro EnemyPool global.enemyPool
function initiateEnemy(e){
	damaged=false;
	gamePausedImageSpeed=image_speed;
	pausedSpeed=0;
	col=false
	hp=e[?"hp"];
	speed=e[?"speed"];
	def=e[?"def"];
	atk=e[?"atk"];
	sprwalking=e[?"sprite"];
	sprattack=e[?"atksprite"];	
	sprite_index=sprwalking;
	xp = e[?"exp"];
}
	
global.enemies=[];
function createEnemy(_id, _name, _sprite, _hp, _speed, _atk, _exp, _weight)
{
	global.enemies[_id]=ds_map_create();
	m = global.enemies[_id];
	ds_map_add(m, "name", _name);	
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "exp", _exp);
	ds_map_add(m, "weight", _weight);
	show_debug_message(_name + " Added to enemies list")
}
enum Enemies
{
	Shrimp,
	DarkShrimp,
	MegaShrimp,
	MegaDarkShrimp,
	DeadBeat,
	DeadBeatLV2,
	DeadBeatLV3,
	DeadBeatLV4,
	DeadBeatLV5,
	Takodachi
}
#region Create Enemies
	#region Shrimps
		createEnemy(Enemies.Shrimp,"Shrimp",sShrimp,8,.35,2,6,1);
		createEnemy(Enemies.MegaShrimp,"MegaShrimp",sShrimp,600,.5,6,150,1);
		createEnemy(Enemies.DarkShrimp,"DarkShrimp",sShrimp,125,.6,5,12,1);		
		createEnemy(Enemies.MegaDarkShrimp,"MegaDarkShrimp",sShrimp,2500,.9,10,1000,1);
	#endregion
	
	#region DeadBeats
		createEnemy(Enemies.DeadBeat,"DeadBeat",sDeadBeat,40,.4,4,7,1);
		createEnemy(Enemies.DeadBeatLV2,"DeadBeatLV2",sDeadBeat,150,.6,7,9,1);
		createEnemy(Enemies.DeadBeatLV3,"DeadBeatLV3",sDeadBeat,380,.65,4,8,1); //knockback immunity
		createEnemy(Enemies.DeadBeatLV4,"DeadBeatLV4",sDeadBeat,80,1,4,8,1);
		createEnemy(Enemies.DeadBeatLV5,"DeadBeatLV5",sDeadBeat,1500,.1,4,4,1);
	#endregion
	
	#region Takodachis
		createEnemy(Enemies.Takodachi,"TakoDachi",sTakodachi,50,.3,10,1,1);
	#endregion
#endregion

#region Enemy Pool Control
global.enemyPool=ds_list_create(); //enemies the game can summon

function addEnemyToPool(e){
	ds_list_add(EnemyPool, EnemyList[e]);	
	show_debug_message(EnemyList[e][? "name"] + " added to enemy pool");
}

function removeEnemyFromPool(e){
	ds_list_delete(EnemyPool, ds_list_find_index(EnemyPool, EnemyList[e]))
	show_debug_message(EnemyList[e][? "name"] + " removed from enemy pool");
}

function ResetPool()
{
	ds_list_clear(EnemyPool);
	ds_list_add(EnemyPool, EnemyList[Enemies.Shrimp]) //start pool with the first mob
}
#endregion

function damageCalculation(baseDmg)
{
	var damage = baseDmg;
	for (var i = 0; i < array_length(Bonuses[bonusType.Defense]); ++i) {
	    damage = damage * Bonuses[bonusType.Defense][i];
	}
	if (global.debug) {
	    show_debug_message("baseDmg:" + string(baseDmg) + " after calculation: " + string(damage));
	}	
	return damage;
}









