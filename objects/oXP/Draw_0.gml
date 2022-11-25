/// @description Insert description here
// You can write your code in this editor
var color = c_white;
if (xp > 11 and xp < 19) {color=c_green;}
if (xp > 20 and xp < 49) {color=c_yellow;}
if (xp > 50 and xp < 99) {color=c_orange;}
if (xp > 100 and xp < 199) {color=c_purple;}
if (xp > 200) {color=c_red;}
draw_sprite_ext(sXP, -1, x,y,1,1,0,color,1);

if (global.debug) {
	draw_text(x,y-20, string(xp));
    draw_circle(x,y,30,true);
}