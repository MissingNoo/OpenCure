if (other.canattack and !global.gamePaused) {
	other.canattack=false;
	audio_play_sound(snd_hurt,0,0);
	if (Shield > 0) {
	    Shield -= 15;
	}
	else {
	    HP -= 15;
		if (Buffs[BuffNames.Sake][$ "count"] > 1) {
		    Buffs[BuffNames.Sake][$ "count"] = round(Buffs[BuffNames.Sake][$ "count"] / 2);
		}
	}
}