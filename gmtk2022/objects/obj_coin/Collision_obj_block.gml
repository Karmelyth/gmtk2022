/// @description bounce off this mfer
// You can write your code in this editor

var makeParticle =  (abs(x - xprevious) + abs(y - yprevious)) > speed;

x = xprevious
y = yprevious

sound_play_pitch(snd_coin_quiet, 1.4 * random_range(.8, 1.3));

var collision = {x: clamp(x, other.bbox_left, other.bbox_right), y: clamp(y, other.bbox_top, other.bbox_bottom)};

var dir = point_direction(collision.x,collision.y, x, y);
motion_add(dir, vector_get_length_on_axis(speed, direction, dir + 180) * 2)

if makeParticle instance_create_layer(collision.x, collision.y, "FX", obj_hit_small);

move_outside_all(dir, 8)