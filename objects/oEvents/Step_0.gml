//feather disable GM2017
if (keyboard_check_pressed(vk_home)) {
	Minutes = 9;
	Seconds = 58;
}
if (event == false and time_source_get_state(_time_source) == time_source_state_stopped) {
    time_source_reset(_time_source);
	time_source_start(_time_source);
}

if (instance_exists(oPlayer) and enable) { //TODO: finish adding stage 1 events
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
		addEnemyToPool(Enemies.DeadBeat);
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
		addEnemyToPool(Enemies.MegaShrimp);
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
		removeEnemyFromPool(Enemies.Shrimp);
		addEnemyToPool(Enemies.Takodachi);
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
		addEnemyToPool(Enemies.KFPEmployee);
		addEnemyToPool(Enemies.TakoGrande);
	}

	if (_seconds == 15 and Minutes == 4 and event) {
		event = false;
		//alarm[0] = 60;	
		spawn_event(Enemies.TakoViking, Patterns.Ring, 200, 1, 0.55, 5, 26, 50);
	}

	if (_seconds == 0 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		removeEnemyFromPool(Enemies.DeadBeat);
		removeEnemyFromPool(Enemies.Takodachi);
		addEnemyToPool(Enemies.DarkShrimp);
		addEnemyToPool(Enemies.Bloom);
		addEnemyToPool(Enemies.Gloom);
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
		removeEnemyFromPool(Enemies.KFPEmployee);
		addEnemyToPool(Enemies.DeadBatter);
		addEnemyToPool(Enemies.MegaDarkShrimp);
	}

	if (_seconds == 30 and Minutes == 6 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.InvestiGator)
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
		addEnemyToPool(Enemies.HungryTakodachi);
	}

	if (_seconds == 0 and Minutes == 8 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.GiantDeadBatter);
	} 
	
	if (_seconds == 30 and Minutes == 8 and event) {
		event = false;
		repeatSource = time_source_create(time_source_game, 2, time_source_units_seconds, function(){ spawn_event(Enemies.DeadBeatLV3,Patterns.Ring, "-", "-", 0.35, "-", 11, 27, 400)}, [], 10);
		time_source_start(repeatSource);
		//INFO: should be 22 seconds of lifetime?
		//alarm[0] = 60;	
		removeEnemyFromPool(Enemies.DarkShrimp);
		removeEnemyFromPool(Enemies.DeadBatter);
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
		addEnemyToPool(Enemies.DisgruntledEmployee);
	}

	if (_seconds == 0 and Minutes == 10 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.FubuZilla);
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
		removeEnemyFromPool(Enemies.Bloom);
		removeEnemyFromPool(Enemies.Gloom);
		removeEnemyFromPool(Enemies.HungryTakodachi);
		removeEnemyFromPool(Enemies.InvestiGator);
		removeEnemyFromPool(Enemies.DisgruntledEmployee)
		addEnemyToPool(Enemies.BaeRat);
	}
	
	if (_seconds == 30 and Minutes == 11 and event) {
		event = false;
		spawn_event(Enemies.BaeRat, Patterns.Ring, "-", "-", "-", "-", "-", 120, 500, 0, true, 16);
	}

	if (_seconds == 0 and Minutes == 12 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.KronieA);
		addEnemyToPool(Enemies.KronieB);
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
		addEnemyToPool(Enemies.KingKronie);
	}

	if (_seconds == 0 and Minutes == 14 and event) {
		event = false;
		//alarm[0] = 60;	
		removeEnemyFromPool(Enemies.BaeRat);
		removeEnemyFromPool(Enemies.KronieA);
		removeEnemyFromPool(Enemies.KronieB);
		addEnemyToPool(Enemies.QDeadBeat);
		addEnemyToPool(Enemies.QShrimp);
	}

	if (_seconds == 0 and Minutes == 15 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.GiantQDeadbeat);
		addEnemyToPool(Enemies.MegaQShrimp);
	}

	if (_seconds == 45 and Minutes == 15 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.SaplingA);
		addEnemyToPool(Enemies.SaplingB);
		addEnemyToPool(Enemies.SaplingC);
		addEnemyToPool(Enemies.HoomanA);
		addEnemyToPool(Enemies.HoomanB);
	}

	if (_seconds == 0 and Minutes == 16 and event) {
		event = false;
		//alarm[0] = 60;	
		removeEnemyFromPool(Enemies.QDeadBeat);
		removeEnemyFromPool(Enemies.QShrimp);
	}
	if (_seconds == 15 and Minutes == 16 and event) {
		event = false;
		spawn_event(Enemies.KronieA, Patterns.WallLeftRight, 1500, "-", 0.26, 10, 15, 100, 0, 0, false, 100);
		spawn_event(Enemies.KronieA, Patterns.WallTopBottom, 1500, "-", 0.26, 10, 15, 100, 0, 0, false, 150);
	}

	if (_seconds == 30 and Minutes == 17 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.OvergrownSapling);
	}

	if (_seconds == 0 and Minutes == 18 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.Sanallite);
	}

	if (_seconds == 0 and Minutes == 19 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.SwarmingKingKronie);
		addEnemyToPool(Enemies.SwarmingOvergrownSapling);
		removeEnemyFromPool(Enemies.SaplingA);
		removeEnemyFromPool(Enemies.SaplingB);
		removeEnemyFromPool(Enemies.SaplingC);
		removeEnemyFromPool(Enemies.HoomanA);
		removeEnemyFromPool(Enemies.HoomanB);
		removeEnemyFromPool(Enemies.Sanallite);
	}

	if (_seconds == 0 and Minutes == 20 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.ThiccBubba);
		addEnemyToPool(Enemies.SmolAme);
		removeEnemyFromPool(Enemies.SwarmingKingKronie);
		removeEnemyFromPool(Enemies.SwarmingOvergrownSapling);
	}

	if (_seconds == 0 and Minutes == 23 and event) {
		event = false;
		//alarm[0] = 60;	
		removeEnemyFromPool(Enemies.ThiccBubba);	
	}
}


//TODO:
/*
(Enemies.deadbeatlv3, Patterns.Ring, "-", "-", "-", "-", 22, 27) every1.66s08:30?
(Enemies.DisgruntledEmployee, Patterns.Horde, "-", "-", "-", "-", "-", 120) every5.0s09:00-09:30
(Enemies.Investi-Gator, Patterns.StampedeRight, 1, 000, "-", 1.6, 10, 20, 40) 10:15
(Enemies.Baerat, Patterns.Ring, "-", "-", "-", "-", "-", 120) 11:30
(Enemies.Kronie, Patterns.StampedeRight, 2, 000, 7, 2.0, 10, 20, 20) 12:20
(Enemies.Kronie, Patterns.StampedeRight, 2, 000, 7, 3.0, 10, 20, 20) 12:25
(Enemies.Kronie, Patterns.StampedeRight, 2, 000, 7, 2.0, 10, 20, 188) 12:45-12:50
(Enemies.Baerat, Patterns.Horde, 70, 2, 1.7, 5, "-", 40) every2.0s13:30-13:40
(Enemies.RiotQDeadBeat, Patterns.StampedeRight, 2.000, "-", 2.0, 10, 20, 10) 14:20
(Enemies.RiotQShrimp, Patterns.StampedeRight, 2.000, "-", 2.0, 10, 20, 10) 14:25
(Enemies.RiotQDeadBeat, Patterns.StampedeRight, 2.000, "-", 2.0, 10, 20, 10) 14:30
(Enemies.RiotQShrimp, Patterns.StampedeRight, 2.000, "-", 2.0, 10, 20, 10) 14:30
(Enemies.RiotQDeadBeat, Patterns.StampedeRight, 2.000, "-", 2.0, 10, 20, 12) every1.0s14:35-14:40
(Enemies.RiotQShrimp, Patterns.StampedeRight, 2.000, "-", 2.0, 10, 20, 12) every1.0s14:35-14:40
(Enemies.RiotQDeadBeat, Patterns.Wall, 2.000, "-", 1.6, 10, 20, 8) 14:45
(Enemies.RiotQShrimp, Patterns.Wall, 2.000, "-", 1.6, 10, 20, 8) 14:45
(Enemies.Kronie, Patterns.Wall, 1.500, "-", 0.26, 10, 15, 100) 16:15
(Enemies.Hooman, Patterns.StampedeRight, 5.000, "-", 2.0, 10, 20, 40) 17:00