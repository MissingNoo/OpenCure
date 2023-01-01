event_inherited();
damaged=false;
if (room != rInicio) {
	    random_set_seed(current_time);
	if (ds_list_size(global.enemyPool) > 0 ) {
	    initiateEnemy(ds_list_find_value(global.enemyPool, irandom_range(0,ds_list_size(global.enemyPool)-1)));
	}
	else {
	    instance_destroy();
	}

	if (boss) {
	    removeEnemyFromPool(thisEnemy);
	}
	baseATK = atk;
	baseHP = hp;
	//hp = (baseHP + baseHP * 0.05 * global.timeA) * (1 + (global.timeB / 50));
	baseSPD = speed;
	baseHP = hp;
	hp = (baseHP + (baseHP * 0.05 + global.timeA)) * ( 1 + (global.timeB/50));
	canattack=true;
}