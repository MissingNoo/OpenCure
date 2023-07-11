///@desc tab images
var _window_pos = imguigml_get_window_pos(),
	_colouru32 = $ffffffff,
	_x1 = _window_pos[0] + 64,
	_y1 = _window_pos[1] + 100,
	_x2 = _x1 + 528,
	_y2 = _y1 + 528;


imguigml_drawlist_add_sprite(added_sprite, 0, _x1, _y1);
_y1 += sprite_get_height(added_sprite);
imguigml_drawlist_add_sprite(sprite, 0, _x1, _y1);
_y1 += sprite_get_height(sprite);

imguigml_drawlist_add_surface(surface, _x1, _y1); 
_y1 += sprite_get_height(sprite);
_x2 = _x1 + sprite_get_width(sprite);
_y2 = _y1 + sprite_get_height(sprite);

//Draws border to verify bounds
imguigml_drawlist_add_quad(                  _x1, _y1, _x2, _y1, _x2, _y2, _x1, _y2, _colouru32);
_y1 += sprite_get_height(sprite);
_x2 = _x1 + sprite_get_width(sprite);
_y2 = _y1 + sprite_get_height(sprite);
imguigml_drawlist_add_quad(                  _x1, _y1, _x2, _y1, _x2, _y2, _x1, _y2, _colouru32);
imguigml_drawlist_add_surface_quad(surface,  _x1, _y1, _x2, _y1, _x2, _y2, _x1, _y2);
