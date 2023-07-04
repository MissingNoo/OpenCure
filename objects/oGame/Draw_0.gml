if (room == rInicio or room == rLobby) {
	#region Lines
		var linesoff = 0;
		if (alarm_get(0) == -1) {
			alarm[0]=1;
		}
		for (var i = 0; i < 130; ++i) {
			draw_sprite_ext(menuCharselectBar,0,linespos+linesoff,display_get_gui_height()+60,1.5,2.15,0,c_white,.25);
			linesoff +=16;
		}	
	#endregion
}
