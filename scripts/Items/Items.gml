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
		variable_struct_set(m, "type", "yellow");
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

	enum ItemIds{
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
		Piki_Piki_Piman, //TODO: add all effects
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
			#region BodyPillow
			newCreateItem({
				id : ItemIds.Body_Pillow,
				name : "Body Pillow",
				maxlevel : 5,
				weight : 3,
				thumb : sBodyPillow,
				cooldown : 15,
				desc : [
				"Gain a shield that absorbs up to [15] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [5%]."  ,
				"Gain a shield that absorbs up to [20] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [10%].",
				"Gain a shield that absorbs up to [25] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [15%].",
				"Gain a shield that absorbs up to [30] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [20%].",
				"Gain a shield that absorbs up to [35] damage. Every [15] seconds, this shield refreshes. Also reduces damage taken by [25%].",
				],
				perk : false,
				shield : [15, 20, 25, 30, 35],
				bonus : [0.95, 0.90, 0.85, 0.80, 0.75],
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
				desc : [
				"Gain [1] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ",
				"Gain [2] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ",
				"Gain [3] revive. When you reach 0 HP, you automatically recover 50% HP and all current targets except bosses will be defeated. ",
				],
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
				desc : [
				"While the Special meter is still charging, increase crit by 15%.", 
				"While the Special meter is still charging, increase crit by 20%.", 
				"While the Special meter is still charging, increase crit by 25%."],
				perk : false});
			#endregion
			
			#region Just Bandage 
			newCreateItem({
				id : ItemIds.Just_Bandage,
				name : "Just Bandage",
				maxlevel : 3,
				weight : 4,
				thumb : sJustBandage,
				cooldown : 1,
				desc : [
				"Increase Max HP by 10. After being hit, heal 10% HP every 3 seconds until 80% of the damage taken is recovered (recovers minimum 1 HP).",
				"Increase Max HP by 20. After being hit, heal 10% HP every 3 seconds until 90% of the damage taken is recovered (recovers minimum 1 HP).",
				"Increase Max HP by 30. After being hit, heal 10% HP every 3 seconds until 100% of the damage taken is recovered (recovers minimum 1 HP).", 
				],
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
				desc : [
				"Gain 100% Pick Up Range. ",
				"Gain 200% Pick Up Range. ",
				"Gain 300% Pick Up Range. ",				
				],
				bonus : [2, 3, 4],
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
				desc : [
				"Targets drop 20% more HoloCoins. All HoloCoins are picked automatically.",
				"Targets drop 40% more HoloCoins. All HoloCoins are picked automatically.",
				"Targets drop 60% more HoloCoins. All HoloCoins are picked automatically.",
				"Targets drop 80% more HoloCoins. All HoloCoins are picked automatically.",
				"Targets drop 100% more HoloCoins. All HoloCoins are picked automatically.",
				],
				perk : false,
				bonus : [1.20, 1.40, 1.60, 1.80, 2]
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
				desc : [
				"Gain 1 coin for every 100px traveled and increase SPD by 20%. However, reduce Pick Up Range by 30%.",
				"Gain 1 coin for every 75px traveled and increase SPD by 30%. However, reduce Pick Up Range by 30%.",
				"Gain 1 coin for every 50px traveled and increase SPD by 40%. However, reduce Pick Up Range by 30%.",
				],
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
				desc : [
				"Gain 1% crit buff every second up to 10%. If taking damage by a target, lose half the buff. If eating food, +5% crit for 10 seconds.",
				"Gain 1% crit buff every second up to 15%. If taking damage by a target, lose half the buff. If eating food, +5% crit for 10 seconds.",
				"Gain 1% crit buff every second up to 20%. If taking damage by a target, lose half the buff. If eating food, +5% crit for 10 seconds.",
				],
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
				desc : [
				"Delays taken damage. On any hit by a target, take only [30%] of the damage initially, then take the remaining damage gradually.",
				"Delays taken damage. On any hit by a target, take only [20%] of the damage initially, then take the remaining damage gradually.",
				"Delays taken damage. On any hit by a target, take only [10%] of the damage initially, then take the remaining damage gradually.",
				],
				perk : false});
			#endregion
			
			#region Piki Piki Piman
			newCreateItem({
				id : ItemIds.Piki_Piki_Piman,
				name : "Piki Piki Piman",
				maxlevel : 3,
				weight : 4,
				thumb : sPikiPikiPiman,
				cooldown : 1,
				desc : [
				"Gain 15 Max HP. After receiving damage, increase the special meter by 2%. There is a 0.2 second cooldown.",
				"Gain 20 Max HP. After receiving damage, increase the special meter by 3%. There is a 0.2 second cooldown.",
				"Gain 25 Max HP. After receiving damage, increase the special meter by 4%. There is a 0.2 second cooldown.",
				],
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
				desc : [
				"Lose 3 Holo Coins per second. If Holo Coins is more than 0, increase damage by 30% and take 10% less damage.",
				"Lose 3 Holo Coins per second. If Holo Coins is more than 0, increase damage by 40% and take 18% less damage.",
				"Lose 3 Holo Coins per second. If Holo Coins is more than 0, increase damage by 50% and take 25% less damage.",
				],
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
				desc : [
				"Increase regular fan spawns, and fans become 5% stronger. Gain 1 HoloCoin for every 5 targets defeated since taking this item.",
				"Increase regular fan spawns more, and fans become 15% stronger. Gain 1 HoloCoin for every 4 targets defeated since taking this item.",
				"Increase regular fan spawns further, and fans become 25% stronger. Gain 1 HoloCoin for every 3 targets defeated since taking this item.",
				"Increase regular fan spawns even further beyond, and fans become 33% stronger. Are you sure about this?",
				"Don't do it. ",
				],
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
			newCreateItem({
				id : ItemIds.Energy_Drink,
				name : "Energy Drink",
				maxlevel : 3,
				weight : 3,
				thumb : sEnergyDrink,
				cooldown : 1,
				desc : [
				"Increase Haste by [10%] and SPD by [30%], but reduce Max HP by [20%] as well.",
				"Increase Haste by [15%] and SPD by [40%], but reduce Max HP by [20%] as well.",
				"Increase Haste by [20%] and SPD by [50%], but reduce Max HP by [20%] as well.",
				],
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
				desc : [
				"Increase ATK by [50%] and Haste by [10%]. Take [30%] more damage."
				],
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
				desc : [
				"All healing is doubled."
				],
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
				desc : [
				"Increase normal attack damage by [30%], but lose [20%] critical chance.",
				"Increase normal attack damage by [40%], but lose [20%] critical chance.",
				"Increase normal attack damage by [50%], but lose [20%] critical chance.",
				],
				perk : false,
				damageBonus : [1.30, 1.40, 1.50],
				loseCritical : 0.80,
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
				
				desc : [
				"[15%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[20%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[25%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[30%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				"[35%] chance to negate [1] hit, and create a shockwave that knocks back all targets.", 
				],
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
				desc : [
				"Lose [5%] HP every second (until 1 HP remains), but gain [40%] damage.",
				"Lose [5%] HP every second (until 1 HP remains), but gain [60%] damage.",
				"Lose [5%] HP every second (until 1 HP remains), but gain [80%] damage.",
				],
				perk : false,
				bonus : [1.40, 1.60, 1.80],
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
				desc : [
				"Increases attack size of weapons by [10%]. Also increase Pick Up Range by [30%].",
				"Increases attack size of weapons by [15%]. Also increase Pick Up Range by [40%].",
				"Increases attack size of weapons by [20%]. Also increase Pick Up Range by [50%].",
				],
				perk : false,
				weaponSize : [1.10, 1.15, 1.20],
				pickupRange : [1.30, 1.40, 1.50],
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
				desc : [
				"When a target is defeated, there is a [30%] chance to heal for [2 HP].",
				"When a target is defeated, there is a [30%] chance to heal for [4 HP].",
				"When a target is defeated, there is a [30%] chance to heal for [6 HP].",
				],
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
				desc : [
				"Every [10] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%].",
				"Every [9] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%].",
				"Every [8] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%].",
				"Every [7] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%].",
				"Every [6] seconds, food will drop close by. Also increase food drop chance from defeated targets by [10%].",
				],
				perk : false,
				bonus : [1.10, 1.12, 1.15, 1.18, 1.20],
			});
				Bonuses[BonusType.UberSheep] = 1;
			#endregion
		
			#endregion
	#endregion
}

function tickItems(){
	for (var i = 0; i < array_length(playerItems); ++i) {
		if (playerItems[i] != global.nullitem and global.itemCooldown[playerItems[i][$"id"]] <= 0) {
			defaultItemBehaviour(playerItems[i][$"id"], playerItems[i][$"cooldown"]);
		    switch (playerItems[i][$"id"]) {
				case ItemIds.Body_Pillow:
					Shield = playerItems[i][$"shield"];
					MaxShield = playerItems[i][$"shield"];
					Bonuses[BonusType.Defense][ItemIds.Body_Pillow] = playerItems[i][$"bonus"];
					break;
				case ItemIds.Chicken_Feather:
					if (playerItems[i][$"level"] != Bonuses[BonusType.ChickenFeather]) {
						Bonuses[BonusType.ChickenFeather] = playerItems[i][$"level"];
						oPlayer.revives +=1 ;
					}
					break;
				case ItemIds.Energy_Drink:
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
					break;
				case ItemIds.Face_Mask:
					Bonuses[BonusType.Damage][ItemIds.Face_Mask] = 1.50;
					Bonuses[BonusType.Haste][ItemIds.Face_Mask] = 1.10;
					Bonuses[BonusType.TakeDamage][ItemIds.Face_Mask] = 1.30;
					break;
				case ItemIds.Full_Meal:
					Bonuses[BonusType.Healing][ItemIds.Full_Meal] = 2;
					break;
				case ItemIds.Gorilla_Paw:
					Bonuses[BonusType.Damage][ItemIds.Gorilla_Paw] = playerItems[i][$"damageBonus"];
					Bonuses[BonusType.loseCritical][ItemIds.Gorilla_Paw] = playerItems[i][$"loseCritical"];
					break;
				case ItemIds.Injection_Type_Asacoco:
					HP = HP - (HP * 0.05);
					Bonuses[BonusType.Damage][ItemIds.Injection_Type_Asacoco] = playerItems[i][$"bonus"];
					break;
				case ItemIds.Knightly_Milk:
					Bonuses[BonusType.WeaponSize][ItemIds.Knightly_Milk] = playerItems[i][$"weaponSize"];
					Bonuses[BonusType.PickupRange][ItemIds.Knightly_Milk] = playerItems[i][$"pickupRange"];
					break;
				case ItemIds.Uber_Sheep: //TODO: fix chance
					do{
						a = irandom_range(-1,1);
						b = irandom_range(-1,1);
					} until (a != b)
					instance_create_layer(
					oPlayer.x+(128*a),
					oPlayer.y+(128*b),
					"Instances",
					oBurguer
					);
					Bonuses[BonusType.UberSheep] = playerItems[i][$"bonus"];
					break;
				case ItemIds.Study_Glasses:
					Bonuses[BonusType.XPBonus][ItemIds.Study_Glasses] = playerItems[i][$"XPBonus"];
					break;
				case ItemIds.CreditCard:
					Bonuses[BonusType.AnvilDrop][ItemIds.CreditCard] = playerItems[i][$"AnvilDropBonus"];
					Bonuses[BonusType.EnhancingCost][ItemIds.CreditCard] = playerItems[i][$"EnhancingCost"];
					break;
				case ItemIds.Super_Chatto_Time:
					Bonuses[BonusType.SuperChattoTime] = playerItems[i][$"bonus"];
					break;
				case ItemIds.Idol_Costume:
					if (oPlayer.idolCostumeLevel != playerItems[i][$"level"]) {
					    oPlayer.idolCostumeLevel = playerItems[i][$"level"];
						oPlayer.specialcooldown = oPlayer.specialcooldown - (oPlayer.specialcooldown * playerItems[i][$"SpecialCooldown"]);
					}
					break;
				case ItemIds.Stolen_Piggy_Bank:
					Bonuses[BonusType.PickupRange][ItemIds.Stolen_Piggy_Bank] = -0.30;
					Bonuses[BonusType.Speed][ItemIds.Stolen_Piggy_Bank] = 1.15;
					if(variable_global_exists("pig") and time_source_exists(global.pig)) {break;}
					global.pigfunction = function()
					{
					    global.newcoins += 1;
					}
					global.pig = time_source_create(time_source_game, 1, time_source_units_seconds,global.pigfunction, [], -1, time_source_expire_after);
					time_source_start(global.pig);
					break;
				case ItemIds.Limiter:
					Bonuses[BonusType.PickupRange][ItemIds.Limiter] = playerItems[i][$"bonus"];
					break;
			}
		}
	}
}

function defaultItemBehaviour(_id, _cooldown){
	global.itemCooldown[_id] = _cooldown;
}




