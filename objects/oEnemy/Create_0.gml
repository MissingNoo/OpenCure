random_set_seed(current_time);
initiateEnemy(ds_list_find_value(global.enemyPool, irandom_range(0,ds_list_size(global.enemyPool)-1)));
if (boss) {
    removeEnemyFromPool(thisEnemy);
}
baseATK = atk;
baseSPD = speed;
baseHP = hp;
hp = (baseHP + (baseHP * 0.05 + global.timeA)) * ( 1 + (global.timeB/50));
canattack=true;
