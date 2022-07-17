/// @description Insert description here
// You can write your code in this editor


image_index = 0
if sprite_index == spr_logo_end {
	with instance_create_layer(x, y, layer, obj_fade_to) {
		destination = main_menu
	}
	image_alpha = 0
}
if sprite_index == spr_logo_loop {
	if loops > 0 {
		loops -= 1
	}
	else {
		sprite_index = spr_logo_end
	}
}
if sprite_index = spr_logo_start {
	sprite_index = spr_logo_loop
}
