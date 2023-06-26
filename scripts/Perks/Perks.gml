
#macro PLAYER_PERKS global.perks
#macro PERK_LIST global.perkList
global.perks=[0];
global.perkCooldown[0] = 0;
global.perkBonuses[0] = 0;
#region Null item
	global.nullperk={};
	variable_struct_set(global.nullperk, "name", "");
	global.perkList=[0];
#endregion

#region Item Functions

	function create_perk(_id, _name, _level, _maxLevel, _weight, _sprite, _cooldown, _desc, _character)
	{
		PERK_LIST[_id][_level]={};
		var item = PERK_LIST[_id][_level];
		variable_struct_set(item, "id", _id);
		variable_struct_set(item, "name", _name);
		variable_struct_set(item, "level", _level);
		variable_struct_set(item, "maxlevel", _maxLevel);
		variable_struct_set(item, "weight", _weight);
		variable_struct_set(item, "thumb", _sprite);
		variable_struct_set(item, "cooldown", _cooldown);
		variable_struct_set(item, "desc", _desc);
		variable_struct_set(item, "characterid", _character);
		variable_struct_set(item, "perk", 1);
		variable_struct_set(item, "style", ItemTypes.Perk);		
		global.perkCooldown[_id] = _cooldown;
	}

	enum PerkIds
	{
		//Amelia
		FpsMastery,
		DetectiveEye,//TODO: critical
		Bubba,//TODO: Everythingq
		ShortSize,
		PowerofAtlantis,
		SharkBite,
		//Modded
		HeavyArtillery,
		MoldySoul,
		SodaFueled
	}
#endregion
function populate_perks(){
	#region Item Creation
		#region Character Perks
			#region Amelia Perks
				#region FPS Mastery
					create_perk(PerkIds.FpsMastery, "FPS Mastery", 0, 3, 1, sFpsMastery, 1, "Do nothing.", Characters.Amelia);
					create_perk(PerkIds.FpsMastery, "FPS Mastery", 1, 3, 1, sFpsMastery, 1, "Weapons deal [20%] more damage.", Characters.Amelia);
					create_perk(PerkIds.FpsMastery, "FPS Mastery", 2, 3, 1, sFpsMastery, 1, "Weapons deal [40%] more damage.", Characters.Amelia);
					create_perk(PerkIds.FpsMastery, "FPS Mastery", 3, 3, 1, sFpsMastery, 1, "Weapons deal [60%] more damage and fire [10%] faster.", Characters.Amelia);
				#endregion
				
				#region Detective Eye
					create_perk(PerkIds.DetectiveEye, "Detective Eye", 0, 3, 1, sDetectiveEye, 1, "Do nothing.", Characters.Amelia);
					create_perk(PerkIds.DetectiveEye, "Detective Eye", 1, 3, 1, sDetectiveEye, 1, "Increases critical hit chance by [10%].", Characters.Amelia);
					create_perk(PerkIds.DetectiveEye, "Detective Eye", 2, 3, 1, sDetectiveEye, 1, "Increases critical hit chance by [20%].", Characters.Amelia);
					create_perk(PerkIds.DetectiveEye, "Detective Eye", 3, 3, 1, sDetectiveEye, 1, "Increases critical hit chance by [30%] with a [2%] chance to defeat a target in [1] hit.", Characters.Amelia);
				#endregion
				
				#region Bubba
					create_perk(PerkIds.Bubba, "Bubba", 0, 3, 1, sBubba, 1, "Do nothing.", Characters.Amelia);
					create_perk(PerkIds.Bubba, "Bubba", 1, 3, 1, sBubba, 1, "Gain a dog companion that attacks random targets, dealing [100%] of your base damage per hit.", Characters.Amelia);
					create_perk(PerkIds.Bubba, "Bubba", 2, 3, 1, sBubba, 1, "Bubba deals [150%] of your base damage per hit.", Characters.Amelia);
					create_perk(PerkIds.Bubba, "Bubba", 3, 3, 1, sBubba, 1, "Bubba deals [200%] of your base damage per hit and stuns targets for [2] seconds on hit.", Characters.Amelia);
				#endregion
				global.characterPerks[Characters.Amelia] = [PERK_LIST[PerkIds.FpsMastery][0], PERK_LIST[PerkIds.DetectiveEye][0], PERK_LIST[PerkIds.Bubba][0]];
			#endregion
	
			#region Gura Perks
				#region ShortSize
					create_perk(PerkIds.ShortSize, "Short Size", 0, 3, 1, sShortHeight, 1, "Do Nothing.", Characters.Gura);
					create_perk(PerkIds.ShortSize, "Short Size", 1, 3, 1, sShortHeight, 1, "Grants a [15%] chance to dodge an attack. After dodging, increase movement speed by [30%] and stay invulnerable for [0.5] second.", Characters.Gura);
					create_perk(PerkIds.ShortSize, "Short Size", 2, 3, 1, sShortHeight, 1, "Grants a [25%] chance to dodge an attack. After dodging, increase movement speed by [40%] and stay invulnerable for [0.5] second.", Characters.Gura);
					create_perk(PerkIds.ShortSize, "Short Size", 3, 3, 1, sShortHeight, 1, "Grants a [35%] chance to dodge an attack. After dodging, increase movement speed by [50%] and stay invulnerable for [0.5] second.", Characters.Gura);
					PerkBonuses[BonusType.Speed][PerkIds.ShortSize] = 0;
				#endregion
				
				#region PowerofAtlantis
					create_perk(PerkIds.PowerofAtlantis, "Power of Atlantis", 0, 3, 1, sPowerofAtlantisThumb, 1, "Do nothing.", Characters.Gura);
					create_perk(PerkIds.PowerofAtlantis, "Power of Atlantis", 1, 3, 1, sPowerofAtlantisThumb, 600, "Every [10] seconds, create a whirlpool that draws in targets and takes [15%] more damage, lasting 6 seconds and deals [30%] damage every [0.5] seconds.", Characters.Gura);
					create_perk(PerkIds.PowerofAtlantis, "Power of Atlantis", 2, 3, 1, sPowerofAtlantisThumb, 600, "Every [10] seconds, create a whirlpool that draws in targets and takes [30%] more damage, lasting 6 seconds and deals [40%] damage every [0.5] seconds.", Characters.Gura);
					create_perk(PerkIds.PowerofAtlantis, "Power of Atlantis", 3, 3, 1, sPowerofAtlantisThumb, 600, "Every [10] seconds, create a whirlpool that draws in targets and takes [50%] more damage, lasting 6 seconds and deals [50%] damage every [0.5] seconds.", Characters.Gura);
				#endregion
				
				#region SharkBite //TODO: add animation again
					create_perk(PerkIds.SharkBite, "Shark Bite", 0, 3, 1, sSharkBite, 1, "Do nothing.", Characters.Gura);
					create_perk(PerkIds.SharkBite, "Shark Bite", 1, 3, 1, sSharkBite, 600, "Attacks have a [10%] chance to place 1 'Bite Mark' (max 5). Per stack, Target takes [6%] more damage, and a [20%] chance to heal you [1%] when defeated.", Characters.Gura);
					create_perk(PerkIds.SharkBite, "Shark Bite", 2, 3, 1, sSharkBite, 600, "Attacks have a [15%] chance to place 1 'Bite Mark' (max 5). Per stack, Target takes [9%] more damage, and a [20%] chance to heal you [1%] when defeated.", Characters.Gura);
					create_perk(PerkIds.SharkBite, "Shark Bite", 3, 3, 1, sSharkBite, 600, "Attacks have a [20%] chance to place 1 'Bite Mark' (max 5). Per stack, Target takes [12%] more damage, and a [20%] chance to heal you [1%] when defeated.", Characters.Gura);
					global.characterPerks[Characters.Gura] = [PERK_LIST[PerkIds.ShortSize][0], PERK_LIST[PerkIds.PowerofAtlantis][0], PERK_LIST[PerkIds.SharkBite][0]];
				#endregion		

			#endregion
	
			#region Ina Perks
				#region 
			
				#endregion
				global.characterPerks[Characters.Ina] = [PERK_LIST[PerkIds.FpsMastery][0], PERK_LIST[PerkIds.DetectiveEye][0], PERK_LIST[PerkIds.Bubba][0]];
			#endregion
			#region Modded
			#region Pipkin Pippa
			create_perk(PerkIds.HeavyArtillery, "Heavy Artillery", 0, 3, 1, spr_Pipmod_Pippa_Icon_Perk_HeavyArtillery, 180, "Do nothing.", Characters.Pippa);
			create_perk(PerkIds.HeavyArtillery, "Heavy Artillery", 1, 3, 1, spr_Pipmod_Pippa_Icon_Perk_HeavyArtillery, 174, "Do nothing.", Characters.Pippa);
			create_perk(PerkIds.HeavyArtillery, "Heavy Artillery", 2, 3, 1, spr_Pipmod_Pippa_Icon_Perk_HeavyArtillery, 174, "Do nothing.", Characters.Pippa);
			create_perk(PerkIds.HeavyArtillery, "Heavy Artillery", 3, 3, 1, spr_Pipmod_Pippa_Icon_Perk_HeavyArtillery, 174, "Do nothing.", Characters.Pippa);
			create_perk(PerkIds.MoldySoul, "Moldy Soul", 0, 1, 1, spr_Pipmod_Pippa_Icon_Perk_MoldySoul, 1, "Do nothing.", Characters.Pippa);
			create_perk(PerkIds.MoldySoul, "Moldy Soul", 1, 1, 1, spr_Pipmod_Pippa_Icon_Perk_MoldySoul, 1, "Do nothing.", Characters.Pippa);
			create_perk(PerkIds.SodaFueled, "Soda Fueled", 0, 1, 1, spr_Pipmod_Pippa_Icon_Perk_SodaFueled, 1, "Do nothing.", Characters.Pippa);
			create_perk(PerkIds.SodaFueled, "Soda Fueled", 1, 1, 1, spr_Pipmod_Pippa_Icon_Perk_SodaFueled, 1, "Do nothing.", Characters.Pippa);
			global.characterPerks[Characters.Pippa] = [PERK_LIST[PerkIds.HeavyArtillery][0], PERK_LIST[PerkIds.MoldySoul][0], PERK_LIST[PerkIds.SodaFueled][0]];
			#endregion
			#endregion
		#endregion
	#endregion
}

function tick_perks()
{
	for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
		//show_debug_message("Perk: " + PLAYER_PERKS[i][$"name"] + " cooldown: " + string(PLAYER_PERKS[i][$"cooldown"]) + ":" + string(global.perkCooldown[PLAYER_PERKS[i][$"id"]])   );
		if (global.perkCooldown[PLAYER_PERKS[i][$"id"]] <= 0) {
			defaultPerkBehaviour(PLAYER_PERKS[i][$"id"], PLAYER_PERKS[i][$"cooldown"]);
			switch (PLAYER_PERKS[i][$"id"]) {
				case PerkIds.FpsMastery:{
						switch (PLAYER_PERKS[i][$"level"]) {
						    case 1:
						        PerkBonuses[BonusType.Damage][PerkIds.FpsMastery] = 1.20;
						        break;
						    case 2:
						        PerkBonuses[BonusType.Damage][PerkIds.FpsMastery] = 1.40;
						        break;
							case 3:
						        PerkBonuses[BonusType.Damage][PerkIds.FpsMastery] = 1.60;
						        break;
						}						
					break;}
				case PerkIds.DetectiveEye:{
						switch (PLAYER_PERKS[i][$"level"]) {
						    case 1:
						        PerkBonuses[BonusType.Critical][PerkIds.DetectiveEye] = 1.10;
						        break;
						    case 2:
						        PerkBonuses[BonusType.Critical][PerkIds.DetectiveEye] = 1.20;
						        break;
							case 3:
						        PerkBonuses[BonusType.Critical][PerkIds.DetectiveEye] = 1.30;
						        break;
						}						
					break;}
				case PerkIds.Bubba:{
						switch (PLAYER_PERKS[i][$"level"]) {
						    case 1:
						        PerkBonuses[BonusType.Bubba] = global.player[?"atk"];
						        break;
						    case 2:
						        PerkBonuses[BonusType.Bubba] = global.player[?"atk"]*1.50;
						        break;
							case 3:
						        PerkBonuses[BonusType.Bubba] = global.player[?"atk"]*2;
						        break;
						}						
					break;}
				case PerkIds.PowerofAtlantis:{
						switch (PLAYER_PERKS[i][$"level"]) {
						    case 1:{
								inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
								inst.upg=global.upgradesAvaliable[Weapons.PowerofAtlantis][1];
								//show_message(string(global.upgradesAvaliable[Weapons.PowerofAtlantis][1][?"duration"]))
								inst.speed=0;
								inst.mindmg = UPGRADES[0][$"mindmg"] * 0.3;
								inst.maxdmg = UPGRADES[0][$"maxdmg"] * 0.3;
								inst.hits=999;
								inst.shoots = 1;
								inst.sprite_index=global.upgradesAvaliable[Weapons.PowerofAtlantis][1][$"sprite"];
						        break;}
						    case 2:{
								inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
								inst.upg=global.upgradesAvaliable[Weapons.PowerofAtlantis][1];
								inst.speed=0;
								inst.mindmg = UPGRADES[0][$"mindmg"] * 0.4;
								inst.maxdmg = UPGRADES[0][$"maxdmg"] * 0.4;
								inst.hits=999;
								inst.shoots = 2;
								inst.sprite_index=global.upgradesAvaliable[Weapons.PowerofAtlantis][1][$"sprite"];
						        break;}
							case 3:{
								inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
								inst.upg=global.upgradesAvaliable[Weapons.PowerofAtlantis][1];
								inst.speed=0;
								inst.mindmg = UPGRADES[0][$"mindmg"] * 0.5;
								inst.maxdmg = UPGRADES[0][$"maxdmg"] * 0.5;
								inst.hits=999;
								inst.shoots = 3;
								inst.sprite_index=global.upgradesAvaliable[Weapons.PowerofAtlantis][1][$"sprite"];
						        break;}
						}						
					break;}
					case PerkIds.HeavyArtillery:{
						switch (PLAYER_PERKS[i][$"level"]) {
						    case 1:{
								inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
								inst.upg=global.upgradesAvaliable[Weapons.HeavyArtillery][1];
								//show_message(string(global.upgradesAvaliable[Weapons.HeavyArtillery][1][?"duration"]))
								inst.speed=0;
								inst.mindmg = UPGRADES[0][$"mindmg"] * 333;
								inst.maxdmg = UPGRADES[0][$"maxdmg"] * 333;
								inst.hits=999;
								inst.shoots = 1;
								inst.sprite_index=global.upgradesAvaliable[Weapons.HeavyArtillery][1][$"sprite"];
						        break;}
						    case 2:{
								inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
								inst.upg=global.upgradesAvaliable[Weapons.HeavyArtillery][2];
								inst.speed=0;
								inst.mindmg = UPGRADES[0][$"mindmg"] * 333;
								inst.maxdmg = UPGRADES[0][$"maxdmg"] * 333;
								inst.hits=999;
								inst.shoots = 1;
								inst.sprite_index=global.upgradesAvaliable[Weapons.HeavyArtillery][1][$"sprite"];
						        break;}
							case 3:{
								inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
								inst.upg=global.upgradesAvaliable[Weapons.HeavyArtillery][3];
								inst.speed=0;
								inst.mindmg = UPGRADES[0][$"mindmg"] * 333;
								inst.maxdmg = UPGRADES[0][$"maxdmg"] * 333;
								inst.hits=999;
								inst.shoots = 2;
								inst.sprite_index=global.upgradesAvaliable[Weapons.HeavyArtillery][1][$"sprite"];
						        break;}
						}						
					break;}
			}
		}
	}
}

function defaultPerkBehaviour(_id, _cooldown){
	global.perkCooldown[_id] = _cooldown;
}







