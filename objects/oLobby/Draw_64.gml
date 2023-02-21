draw_set_color(c_white);
draw_text(10,50,"Connection:" + ishost);
//draw_text(10,100, players);
var offset = 0;
if (is_struct(players[1])) {
    drawWindow(GW/125, GH/11, 135, 155, players[1].username);
	draw_sprite_stretched(CHARACTERS[players[1].character][?"sprite"], -1, GW/115, GH/7, 115, 115);
}
offset += 150;
if (is_struct(players[2])) {
    drawWindow(GW/125+offset, GH/11, 135, 155, players[2].username);
	draw_sprite_stretched(CHARACTERS[players[2].character][?"sprite"], -1, GW/115 + offset, GH/7, 115, 115);
}
