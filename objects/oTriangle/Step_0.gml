if (y > GH + (sprite_height * 2)) {
    instance_destroy();
}
if (dir == 0) {
    image_angle += spd;
}
if (dir == 1) {
    image_angle -= spd;
}
alpha = 1 - real(string("0.{0}", (((y / GH) * 18))));