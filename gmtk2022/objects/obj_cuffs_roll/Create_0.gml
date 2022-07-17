/// @description Insert description here
// You can write your code in this editor

on_roll = function() {
	sprite_index = spr_roll_value
	image_index = global.cuffs_roll
	image_speed = 0
	with instance_create_depth(x, y, depth - 1, obj_brick_flash) {
		lifetime = 5
		currentLife = 5
		sprite_index = other.sprite_index
		image_index = other.image_index
		image_speed = 0
	}
}
