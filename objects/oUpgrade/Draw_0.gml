switch (upg[?"name"]) {
    case "Flying Knife":
		if (image_xscale == 1) {
		    draw_sprite_ext(sprite_index,0,x-5,y,1,1,0,c_white,.75);
			draw_sprite_ext(sprite_index,0,x-10,y,1,1,0,c_white,.5);
			draw_sprite_ext(sprite_index,0,x-15,y,1,1,0,c_white,.15);
		}
		else {
		    draw_sprite_ext(sprite_index,0,x+5,y,-1,1,0,c_white,.75);
			draw_sprite_ext(sprite_index,0,x+10,y,-1,1,0,c_white,.5);
			draw_sprite_ext(sprite_index,0,x+15,y,-1,1,0,c_white,.15);
		}
		draw_self();
        break;
	default:
		draw_self();
		break
}

