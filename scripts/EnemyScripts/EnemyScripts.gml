// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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
	sprattack=e[?"sprite"];	
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
}
createEnemy(0,"Skeleton",sEnemy1,10,.3,10,1);
createEnemy(1,"Zombie",sEnemy2,20,.3,10,1);


#region Enemy Pool Control
global.enemyPool=ds_list_create(); //enemies the game can summon
ds_list_add(global.enemyPool,global.enemies[0]) //start pool with the first mob

function addEnemyToPool(e){
	ds_list_add(global.enemyPool, global.enemies[e]);	
}

function removeEnemyFromPool(e){
	ds_list_delete(global.enemyPool, ds_list_find_index(global.enemyPool,e[?"id"]))
}
#endregion

