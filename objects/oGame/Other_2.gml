
/// @description Insert description here
// You can write your code in this editor
if (!variable_global_exists("ShopUpgrades")) {
    global.ShopUpgrades = {
		Hp : {
			name:"Max HP Up",
			desc : "Increase Max HP by 4% per level. (Max 40%) ",
			sprite : sHudHPIcon,
			level : 0,
			maxlevel : 10,
			costs : [200, 500, 1200, 2750, 6000, 12000, 18000, 24000, 30000, 36000]
		},
		Atk : {
			name:"ATK Up",
			desc : "Increase all damage by 6% per level. (Max 60%) ",
			sprite : sHudAtkIcon,
			level : 0,
			maxlevel : 10,
			costs : [300, 750, 1800, 4100, 9100, 18000, 25000, 31000, 37000, 43000 ]
		},
		Spd : {
			name:"SPD Up",
			desc : "Increase movement speed by 6% per level. (Max 60%) ",
			sprite : sHudSpdIcon,
			level : 0,
			maxlevel : 10,
			costs : [200, 500, 1200, 2750, 6000, 12000, 18000, 24000, 30000, 36000]
		},
		Crit : { //TODO: Crit damage up
			name:"Crit Up",
			desc : "Increase critical hit chance by 2% per level. (max 10%) ",
			sprite : sHudCrtIcon,
			level : 0,
			maxlevel : 5,
			costs : [300, 750, 1800, 4100, 9100 ]
		},
		PickUp : {
			name:"Pick Up Range",
			desc : "Increase base pick up range by 10% per level. (Max 100%) ",
			sprite : sHudPickupIcon,
			level : 0,
			maxlevel : 10,
			costs : [200, 500, 1200, 2750, 6000, 12000, 18000, 24000, 30000, 36000 ]
		},
		Haste : {
			name:"Haste Up",
			desc : "Increase attack speed by 4% per level. (Max 20%) ",
			sprite : sHudCooldownIcon,
			level : 0,
			maxlevel : 5,
			costs : [400, 1000, 2400, 5500, 12000 ]
		},
		Regeneration : {
			name:"Regeneration",
			desc : "Slowly heals 1 HP every 5 seconds. +1 HP per level. (Max 5 HP/ 5 seconds) ",
			sprite : sHudRegenerationIcon,
			level : 0,
			maxlevel : 5,
			costs : [200, 500, 1200, 2750, 6000]
		},
		SpecialAtk : {
			name:"Special Attack",
			desc : "Unlocks the Special Attack for all characters. Press the secondary button (default: X) to use. ",
			sprite : sHudSpecialUnlockIcon,
			level : 0,
			maxlevel : 1,
			costs : [500]
		},
		SpecialCooldown : {
			name:"Special Cooldown Reduction",
			desc : "Reduces the cooldown time of special attack by 3% per level. (Max 15%) ",
			sprite : sHudSpecialCooldownIcon,
			level : 0,
			maxlevel : 5,
			costs : [500, 1250, 3000, 6900, 15000 ]
		},
		Growth : {//TODO: Special attacks
			name:"Growth",
			desc : "Increase the damage of Character Main Weapons and Special Attacks by 2% per in-game level. ",
			sprite : sHudGrowthIcon,
			level : 0,
			maxlevel : 1,
			costs : [1000]
		},
		ExpGain : {
			name:"EXP Gain Up",
			desc : "Increases the amount of EXP gained by 4% per level. (max 20%) ",
			sprite : sXP,
			level : 0,
			maxlevel : 5,
			costs : [300, 750, 1800, 4100, 9100 ]
		},
		FoodDrop : {//TODO: calculate properly the rates and not make Lithusei mad with me for probably asking again
			name:"Food Drops Up",
			desc : "Increases the rate that food is dropped by 4% per level. (max 20%) ",
			sprite : sHamburger,
			level : 0,
			maxlevel : 5,
			costs : [150, 375, 900, 2000, 4500 ]
		},
		MoneyGain : {
			name:"Money Gain Up",
			desc : "Increases the amount of HoloCoins gained by 20% per level. (Max 200%) ",
			sprite : sHolocoin,
			level : 0,
			maxlevel : 10,
			costs : [400, 1000, 2400, 5500, 12000, 20000, 30000, 40000, 50000, 60000 ]
		},
		Reroll : {
			name:"Reroll",
			desc : "Grants a use of Reroll when leveling up. ",
			sprite : sHudRerollIcon,
			level : 0,
			maxlevel : 5,
			costs : [2500, 5000, 7500, 10000, 12500 ]
		},
		EnhacementRate : {//TODO: yeah....
			name:"Enhancement Rate Up",
			desc : "Increases the chance of success during enhancements by 3% per level. (Max 15%) ",
			sprite : sHudHPIcon,
			level : 0,
			maxlevel : 5,
			costs : [300, 750, 1800, 4100, 9100 ]
		},
		Defense : {
			name:"Defense Up",
			desc : "Increases defense, reducing damage taken by 3% per level. (Max 15%) ",
			sprite : sHudDefenseIcon,
			level : 0,
			maxlevel : 5,
			costs : [500, 1250, 3000, 6900, 15000 ]
		},
		GRankOff : {//TODO: maybe implement G-ranks before...
			name:"G Rank Off",
			desc : "Turn off bonuses gained from G Ranks on all characters. ",
			sprite : sHudHPIcon,
			level : 0,
			maxlevel : 1,
			costs : [0]
		},
		Hardcore : {//TODO: score system and bonus score
			name:"Hardcore",
			desc : "Ultimate challenge! HP is set to 1. Gain massive bonus score the longer you survive in Endless Mode. ",
			sprite : sHudHPIcon,
			level : 0,
			maxlevel : 1,
			costs : [0]
		},
	}
}
global.ShopUpgradesJSON = json_stringify(global.ShopUpgrades);
global.holocoins = 0;
Load_Data_Structs();
global.holocoins ??= 0;
global.Font = font_add_sprite(sPixelFont, ord("!"), true, 2);
draw_set_font(global.Font);
//draw_set_font(global.Font); //draw_set_font(fnt_font1);
randomize();
populateItems();
populateUpgrades();
populateCharacters();
populate_perks();
populateSpecials();


#region name here


		global.ShopUpgrades.Hp.sprite = sHudHPIcon;
		global.ShopUpgrades.Atk.sprite =sHudAtkIcon;
		global.ShopUpgrades.Spd.sprite =sHudSpdIcon;
		global.ShopUpgrades.Crit.sprite =sHudCrtIcon;
		global.ShopUpgrades.PickUp.sprite =sHudPickupIcon;
		global.ShopUpgrades.Haste.sprite =sHudCooldownIcon;
		global.ShopUpgrades.Regeneration.sprite =sHudRegenerationIcon;
		global.ShopUpgrades.SpecialAtk.sprite =sHudSpecialUnlockIcon;
		global.ShopUpgrades.SpecialCooldown.sprite =sHudSpecialCooldownIcon;
		global.ShopUpgrades.Growth.sprite =sHudGrowthIcon;
		global.ShopUpgrades.ExpGain.sprite =sXP;
		global.ShopUpgrades.FoodDrop.sprite =sHamburger;
		global.ShopUpgrades.MoneyGain.sprite =sHolocoin;
		global.ShopUpgrades.Reroll.sprite =sHudRerollIcon;
		global.ShopUpgrades.EnhacementRate.sprite =sHudHPIcon;
		global.ShopUpgrades.Defense.sprite =sHudDefenseIcon;
		global.ShopUpgrades.GRankOff.sprite =sHudHPIcon;
		global.ShopUpgrades.Hardcore.sprite =sHudHPIcon;

#endregion