

/// @description Insert description here
// You can write your code in this editor
// Feather disable GM2016
var inst = noone;
switch (upg[?"name"]) {
	default:
		break;
	case "AmePistol":
		if (shoots > 1) {			
			inst = (instance_create_layer(oPlayer.x,oPlayer.y-8,"Upgrades",oUpgrade));
			inst.upg=upg;
			inst.speed=upg[?"speed"];
			inst.hits=upg[?"hits"];
			inst.shoots = 0;
			inst.sprite_index=upg[?"sprite"];
		    shoots-=1;
			alarm[0]=10;
		}
		break;
	case "GuraTrident":
		if (shoots > 1) {			
			inst = (instance_create_layer(oPlayer.x,oPlayer.y-8,"Upgrades",oUpgrade));
			inst.upg=upg;
			inst.speed=upg[?"speed"];
			inst.hits=upg[?"hits"];
			inst.shoots = 0;
			inst.sprite_index=upg[?"sprite"];
			inst.diroffset=offset;
			offset+=32;			
		    shoots-=1;			
			alarm[0]=1;
		}
		break;
	case "InaTentacle":
		if (shoots > 1) {			
			inst = (instance_create_layer(oPlayer.x,oPlayer.y-8,"Upgrades",oUpgrade));
			inst.upg=upg;
			inst.speed=upg[?"speed"];
			inst.hits=upg[?"hits"];
			inst.shoots = 0;
			inst.sprite_index=upg[?"sprite"];
			inst.diroffset=irandom_range(0,360);
		    shoots-=1;			
			alarm[0]=1;
		}
	case "Plug-type Asacoco":{
		speed = originalspeed;			
		break;}
	case "BL Book":{
		if (shoots > 1) {			
			inst = (instance_create_layer(oPlayer.x,oPlayer.y-8,"Upgrades",oUpgrade));
			inst.upg=upg;
			inst.speed=upg[?"speed"];
			inst.hits=upg[?"hits"];
			inst.sprite_index=upg[?"sprite"];
			inst.shoots = 0;
			inst.orbit_place = orbitoffset;
			inst.orbit_length = orbit_length;
			switch (upg[?"level"]) {
				    case 1:
				        orbitoffset -= 120;
				        break;
				    case 2:
				        orbitoffset -= 90;
				        break;
					case 3:
				        orbitoffset -= 90;
				        break;
					case 4:
				        orbitoffset -= 80;
				        break;
					case 5:
				        orbitoffset -= 80;
				        break;
					case 6:
				        orbitoffset -= 60;
				        break;
					case 7:
				        orbitoffset -= 60;
				        break;
				}			
		    shoots-=1;			
			alarm[0]=1;
		}
		break;}
	case "Elite Lava Bucket":{
		if (shoots > 1) {			
			inst = (instance_create_layer(oPlayer.x,oPlayer.y-8,"Upgrades",oUpgrade));
			inst.upg=upg;
			inst.speed=upg[?"speed"];
			inst.hits=upg[?"hits"];
			inst.shoots = 0;
			inst.sprite_index=upg[?"sprite"];
			random_set_seed(current_time);
			x = oPlayer.x + irandom_range(-200,200)
			random_set_seed(current_time);
			y = oPlayer.y + irandom_range(-200,200)
		    shoots-=1;
			alarm[0]=1;
		}
		break;}
	case "Power of Atlantis":{
		if (shoots > 1) {			
			inst = (instance_create_layer(oPlayer.x,oPlayer.y-8,"Upgrades",oUpgrade));
			inst.upg=upg;
			inst.speed=upg[?"speed"];
			inst.hits=upg[?"hits"];
			inst.shoots = 0;
			inst.mindmg = mindmg;
			inst.maxdmg = maxdmg;
			inst.sprite_index=upg[?"sprite"];
			random_set_seed(current_time);
			x = oPlayer.x + irandom_range(-200,200)
			random_set_seed(current_time);
			y = oPlayer.y + irandom_range(-200,200)
		    shoots-=1;
			alarm[0]=1;
		}
		break;}
}

