
instance_create_layer(x,y,"Instances",oXP, {xp : xp});
//global.lastxp = xp;
//layer_sequence_create("Instances", x, y, seq_xp);
random_set_seed(current_time);
#region nurse horn
	for (var i = 0; i < array_length(playerItems); ++i) {
		//show_message(string(playerItems[i][?"id"]));
		//show_message(string(ItemIds.NurseHorn));
	    if (playerItems[i][?"id"] == ItemIds.NurseHorn) {
		    var rdn = irandom_range(0,100);
			if (rdn <= 30) {
			    switch (playerItems[i][?"level"]) {
				    case 1:
				        HP+=2;
				        break;
					case 2:
				        HP+=4;
				        break;
					case 3:
				        HP+=6;
				        break;
				}
			}
		}
	}
#endregion

if (random_range(1,200) <= (1 * Bonuses[BonusType.UberSheep])) {
    instance_create_layer(x,y,"Instances", oBurguer);
}

if (irandom_range(1,90) == 1) {
    //TODO: code here for 10 holocoin drop
}

if (irandom_range(1,1301) == 1) {
	instance_create_layer(x,y,"Instances", oAnvil);
}

if (irandom_range(1,3000) == 1) {
    //TODO: code here for exp magnet
}