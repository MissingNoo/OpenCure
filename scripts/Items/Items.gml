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
			createItem(ItemIds.Body_Pillow, "Body Pillow", 1, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 15 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 5%.")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 2, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 20 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 10%.")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 3, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 25 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 15%.")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 4, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 30 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 20%.")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 5, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 35 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 25%.")
			createItem(ItemIds.Body_Pillow, "Body Pillow", 5, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 35 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 25%.")
		#endregion
		
	#endregion

#endregion

function tickItems()
{
	for (var i = 0; i < array_length(playerItems); ++i) {
		if (playerItems[i] != global.nullitem and global.itemCooldown[playerItems[i][?"id"]] <= 0) {
		    switch (playerItems[i]) {
			    default:
					defaultItemBehaviour(playerItems[i][?"id"], playerItems[i][?"cooldown"]);
			        break;
			}
		}
	}
}

function defaultItemBehaviour(_id, _cooldown)
{
	//global.itemCooldown[playerItems[i][?"id"]] = playerItems[i][?"cooldown"];
	global.itemCooldown[_id] = _cooldown;
}
