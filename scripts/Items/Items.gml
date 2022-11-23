#macro playerItems global.items
#macro ItemList global.itemList
global.items=[0];
global.itemCooldown[0] = 0;
#region Null item
	global.nullitem=ds_map_create()
	ds_map_add(global.nullitem, "name", "");
	global.itemList=[0];
#endregion

#region Item Functions

	function createItem(_id, _name, _level, _maxLevel, _weight, _sprite, _cooldown, _desc, _unlocked = true, _type = "yellow", _perk = 0)
	{
		ItemList[_id][0]=global.nullitem;
		ItemList[_id][_level]=ds_map_create();
		var item = ItemList[_id][_level];
		ds_map_add(item, "id", _id);
		ds_map_add(item, "name", _name);
		ds_map_add(item, "level", _level);
		ds_map_add(item, "maxlevel", _maxLevel);
		ds_map_add(item, "weight", _weight);
		ds_map_add(item, "thumb", _sprite);
		ds_map_add(item, "cooldown", _cooldown);
		ds_map_add(item, "desc", _desc);
		ds_map_add(item, "unlocked", _unlocked);
		ds_map_add(item, "type", _type);
		ds_map_add(item, "perk", _perk);
		ds_map_add(item, "style", ItemTypes.Item);
		global.itemCooldown[_id] = _cooldown;
	}

	enum ItemIds
	{
		Body_Pillow,
		Chicken_Feather,//TODO: defeat enemies
		//Credit_Card,
		Energy_Drink,
		Face_Mask,
		Full_Meal, //TODO: double heal
		Gorilla_Paw, //TODO: minus crit damage
		//GWS_Pill,
		//Halu,
		//Headphones,
		//Idol_Costume,
		Injection_Type_Asacoco,
		//Just_Bandage,
		Knightly_Milk, //TODO: pickup range
		//Limiter,
		//Membership,
		Nurse_Horn,
		//Piki_Piki_Piman, 
		//Plushie,
		//Sake,
		//Stolen_Piggy_Bank,
		//Study_Glasses,
		//Super_Chatto_Time,
		Uber_Sheep//TODO: More food from enemies
	}
	global.bonuses[0] = 0;
	enum bonusType {
		Damage,
		Critical,
		loseCritical,
		TakeDamage,
		Defense,
		Haste,
		Speed,
		ChickenFeather,
		EnergyDrinkHpMinus,
		Healing,
		weaponSize
	}
#endregion

function populateItems(){
	#region Item Creation
		#region Items
			#region BodyPillow
				createItem(ItemIds.Body_Pillow, "Body Pillow", 1, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to [15] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [5%].");
				createItem(ItemIds.Body_Pillow, "Body Pillow", 2, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to [20] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [10%].");
				createItem(ItemIds.Body_Pillow, "Body Pillow", 3, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to [25] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [15%].");
				createItem(ItemIds.Body_Pillow, "Body Pillow", 4, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to [30] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [20%].");
				createItem(ItemIds.Body_Pillow, "Body Pillow", 5, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to [35] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [25%].");
				Bonuses[bonusType.Defense][ItemIds.Body_Pillow] = 0;
				//super createItem(ItemIds.Body_Pillow, "Body Pillow", 6, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 35 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 25%.")
			#endregion
		
			#region Chicken's Feather
				createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 1, 3, 2, sChickenFeather, 1, "Gain [1] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
				createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 2, 3, 2, sChickenFeather, 1, "Gain [2] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
				createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 3, 3, 2, sChickenFeather, 1, "Gain [3] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
				Bonuses[bonusType.ChickenFeather] = 0;
			#endregion
		
			#region Energy Drink
				createItem(ItemIds.Energy_Drink, "Energy Drink", 1, 3, 3, sEnergyDrink, 1, "Increase Haste by [10%] and SPD by [30%], but reduce Max HP by [20%] as well.")
				createItem(ItemIds.Energy_Drink, "Energy Drink", 2, 3, 3, sEnergyDrink, 1, "Increase Haste by [15%] and SPD by [40%], but reduce Max HP by [20%] as well.")
				createItem(ItemIds.Energy_Drink, "Energy Drink", 3, 3, 3, sEnergyDrink, 1, "Increase Haste by [20%] and SPD by [50%], but reduce Max HP by [20%] as well.")
				Bonuses[bonusType.Haste][ItemIds.Energy_Drink] = 0;
				Bonuses[bonusType.Speed][ItemIds.Energy_Drink] = 0;
				Bonuses[bonusType.EnergyDrinkHpMinus] = 0;
			#endregion
		
			#region Face Mask
				createItem(ItemIds.Face_Mask, "Face Mask", 1, 1, 1, sFaceMask, 1, "Increase ATK by [50%] and Haste by [10%]. Take [30%] more damage.");
				Bonuses[bonusType.Damage][ItemIds.Face_Mask] = 0;
				Bonuses[bonusType.Haste][ItemIds.Face_Mask] = 0;
				Bonuses[bonusType.TakeDamage][ItemIds.Face_Mask] = 0;
			#endregion
		
			#region Full Meal
				createItem(ItemIds.Full_Meal, "Full Meal", 1, 1, 1, sFullMeal, 1, "All healing is doubled.")
				Bonuses[bonusType.Healing][ItemIds.Full_Meal] = 0;
			#endregion
		
			#region Gorilla's Paw
				createItem(ItemIds.Gorilla_Paw, "Gorilla's Paw", 1, 3, 3, sGorillaPaw, 1, "Increase normal attack damage by [30%], but lose [20%] critical chance.");
				createItem(ItemIds.Gorilla_Paw, "Gorilla's Paw", 2, 3, 3, sGorillaPaw, 1, "Increase normal attack damage by [40%], but lose [20%] critical chance.");
				createItem(ItemIds.Gorilla_Paw, "Gorilla's Paw", 3, 3, 3, sGorillaPaw, 1, "Increase normal attack damage by [50%], but lose [20%] critical chance.");
				Bonuses[bonusType.Damage][ItemIds.Gorilla_Paw] = 0;
				Bonuses[bonusType.loseCritical][ItemIds.Gorilla_Paw] = 0;
			#endregion
		
			#region Injection Type Asacoco
				createItem(ItemIds.Injection_Type_Asacoco, "Injection Type Asacoco", 1, 3, 2, sInjectionAsacoco, 1, "Lose [5%] HP every second (until 1 HP remains), but gain [40%] damage. ");
				createItem(ItemIds.Injection_Type_Asacoco, "Injection Type Asacoco", 1, 3, 2, sInjectionAsacoco, 1, "Lose [5%] HP every second (until 1 HP remains), but gain [60%] damage. ");
				createItem(ItemIds.Injection_Type_Asacoco, "Injection Type Asacoco", 1, 3, 2, sInjectionAsacoco, 1, "Lose [5%] HP every second (until 1 HP remains), but gain [80%] damage. ");
				Bonuses[bonusType.Damage][ItemIds.Injection_Type_Asacoco] = 0;
			#endregion
		
			#region Knightly Milk
				createItem(ItemIds.Knightly_Milk, "Knightly Milk", 1, 3, 1, sKnightlyMilk, 1, "Increases attack size of weapons by [10%]. Also increase Pick Up Range by [30%].");
				createItem(ItemIds.Knightly_Milk, "Knightly Milk", 2, 3, 1, sKnightlyMilk, 1, "Increases attack size of weapons by [15%]. Also increase Pick Up Range by [40%].");
				createItem(ItemIds.Knightly_Milk, "Knightly Milk", 3, 3, 1, sKnightlyMilk, 1, "Increases attack size of weapons by [20%]. Also increase Pick Up Range by [50%].");
				Bonuses[bonusType.weaponSize][ItemIds.Knightly_Milk] = 0;
			#endregion
		
			#region Nurse's Horn
				createItem(ItemIds.Nurse_Horn, "Nurse's Horn", 1, 3, 3, sNurseHorn, 1, "When a target is defeated, there is a [30%] chance to heal for [2 HP].");
				createItem(ItemIds.Nurse_Horn, "Nurse's Horn", 2, 3, 3, sNurseHorn, 1, "When a target is defeated, there is a [30%] chance to heal for [4 HP].");
				createItem(ItemIds.Nurse_Horn, "Nurse's Horn", 3, 3, 3, sNurseHorn, 1, "When a target is defeated, there is a [30%] chance to heal for [6 HP].");
			#endregion		
		
			#region UberSheep
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 1, 5 , 4, sUberSheep, 10, "Every [10] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 2, 5 , 4, sUberSheep, 9, "Every [9] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 3, 5 , 4, sUberSheep, 8, "Every [8] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 4, 5 , 4, sUberSheep, 7, "Every [7] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 5, 5 , 4 , sUberSheep, 6, "Every [6] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
			#endregion
		
			#endregion
	#endregion
}

function tickItems()
{
	for (var i = 0; i < array_length(playerItems); ++i) {
		if (playerItems[i] != global.nullitem and global.itemCooldown[playerItems[i][?"id"]] <= 0) {
			defaultItemBehaviour(playerItems[i][?"id"], playerItems[i][?"cooldown"]);
		    switch (playerItems[i][?"id"]) {
				case ItemIds.Body_Pillow:					
					switch (playerItems[i][?"level"]) {
					    case 1:
					        Shield = 15;
							MaxShield = 15;
							Bonuses[bonusType.Defense][ItemIds.Body_Pillow] = 0.95;
					        break;
						case 2:
					        Shield = 20;
							MaxShield = 15;
							Bonuses[bonusType.Defense][ItemIds.Body_Pillow] = 0.90;
					        break;
						case 3:
					        Shield = 25;
							MaxShield = 15;
							Bonuses[bonusType.Defense][ItemIds.Body_Pillow] = 0.85;
					        break;
						case 4:
					        Shield = 30;
							MaxShield = 15;
							Bonuses[bonusType.Defense][ItemIds.Body_Pillow] = 0.80;
					        break;
						case 5:
					        Shield = 35;
							MaxShield = 15;
							Bonuses[bonusType.Defense][ItemIds.Body_Pillow] = 0.75;
					        break;
					    default:
					        // code here
					        break;
					}
					break;
					
				case ItemIds.Chicken_Feather:
					if (playerItems[i][?"level"] != Bonuses[bonusType.ChickenFeather]) {
						Bonuses[bonusType.ChickenFeather] = playerItems[i][?"level"];
						oPlayer.revives +=1 ;
					}
					break;
					
				case ItemIds.Energy_Drink:
					if (Bonuses[bonusType.EnergyDrinkHpMinus] == 0) {
					    Bonuses[bonusType.EnergyDrinkHpMinus] = 1;
						MAXHP = MAXHP * 0.80;
					}
					switch (playerItems[i][?"level"]) {
					    case 1:
					        Bonuses[bonusType.Haste][ItemIds.Energy_Drink] = 1.10;
							Bonuses[bonusType.Speed][ItemIds.Energy_Drink] = 1.30;
					        break;
					    case 2:
					        Bonuses[bonusType.Haste][ItemIds.Energy_Drink] = 1.15;
							Bonuses[bonusType.Speed][ItemIds.Energy_Drink] = 1.40;
					        break;
						case 3:
							Bonuses[bonusType.Haste][ItemIds.Energy_Drink] = 1.20;
							Bonuses[bonusType.Speed][ItemIds.Energy_Drink] = 1.50;
							break;
					}
					break;
					
				case ItemIds.Face_Mask:
					Bonuses[bonusType.Damage][ItemIds.Face_Mask] = 1.50;
					Bonuses[bonusType.Haste][ItemIds.Face_Mask] = 1.10;
					Bonuses[bonusType.TakeDamage][ItemIds.Face_Mask] = 1.30;
					break;
					
				case ItemIds.Full_Meal:
					Bonuses[bonusType.Healing][ItemIds.Full_Meal] = 2;
					break;
				
				case ItemIds.Gorilla_Paw:
					switch (playerItems[i][?"level"]) {
					    case 1:
					        Bonuses[bonusType.Damage][ItemIds.Gorilla_Paw] = 1.30;
							Bonuses[bonusType.loseCritical][ItemIds.Gorilla_Paw] = 0.80;
					        break;
						case 2:
					        Bonuses[bonusType.Damage][ItemIds.Gorilla_Paw] = 1.40;
							Bonuses[bonusType.loseCritical][ItemIds.Gorilla_Paw] = 0.80;
					        break;
						case 3:
					        Bonuses[bonusType.Damage][ItemIds.Gorilla_Paw] = 1.50;
							Bonuses[bonusType.loseCritical][ItemIds.Gorilla_Paw] = 0.80;
					        break;
					}
					break;
					
				case ItemIds.Injection_Type_Asacoco:
					HP = HP - (HP * 0.05); 
					switch (playerItems[i][?"level"]) {
					    case 1:
					        Bonuses[bonusType.Damage][ItemIds.Injection_Type_Asacoco] = 1.40;
					        break;
					    case 2:
					        Bonuses[bonusType.Damage][ItemIds.Injection_Type_Asacoco] = 1.60;
					        break;
						case 3:
					        Bonuses[bonusType.Damage][ItemIds.Injection_Type_Asacoco] = 1.80;
					        break;
					}
					
				case ItemIds.Knightly_Milk:
					switch (playerItems[i][?"level"]) {
					    case 1:
					        Bonuses[bonusType.weaponSize][ItemIds.Knightly_Milk] = 1.10;
					        break;
						case 2:
					        Bonuses[bonusType.weaponSize][ItemIds.Knightly_Milk] = 1.15;
					        break;
						case 3:
					        Bonuses[bonusType.weaponSize][ItemIds.Knightly_Milk] = 1.20;
					        break;
					}
					break;
					
				case ItemIds.Uber_Sheep:
					do{
						random_set_seed(current_time);
						a = irandom_range(-1,1)
						random_set_seed(current_time);
						b = irandom_range(-1,1)
					} until (a != b)
					instance_create_layer(
					oPlayer.x+(128*a),
					oPlayer.y+(128*b),
					"Instances",
					oBurguer
					)
					break;
					
			
			}
		}
	}
}

function defaultItemBehaviour(_id, _cooldown){
	global.itemCooldown[_id] = _cooldown;
}



