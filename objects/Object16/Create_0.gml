randomize();
image_xscale = 3.75;
image_yscale = 3.75;
color = make_color_rgb(irandom(255),irandom(255),irandom(255));
y = irandom_range(GH/2, GH-32);
for (var i = 0; i < Enemies.lenght; ++i) {
    array_push(global.sprites, EnemyList[i][?"sprite"]);
}
do {
    sprite = global.sprites[irandom_range(1, array_length(global.sprites)-1)];
} until (sprite != undefined);
sprite_index = sprite;
x = 0-sprite_get_width(sprite_index);
speed = irandom_range(3,5);
alarm[0] = irandom_range(1,100);

