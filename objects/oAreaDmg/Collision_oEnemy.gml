var damage;
switch (global.player[?"special"]) {
    case SpecialIds.Gura:
        damage = (UPGRADES[0][$ "mindmg"] * 500) / 100;
        break;
    case SpecialIds.Ina:
        damage = (UPGRADES[0][$ "mindmg"] * 150) / 100;
        break;		
    default:
        // code here
        break;
} 
other.hp -= damage;
//instance_create_layer(other.x, other.y, "DamageLayer", oDamageText, {dmg : damage});