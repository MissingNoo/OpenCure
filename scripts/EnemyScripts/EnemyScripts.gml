//iniciar variaveis do inimigo
#macro EnemyList global.enemies
#macro EnemyPool global.enemyPool
function initiateEnemy(e){
	thisEnemy = e;
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
	boss = e[?"boss"];
}
	
global.enemies=[];
function createEnemy(_id, _name, _sprite, _hp, _speed, _atk, _exp, _weight, _boss = false)
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
	ds_map_add(m, "boss", _boss);
	//show_debug_message(_name + " Added to enemies list")
}
enum Enemies
{
	Shrimp,
	DarkShrimp,
	MegaShrimp,
	MegaDarkShrimp,
	DeadBeat,
	DeadBatter,
	DeadBeatLV3,
	DeadBeatLV4,
	DeadBeatLV5,
	Takodachi,
	KFPEmployee,
	TakoGrande,
	Bloom,
	Gloom,
	InvestiGator,
	GiantDeadBatter,
	DisgruntledEmployee,
	HungryTakodachi,
	FubuZilla
}
#region Create Enemies
	#region Shrimps
		createEnemy(Enemies.Shrimp,"Shrimp",sShrimp,8,.35,2,6,1);
		createEnemy(Enemies.MegaShrimp,"MegaShrimp",sShrimp,600,.5,6,150,1, true);
		createEnemy(Enemies.DarkShrimp,"DarkShrimp",sShrimp,125,.6,5,12,1);		
		createEnemy(Enemies.MegaDarkShrimp,"MegaDarkShrimp",sShrimp,2500,.9,10,1000,1, true);
	#endregion
	
	#region DeadBeats
		createEnemy(Enemies.DeadBeat,"DeadBeat",sDeadBeat,40,.4,4,7,1);
		createEnemy(Enemies.DeadBatter,"DeadBeatLV2",sDeadBatter,150,.6,7,9,1);
		createEnemy(Enemies.GiantDeadBatter,"GiantDeadBeatLV2",sDeadBatter,3500,1,11,1500,1, true);
		createEnemy(Enemies.DeadBeatLV3,"DeadBeatLV3",sDeadBeat,380,.65,4,8,1); //knockback immunity
		createEnemy(Enemies.DeadBeatLV4,"DeadBeatLV4",sDeadBeat,80,1,4,8,1);
		createEnemy(Enemies.DeadBeatLV5,"DeadBeatLV5",sDeadBeat,1500,.1,4,4,1);
	#endregion
	
	#region Takodachis
		createEnemy(Enemies.Takodachi,"TakoDachi",sTakodachi,50,.4,4,1,1);
		createEnemy(Enemies.HungryTakodachi,"Hungry TakoDachi",sHungryTakodachi,220,.65,8,9,1);
		createEnemy(Enemies.TakoGrande,"Tako Grande",sTakodachi,1800,.75,10, 600,1, true);
	#endregion
	
	#region KPF
		createEnemy(Enemies.KFPEmployee, "KFPEmployee", sKFPEmployee, 20, 1, 2, 3, 1);
		createEnemy(Enemies.DisgruntledEmployee, "Disgruntled Employee", sDisgruntledEmployee, 50, 1.15, 4, 7, 1);
	#endregion
	
	#region Hope
		createEnemy(Enemies.Gloom, "Gloom", sGloom, 30, .7, 6, 12, 1);
		createEnemy(Enemies.Bloom, "Bloom", sBloom, 30, .7, 6, 12, 1);
	#endregion
	
	#region Ame
		createEnemy(Enemies.InvestiGator, "Inveti-Gator", sInvestigator, 180, 0.85, 7, 9, 1)
	#endregion
	
	#region fubuzilla
		createEnemy(Enemies.FubuZilla, "FubuZilla", sFubuzilla, 8000, 0.8, 15, 2000,1,true);
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
		if (Bonuses[bonusType.Defense][i] != 0) {
		    damage = damage * Bonuses[bonusType.Defense][i];
		}
	}
	for (var i = 0; i < array_length(Bonuses[bonusType.TakeDamage]); ++i) {
		if (Bonuses[bonusType.TakeDamage][i] != 0) {
		    damage = damage * Bonuses[bonusType.TakeDamage][i];
		}
	}
	if (global.debug) {
	    show_debug_message("baseDmg:" + string(baseDmg) + " after calculation: " + string(damage));
	}	
	return damage;
}









