/// @description Insert description here
// You can write your code in this editor
instance_destroy(other);
var coins = 10;
for (var i = 1; i < global.ShopUpgrades.MoneyGain.level; ++i) {
    coins = coins + ((coins * 20) / 100);
}
global.newcoins+= coins;