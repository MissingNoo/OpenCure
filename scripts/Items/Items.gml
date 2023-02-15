// Feather disable GM2017
#macro playerItems global.items
#macro ItemList global.itemList
global.upgrade=false;
global.items=[0];
global.itemCooldown[0] = 0;
#region Null item
	global.nullitem={};
	var item = global.nullitem;
		variable_struct_set(item, "id", 0);
		variable_struct_set(item, "name", "");
		variable_struct_set(item, "level", 1);
		variable_struct_set(item, "maxlevel", 1);
		variable_struct_set(item, "weight", 1);
		variable_struct_set(item, "thumb", blank);
		variable_struct_set(item, "cooldown", 1);
		variable_struct_set(item, "desc", "null");
		variable_struct_set(item, "unlocked", true);
		variable_struct_set(item, "type", "white");
		variable_struct_set(item, "perk", 0);
		variable_struct_set(item, "style", ItemTypes.Item);
	global.itemList=[0];
#endregion

#region Item Functions
function newCreateItem(_data){
	ItemList[_data.id][0] = global.nullitem;	
	for (var i = 1; i <= _data.maxlevel; ++i) {
		ItemList[_data.id][i] = {};
		var m = ItemList[_data.id][i];		
		variable_struct_set(m, "level", i);
		variable_struct_set(m, "style", ItemTypes.Item);	
		var keys = variable_struct_get_names(_data);
		for (var j = array_length(keys)-1; j >= 0; --j) {
		    var k = keys[j];
		    var v = _data[$ k];
			if (is_array(v)) {
			    if (array_length(v) > 1) {
				    variable_struct_set(m, k, v[i-1]);
				}
				else
				{
					variable_struct_set(m, k, v[0]);
				}
			}else{
				variable_struct_set(m, k, v);
			}
			
		}
		global.itemCooldown[_data.id] = 0;
	}
}
	function createItem(_id, _name, _level, _maxLevel, _weight, _sprite, _cooldown, _desc, _unlocked = true, _type = "yellow", _perk = 0)
	{
		ItemList[_id][0]=global.nullitem;
		ItemList[_id][_level]={};
		var item = ItemList[_id][_level];
		variable_struct_set(item, "id", _id);
		variable_struct_set(item, "name", _name);
		variable_struct_set(item, "level", _level);
		variable_struct_set(item, "maxlevel", _maxLevel);
		variable_struct_set(item, "weight", _weight);
		variable_struct_set(item, "thumb", _sprite);
		variable_struct_set(item, "cooldown", _cooldown);
		variable_struct_set(item, "desc", _desc);
		variable_struct_set(item, "unlocked", _unlocked);
		variable_struct_set(item, "type", _type);
		variable_struct_set(item, "perk", _perk);
		variable_struct_set(item, "style", ItemTypes.Item);
		global.itemCooldown[_id] = _cooldown;
	}

	enum ItemIds
	{
		Body_Pillow, //TODO: convert item format
		Chicken_Feather, //TODO: convert item format
		CreditCard,
		Energy_Drink, //TODO: convert item format
		Face_Mask, //TODO: convert item format
		Full_Meal, //TODO: actually double the heal amount
		Gorilla_Paw, //TODO: lower the crit damage
		//GWS_Pill,
		//Halu,
		Headphones, //TODO: add knockback
		Idol_Costume,
		Injection_Type_Asacoco, //TODO: convert item format
		//Just_Bandage,
		Knightly_Milk, //TODO: convert item format
		//Limiter,
		//Membership,
		NurseHorn, //TODO: convert item format
		//Piki_Piki_Piman, 
		//Plushie,
		//Sake,
		//Stolen_Piggy_Bank,
		Study_Glasses, //TODO: see if the +% is actually accurate
		//Super_Chatto_Time,
		Uber_Sheep//TODO: fix drop chance from enemies and convert item format
	}
	global.bonuses[0] = 0;
	enum BonusType {
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
		weaponSize,
		Bubba,
		UberSheep,
		PickupRange,
		XPBonus,
		AnvilDrop,
		EnhancingCost,
		lenght
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
				Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = 0;
				//super createItem(ItemIds.Body_Pillow, "Body Pillow", 6, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 35 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 25%.")
			#endregion
		
			#region Chicken's Feather
				createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 1, 3, 2, sChickenFeather, 1, "Gain [1] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
				createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 2, 3, 2, sChickenFeather, 1, "Gain [2] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
				createItem(ItemIds.Chicken_Feather, "Chicken's Feather", 3, 3, 2, sChickenFeather, 1, "Gain [3] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ");
				Bonuses[BonusType.ChickenFeather] = 0;
			#endregion
			
			#region Credit Card
			newCreateItem(
			{
				id : ItemIds.CreditCard,
				name : "Credit Card",
				maxlevel : 5,
				weight : 4,
				thumb : sCreditCard,
				cooldown : 1,
				type : "yellow",
				desc : [
				"Cost of enhancing is reduced by [20%] and anvils appear [20%] more often.", 
				"Cost of enhancing is reduced by [25%] and anvils appear [40%] more often.",
				"Cost of enhancing is reduced by [30%] and anvils appear [60%] more often.",
				"Cost of enhancing is reduced by [35%] and anvils appear [80%] more often.",
				"Cost of enhancing is reduced by [40%] and anvils appear [twice] as often.",
				],
				perk : false,
				AnvilDropBonus: [.18, .28, .38, .45, .5],
				EnhancingCost : [20, 25, 30, 35, 40]
			}
			)
			Bonuses[BonusType.AnvilDrop][ItemIds.CreditCard] = 0;
			Bonuses[BonusType.EnhancingCost][ItemIds.CreditCard] = 0;
			#endregion
		
			#region Idol Costume
				newCreateItem({
					id : ItemIds.Idol_Costume,
					name : "Idol Costume",
					maxlevel : 5,
					weight : 1,
					thumb : sIdolCostume,
					cooldown : 1,
					type : "yellow",
					desc : [
					"Reduce Special cooldown by 20%.", 
					"Reduce Special cooldown by 25%.",
					"Reduce Special cooldown by 30%.",
					"Reduce Special cooldown by 35%.",
					"Reduce Special cooldown by 40%.",],
					perk : false,
					SpecialCooldown: [.20, .25, .30, .35, .40],
				}
				);
			#endregion
		
			#region Energy Drink
				createItem(ItemIds.Energy_Drink, "Energy Drink", 1, 3, 3, sEnergyDrink, 1, "Increase Haste by [10%] and SPD by [30%], but reduce Max HP by [20%] as well.")
				createItem(ItemIds.Energy_Drink, "Energy Drink", 2, 3, 3, sEnergyDrink, 1, "Increase Haste by [15%] and SPD by [40%], but reduce Max HP by [20%] as well.")
				createItem(ItemIds.Energy_Drink, "Energy Drink", 3, 3, 3, sEnergyDrink, 1, "Increase Haste by [20%] and SPD by [50%], but reduce Max HP by [20%] as well.")
				Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 0;
				Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 0;
				Bonuses[BonusType.EnergyDrinkHpMinus] = 0;
			#endregion
		
			#region Face Mask
				createItem(ItemIds.Face_Mask, "Face Mask", 1, 1, 1, sFaceMask, 1, "Increase ATK by [50%] and Haste by [10%]. Take [30%] more damage.");
				Bonuses[BonusType.Damage][ItemIds.Face_Mask] = 0;
				Bonuses[BonusType.Haste][ItemIds.Face_Mask] = 0;
				Bonuses[BonusType.TakeDamage][ItemIds.Face_Mask] = 0;
			#endregion
		
			#region Full Meal
				createItem(ItemIds.Full_Meal, "Full Meal", 1, 1, 1, sFullMeal, 1, "All healing is doubled.")
				Bonuses[BonusType.Healing][ItemIds.Full_Meal] = 0;
			#endregion
		
			#region Gorilla's Paw
				createItem(ItemIds.Gorilla_Paw, "Gorilla's Paw", 1, 3, 3, sGorillaPaw, 1, "Increase normal attack damage by [30%], but lose [20%] critical chance.");
				createItem(ItemIds.Gorilla_Paw, "Gorilla's Paw", 2, 3, 3, sGorillaPaw, 1, "Increase normal attack damage by [40%], but lose [20%] critical chance.");
				createItem(ItemIds.Gorilla_Paw, "Gorilla's Paw", 3, 3, 3, sGorillaPaw, 1, "Increase normal attack damage by [50%], but lose [20%] critical chance.");
				Bonuses[BonusType.Damage][ItemIds.Gorilla_Paw] = 0;
				Bonuses[BonusType.loseCritical][ItemIds.Gorilla_Paw] = 0;
			#endregion
			
			#region Headphones
			newCreateItem(
			{
				id : ItemIds.Headphones,
				name : "Headphones",
				maxlevel : 5,
				weight : 4,
				thumb : sHeadPhones,
				cooldown : 1,
				type : "yellow",
				desc : [
				"[15%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[20%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[25%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[30%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[35%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				],
				perk : false,
				dodgeChance: [15, 20, 25, 30, 35]
			}
			)
			#endregion
		
			#region Injection Type Asacoco
				createItem(ItemIds.Injection_Type_Asacoco, "Injection Type Asacoco", 1, 3, 2, sInjectionAsacoco, 1, "Lose [5%] HP every second (until 1 HP remains), but gain [40%] damage. ");
				createItem(ItemIds.Injection_Type_Asacoco, "Injection Type Asacoco", 2, 3, 2, sInjectionAsacoco, 1, "Lose [5%] HP every second (until 1 HP remains), but gain [60%] damage. ");
				createItem(ItemIds.Injection_Type_Asacoco, "Injection Type Asacoco", 3, 3, 2, sInjectionAsacoco, 1, "Lose [5%] HP every second (until 1 HP remains), but gain [80%] damage. ");
				Bonuses[BonusType.Damage][ItemIds.Injection_Type_Asacoco] = 0;
			#endregion
		
			#region Knightly Milk
				createItem(ItemIds.Knightly_Milk, "Knightly Milk", 1, 3, 1, sKnightlyMilk, 1, "Increases attack size of weapons by [10%]. Also increase Pick Up Range by [30%].");
				createItem(ItemIds.Knightly_Milk, "Knightly Milk", 2, 3, 1, sKnightlyMilk, 1, "Increases attack size of weapons by [15%]. Also increase Pick Up Range by [40%].");
				createItem(ItemIds.Knightly_Milk, "Knightly Milk", 3, 3, 1, sKnightlyMilk, 1, "Increases attack size of weapons by [20%]. Also increase Pick Up Range by [50%].");
				Bonuses[BonusType.weaponSize][ItemIds.Knightly_Milk] = 1;
				Bonuses[BonusType.PickupRange][ItemIds.Knightly_Milk] = 0;
			#endregion
		
			#region Nurse's Horn
				createItem(ItemIds.NurseHorn, "Nurse's Horn", 1, 3, 3, sNurseHorn, 1, "When a target is defeated, there is a [30%] chance to heal for [2 HP].");
				createItem(ItemIds.NurseHorn, "Nurse's Horn", 2, 3, 3, sNurseHorn, 1, "When a target is defeated, there is a [30%] chance to heal for [4 HP].");
				createItem(ItemIds.NurseHorn, "Nurse's Horn", 3, 3, 3, sNurseHorn, 1, "When a target is defeated, there is a [30%] chance to heal for [6 HP].");
			#endregion		
			
			#region Study Glasses
			newCreateItem(
			{
				id : ItemIds.Study_Glasses,
				name : "Study Glasses",
				maxlevel : 5,
				weight : 3,
				thumb : sStudyGlasses,
				cooldown : 1,
				type : "yellow",
				desc : [
				"Increase EXP gain by [10%].", 
				"Increase EXP gain by [15%].",
				"Increase EXP gain by [20%].",
				"Increase EXP gain by [25%].",
				"Increase EXP gain by [30%].",
				],
				perk : false,
				XPBonus: [1.10, 1.15, 1.20, 1.25, 1.30]
			}
			)
			Bonuses[BonusType.XPBonus][ItemIds.Study_Glasses] = 0;
			#endregion
		
			#region UberSheep
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 1, 5 , 4, sUberSheep, 10, "Every [10] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 2, 5 , 4, sUberSheep, 9, "Every [9] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 3, 5 , 4, sUberSheep, 8, "Every [8] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 4, 5 , 4, sUberSheep, 7, "Every [7] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				createItem(ItemIds.Uber_Sheep, "Uber Sheep", 5, 5 , 4 , sUberSheep, 6, "Every [6] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%]. ");
				Bonuses[BonusType.UberSheep] = 1;
			#endregion
		
			#endregion
	#endregion
}

function tickItems()
{
	for (var i = 0; i < array_length(playerItems); ++i) {
		if (playerItems[i] != global.nullitem and global.itemCooldown[playerItems[i][$"id"]] <= 0) {
			defaultItemBehaviour(playerItems[i][$"id"], playerItems[i][$"cooldown"]);
		    switch (playerItems[i][$"id"]) {
				case ItemIds.Body_Pillow:{	
					switch (playerItems[i][$"level"]) {
					    case 1:
					        Shield = 15;
							MaxShield = 15;
							Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = 0.95;
					        break;
						case 2:
					        Shield = 20;
							MaxShield = 20;
							Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = 0.90;
					        break;
						case 3:
					        Shield = 25;
							MaxShield = 25;
							Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = 0.85;
					        break;
						case 4:
					        Shield = 30;
							MaxShield = 30;
							Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = 0.80;
					        break;
						case 5:
					        Shield = 35;
							MaxShield = 35;
							Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = 0.75;
					        break;
					    default:
					        // code here
					        break;
					}
					break;}
				case ItemIds.Chicken_Feather:{
					if (playerItems[i][$"level"] != Bonuses[BonusType.ChickenFeather]) {
						Bonuses[BonusType.ChickenFeather] = playerItems[i][$"level"];
						oPlayer.revives +=1 ;
					}
					break;}
				case ItemIds.Energy_Drink:{
					switch (playerItems[i][$"level"]) {
					    case 1:
							if (Bonuses[BonusType.EnergyDrinkHpMinus] == 0) {
							    Bonuses[BonusType.EnergyDrinkHpMinus] = 1;
								MAXHP = MAXHP * 0.80;
							}
					        Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 1.10;
							Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 1.30;
					        break;
					    case 2:
							if (Bonuses[BonusType.EnergyDrinkHpMinus] == 1) {
							    Bonuses[BonusType.EnergyDrinkHpMinus] = 2;
								MAXHP = MAXHP * 0.80;
							}
					        Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 1.15;
							Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 1.40;
					        break;
						case 3:
							if (Bonuses[BonusType.EnergyDrinkHpMinus] == 2) {
							    Bonuses[BonusType.EnergyDrinkHpMinus] = 3;
								MAXHP = MAXHP * 0.80;
							}
							Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 1.20;
							Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 1.50;
							break;
					}
					break;}
				case ItemIds.Face_Mask:{
					Bonuses[BonusType.Damage][ItemIds.Face_Mask] = 1.50;
					Bonuses[BonusType.Haste][ItemIds.Face_Mask] = 1.10;
					Bonuses[BonusType.TakeDamage][ItemIds.Face_Mask] = 1.30;
					break;}
				case ItemIds.Full_Meal:{
					Bonuses[BonusType.Healing][ItemIds.Full_Meal] = 2;
					break;}
				case ItemIds.Gorilla_Paw:{
					switch (playerItems[i][$"level"]) {
					    case 1:
					        Bonuses[BonusType.Damage][ItemIds.Gorilla_Paw] = 1.30;
							Bonuses[BonusType.loseCritical][ItemIds.Gorilla_Paw] = 0.80;
					        break;
						case 2:
					        Bonuses[BonusType.Damage][ItemIds.Gorilla_Paw] = 1.40;
							Bonuses[BonusType.loseCritical][ItemIds.Gorilla_Paw] = 0.80;
					        break;
						case 3:
					        Bonuses[BonusType.Damage][ItemIds.Gorilla_Paw] = 1.50;
							Bonuses[BonusType.loseCritical][ItemIds.Gorilla_Paw] = 0.80;
					        break;
					}
					break;}
				case ItemIds.Injection_Type_Asacoco:{
					HP = HP - (HP * 0.05); 
					switch (playerItems[i][$"level"]) {
					    case 1:
					        Bonuses[BonusType.Damage][ItemIds.Injection_Type_Asacoco] = 1.40;
					        break;
					    case 2:
					        Bonuses[BonusType.Damage][ItemIds.Injection_Type_Asacoco] = 1.60;
					        break;
						case 3:
					        Bonuses[BonusType.Damage][ItemIds.Injection_Type_Asacoco] = 1.80;
					        break;
					}
					break;}
				case ItemIds.Knightly_Milk:{
					switch (playerItems[i][$"level"]) {
					    case 1:
					        Bonuses[BonusType.weaponSize][ItemIds.Knightly_Milk] = 1.10;
							Bonuses[BonusType.PickupRange][ItemIds.Knightly_Milk] = 1.30;
					        break;
						case 2:
					        Bonuses[BonusType.weaponSize][ItemIds.Knightly_Milk] = 1.15;
							Bonuses[BonusType.PickupRange][ItemIds.Knightly_Milk] = 1.40;
					        break;
						case 3:
					        Bonuses[BonusType.weaponSize][ItemIds.Knightly_Milk] = 1.20;
							Bonuses[BonusType.PickupRange][ItemIds.Knightly_Milk] = 1.50;
					        break;
					}
					break;}
				case ItemIds.Uber_Sheep:{ //TODO: fix chance and convert to new itemtype
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
					switch (playerItems[i][$"level"]) {
					    case 1:{
					        Bonuses[BonusType.UberSheep] = 1.10;
					        break;}
					    case 2:{
					        Bonuses[BonusType.UberSheep] = 1.12;
					        break;}
						case 3:{
					        Bonuses[BonusType.UberSheep] = 1.15;
					        break;}
						case 4:{
					        Bonuses[BonusType.UberSheep] = 1.18;
					        break;}
						case 5:{
					        Bonuses[BonusType.UberSheep] = 1.20;
					        break;}
					}
					break;}
				case ItemIds.Study_Glasses:{
					Bonuses[BonusType.XPBonus][ItemIds.Study_Glasses] = playerItems[i][$"XPBonus"];
					//show_message(string(playerItems[i][$"XPBonus"]));
					break;}
				case ItemIds.CreditCard:{
					Bonuses[BonusType.AnvilDrop][ItemIds.CreditCard] = playerItems[i][$"AnvilDropBonus"];
					Bonuses[BonusType.EnhancingCost][ItemIds.CreditCard] = playerItems[i][$"EnhancingCost"];
					break;}
				case ItemIds.Idol_Costume:{
					if (oPlayer.idolCostumeLevel != playerItems[i][$"level"]) {
					    oPlayer.idolCostumeLevel = playerItems[i][$"level"];
						oPlayer. specialcooldown = oPlayer.specialcooldown - (oPlayer.specialcooldown * playerItems[i][$"SpecialCooldown"]);
					}
					break;}
			}
		}
	}
}

function defaultItemBehaviour(_id, _cooldown){
	global.itemCooldown[_id] = _cooldown;
}




