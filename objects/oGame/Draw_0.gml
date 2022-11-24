/// @description Insert description here
// You can write your code in this editor
if (room == rInicio) {
	#region Lines
		var linesoff = 0;
		if (alarm_get(0) == -1) {
			alarm[0]=1;
		}
		for (var i = 0; i < 130; ++i) {
			draw_sprite_ext(menu_charselec_bar,0,linespos+linesoff,GH,1.5,2.15,0,c_white,.25);
			linesoff +=16;
		}	
	#endregion
}
