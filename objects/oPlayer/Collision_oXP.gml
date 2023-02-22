/// @description Insert description here
// You can write your code in this editor
var newxp = other.xp;
audio_play_sound(snd_getEXP,0,0);
instance_destroy(other);
for (var i = 0; i < array_length(Bonuses[BonusType.XPBonus]); ++i) {
	if (Bonuses[BonusType.XPBonus][i] != 0) {
		//show_message("old:" + string(newxp) + " new:" + string(newxp * Bonuses[BonusType.XPBonus][i]));
	    newxp = newxp * Bonuses[BonusType.XPBonus][i];
	}
}
for (var i = 0; i < global.ShopUpgrades[$ "ExpGain"][$ "level"]; ++i) {
	newxp = newxp + ((newxp * 4) / 100);
}
global.xp += newxp;