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
}
	
global.enemies=[];
function createEnemy(_id, _name, _sprite, _hp, _speed, _atk, _def)
{
	global.enemies[_id]=ds_map_create();
	m = global.enemies[_id];
	ds_map_add(m, "name", _name);	
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "def", _def);
	show_debug_message(_name + " Added to enemies list")
}
enum Enemies
{
	Shrimp,
	DeadBeat,
	Takodachi
}
createEnemy(Enemies.Shrimp,"Shrimp",sShrimp,10,.3,10,1);
createEnemy(Enemies.DeadBeat,"DeadBeat",sDeadBeat,20,.3,10,1);
createEnemy(Enemies.Takodachi,"TakoDachi",sTakodachi,30,.3,10,1);




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





