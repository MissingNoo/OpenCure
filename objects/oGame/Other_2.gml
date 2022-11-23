/// @description Insert description here
// You can write your code in this editor
Load_Data_Structs();
//draw_set_font(Font1);
global.Font = font_add_sprite(sFont, ord("e"), true, 2);
draw_set_font(global.Font);
randomize();
populateItems();
populateUpgrades();
populateCharacters();
populatePerks();



