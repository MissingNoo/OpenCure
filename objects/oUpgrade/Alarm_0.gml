/// @description Insert description here
// You can write your code in this editor
switch (upg[?"name"]) {
	default:
		break;
	case "AmePistol":
		if (shoots > 1) {			
			inst = (instance_create_layer(oPlayer.x,oPlayer.y,"Upgrades",oUpgrade));
			inst.upg=upg;
			inst.speed=upg[?"speed"];
			inst.hits=upg[?"hits"];
			inst.shoots = 0;
			inst.sprite_index=upg[?"sprite"];
		    shoots-=1;
			alarm[0]=10;
		}
		break;
}


