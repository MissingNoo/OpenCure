/// @description Insert description here
// You can write your code in this editor
y-=1.50;
image_alpha-=0.03;
if (image_alpha <= 0) {
    instance_destroy();
}
