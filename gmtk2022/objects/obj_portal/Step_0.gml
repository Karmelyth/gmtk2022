/// @description Insert description here

if !irandom(19) with instance_create_depth(x + random_range(32, 64) * choose(-1, 1), y + random_range(32, 64) * choose(-1, 1), depth -1, obj_portal_fx){
	image_speed *= random_range(.8, 1);
	motion_set(point_direction(x, y, other.x, other.y), .5 + random(1));	
}