/// @description Insert description here
// You can write your code in this editor

/// @description bounce off this mfer
// You can write your code in this editor

x = xprevious
y = yprevious

motion_set(point_direction(other.x, other.y, x, y), min(speed + 4, 24))
instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_small);
other.sprite_index = spr_bumper_hit;
other.image_index = 0;

on_dice_bounce(self)
