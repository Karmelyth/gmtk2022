/// @description Insert description here

draw_sprite(spr_back, image_index, x, y);

var a = image_alpha;
if obj_board.obj_layer != obj_layer && obj_board.editor image_alpha = .5;
	draw_self();
image_alpha = a;

if blocking{
	if obj_board.obj_layer == obj_layer{
		draw_set_alpha(.35);
		draw_rectangle_color(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(1);
	
		gpu_set_fog(true, c_red, 0, 0);
		draw_sprite_ext(spr_back, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, .5);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, .5);
		gpu_set_fog(false, c_red, 0, 0);
	}
}