/// @description Bounce off chip
// You can write your code in this editor


x = xprevious
y = yprevious

var dir = point_direction(other.x, other.y, x, y);
motion_add(dir, 1.2 * abs(vector_get_length_on_axis(other.speed, other.direction, dir)))
on_dice_bounce(self)
motion_add(90, speed * 0.125);

instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_medium);

instance_destroy(other)