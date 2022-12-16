/// @description Insert description here
// You can write your code in this editor
var color = c_white;
var img = 0;
if (xp > 11 and xp < 19) {img = 1;}
if (xp > 20 and xp < 49) {img = 2;}
if (xp > 50 and xp < 99) {img = 3;}
if (xp > 100 and xp < 199) {img = 4;}
if (xp > 200) {color=img = 5;}
draw_sprite_ext(sXP, img, x,y,1,1,0,color,1);

if (global.debug) {
	draw_text(x,y-20, string(xp));
    draw_circle(x,y,30,true);
}