/// @description Insert description here
// You can write your code in this editor
instance_destroy(other);
var coins = 10;
//feather disable once GM2017
for (var i = 1; i < global.shopUpgrades.MoneyGain.level; ++i) {
    coins = coins + ((coins * 20) / 100);
}
global.newcoins+= coins;