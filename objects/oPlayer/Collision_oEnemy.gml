
/// @description 


if (other.canattack and other.image_alpha == 1 and !global.gamePaused) {
	
	#region Perks
		#region Gura
			if (global.player == CHARACTERS[Characters.Gura]) {
			    for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
				    if (PLAYER_PERKS[i][$"id"] == PerkIds.ShortSize and PLAYER_PERKS[i][$"level"] > 0 and irandom_range(1, 100) <= Buffs[BuffNames.ShortHeight].chance[PLAYER_PERKS[i][$"level"]]) {
					    Buffs[BuffNames.ShortHeight].enabled = true;
						Buffs[BuffNames.ShortHeight].cooldown = Buffs[BuffNames.ShortHeight].baseCooldown;
						PerkBonuses[BonusType.Speed][PerkIds.ShortSize] = Buffs[BuffNames.ShortHeight].bonus[PLAYER_PERKS[i][$"level"]];
					}
				}
			}
		#endregion
	#endregion
	
	//damaged=true;
	audio_play_sound(snd_hurt,0,0);
	var damage = damageCalculation(other.atk);
	if (Shield > 0) {
	    Shield -= damage;
	}
	else {
	    HP -= damage;
	}
	//alarm[1]=60;
	other.canattack=false;
	other.alarm[0]=15;
	var inst = instance_create_layer(x,y - sprite_get_height(sprite_index)/2,"DamageLayer",oDamageText);
	with (inst)
	{
	    dmg=round(damage);
		depth = oPlayer.depth-1;
	}
}

