event_inherited();
damaged=false;
target = oPlayer;
enemynum = 1;
if (room != rInicio) {
	    random_set_seed(current_time);
	if (ds_list_size(global.enemyPool) > 0 ) {
		enemynum = irandom_range(0,ds_list_size(global.enemyPool)-1);
	    initiateEnemy(ds_list_find_value(global.enemyPool, enemynum));
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
randomize();
enemyID = irandom(9999);

vars = variable_instance_get_names(self);
savedvars = {};
for (var i = 0; i < array_length(vars); ++i) {
    variable_struct_set(savedvars, vars[i], variable_instance_get(self, vars[i]));
}
sendvars = json_stringify(savedvars);
buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
buffer_write(oClient.clientBuffer, buffer_u8, Network.Spawn);
buffer_write(oClient.clientBuffer, buffer_u8, oPlayer.socket);
buffer_write(oClient.clientBuffer, buffer_u16, x);
buffer_write(oClient.clientBuffer, buffer_u16, y);
buffer_write(oClient.clientBuffer, buffer_string, sendvars);
//show_message(sendvars);
if (oPlayer.socket == 1) {
    network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
}
//show_debug_overlay(true);