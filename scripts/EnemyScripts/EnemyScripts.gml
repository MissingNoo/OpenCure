//iniciar variaveis do inimigo
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
function createEnemy(_id, _name, _sprite, _atksprite, _hp, _speed, _atk, _def)
{
	global.enemies[_id]=ds_map_create();
	m = global.enemies[_id];
	ds_map_add(m, "name", _name);	
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "atksprite", _atksprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "def", _def);
	show_debug_message(_name + " Added to enemies list")
}
createEnemy(0,"Blue Guy",sEnemy1, sEnemy1,10,.3,10,1);
createEnemy(1,"Red Guy",sEnemy2, sEnemy2,20,.3,10,1);

enum Enemies
{
	Blue_Guy,
	Red_Guy
}


#region Enemy Pool Control
global.enemyPool=ds_list_create(); //enemies the game can summon
ds_list_add(EnemyPool, global.enemies[Enemies.Blue_Guy]) //start pool with the first mob

function addEnemyToPool(e){
	ds_list_add(EnemyPool, global.enemies[e]);	
	show_debug_message(global.enemies[e][? "name"] + " added to enemy pool");
}

function removeEnemyFromPool(e){
	ds_list_delete(EnemyPool, ds_list_find_index(EnemyPool,e[?"id"]))
	show_debug_message(global.enemies[e][? "name"] + " removed from enemy pool");
}
#endregion


