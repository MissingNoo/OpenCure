
/// @description 


if (other.canattack and other.image_alpha == 1 and image_alpha == 1 and !global.gamePaused) {
	other.canattack=false;
	other.alarm[0]=25;
	var damage = damageCalculation(other.atk);
	#region Perks
		#region Gura
			if (global.player == CHARACTERS[Characters.Gura]) {
			    for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
				    if (PLAYER_PERKS[i][$"id"] == PerkIds.ShortSize and PLAYER_PERKS[i][$"level"] > 0 and irandom_range(1, 100) <= Buffs[BuffNames.ShortHeight].chance[PLAYER_PERKS[i][$"level"]] and Shield == 0) {
					    Buffs[BuffNames.ShortHeight][$"enabled"] = true;
						Buffs[BuffNames.ShortHeight][$"cooldown"] = Buffs[BuffNames.ShortHeight][$"baseCooldown"];
						PerkBonuses[BonusType.Speed][PerkIds.ShortSize] = Buffs[BuffNames.ShortHeight][$"bonus"][PLAYER_PERKS[i][$"level"]];
						damage = 0;
					}
				}
			}
		#endregion
	#endregion
	
	if (pimanUsable) {
	    pimanUsable = false;
		var calc = (specialcooldown * pimanBonus) / 100;
		skilltimer += calc;
	}
	//damaged=true;
	audio_play_sound(snd_hurt,0,0);
	if (Shield > 0) {
	    Shield -= damage;
	}
	else {
	    HP -= damage;
		if (Buffs[BuffNames.Sake][$"count"] > 1) {
		    Buffs[BuffNames.Sake][$"count"] = round(Buffs[BuffNames.Sake][$"count"] / 2);
		}		
	}
	//alarm[1]=60;
	var inst = instance_create_layer(x,y - sprite_get_height(sprite_index)/2,"DamageLayer",oDamageText);
	with (inst)
	{
	    dmg=round(damage);
		depth = oPlayer.depth-1;
	}
	
	#region breastplate
	for (var i = 0; i < array_length(playerItems); ++i) {
		switch (playerItems[i][$"id"]) {
			case ItemIds.Breastplate:
				var _chance = playerItems[i][$"reflectChance"];
				var _random = irandom_range(1, 100);
				var _returnPercent = playerItems[i][$"reflectDamage"];
				var _returnDamage = damage * _returnPercent;
				if (_random <= _chance) {
					other.hp -= _returnDamage;
					var inst = instance_create_layer(other.x,other.y - sprite_get_height(other.sprite_index)/2,"DamageLayer",oDamageText);
					with (inst)
					{
						dmg=round(_returnDamage);
						depth = other.depth-1;
					}
				}
		        break;
			case ItemIds.NurseHorn:
				var _rnd = irandom_range(0, 100);
				var _hppercent = (HP/MAXHP) * 100;
				if (_hppercent <= 15 and _rnd <= 4) {
					var _percenttoheal = (MAXHP * 30) / 100;
				    healPlayer(_percenttoheal);
				}
				break;
		    default:
		        // code here
		        break;
		}
	    if (playerItems[i][$"id"] == ItemIds.Breastplate) {
		    
		}
		
	}
	#endregion
}

