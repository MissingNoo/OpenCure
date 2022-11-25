
instance_create_layer(x,y,"Instances",oXP, {xp : xp});
random_set_seed(current_time);
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

