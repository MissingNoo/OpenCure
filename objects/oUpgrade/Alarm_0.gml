

///// @description Insert description here
//// You can write your code in this editor
//// Feather disable GM2016


//var inst = noone;
//switch (upg[$"id"]) {
//	default:
//		spawnUpgrade();
//		break;
//	//case Weapons.AmePistol:
//	//	//if (shoots > 1) {			
//	//		spawnUpgrade();
//	//	    //shoots-=1;
//	//		//alarm[0]=10;
//	//	//}
//	//	break;
//	case Weapons.GuraTrident:
//		//if (shoots > 1) {			
//			inst = spawnUpgrade();
//			inst.diroffset=offset;
//			offset+=32;			
//		    //shoots-=1;			
//			//alarm[0]=1;
//		//}
//		break;
//	case Weapons.InaTentacle:
//		//if (shoots > 1) {			
//			inst = spawnUpgrade();
//			inst.diroffset=irandom_range(0,360);
//		    //shoots-=1;			
//			////alarm[0]=1;
//		//}
//		break;
//	case Weapons.CuttingBoard:
//		shoots = -1;
//		inst = spawnUpgrade();
//		inst.diroffset += 90;
//		inst = spawnUpgrade();
//		inst.diroffset -= 90;
//		break;
//	//case Weapons.PlugAsaCoco:{
//	//	//spawnUpgrade();
//	//	break;}
//	case Weapons.BlBook:{
//		//if (shoots > 1) {			
//			inst = spawnUpgrade();
//			inst.orbitPlace = orbitoffset;
//			inst.orbitLength = orbitLength;
//			switch (upg[$"level"]) {
//				    case 1:
//				        orbitoffset -= 120;
//				        break;
//				    case 2:
//				        orbitoffset -= 90;
//				        break;
//					case 3:
//				        orbitoffset -= 90;
//				        break;
//					case 4:
//				        orbitoffset -= 80;
//				        break;
//					case 5:
//				        orbitoffset -= 80;
//				        break;
//					case 6:
//				        orbitoffset -= 60;
//				        break;
//					case 7:
//				        orbitoffset -= 60;
//				        break;
//				}			
//		    //shoots-=1;			
//			//alarm[0]=1;
//		//}
//		break;}
//	case Weapons.EliteLavaBucket:{
//		//if (shoots > 1) {			
//			spawnUpgrade();
//			random_set_seed(current_time);
//			x = oPlayer.x + irandom_range(-200,200);
//			random_set_seed(current_time);
//			y = oPlayer.y + irandom_range(-200,200);
//		    //shoots-=1;
//			//alarm[0]=1;
//		//}
//		break;}
//	case Weapons.PowerofAtlantis:{
//		//if (shoots > 1) {			
//			spawnUpgrade();
//			random_set_seed(current_time);
//			x = oPlayer.x + irandom_range(-200,200);
//			random_set_seed(current_time);
//			y = oPlayer.y + irandom_range(-200,200);
//		    //shoots-=1;
//			//alarm[0]=1;
//		//}
//		break;}
//	case Weapons.HoloBomb:{
//		//if (shoots > 1) {			
//			spawnUpgrade();
//			//random_set_seed(current_time);
//			x = owner.x + irandom_range(-50,50);
//			//random_set_seed(current_time);
//			y = owner.y + irandom_range(-50,50);
//		    //shoots-=1;
//			//alarm[0]=1;
//		//}
//		break;}
//	case Weapons.IdolSong:{
//		//if (shoots > 1) {			
//			inst = spawnUpgrade();
//			if (shoots % 2) {
//			//    //alarm[0]=1;
//			//	idolDir = 0;
//			//}
//			//else{
//			//	idolDir = 180;
//			//	alarm[0]=50;
//				if (idolDir == 90) {
//				    idolDir = 270;
//					direction = idolDir;
//				}else{
//					idolDir = 90;
//					direction = idolDir;
//					image_xscale = image_xscale * -1;
//				}
//			}
//			try{
//			inst.idolDir = idolDir;
//			}
//			catch (err){}
//		//}
//		//shoots -= 1;
//		break;}
//		case Weapons.PipiPilstol:{
//			//if (shoots > 1) {			
//				//shoots-=1;
//				inst = spawnUpgrade();
//				if (shoots % 2) {
//					inst.shoots = -2;
//				}
//				else{
//					inst.shoots = -1;
//				}
//				//shoots=0;
//				//alarm[0]=10;
//				//}
//			break;
//		}
//		//case Weapons.HeavyArtillery:{
//		//	//if (shoots > 1) {
//		//		spawnUpgrade();
//		//		//shoots-=1;
//		//		//}
//		//	break;
//		//}
//}
//shoots -= 1;
//if (shoots > 1) {
//	if (variable_struct_exists(upg, "attackdelay")) {
//		alarm[0] = upg[$"attackdelay"];
//	}
//	else{
//		alarm[0] = 1;
//	}   
//}