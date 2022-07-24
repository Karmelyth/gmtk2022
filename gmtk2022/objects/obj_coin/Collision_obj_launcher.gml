/// @description Insert description here
if image_blend = c_dkgray exit;
x = other.x;
y = other.y;

motion_set(other.direction, maxspeed)
instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_small);
other.sprite_index = spr_bumper_hit;
other.image_index = 0;
sound_play_pitch(snd_bumper_hit, random_range(.8, 1.2));

on_dice_bounce(self)