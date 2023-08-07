//feather disable GM2017
if (keyboard_check_pressed(vk_home) and global.debug) {
	Minutes = 9;
	Seconds = 58;
}
if (event == false and time_source_get_state(_time_source) == time_source_state_stopped) {
    time_source_reset(_time_source);
	time_source_start(_time_source);
}

if (instance_exists(oPlayer) and enable) { //TODO: finish adding stage 1 events
	//feather disable once GM1041
	var _seconds = round(Seconds);
	if (_seconds == 5 and Minutes == 0 and event) {
		event = false;
		//alarm[0] = 60;
		spawn_event(Enemies.Shrimp,Patterns.Cluster,"-", "-", "-", "-", "-", 15);
		
	}

	if (_seconds == 30 and Minutes == 0 and event) {
		event = false;
		//alarm[0] = 60;
		//shtimp e deadbeat
		add_enemy_to_pool(Enemies.DeadBeat);
	}

	if (_seconds == 5 and Minutes == 1 and event) {
		event = false;
		//alarm[0] = 60;
		//shtimp e deadbeat
		spawn_event(Enemies.KFPEmployee,Patterns.Horde, 25, "-", 3, "-", "-", 30);
	}

	if (_seconds == 30 and Minutes == 1 and event) {
		event = false;
		//alarm[0] = 60;
		spawn_event(Enemies.DeadBeatLV3,Patterns.WallLeftRight,120, "-", "-", 4, 8.3, 140);
	}

	if (_seconds == 0 and Minutes == 2 and event) {
		event = false;
		//alarm[0] = 60;
		add_enemy_to_pool(Enemies.MegaShrimp);
	}
	
	if (_seconds == 35 and Minutes == 2 and event) {
		event = false;
		//alarm[0] = 60;
		spawn_event(Enemies.DeadBeat,Patterns.Ring, "-", "-", "-", "-", "-", 50);
	}

	if (_seconds == 45 and Minutes == 2 and event) {
		event = false;
		//alarm[0] = 60;
		spawn_event(Enemies.DeadBeatLV3,Patterns.StampedeRight, 500, "-", 2, 8, 20, 10);
	}

	if (_seconds == 0 and Minutes == 3 and event) {
		event = false;
		//alarm[0] = 60;	
		//remove shrimp
		//deadbeat takodachi
		remove_enemy_from_pool(Enemies.Shrimp);
		add_enemy_to_pool(Enemies.Takodachi);
	}
	
	if (_seconds == 15 and Minutes == 3 and event) {
		event = false;
		//alarm[0] = 60;	
		//var qtd = os_type == os_android ? 70 : 140;
		//spawnEvent(Enemies.TakoViking, Patterns.WallTop, 200, "-", 0.55, 5, 8.3, 140, 0, "-", true);
		spawn_event(Enemies.TakoViking, Patterns.WallTopBottom, 200, "-", 0.55, 5, 8.3, 140, 0, "-", true);
	}

	if (_seconds == 18 and Minutes == 3 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.KFPEmployee,Patterns.Horde, 25, "-", 3, "-", "-", 30);
	}

	if (_seconds == 40 and Minutes == 3 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.TakoViking, Patterns.StampedeTop, 500, 1, 1.6, 8, 20, 20, 0 ,0, false, 1);
		spawn_event(Enemies.TakoViking, Patterns.StampedeDown, 500, 1, 1.6, 8, 20, 20, 0 ,0, false, 2);
	}

	if (_seconds == 0 and Minutes == 4 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.KFPEmployee);
		add_enemy_to_pool(Enemies.TakoGrande);
	}

	if (_seconds == 15 and Minutes == 4 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.TakoViking, Patterns.Ring, 200, 1, 0.55, 5, 26, 50);
	}

	if (_seconds == 0 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		remove_enemy_from_pool(Enemies.DeadBeat);
		remove_enemy_from_pool(Enemies.Takodachi);
		add_enemy_to_pool(Enemies.DarkShrimp);
		add_enemy_to_pool(Enemies.Bloom);
		add_enemy_to_pool(Enemies.Gloom);
	}

	if (_seconds == 0 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.KFPEmployee,Patterns.Horde, 25, "-", 3, "-", "-", 100);
	}

	if (_seconds == 5 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.KFPEmployee,Patterns.Horde, 25, "-", 3, "-", "-", 100);
	}

	if (_seconds == 10 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.KFPEmployee,Patterns.Horde, 25, "-", 3, "-", "-", 100);
	}

	if (_seconds == 30 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		repeatSource = time_source_create(time_source_game, 0.5, time_source_units_seconds, function(){ spawn_event(Enemies.TakoViking, Patterns.StampedeRight, 800, 1, 2, 8, 20, 10);}, [], 5);
		time_source_start(repeatSource);
	}

	if (_seconds == 0 and Minutes == 6 and event) {
		event = false;
		//alarm[0] = 60;	
		remove_enemy_from_pool(Enemies.KFPEmployee);
		add_enemy_to_pool(Enemies.DeadBatter);
		add_enemy_to_pool(Enemies.MegaDarkShrimp);
	}

	if (_seconds == 30 and Minutes == 6 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.InvestiGator)
	}

	if (_seconds == 0 and Minutes == 7 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.Shrimp, Patterns.Ring, 500, 5, 0.05, 10, 25, 76, 400, "-", true, 16);
		//INFO: should be 120 shrimps, but anyway?
	}
	
	if (_seconds == 35 and Minutes == 7 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.HungryTakodachi);
	}

	if (_seconds == 0 and Minutes == 8 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.GiantDeadBatter);
	} 
	
	if (_seconds == 30 and Minutes == 8 and event) {
		event = false;
		repeatSource = time_source_create(time_source_game, 2, time_source_units_seconds, function(){ spawn_event(Enemies.DeadBeatLV3,Patterns.Ring, "-", "-", 0.35, "-", 11, 27, 400)}, [], 10);
		time_source_start(repeatSource);
		//INFO: should be 22 seconds of lifetime?
		//alarm[0] = 60;	
		remove_enemy_from_pool(Enemies.DarkShrimp);
		remove_enemy_from_pool(Enemies.DeadBatter);
	}
	
	if (_seconds == 55 and Minutes == 8 and event) {
		event = false;
		repeatSource = time_source_create(time_source_game, 5, time_source_units_seconds, function(){ spawn_event(Enemies.DisgruntledEmployee, Patterns.Horde, "-", "-", 3, "-", "-", 60);}, [], 6);
		time_source_start(repeatSource);
		//INFO: should be 120?
	}
	
	if (_seconds == 30 and Minutes == 9 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.DisgruntledEmployee);
	}

	if (_seconds == 0 and Minutes == 10 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.FubuZilla);
	}
	
	if (_seconds == 15 and Minutes == 10 and event) {
		event = false;
		spawn_event(Enemies.InvestiGator, Patterns.StampedeLeft, 1000, "-", 1.6, 10, 20, 40, 0, 0, false, 1);
		spawn_event(Enemies.InvestiGator, Patterns.StampedeRight, 1000, "-", 1.6, 10, 20, 40, 0, 0, false, 1);
		spawn_event(Enemies.InvestiGator, Patterns.StampedeTop, 1000, "-", 1.6, 10, 20, 40, 0, 0, false, 1);
		spawn_event(Enemies.InvestiGator, Patterns.StampedeDown, 1000, "-", 1.6, 10, 20, 40, 0, 0, false, 1);
	}

	if (_seconds == 0 and Minutes == 11 and event) {
		event = false;
		//alarm[0] = 60;	
		remove_enemy_from_pool(Enemies.Bloom);
		remove_enemy_from_pool(Enemies.Gloom);
		remove_enemy_from_pool(Enemies.HungryTakodachi);
		remove_enemy_from_pool(Enemies.InvestiGator);
		remove_enemy_from_pool(Enemies.DisgruntledEmployee)
		add_enemy_to_pool(Enemies.BaeRat);
	}
	
	if (_seconds == 30 and Minutes == 11 and event) {
		event = false;
		spawn_event(Enemies.BaeRat, Patterns.Ring, "-", "-", "-", "-", "-", 120, 500, 0, true, 16);
	}

	if (_seconds == 0 and Minutes == 12 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.KronieA);
		add_enemy_to_pool(Enemies.KronieB);
	}

	if (_seconds == 20 and Minutes == 12 and event) {
		event = false;
		spawn_event(Enemies.KronieA, Patterns.StampedeLeft, 2000, 7, 2, 10, 20, 10, 0, 0, false, 2);
		spawn_event(Enemies.KronieB, Patterns.StampedeRight, 2000, 7, 2, 10, 20, 10, 0, 0, false, 1);
		//TODO: random kronie
	}
	if (_seconds == 25 and Minutes == 12 and event) {
		event = false;
		spawn_event(Enemies.KronieA, Patterns.StampedeTop, 2000, 7, 3, 10, 20, 10, 0, 0, false, 1);
		spawn_event(Enemies.KronieA, Patterns.StampedeDown, 2000, 7, 3, 10, 20, 10, 0, 0, false, 2);
		//TODO: random kronie
	}
	if (_seconds == 45 and Minutes == 12 and event) {
		event = false;
		repeatSource = time_source_create(time_source_game, 1, time_source_units_seconds, function(){
			spawn_event(Enemies.KronieA, Patterns.StampedeLeft, 2000, 7, 3, 10, 20, 20, 0, 0, false, 1);
			spawn_event(Enemies.KronieA, Patterns.StampedeDown, 2000, 7, 3, 10, 20, 20, 0, 0, false, 2);
			}, [], 5);
		time_source_start(repeatSource);		
		//TODO: random kronie
	}

	if (_seconds == 0 and Minutes == 13 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.KingKronie);
	}

	if (_seconds == 0 and Minutes == 14 and event) {
		event = false;
		//alarm[0] = 60;	
		remove_enemy_from_pool(Enemies.BaeRat);
		remove_enemy_from_pool(Enemies.KronieA);
		remove_enemy_from_pool(Enemies.KronieB);
		add_enemy_to_pool(Enemies.QDeadBeat);
		add_enemy_to_pool(Enemies.QShrimp);
	}

	if (_seconds == 0 and Minutes == 15 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.GiantQDeadbeat);
		add_enemy_to_pool(Enemies.MegaQShrimp);
	}

	if (_seconds == 45 and Minutes == 15 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.SaplingA);
		add_enemy_to_pool(Enemies.SaplingB);
		add_enemy_to_pool(Enemies.SaplingC);
		add_enemy_to_pool(Enemies.HoomanA);
		add_enemy_to_pool(Enemies.HoomanB);
	}

	if (_seconds == 0 and Minutes == 16 and event) {
		event = false;
		//alarm[0] = 60;	
		remove_enemy_from_pool(Enemies.QDeadBeat);
		remove_enemy_from_pool(Enemies.QShrimp);
	}
	if (_seconds == 15 and Minutes == 16 and event) {
		event = false;
		spawn_event(Enemies.KronieA, Patterns.WallLeftRight, 1500, "-", 0.26, 10, 15, 100, 0, 0, false, 100);
		spawn_event(Enemies.KronieA, Patterns.WallTopBottom, 1500, "-", 0.26, 10, 15, 100, 0, 0, false, 150);
	}

	if (_seconds == 30 and Minutes == 17 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.OvergrownSapling);
	}

	if (_seconds == 0 and Minutes == 18 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.Sanallite);
	}

	if (_seconds == 0 and Minutes == 19 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.SwarmingKingKronie);
		add_enemy_to_pool(Enemies.SwarmingOvergrownSapling);
		remove_enemy_from_pool(Enemies.SaplingA);
		remove_enemy_from_pool(Enemies.SaplingB);
		remove_enemy_from_pool(Enemies.SaplingC);
		remove_enemy_from_pool(Enemies.HoomanA);
		remove_enemy_from_pool(Enemies.HoomanB);
		remove_enemy_from_pool(Enemies.Sanallite);
	}

	if (_seconds == 0 and Minutes == 20 and event) {
		event = false;
		//alarm[0] = 60;	
		add_enemy_to_pool(Enemies.ThiccBubba);
		add_enemy_to_pool(Enemies.SmolAme);
		remove_enemy_from_pool(Enemies.SwarmingKingKronie);
		remove_enemy_from_pool(Enemies.SwarmingOvergrownSapling);
	}
	if (_seconds == 0 and Minutes == 23 and event) {
		event = false;
		//alarm[0] = 60;	
		reset_pool();
		remove_enemy_from_pool(Enemies.Shrimp);
		for (var i = Enemies.EndlessShrimp; i <= Enemies.EndlessSanallite; ++i) {
		    add_enemy_to_pool(i);
		}
	}
	
	
}