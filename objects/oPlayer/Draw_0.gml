/// @description Insert description here	
// You can write your code in this editor
draw_self();
if (damaged) {
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_purple,1)
}
draw_sprite_ext(Arrow,0,x,y,.5,.5,arrow_dir,c_red,1);
draw_rectangle_color(x-30,y-10,(x-30)+global.hp,y-12,c_green,c_green,c_green,c_green,false)
draw_text(x,y-20,atk)

/*
//draw_text_transformed(x,y-20,coords[0][?"x"],.5,.5,1)
if (ds_list_size(coordsx) > 0) {
	c = ds_list_size(coordsx);
	for (var i = 0; i < c; ++i) {
		a=oPlayer.x + ds_list_find_value(coordsx,i)
		b=oPlayer.y + ds_list_find_value(coordsy,i)
		draw_circle(a,b,5,1)
	}
}

//draw_circle(x+10,y,5,1)
//draw_circle(x,y-10,5,1)
//draw_circle(x+7,y-7,5,1)



