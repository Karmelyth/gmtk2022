/// @description bounce off this mfer
// You can write your code in this editor

if (abs(x - xprevious) + abs(y - yprevious)) > 4{
	instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_small);
}

x = xprevious
y = yprevious

var collision = {x: clamp(x, other.bbox_left, other.bbox_right), y: clamp(y, other.bbox_top, other.bbox_bottom)};
sound_play_pitch(snd_coin_quiet, 1.4 * random_range(.8, 1.3));
var dir = point_direction(collision.x,collision.y, x, y);
motion_add(dir + 180, vector_get_length_on_axis(speed, direction, dir) * 2)
if other.bbox_bottom <= bbox_top vspeed = -7;
move_outside_all(dir, 8)