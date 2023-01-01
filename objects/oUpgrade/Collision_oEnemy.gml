/// @description 


if (other.hittedcooldown[upg[?"id"]] <= 0  and !global.gamePaused and other.image_alpha == 1 and image_alpha == 1) {
	
	#region debuffs
		#region Gura
			if (global.player == CHARACTERS[Characters.Gura]) {
				for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
					var found = false;
					randomize();
					if (PLAYER_PERKS[i][?"id"] == PerkIds.SharkBite and PLAYER_PERKS[i][?"level"] > 0 and irandom_range(1,100) <= Buffs[BuffNames.SharkBite].chance[PLAYER_PERKS[i][?"level"]]) {
						for (var j = 0; j < array_length(other.debuffs); ++j) {
							if (other.debuffs[j].id == BuffNames.SharkBite) {
								found = true;
								if (other.debuffs[j].marks < other.debuffs[j].maxMarks) {
									other.debuffs[j].marks += 1;
								}
							}
						}
						if (!found) {
							var _lv=0;
							for (var k = 0; k < array_length(PLAYER_PERKS); ++k) {
								if (PLAYER_PERKS[k][?"id"] == PerkIds.SharkBite) {
									_lv = PLAYER_PERKS[k][?"level"];
								}
							}
							Buffs[BuffNames.SharkBite].level = _lv;
							array_push(other.debuffs, copyStruct(Buffs[BuffNames.SharkBite]));
						}
					}
				}
			}
		#endregion
	#endregion

	
	other.hittedcooldown[upg[?"id"]] = upg[?"hitCooldown"];
	other.damaged = true;
	random_set_seed(current_time);
	if (!variable_instance_exists(self, "mindmg")) {
		mindmg = 0;
	}
	
	if (!variable_instance_exists(self, "maxdmg")) {
	    // Feather disable once GM2016
	    maxdmg = 0;
	}
	var dmg = irandom_range(mindmg, maxdmg);
	var bdmg = dmg;
	for (var i = 0; i < array_length(Bonuses[BonusType.Damage]); ++i) {
	    if (Bonuses[BonusType.Damage][i] != 0) {
			//show_message(string(dmg) + " : " + string(Bonuses[BonusType.Damage][i]) + " = " +  string(dmg*Bonuses[BonusType.Damage][i]));
		    dmg = dmg * Bonuses[BonusType.Damage][i];			
		}
	}
	for (var i = 0; i < array_length(PerkBonuses[BonusType.Damage]); ++i) {
	    if (PerkBonuses[BonusType.Damage][i] != 0) {
			//show_message(string(dmg) + " : " + string(Bonuses[BonusType.Damage][i]) + " = " +  string(dmg*Bonuses[BonusType.Damage][i]));
		    dmg = dmg * PerkBonuses[BonusType.Damage][i];			
		}
	}
	for (var i = 0; i < array_length(other.debuffs); ++i) {
	    if (other.debuffs[i].id == BuffNames.SharkBite) {
			for (var j = 0; j < other.debuffs[i].marks; ++j) {
			    dmg = dmg * other.debuffs[i].damage[other.debuffs[i].level];
			}
		}
	}
	other.hp-= dmg * global.player[?"atk"];
	if (global.DamageNumbers) {
	    var _inst = instance_create_layer(other.x,other.y,"DamageLayer",oDamageText);
		_inst.dmg = dmg;
	}
	
	other.alarm[1]=15;	
	switch (upg[?"name"]) {
	    case "AmePistol":
	        if (hits == 1 and !AmePistolLastHit and upg[?"level"] >= 4) {
			    AmePistolLastHit=true;
				hits+=5;
				switch (direction) {
				    case 0:
				        direction = 180;
				        break;
				    case 180:
				        direction = 0;
				        break;
				}
			}
	        break;
	    default:
	        break;
	}
	hits-=1;
}





