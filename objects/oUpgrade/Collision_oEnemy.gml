/// @description 

if (other.hittedcooldown[upg[?"id"]] <= 0  and !global.gamePaused and other.image_alpha == 1 and image_alpha == 1) {
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
	other.hp-= dmg * global.player[?"atk"];
	if (global.damageNumbers) {
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





