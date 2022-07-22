/// @description Insert description here

if !irandom(12) with instance_create_depth(x + random_range(32, 64) * choose(-1, 1), y + random_range(32, 64) * choose(-1, 1), depth -1, obj_portal_fx){
	image_speed *= random_range(.3, .8);
	target = other;
	motion_set( point_direction(x, y, other.x, other.y) + 90, .5 + random(1));
}