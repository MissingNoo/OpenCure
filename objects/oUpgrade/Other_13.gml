var _size = sprite_get_width(sprite_index);
instance_create_depth(x + irandom_range(-_size, _size), y + irandom_range(-_size, _size), depth - 1, oEldritchFX);
dAlarm[3] = irandom(100);