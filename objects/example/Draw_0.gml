///@desc Example - Draw

if (!instance_exists(imgui)) {
  draw_set_color($F36EB2);
  var s = 2;
  var helpText = "Press [SPACE] to start ImGui!";
  var tw = string_width(helpText) * s,
      th = string_height(helpText) * s;
  var tx = floor((room_width - tw) * 0.5),
      ty = room_height - (th * 3);
  draw_text_transformed(tx, ty, helpText, s, s, 0);
}

//if (!surface_exists(Surface)) {
//	Surface = surface_create(sprite_get_width(doggo), sprite_get_height(doggo));
//	surface_set_target(Surface)
//	draw_clear_alpha(c_black, 0);
//	draw_sprite(doggo, 0, 0, 0);
//	surface_reset_target();
//}