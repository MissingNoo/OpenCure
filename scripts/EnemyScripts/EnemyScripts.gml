//iniciar variaveis do inimigo
#macro EnemyList global.enemies
#macro EnemyPool global.enemyPool
function initiate_enemy(e){
	//hittedcooldown = array_create(array_length(global.upgradesAvaliable));
	hittedcooldown[0] = 0;
	thisEnemy = e[?"id"];
	damaged=false;
	gamePausedImageSpeed=image_speed;
	pausedSpeed=0;
	col=false;
	hp=e[?"hp"];
	speed=e[?"speed"];
	ospeed=e[?"speed"];
	def=e[?"def"];
	atk=e[?"atk"];
	sprwalking=e[?"sprite"];
	sprattack=e[?"atksprite"];
	sprite_index=sprwalking;
	image_xscale = e[?"xscale"];
	image_yscale = e[?"yscale"];
	xscale = e[?"xscale"];
	yscale = e[?"yscale"];
	xp = e[?"exp"];
	boss = e[?"boss"];
	for (var i = 0; i < array_length(global.upgradesAvaliable); ++i) {
	    hittedcooldown[i] = 0;
	}
	debuffs = [];
	effects = [];
}
	
global.enemies=[];
function create_enemy(_id, _name, _sprite, _hp, _speed, _atk, _exp, _weight = 1, _boss = false, _xscale = 1, _yscale = 1, _knockbackImmunity = false)
{
	global.enemies[_id]=ds_map_create();
	m = global.enemies[_id];
	ds_map_add(m, "id", _id);	
	ds_map_add(m, "name", _name);	
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "xscale", _xscale);
	ds_map_add(m, "yscale", _yscale);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "exp", _exp);
	ds_map_add(m, "weight", _weight);
	ds_map_add(m, "boss", _boss);
	ds_map_add(m, "knockbackImmunity", _knockbackImmunity);
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
	TakoViking,
	KFPEmployee,
	TakoGrande,
	Bloom,
	Gloom,
	InvestiGator,
	GiantDeadBatter,
	DisgruntledEmployee,
	HungryTakodachi,
	FubuZilla,
	BaeRat,
	KronieA,
	KronieB,
	KingKronie,
	QDeadBeat,
	QShrimp,
	GiantQDeadbeat,
	MegaQShrimp,
	SaplingA,
	SaplingB,
	SaplingC,
	HoomanA,
	HoomanB,
	OvergrownSapling,
	Sanallite,
	SwarmingKingKronie,
	SwarmingOvergrownSapling,
	ThiccBubba,
	SmolAme,
	EndlessShrimp,
	EndlessDeadBeat,
	EndlessTakodachi,
	EndlessEmployee,
	EndlessBubba,
	EndlessBloom,
	EndlessGloom,
	EndlessSapling,
	EndlessBaerat,
	EndlessKronie,
	EndlessHooman,
	EndlessSanallite,
	EndlessYagoo,
	Lenght
}
#region Create Enemies
	#region Stage 1
		create_enemy(Enemies.Shrimp, "Shrimp", sShrimp, 8, .35, 2, 6, 1);
		create_enemy(Enemies.MegaShrimp, "MegaShrimp", sShrimp, 600,.5,6,150,1, true);
		create_enemy(Enemies.DarkShrimp,"DarkShrimp",sDarkShrimp,125,.6,5,12,1);		
		create_enemy(Enemies.MegaDarkShrimp,"MegaDarkShrimp",sDarkShrimp,2500,.9,10,1000,1, true);
		create_enemy(Enemies.DeadBeat,"DeadBeat",sDeadBeat,40,.4,4,7,1);
		create_enemy(Enemies.DeadBeatLV3,"DeadBeatLV3",sDeadBeatLV3,380,.65,5,8,1);
		create_enemy(Enemies.DeadBatter,"DeadBeatLV2",sDeadBatter,150,.6,7,9,1);
		create_enemy(Enemies.GiantDeadBatter,"GiantDeadBeatLV2",sDeadBatter,3500,1,11,1500,1, true);
		create_enemy(Enemies.Takodachi,"TakoDachi",sTakodachi,50,.4,4,1,1, false, 1.5, 1.5);
		create_enemy(Enemies.TakoViking,"TakoViking",sTakoViking,50,.4,4,1,0, false, 1.5, 1.5);
		create_enemy(Enemies.HungryTakodachi,"Hungry TakoDachi",sHungryTakodachi,220,.65,8,9,1, false, 1.5, 1.5);
		create_enemy(Enemies.TakoGrande,"Tako Grande",sTakodachi,1800,.75,10, 600,1, true, 2, 2);
		create_enemy(Enemies.KFPEmployee, "KFPEmployee", sKFPEmployee, 20, 1, 2, 3, 1);
		create_enemy(Enemies.DisgruntledEmployee, "Disgruntled Employee", sDisgruntledEmployee, 50, 1.15, 4, 7, 1);
		create_enemy(Enemies.Gloom, "Gloom", sGloom, 30, .7, 6, 12, 1);
		create_enemy(Enemies.Bloom, "Bloom", sBloom, 30, .7, 6, 12, 1);
		create_enemy(Enemies.InvestiGator, "Inveti-Gator", sInvestigator, 180, 0.85, 7, 9, 1);
		create_enemy(Enemies.FubuZilla, "FubuZilla", sFubuzilla, 8000, 0.8, 15, 2000,1,true, 1, 1, true);
		create_enemy(Enemies.BaeRat, "BaeRat", sBaeRat, 100, 1.1, 5, 8, 1);
		create_enemy(Enemies.KronieA, "KronieA", sKronieA, 450, 0.8, 11, 10, 1);
		create_enemy(Enemies.KronieB, "KronieB", sKronieA, 450, 0.8, 11, 10, 1);
		create_enemy(Enemies.KingKronie, "King Kronie", sKingKronie, 5500, 1, 18, 2000, 1, true);
		create_enemy(Enemies.QDeadBeat, "Q DeadBeat", sQDeadBeat, 650, 0.7, 14, 12, 1);
		create_enemy(Enemies.QShrimp, "Q Shrimp", sQShrimp, 650, 0.9, 12, 12, 1);
		create_enemy(Enemies.GiantQDeadbeat, "Giant Q Deadbeat", sQDeadBeat, 7500, 1.1, 20, 1200);
		create_enemy(Enemies.MegaQShrimp, "Mega Q Shrimp", sQShrimp, 7500, 1.1, 20, 1200);
		create_enemy(Enemies.SaplingA, "Sapling A", sSaplingA, 900, 0.7, 14, 11);
		create_enemy(Enemies.SaplingB, "Sapling B", sSaplingB, 900, 0.7, 14, 11);
		create_enemy(Enemies.SaplingC, "Sapling C", sSaplingC, 900, 0.7, 14, 11);
		create_enemy(Enemies.HoomanA, "Hooman A", sHoomanA, 750, 1, 12, 11);
		create_enemy(Enemies.HoomanB, "Hooman B", sHoomanB, 750, 1, 12, 11);
		create_enemy(Enemies.OvergrownSapling, "Overgrown Sapling", sSaplingKing, 11000, 1.1, 20, 2000);
		create_enemy(Enemies.Sanallite, "Sanallite", sSanallite, 2000, 0.6, 18, 14);
		create_enemy(Enemies.SwarmingKingKronie, "SwarmingKingKronie", sKingKronie, 3000, 0.4, 17, 15);
		create_enemy(Enemies.SwarmingOvergrownSapling, "SwarmingOvergrownSapling", sSaplingKing, 3000, 0.4, 17, 15);
		create_enemy(Enemies.ThiccBubba, "Thicc Bubba", sThiccBubba, 1000, 0.85, 12, 20);
		create_enemy(Enemies.SmolAme, "Smol Ame", sSmolAme, 25000, 1.2, 20, 5000);
		#region Endless
		create_enemy(Enemies.EndlessShrimp, "Endless", sShrimp, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessDeadBeat, "Endless", sQDeadBeat, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessTakodachi, "Endless", sTakodachi, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessEmployee, "Endless", sDisgruntledEmployee, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessBubba, "Endless", sThiccBubba, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessBloom, "Endless", sBloom, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessGloom, "Endless", sGloom, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessSapling, "Endless", sSaplingA, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessBaerat, "Endless", sBaeRat, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessKronie, "Endless", sKronieA, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessHooman, "Endless", sHoomanA, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessSanallite, "Endless", sSanallite, 5000, 1, 15, 25);
		create_enemy(Enemies.EndlessYagoo, "Endless", sSake, 9000, 1.5, 5, 25);
		#endregion
	#endregion
#endregion
global.sprites = [];
for (var i = 0; i < Enemies.Lenght; ++i) {
	array_push(global.sprites, EnemyList[i][?"sprite"]);
}

#region Enemy Pool Control
global.enemyPool=ds_list_create(); //enemies the game can summon

function add_enemy_to_pool(e){
	ds_list_add(EnemyPool, EnemyList[e]);	
	show_debug_message(EnemyList[e][? "name"] + " added to enemy pool");
}

function remove_enemy_from_pool(e){
	ds_list_delete(EnemyPool, ds_list_find_index(EnemyPool, EnemyList[e]));
	show_debug_message(EnemyList[e][? "name"] + " removed from enemy pool");
}

function reset_pool()
{
	ds_list_clear(EnemyPool);
	ds_list_add(EnemyPool, EnemyList[Enemies.Shrimp]); //start pool with the first mob
}
#endregion

function damage_calculation(baseDmg)
{
	var damage = baseDmg;
	for (var i = 0; i < array_length(Bonuses[BonusType.Defense]); ++i) {
		if (Bonuses[BonusType.Defense][i] != 0) {
		    damage = damage * Bonuses[BonusType.Defense][i];
		}
	}
	for (var i = 0; i < global.shopUpgrades[$ "Defense"][$ "level"]; ++i) {
	    damage = damage - ((damage * 3) / 100);
	}
	//// perk bonuses
	//for (var i = 0; i < array_length(PerkBonuses[BonusType.Defense]); ++i) {
	//	if (PerkBonuses[BonusType.Defense][i] != 0) {
	//	    damage = damage * PerkBonuses[BonusType.Defense][i];
	//	}
	//}
	//
	for (var i = 0; i < array_length(Bonuses[BonusType.TakeDamage]); ++i) {
		if (Bonuses[BonusType.TakeDamage][i] != 0) {
		    damage = damage * Bonuses[BonusType.TakeDamage][i];
		}
	}
	for (var i = 0; i < array_length(playerItems); ++i) {
	    if (playerItems[i][$ "id"] == ItemIds.Headphones) {
		    // randomize;
			if (irandom_range(1, 100) <= playerItems[i][$ "dodgeChance"]) {
			    damage = 0;
				instance_create_depth(x,y,depth,oUpgrade,{upg : global.upgradesAvaliable[Weapons.Shockwave][1]});
			}
		}
	}
	
	if (global.debug) {
	    show_debug_message("baseDmg:" + string(baseDmg) + " after calculation: " + string(damage));
	}	
	return damage;
}
















