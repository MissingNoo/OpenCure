/// @description Insert description here
// You can write your code in this editor
heal_player(10);
if (Buffs[BuffNames.Sake][$ "enabled"]) {
    Buffs[BuffNames.SakeFood][$ "enabled"] = true;
    Buffs[BuffNames.SakeFood][$ "cooldown"] = Buffs[BuffNames.SakeFood][$ "baseCooldown"];
}
instance_destroy();
