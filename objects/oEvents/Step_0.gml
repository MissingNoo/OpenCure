//feather disable GM2017
if (event == false and time_source_get_state(_time_source) == time_source_state_stopped) {
    time_source_reset(_time_source);
	time_source_start(_time_source);
}

if (instance_exists(oPlayer) and enable) { //TODO: finish adding stage 1 events
	var _seconds = round(Seconds);
	if (_seconds == 5 and Minutes == 0 and event) {
		event = false;
		//alarm[0] = 60;
		spawnEvent(Enemies.Shrimp,Patterns.Cluster,"-", "-", "-", "-", "-", 15);
		
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
		spawnEvent(Enemies.KFPEmployee,Patterns.Horde, 25, "-", "-", "-", "-", 30);
	}

	if (_seconds == 30 and Minutes == 1 and event) {
		event = false;
		//alarm[0] = 60;
		spawnEvent(Enemies.DeadBeatLV3,Patterns.WallBoth,120, "-", "-", 4, 8.3, 140);
	}

	if (_seconds == 0 and Minutes == 2 and event) {
		event = false;
		//alarm[0] = 60;
		addEnemyToPool(Enemies.MegaShrimp);
	}
	
	if (_seconds == 35 and Minutes == 2 and event) {
		event = false;
		//alarm[0] = 60;
		spawnEvent(Enemies.DeadBeat,Patterns.Ring, "-", "-", "-", "-", "-", 50);
	}

	if (_seconds == 45 and Minutes == 2 and event) {
		event = false;
		//alarm[0] = 60;
		spawnEvent(Enemies.DeadBeatLV3,Patterns.Stampede, 500, "-", "-", 8, 20, 10); //TODO: Add 20 seconds of lifetime
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
		spawnEvent(Enemies.Takodachi, Patterns.WallRight, 200, "-", 0.55, 5, 8.3, 140);//TODO: Tako knight
	}

	if (_seconds == 18 and Minutes == 3 and event) {
		event = false;
		//alarm[0] = 60;	
		spawnEvent(Enemies.KFPEmployee, Patterns.Horde, 25, "-", "-", "-", "-", 30);
	}

	if (_seconds == 40 and Minutes == 3 and event) {
		event = false;
		//alarm[0] = 60;	
		//TODO: takoknight Stampede	500	-	1.6	8	20	20
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
		//TODO: takoknight Ring	200	-	-	5	26	50
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
		spawnEvent(Enemies.KFPEmployee, Patterns.Horde, 25, "-", "-", "-", "-", 100);
	}

	if (_seconds == 5 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		spawnEvent(Enemies.KFPEmployee, Patterns.Horde, 25, "-", "-", "-", "-", 100);
	}

	if (_seconds == 10 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		spawnEvent(Enemies.KFPEmployee, Patterns.Horde, 25, "-", "-", "-", "-", 100);
	}

	if (_seconds == 30 and Minutes == 5 and event) {
		event = false;
		//alarm[0] = 60;	
		//TODO: takoknight Stampede	800	-	2.0	8	20	40
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
		//TODO: darkshrimp Ring	500	5	0.05	10	25	120
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
		//alarm[0] = 60;	
		removeEnemyFromPool(Enemies.DarkShrimp);
		removeEnemyFromPool(Enemies.DeadBatter);
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

	if (_seconds == 0 and Minutes == 12 and event) {
		event = false;
		//alarm[0] = 60;	
		addEnemyToPool(Enemies.KronieA);
		addEnemyToPool(Enemies.KronieB);
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
(Enemies.Investi-Gator, Patterns.Stampede, 1, 000, "-", 1.6, 10, 20, 40) 10:15
(Enemies.Baerat, Patterns.Ring, "-", "-", "-", "-", "-", 120) 11:30
(Enemies.Kronie, Patterns.Stampede, 2, 000, 7, 2.0, 10, 20, 20) 12:20
(Enemies.Kronie, Patterns.Stampede, 2, 000, 7, 3.0, 10, 20, 20) 12:25
(Enemies.Kronie, Patterns.Stampede, 2, 000, 7, 2.0, 10, 20, 188) 12:45-12:50
(Enemies.Baerat, Patterns.Horde, 70, 2, 1.7, 5, "-", 40) every2.0s13:30-13:40
(Enemies.RiotQDeadBeat, Patterns.Stampede, 2.000, "-", 2.0, 10, 20, 10) 14:20
(Enemies.RiotQShrimp, Patterns.Stampede, 2.000, "-", 2.0, 10, 20, 10) 14:25
(Enemies.RiotQDeadBeat, Patterns.Stampede, 2.000, "-", 2.0, 10, 20, 10) 14:30
(Enemies.RiotQShrimp, Patterns.Stampede, 2.000, "-", 2.0, 10, 20, 10) 14:30
(Enemies.RiotQDeadBeat, Patterns.Stampede, 2.000, "-", 2.0, 10, 20, 12) every1.0s14:35-14:40
(Enemies.RiotQShrimp, Patterns.Stampede, 2.000, "-", 2.0, 10, 20, 12) every1.0s14:35-14:40
(Enemies.RiotQDeadBeat, Patterns.Wall, 2.000, "-", 1.6, 10, 20, 8) 14:45
(Enemies.RiotQShrimp, Patterns.Wall, 2.000, "-", 1.6, 10, 20, 8) 14:45
(Enemies.Kronie, Patterns.Wall, 1.500, "-", 0.26, 10, 15, 100) 16:15
(Enemies.Hooman, Patterns.Stampede, 5.000, "-", 2.0, 10, 20, 40) 17:00