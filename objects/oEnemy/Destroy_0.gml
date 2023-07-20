if (boss) {
    audio_play_sound(snd_bossdefeated,0,0);
}

if (dropxp) {
	global.defeatedEnemies += 1;
    instance_create_layer(x,y,"Instances",oXP, {xp : xp});
}

//global.lastxp = xp;
//layer_sequence_create("Instances", x, y, seq_xp);
//random_set_seed(current_time);
#region nurse horn
	for (var i = 0; i < array_length(playerItems); ++i) {
		//show_message(string(playerItems[i][?"id"]));
		//show_message(string(ItemIds.NurseHorn));
	    if (playerItems[i][$"id"] == ItemIds.NurseHorn) {
		    var rdn = irandom_range(0,100);
			if (rdn <= 30) {
			    switch (playerItems[i][$"level"]) {
				    case 1:
				        healPlayer(2);
				        break;
					case 2:
				        healPlayer(4);
				        break;
					case 3:
				        healPlayer(6);
				        break;
				}
			}
		}
	}
#endregion
// randomize;
//var _dropChanceBuff = Bonuses[BonusType.UberSheep][ItemIds.UberSheep] + global.shopUpgrades[$"FoodDrop"][$"level"] / 100;
//show_message(_dropChanceBuff)
//var dropchance = 1 / 200 * (1 - _dropChanceBuff);
//show_message(dropchance)
var _dropchance = 1;
for (var i = 0; i < global.shopUpgrades[$"FoodDrop"][$"level"]; ++i) {
    _dropchance = _dropchance * 1.04;
}
if (Bonuses[BonusType.UberSheep][ItemIds.UberSheep] != 0) {
    _dropchance = _dropchance * Bonuses[BonusType.UberSheep][ItemIds.UberSheep];
}
if (random_range(1,200) <= _dropchance) {
    instance_create_layer(x,y,"Instances", oBurguer);
}
// randomize;
if (irandom_range(1, 90) == 1) {
	if(Bonuses[BonusType.SuperChattoTime] > 0){
		global.newcoins += round(10 * Bonuses[BonusType.SuperChattoTime]);
	}else{
		instance_create_layer(x,y,"Instances", oHolocoin);
	}
    
}

// randomize;
var range = floor(1300 * (1 - Bonuses[BonusType.AnvilDrop][ItemIds.CreditCard])) + 1;
if (irandom_range(1,range) == 1) {
	instance_create_layer(x,y,"Instances", oAnvil);
}

// randomize;
if (irandom_range(1,3000) == 1) {
    //TODO: code here for exp magnet
}