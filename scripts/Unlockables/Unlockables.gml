#macro UnlockableItems global.unlockableItems
#macro UnlockableWeapons global.unlockableWeapons
#macro UnlockableOutfits global.unlockableOutfits
#macro UnlockableCharacters global.unlockableCharacters
#macro Granks global.gRanks
UnlockableItems = array_create(ItemIds.Length, false);
UnlockableWeapons = array_create(Weapons.Length, false);
UnlockableCharacters = array_create(Characters.Lenght, false);
Granks = array_create(Characters.Lenght, 0);
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