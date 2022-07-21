/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_board_bg, 0, x, y, (image_xscale - 12/TILE_MIN) * 2/3, (image_yscale - 12/TILE_MIN) * 2/3, image_angle, image_blend, image_alpha)
draw_self();
draw_sprite_ext(spr_board_border, 0, x, y, 1, 1, image_angle, image_blend, image_alpha)
