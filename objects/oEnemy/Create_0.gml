random_set_seed(current_time);
initiateEnemy(ds_list_find_value(global.enemyPool, irandom_range(0,ds_list_size(global.enemyPool)-1)));
