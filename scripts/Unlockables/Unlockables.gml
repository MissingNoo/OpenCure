#macro UnlockableItems global.unlockableItems
#macro UnlockableWeapons global.unlockableWeapons
UnlockableItems = array_create(ItemIds.Length, false);
UnlockableWeapons = array_create(Weapons.Length, false);
function load_unlocked(){
	for (var i = 0; i < ItemIds.Length; ++i) {
		if (variable_struct_exists(ItemList[i][1], "unlocked")) {
		    ItemList[i][1][$"unlocked"] = UnlockableItems[i];
		}	
	}
	for (var i = 0; i < Weapons.Length; ++i) {
		if (variable_struct_exists(WEAPONS_LIST[i][1], "unlocked")) {
		    WEAPONS_LIST[i][1][$"unlocked"] = UnlockableWeapons[i];
		}	
	}
}