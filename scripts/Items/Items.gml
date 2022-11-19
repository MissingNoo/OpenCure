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

	function createItem(_id, _name, _level, _maxLevel, _weight, _sprite, _cooldown, _desc, _unlocked = true, _type = "white", _perk = 0)
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
		ds_map_add(item, "type", _type);
		ds_map_add(item, "perk", _perk);
		ds_map_add(item, "desc", _desc);
		ds_map_add(item, "unlocked", _unlocked);
		ds_map_add(item, "style", "item");
		ds_map_add(item, "cooldown", _cooldown);
		global.itemCooldown[_id] = _cooldown;
	}

	enum ItemIds
	{
		Body_Pillow,
		Chicken_Feather,
		Credit_Card,
		Energy_Drink,
		Face_Mask,
		Full_Meal,
		Gorilla_Paw,
		GWS_Pill,
		Halu,
		Headphones,
		Idol_Costume,
		Injection_Type_Asacoco,
		Just_Bandage,
		Knightly_Milk,
		Limiter,
		Membership,
		Nurse_Horn,
		Piki_Piki_Piman,
		Plushie,
		Sake,
		Stolen_Piggy_Bank,
		Study_Glasses,
		Super_Chatto_Time,
		Uber_Sheep
	}
	global.bonuses[0] = 0;
	enum bonusType {
		Damage,
		Defense,
		Haste,
		Speed,
		ChickenFeather,
		EnergyDrinkHpMinus
	}
	
	enum bonusName {
		BodyPillow,
		EnergyDrink
	}
#endregion

#region Item Creation
	#region Character Perks
		#region Amelia Perks
			#region 			
			#endregion
		#endregion
	
		#region Gura Perks
			#region 
			
			#endregion
		#endregion
	
		#region Ina Perks
			#region 
			
			#endregion
		#endregion
	#endregion
	#region Items
		#region BodyPillow
			createItem(ItemIds.Body_Pillow, "Body Pillow", 1, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 15 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 5%.",,"yellow")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 2, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 20 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 10%.",,"yellow")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 3, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 25 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 15%.",,"yellow")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 4, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 30 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 20%.",,"yellow")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 5, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 35 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 25%.",,"yellow")
			Bonuses[bonusType.Defense][bonusName.BodyPillow] = 1;
			//super createItem(ItemIds.Body_Pillow, "Body Pillow", 6, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 35 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 25%.")
		#endregion
		
		#region Chicken's Feather
			createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 1, 3, 2, sChickenFeather, 1, "Gain 1 revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
			createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 2, 3, 2, sChickenFeather, 1, "Gain 2 revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
			createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 3, 3, 2, sChickenFeather, 1, "Gain 3 revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
			Bonuses[bonusType.ChickenFeather] = 0;
		#endregion
		
		#region EnergyDrink
			createItem(ItemIds.Energy_Drink, "Energy Drink", 1, 3, 3, sEnergyDrink, 1, "Increase Haste by 10% and SPD by 30%, but reduce Max HP by 20% as well.")
			createItem(ItemIds.Energy_Drink, "Energy Drink", 2, 3, 3, sEnergyDrink, 1, "Increase Haste by 15% and SPD by 40%, but reduce Max HP by 20% as well.")
			createItem(ItemIds.Energy_Drink, "Energy Drink", 3, 3, 3, sEnergyDrink, 1, "Increase Haste by 20% and SPD by 50%, but reduce Max HP by 20% as well.")
			Bonuses[bonusType.Haste][bonusName.EnergyDrink] = 1;
			Bonuses[bonusType.Speed][bonusName.EnergyDrink] = 1;
			Bonuses[bonusType.EnergyDrinkHpMinus] = 0;
		#endregion
		
	#endregion

#endregion

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
							Bonuses[bonusType.Defense][bonusName.BodyPillow] = 0.95;
					        break;
						case 2:
					        Shield = 20;
							MaxShield = 15;
							Bonuses[bonusType.Defense][bonusName.BodyPillow] = 0.90;
					        break;
						case 3:
					        Shield = 25;
							MaxShield = 15;
							Bonuses[bonusType.Defense][bonusName.BodyPillow] = 0.85;
					        break;
						case 4:
					        Shield = 30;
							MaxShield = 15;
							Bonuses[bonusType.Defense][bonusName.BodyPillow] = 0.80;
					        break;
						case 5:
					        Shield = 35;
							MaxShield = 15;
							Bonuses[bonusType.Defense][bonusName.BodyPillow] = 0.75;
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
					        Bonuses[bonusType.Haste][bonusName.EnergyDrink] = 1.10;
							Bonuses[bonusType.Speed][bonusName.EnergyDrink] = 1.30;
					        break;
					    case 2:
					        Bonuses[bonusType.Haste][bonusName.EnergyDrink] = 1.15;
							Bonuses[bonusType.Speed][bonusName.EnergyDrink] = 1.40;
					        break;
						case 3:
							Bonuses[bonusType.Haste][bonusName.EnergyDrink] = 1.20;
							Bonuses[bonusType.Speed][bonusName.EnergyDrink] = 1.50;
							break;
					}
					
					break;
			}
		}
	}
}

function defaultItemBehaviour(_id, _cooldown)
{
	global.itemCooldown[_id] = _cooldown;
}

