// Feather disable GM2017
#macro playerItems global.items
#macro ItemList global.itemList
global.upgrade=false;
global.items=[0];
global.itemCooldown[0] = 0;
#region Null item
	global.nullitem={};
	var item = global.nullitem;
		variable_struct_set(item, "id", -1);
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
		//variable_struct_set(m, "desc", lexicon_text("Items." + _data.name + "." + string(i)));
		variable_struct_set(m, "style", ItemTypes.Item);
		variable_struct_set(m, "type", "yellow");
		var keys = variable_struct_get_names(_data);
		for (var j = array_length(keys)-1; j >= 0; --j) {
		    var k = keys[j];
			if (k == "bonusType") { 
				variable_struct_set(m, "bonusType", _data.bonusType);
			}
			else if (k == "bonusValue"){
				variable_struct_set(m, "bonusValue", _data.bonusValue);
			}
			else{
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
		}
		if (variable_struct_exists(_data, "bonusType") and variable_struct_exists(_data, "bonusValue")) {
		    
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

	enum ItemIds{
		BlacksmithsGear, //TODO: enhancement
		Body_Pillow,
		Chicken_Feather,
		CreditCard,
		Energy_Drink,
		Face_Mask,
		Full_Meal,
		Gorilla_Paw, //TODO: lower the crit damage
		GWS_Pill, //TODO: add crit effects
		Halu,//TODO: add all effects
		Headphones, //TODO: add knockback
		Idol_Costume,
		Injection_Type_Asacoco,
		Just_Bandage, //TODO: add all effects
		Knightly_Milk,
		Limiter,
		Membership, //TODO: add all effects
		NurseHorn,
		Piki_Piki_Piman,
		Plushie, //TODO: add all effects
		Sake, //TODO: add all effects
		Stolen_Piggy_Bank,
		Study_Glasses, 
		Super_Chatto_Time,
		Uber_Sheep,
		Holocoin,
		Hamburguer,
	}
	global.bonuses[0] = 0;
	enum BonusType{
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
		WeaponSize,
		Bubba,
		UberSheep,
		PickupRange,
		XPBonus,
		AnvilDrop,
		EnhancingCost,
		SuperChattoTime,
		lenght
	}
#endregion

function populateItems(){
	#region Item Creation
		#region Items
			newCreateItem({//Blacksmith's Gear
				id : ItemIds.BlacksmithsGear,
				name : "Blacksmith's Gear",
				maxlevel : 3,
				weight : 1,
				thumb : sBlacksmithGear,
				cooldown : 1,
				perk : false,
			});
			#region BodyPillow
			newCreateItem({
				id : ItemIds.Body_Pillow,
				name : "Body Pillow",
				maxlevel : 5,
				weight : 3,
				thumb : sBodyPillow,
				cooldown : 15,
				perk : false,
				bonusType : BonusType.Defense,
				bonusValue : [0.95, 0.90, 0.85, 0.80, 0.75],
				shield : [15, 20, 25, 30, 35],				
			});			
				Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = 0;
				//super createItem(ItemIds.Body_Pillow, "Body Pillow", 6, 5, 3, sBodyPillow, 15, "Gain a shield that absorbs up to 35 damage. Every 15 seconds, this shield refreshes. Also reduces damage taken by 25%.")
			#endregion
			
			#region Holocoin
			
			newCreateItem({
				id : ItemIds.Holocoin,
				name : "Holocoin",
				maxlevel : 1,
				weight : 0,
				thumb : sHolocoin,
				cooldown : 15,
				desc : [
				"Gain 50 Holocoins.",
				],
				perk : true,
				characterid : 99,
			});
			#endregion
			
			#region Hamburger
			newCreateItem({
				id : ItemIds.Hamburguer,
				name : "Hamburguer",
				maxlevel : 1,
				weight : 0,
				thumb : sHamburger,
				cooldown : 15,
				desc : [
				"Recover 10 Health.",
				],
				perk : true,
				characterid : 99,
			});
			#endregion
		
			#region Chicken's Feather
			newCreateItem({
				id : ItemIds.Chicken_Feather,
				name : "Chicken's Feather",
				maxlevel : 3,
				weight : 2,
				thumb : sChickenFeather,
				cooldown : 1,
				perk : false});				
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
				perk : false,
				bonusType : [BonusType.AnvilDrop, BonusType.EnhancingCost],
				bonusValue : [[.18, .28, .38, .45, .5], [20, 25, 30, 35, 40]],
			}
			);
			Bonuses[BonusType.AnvilDrop][ItemIds.CreditCard] = 0;
			Bonuses[BonusType.EnhancingCost][ItemIds.CreditCard] = 0;
			#endregion
		
			#region GWS Pill 
			newCreateItem({
				id : ItemIds.GWS_Pill,
				name : "GWS Pill",
				maxlevel : 3,
				weight : 2,
				thumb : sGWSPill,
				cooldown : 1,
				crit : [1.15, 1.20, 1.25],
				perk : false});
			#endregion
			
			#region Just Bandage //TODO
			newCreateItem({
				id : ItemIds.Just_Bandage,
				name : "Just Bandage",
				maxlevel : 3,
				weight : 4,
				thumb : sJustBandage,
				cooldown : 1,
				perk : false});
			#endregion
			
			#region Limiter
			newCreateItem({
				id : ItemIds.Limiter,
				name : "Limiter",
				maxlevel : 3,
				weight : 4,
				thumb : sLimiter,
				cooldown : 1,
				bonusType : BonusType.PickupRange,
				bonusValue : [2, 3, 4],
				perk : false});
				Bonuses[BonusType.PickupRange][ItemIds.Limiter] = 0;
			#endregion
			
			#region Super Chatto Time
			newCreateItem({
				id : ItemIds.Super_Chatto_Time,
				name : "Super Chatto Time",
				maxlevel : 5,
				weight : 2,
				thumb : sSuperChattoTime,
				cooldown : 1,
				perk : false,
				bonusType : BonusType.SuperChattoTime,
				bonusValue : [1.20, 1.40, 1.60, 1.80, 2]
			});
			Bonuses[BonusType.SuperChattoTime] = 0;
			#endregion
			
			#region Stolen Piggy Bank
			newCreateItem({
				id : ItemIds.Stolen_Piggy_Bank,
				name : "Stolen Piggy Bank",
				maxlevel : 1,
				weight : 2,
				thumb : sStolenPiggyBank,
				cooldown : 1,
				perk : false});
			#endregion
		
			#region Sake
			newCreateItem({
				id : ItemIds.Sake,
				name : "Sake",
				maxlevel : 3,
				weight : 4,
				thumb : sSake,
				cooldown : 1,
				perk : false});
			#endregion
			
			#region Plushie
			newCreateItem({
				id : ItemIds.Plushie,
				name : "Plushie",
				maxlevel : 3,
				weight : 3,
				thumb : sPlushie,
				cooldown : 1,
				perk : false});
			#endregion
			
			#region Piki Piki Piman
			newCreateItem({
				id : ItemIds.Piki_Piki_Piman,
				name : "Piki Piki Piman",
				maxlevel : 3,
				weight : 4,
				thumb : sPikiPikiPiman,
				cooldown : 0.2,
				bonus : [15, 20, 25],
				bonusPercentage: [2, 3, 4],
				perk : false});
			#endregion
			
			#region Membership
			newCreateItem({
				id : ItemIds.Membership,
				name : "Membership",
				maxlevel : 3,
				weight : 3,
				thumb : sMembership,
				cooldown : 1,
				bonusType : [BonusType.Damage, BonusType.Defense],
				bonusValue : [[1.30, 1.40, 1.50], [0.90, 0.82, 0.75]],
				perk : false});
			#endregion
			
			#region Halu 
			newCreateItem({
				id : ItemIds.Halu,
				name : "Halu",
				maxlevel : 5,
				weight : 3,
				thumb : sHalu,
				cooldown : 1,
				perk : false});
				/*
				Each upgrade adds 2 to the enemy spawn rate, resulting in an increase in the effective spawn rate of new enemies by between 15% to 70% of the base spawn rate at most times, depending on how long the player is into the game. Each upgrade also buffs the HP, ATK, and SPD of each enemy by 10%/15%/20%/25%/30% (incorrect tooltip), depending on the upgrade level. When Halu is selected or upgraded, the buff is immediately applied to future spawns and all enemies on screen that have not been damaged.
				HoloCoin bonus only affects enemies that were defeated after Halu was first selected; however, the number of coins gained is applied retroactively to this total using the coin per kill rate of the item's upgrade level when the stage ends. Although not listed in the item description, level 4 grants the player 1 HoloCoin for every 2 targets defeated since taking the item, and level 5 gains 1 HoloCoin for every target defeated since taking the item. The amount of coins gained from Halu is only affected by the stage coin multiplier. 
				*/
			#endregion
		
			#region Idol Costume
				newCreateItem({
					id : ItemIds.Idol_Costume,
					name : "Idol Costume",
					maxlevel : 5,
					weight : 1,
					thumb : sIdolCostume,
					cooldown : 1,
					perk : false,
					SpecialCooldown: [.20, .25, .30, .35, .40],
				}
				);
			#endregion
		
			#region Energy Drink
			newCreateItem({
				id : ItemIds.Energy_Drink,
				name : "Energy Drink",
				maxlevel : 3,
				weight : 3,
				thumb : sEnergyDrink,
				cooldown : 1,
				bonusType : [BonusType.Haste, BonusType.Speed],
				bonusValue : [[1.10, 1.15, 1.20], [1.30, 1.40, 1.50]],
				perk : false});
				Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 0;
				Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 0;
				Bonuses[BonusType.EnergyDrinkHpMinus] = 0;
			#endregion
		
			#region Face Mask
			newCreateItem({
				id : ItemIds.Face_Mask,
				name : "Face Mask",
				maxlevel : 1,
				weight : 1,
				thumb : sFaceMask,
				cooldown : 1,
				bonusType : [BonusType.Damage, BonusType.Haste, BonusType.TakeDamage],
				bonusValue : [[1.3],[1.1],[1.3]],
				perk : false});
				Bonuses[BonusType.Damage][ItemIds.Face_Mask] = 0;
				Bonuses[BonusType.Haste][ItemIds.Face_Mask] = 0;
				Bonuses[BonusType.TakeDamage][ItemIds.Face_Mask] = 0;
			#endregion
		
			#region Full Meal
			newCreateItem({
				id : ItemIds.Full_Meal,
				name : "Full Meal",
				maxlevel : 1,
				weight : 1,
				thumb : sFullMeal,
				cooldown : 1,
				perk : false});
				Bonuses[BonusType.Healing][ItemIds.Full_Meal] = 1;
			#endregion
		
			#region Gorilla's Paw
			newCreateItem({
				id : ItemIds.Gorilla_Paw,
				name : "Gorilla's Paw",
				maxlevel : 3,
				weight : 3,
				thumb : sGorillaPaw,
				cooldown : 1,				
				perk : false,
				bonusType : [BonusType.Damage, BonusType.loseCritical],
				bonusValue : [[1.30, 1.40, 1.50], [0.8, 0.8, 0.8]]
			});
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
				perk : false,
				dodgeChance: [15, 20, 25, 30, 35]
			});
			#endregion
		
			#region Injection Type Asacoco
			newCreateItem({
				id : ItemIds.Injection_Type_Asacoco,
				name : "Injection Type Asacoco",
				maxlevel : 3,
				weight : 2,
				thumb : sInjectionAsacoco,
				cooldown : 1,
				perk : false,
				bonusType : BonusType.Damage,
				bonusValue : [1.40, 1.60, 1.80],
			});
				Bonuses[BonusType.Damage][ItemIds.Injection_Type_Asacoco] = 0;
			#endregion
		
			#region Knightly Milk
			newCreateItem({
				id : ItemIds.Knightly_Milk,
				name : "Knightly Milk",
				maxlevel : 3,
				weight : 1,
				thumb : sKnightlyMilk,
				cooldown : 1,
				perk : false,
				bonusType : [BonusType.WeaponSize, BonusType.PickupRange],
				bonusValue : [[1.10, 1.15, 1.20], [1.30, 1.40, 1.50]],
			});				
				Bonuses[BonusType.WeaponSize][ItemIds.Knightly_Milk] = 1;
				Bonuses[BonusType.PickupRange][ItemIds.Knightly_Milk] = 0;
			#endregion
		
			#region Nurse's Horn
			newCreateItem({
				id : ItemIds.NurseHorn,
				name : "Nurse's Horn",
				maxlevel : 3,
				weight : 3,
				thumb : sNurseHorn,
				cooldown : 1,
				perk : false});
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
				perk : false,
				bonusType : BonusType.XPBonus,
				bonusValue : [1.10, 1.15, 1.20, 1.25, 1.30]
			}
			);
			Bonuses[BonusType.XPBonus][ItemIds.Study_Glasses] = 0;
			#endregion
		
			#region UberSheep
			newCreateItem({
				id : ItemIds.Uber_Sheep,
				name : "Uber Sheep",
				maxlevel : 5,
				weight : 4,
				thumb : sUberSheep,
				cooldown : [10, 9, 8, 7, 6],
				perk : false,
				bonusType : BonusType.UberSheep,
				bonusValue : [1.10, 1.12, 1.15, 1.18, 1.20],
			});
				Bonuses[BonusType.UberSheep][ItemIds.Uber_Sheep] = 1;
			#endregion
		
			#endregion
	#endregion
}

function tickItems(){
	for (var i = 0; i < array_length(playerItems); ++i) {
		if (playerItems[i] != global.nullitem and global.itemCooldown[playerItems[i][$"id"]] <= 0) {
			defaultItemBehaviour(playerItems[i][$"id"], playerItems[i][$"cooldown"]);
			if (variable_struct_exists(playerItems[i], "bonusType")) {
				if (is_array(playerItems[i][$"bonusType"])) {
					for (var j = 0; j < array_length(playerItems[i][$"bonusType"]); ++j) {
					    Bonuses[playerItems[i][$"bonusType"][j]][playerItems[i][$"id"]] = playerItems[i][$"bonusValue"][j][playerItems[i][$"level"] -1];
					}				    
				}
				else{
					Bonuses[playerItems[i][$"bonusType"]][playerItems[i][$"id"]] = playerItems[i][$"bonusValue"][playerItems[i][$"level"] -1];
				}			    
			}
		    switch (playerItems[i][$"id"]) {
				case ItemIds.Body_Pillow:{
					Shield = playerItems[i][$"shield"];
					MaxShield = playerItems[i][$"shield"];
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
					        //Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 1.10;
							//Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 1.30;
					        break;
					    case 2:
							if (Bonuses[BonusType.EnergyDrinkHpMinus] == 1) {
							    Bonuses[BonusType.EnergyDrinkHpMinus] = 2;
								MAXHP = MAXHP * 0.80;
							}
					        //Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 1.15;
							//Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 1.40;
					        break;
						case 3:
							if (Bonuses[BonusType.EnergyDrinkHpMinus] == 2) {
							    Bonuses[BonusType.EnergyDrinkHpMinus] = 3;
								MAXHP = MAXHP * 0.80;
							}
							//Bonuses[BonusType.Haste][ItemIds.Energy_Drink] = 1.20;
							//Bonuses[BonusType.Speed][ItemIds.Energy_Drink] = 1.50;
							break;
					}
					break;}
				case ItemIds.Injection_Type_Asacoco:{
					HP = HP - (HP * 0.05);
					break;}
				case ItemIds.Uber_Sheep:{
					do{
						a = irandom_range(-1,1);
						b = irandom_range(-1,1);
					} until (a != b)
					instance_create_layer(
					oPlayer.x+ (irandom_range(64,128) *a),
					oPlayer.y+(irandom_range(64,128)*b),
					"Instances",
					oBurguer
					);
					break;}
				case ItemIds.Idol_Costume:{
					if (oPlayer.idolCostumeLevel != playerItems[i][$"level"]) {
					    oPlayer.idolCostumeLevel = playerItems[i][$"level"];
						oPlayer.specialcooldown = oPlayer.specialcooldown - (oPlayer.specialcooldown * playerItems[i][$"SpecialCooldown"]);
					}
					break;}
				case ItemIds.Stolen_Piggy_Bank:{
					if(variable_global_exists("pig") and time_source_exists(global.pig)) {break;}
					global.pigfunction = function()
					{
					    global.newcoins += 1;
					}
					global.pig = time_source_create(time_source_game, 1, time_source_units_seconds,global.pigfunction, [], -1, time_source_expire_after);
					time_source_start(global.pig);
					break;}
				case ItemIds.Piki_Piki_Piman:{
					if (oPlayer.pimanLevel != playerItems[i][$"level"]) {
					    oPlayer.pimanLevel = playerItems[i][$"level"];
					    oPlayer.pimanBonus = playerItems[i][$"bonusPercentage"];
						MAXHP += playerItems[i][$"bonus"];
					}
					pimanUsable = true;
					break;}
				case ItemIds.Membership:{
					if (global.newcoins > 0) {
					    global.newcoins -= 3;
						Bonuses[BonusType.Damage][ItemIds.Membership] = playerItems[i][$"bonusATK"];
						Bonuses[BonusType.TakeDamage][ItemIds.Membership] = playerItems[i][$"bonusLessDamage"];
					}
					if (global.newcoins <= 0) {
					    global.newcoins = 0;
						Bonuses[BonusType.Damage][ItemIds.Membership] = 1;
						Bonuses[BonusType.TakeDamage][ItemIds.Membership] = 1;
					}		
					break;}
				case ItemIds.GWS_Pill:{
					if (oPlayer.skilltimer < oPlayer.specialcooldown) {
					    Bonuses[BonusType.Critical][ItemIds.GWS_Pill] = playerItems[i][$"crit"];
					}
					else{
						Bonuses[BonusType.Critical][ItemIds.GWS_Pill] = 0;
					}
					break;}
				case ItemIds.BlacksmithsGear:{
					oPlayer.blacksmithLevel = playerItems[i][$"level"];
					break;}
			}
		}
	}
}

function defaultItemBehaviour(_id, _cooldown){
	global.itemCooldown[_id] = _cooldown;
}




