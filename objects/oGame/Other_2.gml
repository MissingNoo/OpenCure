
/// @description Insert description here
// You can write your code in this editor
Load_Data_Structs();
global.Font = font_add_sprite(sFont256269, ord("!"), true, 2);
draw_set_font(global.Font);
//draw_set_font(global.Font); //draw_set_font(fnt_font1);
randomize();
populateItems();
populateUpgrades();
populateCharacters();
populatePerks();





