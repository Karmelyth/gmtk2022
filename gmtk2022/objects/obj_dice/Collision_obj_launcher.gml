/// @description Insert description here
// You can write your code in this editor

/// @description bounce off this mfer
// You can write your code in this editor
if image_blend = c_dkgray exit;
x = xprevious
y = yprevious

var dir = point_direction(other.x, other.y, x, y);
motion_set(dir, min(speed + 3, 18))
move_outside_all(dir, 8)
instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_small);
other.sprite_index = spr_bumper_hit;
other.image_index = 0;
extraspeed = 3;
sound_play_pitch(snd_bumper_hit, random_range(.8, 1.2));

on_dice_bounce(self)
