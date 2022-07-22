/// @description Insert description here
// You can write your code in this editor
draw_self();
if blocking{
	draw_set_alpha(.35);
	draw_rectangle_color(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, c_red, c_red, c_red, c_red, false);
	draw_set_alpha(1);
	
	gpu_set_fog(true, c_red, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, .5);
	gpu_set_fog(false, c_red, 0, 0);
	
	//draw_rectangle_color(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, c_red, c_red, c_red, c_red, true);
}