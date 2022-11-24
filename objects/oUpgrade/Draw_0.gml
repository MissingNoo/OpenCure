switch (upg[?"name"]) {
	default:
		draw_self();
		if (global.debug) {
		    draw_text(x,y-30, string(alarm_get(1)));
			draw_text(x,y-60, string(upg[?"duration"]));
		}		
		break
}


