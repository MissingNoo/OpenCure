/// @description Insert description here
// You can write your code in this editor
seconds = round(Seconds);
if (seconds == 30 and Minutes == 0 and event) {
	event = false;
	alarm[0] = 60;
	//shtimp e deadbeat
	addEnemyToPool(Enemies.DeadBeat);
}

if (seconds == 0 and Minutes == 2 and event) {
	addEnemyToPool(Enemies.MegaShrimp);
}

if (seconds == 0 and Minutes == 3 and event) {
	event = false;
	alarm[0] = 60;	
	//remove shrimp
	//deadbeat takodachi
	removeEnemyFromPool(Enemies.Shrimp);
	addEnemyToPool(Enemies.Takodachi);
}

if (seconds == 0 and Minutes == 4 and event) {
	event = false;
	alarm[0] = 60;	
	addEnemyToPool(Enemies.KFPEmployee);
	addEnemyToPool(Enemies.TakoGrande);
}

if (seconds == 0 and Minutes == 5 and event) {
	event = false;
	alarm[0] = 60;	
	removeEnemyFromPool(Enemies.DeadBeat);
	removeEnemyFromPool(Enemies.Takodachi);
	addEnemyToPool(Enemies.DarkShrimp);
	addEnemyToPool(Enemies.Bloom);
	addEnemyToPool(Enemies.Gloom);
}

if (seconds == 40 and Minutes == 5 and event) {
	event = false;
	alarm[0] = 60;	
	//shrimplv2 a1/a2 deadlv2 
}

if (seconds == 0 and Minutes == 6 and event) {
	event = false;
	alarm[0] = 60;	
	removeEnemyFromPool(Enemies.KFPEmployee);
	addEnemyToPool(Enemies.DeadBatter);
	addEnemyToPool(Enemies.MegaDarkShrimp);
}

if (seconds == 30 and Minutes == 6 and event) {
	event = false;
	alarm[0] = 60;	
	addEnemyToPool(Enemies.InvestiGator)
}

if (seconds == 35 and Minutes == 7 and event) {
	event = false;
	alarm[0] = 60;	
	addEnemyToPool(Enemies.HungryTakodachi);
}

if (seconds == 0 and Minutes == 8 and event) {
	event = false;
	alarm[0] = 60;	
	addEnemyToPool(Enemies.GiantDeadBatter);
}

if (seconds == 30 and Minutes == 8 and event) {
	event = false;
	alarm[0] = 60;	
	removeEnemyFromPool(Enemies.DarkShrimp);
	removeEnemyFromPool(Enemies.DeadBatter);
}

if (seconds == 30 and Minutes == 9 and event) {
	event = false;
	alarm[0] = 60;	
	addEnemyToPool(Enemies.DisgruntledEmployee);
}

if (seconds == 0 and Minutes == 10 and event) {
	event = false;
	alarm[0] = 60;	
	addEnemyToPool(Enemies.FubuZilla);
}

if (seconds == 0 and Minutes == 11 and event) {
	event = false;
	alarm[0] = 60;	
	removeEnemyFromPool(Enemies.Bloom);
	removeEnemyFromPool(Enemies.Gloom);
	removeEnemyFromPool(Enemies.HungryTakodachi);
	removeEnemyFromPool(Enemies.InvestiGator);
	removeEnemyFromPool(Enemies.DisgruntledEmployee)
}
