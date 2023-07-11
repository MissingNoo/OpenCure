if(!surface_exists(surface)){
	surface = surface_create(sprite_get_width(sprite), sprite_get_height(sprite));	
}

surface_set_target(surface);
draw_clear_alpha(0,0);
draw_sprite(sprite, 0, 0, 0);
surface_reset_target();