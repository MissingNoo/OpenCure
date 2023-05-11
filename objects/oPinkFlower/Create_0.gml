petal = function(){
	petals = part_system_create(pFlower1);
	part_system_position(petals, x, y);
	time_source_reconfigure(source, random_range(1,10), time_source_units_seconds, petal);
}
source = time_source_create(time_source_game, 5, time_source_units_seconds,petal);