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
			inst.speed=UPGRADES[weapons.AmePistol][?"speed"];
			inst.hits=UPGRADES[weapons.AmePistol][?"hits"];
			inst.shoots = 0;
			inst.sprite_index=UPGRADES[weapons.AmePistol][?"sprite"];
		    shoots-=1;
			alarm[0]=10;
		}
		break;
}


