event_inherited();
gotknocked = false;
debuffs = [];
damaged=false;
target = oPlayer;
enemynum = 1;
//TODO: add multiplayer random target
if (room != rInicio) {
	    random_set_seed(current_time);
	if (ds_list_size(global.enemyPool) > 0 ) {
		enemynum = irandom_range(0,ds_list_size(global.enemyPool)-1);
		if (!customSpawn) {
		    initiateEnemy(ds_list_find_value(global.enemyPool, enemynum));
		}else{
			initiateEnemy(selectedEnemy);
			if (customHP != "-") {
				hp = customHP;
			}
			if (customSPD != "-") {
				speed = customSPD;
			}
			if (customXP != "-") {
				xp = customXP;
			}
			switch (pattern) {
			    case Patterns.Horde:
			        direction = point_direction(x,y, oPlayer.x, oPlayer.y);
			        break;
				case Patterns.WallBoth:
					    direction = point_direction(x,y, oPlayer.x, y);
					break;
			    default:
			        // code here
			        break;
			}
		}
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
deathSent = false;
enemyID = irandom(9999);
//feather disable once GM2017
if (global.IsHost and !global.singleplayer) {
	vars = variable_instance_get_names(self);
	savedvars = {};
	for (var i = 0; i < array_length(vars); ++i) {
	    variable_struct_set(savedvars, vars[i], variable_instance_get(self, vars[i]));
	}
	sendvars = json_stringify(savedvars);
	sendMessage({
		command : Network.Spawn,
		socket : oClient.connected,
		x,
		y,
		sendvars,		
	});
}
dropxp = true;