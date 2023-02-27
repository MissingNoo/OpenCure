if (instance_exists(oPlayer)) {
	var _seconds = round(Seconds);
	if (_seconds == 5 and Minutes == 0 and event) {
		event = false;
		alarm[0] = 60;
		spawnEvent(Enemies.Shrimp, 15, Patterns.Cluster);
	}

	if (_seconds == 30 and Minutes == 0 and event) {
		event = false;
		alarm[0] = 60;
		//shtimp e deadbeat
		addEnemyToPool(Enemies.DeadBeat);
	}

	if (_seconds == 5 and Minutes == 1 and event) {
		event = false;
		alarm[0] = 60;
		//shtimp e deadbeat
		spawnEvent(Enemies.KFPEmployee, 30, Patterns.Horde, 25, 3);
	}

	if (_seconds == 30 and Minutes == 1 and event) {
		event = false;
		alarm[0] = 60;
		spawnEvent(Enemies.DeadBeatLV3, 140, Patterns.WallBoth, 120, 0, 4);
	}

	if (_seconds == 0 and Minutes == 2 and event) {
		event = false;
		alarm[0] = 60;
		addEnemyToPool(Enemies.MegaShrimp);
	}

	if (_seconds == 0 and Minutes == 3 and event) {
		event = false;
		alarm[0] = 60;	
		//remove shrimp
		//deadbeat takodachi
		removeEnemyFromPool(Enemies.Shrimp);
		addEnemyToPool(Enemies.Takodachi);
	}

	if (_seconds == 18 and Minutes == 3 and event) {
		event = false;
		alarm[0] = 60;	
		spawnEvent(Enemies.KFPEmployee, 30, Patterns.Horde, 25, 3);
	}

	if (_seconds == 0 and Minutes == 4 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.KFPEmployee);
		addEnemyToPool(Enemies.TakoGrande);
	}

	if (_seconds == 0 and Minutes == 5 and event) {
		event = false;
		alarm[0] = 60;	
		removeEnemyFromPool(Enemies.DeadBeat);
		removeEnemyFromPool(Enemies.Takodachi);
		addEnemyToPool(Enemies.DarkShrimp);
		addEnemyToPool(Enemies.Bloom);
		addEnemyToPool(Enemies.Gloom);
	}

	if (_seconds == 0 and Minutes == 5 and event) {
		event = false;
		alarm[0] = 60;	
		spawnEvent(Enemies.KFPEmployee, 100, Patterns.Horde, 25, 3);
	}

	if (_seconds == 5 and Minutes == 5 and event) {
		event = false;
		alarm[0] = 60;	
		spawnEvent(Enemies.KFPEmployee, 100, Patterns.Horde, 25, 3);
	}

	if (_seconds == 10 and Minutes == 5 and event) {
		event = false;
		alarm[0] = 60;	
		spawnEvent(Enemies.KFPEmployee, 100, Patterns.Horde, 25, 3);
	}

	if (_seconds == 40 and Minutes == 5 and event) {
		event = false;
		alarm[0] = 60;	
		//shrimplv2 a1/a2 deadlv2 
	}

	if (_seconds == 0 and Minutes == 6 and event) {
		event = false;
		alarm[0] = 60;	
		removeEnemyFromPool(Enemies.KFPEmployee);
		addEnemyToPool(Enemies.DeadBatter);
		addEnemyToPool(Enemies.MegaDarkShrimp);
	}

	if (_seconds == 30 and Minutes == 6 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.InvestiGator)
	}

	if (_seconds == 35 and Minutes == 7 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.HungryTakodachi);
	}

	if (_seconds == 0 and Minutes == 8 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.GiantDeadBatter);
	}

	if (_seconds == 30 and Minutes == 8 and event) {
		event = false;
		alarm[0] = 60;	
		removeEnemyFromPool(Enemies.DarkShrimp);
		removeEnemyFromPool(Enemies.DeadBatter);
	}

	if (_seconds == 30 and Minutes == 9 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.DisgruntledEmployee);
	}

	if (_seconds == 0 and Minutes == 10 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.FubuZilla);
	}

	if (_seconds == 0 and Minutes == 11 and event) {
		event = false;
		alarm[0] = 60;	
		removeEnemyFromPool(Enemies.Bloom);
		removeEnemyFromPool(Enemies.Gloom);
		removeEnemyFromPool(Enemies.HungryTakodachi);
		removeEnemyFromPool(Enemies.InvestiGator);
		removeEnemyFromPool(Enemies.DisgruntledEmployee)
		addEnemyToPool(Enemies.BaeRat);
	}

	if (_seconds == 0 and Minutes == 12 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.KronieA);
		addEnemyToPool(Enemies.KronieB);
	}

	if (_seconds == 0 and Minutes == 13 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.KingKronie);
	}

	if (_seconds == 0 and Minutes == 14 and event) {
		event = false;
		alarm[0] = 60;	
		removeEnemyFromPool(Enemies.BaeRat);
		removeEnemyFromPool(Enemies.KronieA);
		removeEnemyFromPool(Enemies.KronieB);
		addEnemyToPool(Enemies.QDeadBeat);
		addEnemyToPool(Enemies.QShrimp);
	}

	if (_seconds == 0 and Minutes == 15 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.GiantQDeadbeat);
		addEnemyToPool(Enemies.MegaQShrimp);
	}

	if (_seconds == 45 and Minutes == 15 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.SaplingA);
		addEnemyToPool(Enemies.SaplingB);
		addEnemyToPool(Enemies.SaplingC);
		addEnemyToPool(Enemies.HoomanA);
		addEnemyToPool(Enemies.HoomanB);
	}

	if (_seconds == 0 and Minutes == 16 and event) {
		event = false;
		alarm[0] = 60;	
		removeEnemyFromPool(Enemies.QDeadBeat);
		removeEnemyFromPool(Enemies.QShrimp);
	}

	if (_seconds == 30 and Minutes == 17 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.OvergrownSapling);
	}

	if (_seconds == 0 and Minutes == 18 and event) {
		event = false;
		alarm[0] = 60;	
		addEnemyToPool(Enemies.Sanallite);
	}

	if (_seconds == 0 and Minutes == 19 and event) {
		event = false;
		alarm[0] = 60;	
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
		alarm[0] = 60;	
		addEnemyToPool(Enemies.ThiccBubba);
		addEnemyToPool(Enemies.SmolAme);
		removeEnemyFromPool(Enemies.SwarmingKingKronie);
		removeEnemyFromPool(Enemies.SwarmingOvergrownSapling);
	}

	if (_seconds == 0 and Minutes == 23 and event) {
		event = false;
		alarm[0] = 60;	
		removeEnemyFromPool(Enemies.ThiccBubba);	
	}
}