/// @description Insert description here
// You can write your code in this editor
seconds = round(Seconds);
if (seconds == 30 and Minutes == 0 and event) {
	event = false;
	alarm[0] = 60;
	//shtimp e deadbeat
	addEnemyToPool(Enemies.Red_Guy);
}

if (seconds == 0 and Minutes == 3 and event) {
	event = false;
	alarm[0] = 60;	
	//remove shrimp
	//deadbeat takodachi
	removeEnemyFromPool(Enemies.Blue_Guy);
}

if (seconds == 0 and Minutes == 4 and event) {
	event = false;
	alarm[0] = 60;	
	//dead tako kfp
}

if (seconds == 0 and Minutes == 5 and event) {
	event = false;
	alarm[0] = 60;	
	//remove dead
	//tako kfp a1/a2
}

if (seconds == 40 and Minutes == 5 and event) {
	event = false;
	alarm[0] = 60;	
	//shrimplv2 a1/a2 deadlv2 
}

if (seconds == 35 and Minutes == 6 and event) {
	event = false;
	alarm[0] = 60;	
	//shlv2 a1/a2 bigbubba
}

if (seconds == 35 and Minutes == 7 and event) {
	event = false;
	alarm[0] = 60;	
	//shlv2 deadbeatlv2 bigbubba takolv2
}

if (seconds == 0 and Minutes == 8 and event) {
	event = false;
	alarm[0] = 60;	
	//1 boss
}

if (seconds == 35 and Minutes == 8 and event) {
	event = false;
	alarm[0] = 60;	
	//trocentos deadbeat
	//shlv2 a1/a2 bigbubba deadlv3
}
