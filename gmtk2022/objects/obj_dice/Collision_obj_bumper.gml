/// @description Insert description here
// You can write your code in this editor

/// @description bounce off this mfer
// You can write your code in this editor

x = xprevious
y = yprevious

var collision = {x: clamp(x, other.bbox_left, other.bbox_right), y: clamp(y, other.bbox_top, other.bbox_bottom)};

var dir = point_direction(collision.x,collision.y, x, y);
motion_set(dir, min(speed + 4, 24))
instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_small);
other.sprite_index = spr_bumper_hit;
other.image_index = 0;

on_dice_bounce(self)
