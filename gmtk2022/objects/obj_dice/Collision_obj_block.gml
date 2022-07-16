/// @description bounce off this mfer
// You can write your code in this editor

var collision = {x: clamp(x, other.bbox_left, other.bbox_right), y: clamp(y, other.bbox_top, other.bbox_bottom)};

motion_set(point_direction(collision.x,collision.y, x, y), speed * (bounciness))

on_dice_bounce(self)

instance_destroy(other)	