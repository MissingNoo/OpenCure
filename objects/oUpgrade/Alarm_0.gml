/// @description Insert description here
// You can write your code in this editor
switch (upg[?"name"]) {
	case "DouglasShoot":
		image_speed=image_original_speed;
		break;
	case "AmePistol":
		if (shoots > 1) {
			inst = (instance_create_layer(oPlayer.x,oPlayer.y,"Upgrades",oUpgrade));
			inst.upg=UPGRADES[weapons.AmePistol];
			inst.shoots = 0;
		    shoots-=1;
			alarm[0]=10;
		}
		break;
}

