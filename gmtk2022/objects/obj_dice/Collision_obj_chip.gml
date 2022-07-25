/// @description Bounce off chip
// You can write your code in this editor

if image_blend = c_dkgray exit;
x = xprevious
y = yprevious

var dir = point_direction(other.x, other.y, x, y);
motion_add(dir, 1.2 * (vector_get_length_on_axis(other.speed, other.direction, dir)))
on_dice_bounce(self)
motion_add(90, speed * 0.125);
vspeed = min(vspeed, -9);
nograv = false;
sound_play_pitch(snd_die_hit_peg, random_range(0.8, 1.2));

instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_medium);

instance_destroy(other)