

/// @description Insert description here
// You can write your code in this editor
// Feather disable GM2016


var inst = noone;
switch (upg[$"id"]) {
	default:
		break;
	case Weapons.AmePistol:
		if (shoots > 1) {			
			spawnUpgrade();
		    shoots-=1;
			alarm[0]=10;
		}
		break;
	case Weapons.GuraTrident:
		if (shoots > 1) {			
			inst = spawnUpgrade();
			inst.diroffset=offset;
			offset+=32;			
		    shoots-=1;			
			alarm[0]=1;
		}
		break;
	case "InaTentacle":
		if (shoots > 1) {			
			inst = spawnUpgrade();
			inst.diroffset=irandom_range(0,360);
		    shoots-=1;			
			alarm[0]=1;
		}
	case Weapons.PlugAsaCoco:{
		speed = originalspeed;
		audio_play_sound(choose(snd_tailplug, snd_tailplug2, snd_tailplug3),0,0);
		break;}
	case Weapons.BlBook:{
		if (shoots > 1) {			
			inst = spawnUpgrade();
			inst.orbit_place = orbitoffset;
			inst.orbit_length = orbit_length;
			switch (upg[$"level"]) {
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
	case Weapons.EliteLavaBucket:{
		if (shoots > 1) {			
			spawnUpgrade();
			random_set_seed(current_time);
			x = oPlayer.x + irandom_range(-200,200);
			random_set_seed(current_time);
			y = oPlayer.y + irandom_range(-200,200);
		    shoots-=1;
			alarm[0]=1;
		}
		break;}
	case Weapons.PowerofAtlantis:{
		if (shoots > 1) {			
			spawnUpgrade();
			random_set_seed(current_time);
			x = oPlayer.x + irandom_range(-200,200);
			random_set_seed(current_time);
			y = oPlayer.y + irandom_range(-200,200);
		    shoots-=1;
			alarm[0]=1;
		}
		break;}
	case Weapons.HoloBomb:{
		if (shoots > 1) {			
			spawnUpgrade();
			//random_set_seed(current_time);
			x = oPlayer.x + irandom_range(-50,50);
			//random_set_seed(current_time);
			y = oPlayer.y + irandom_range(-50,50);
		    shoots-=1;
			alarm[0]=1;
		}
		break;}
}