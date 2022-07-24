/// @description Insert description here
event_inherited();
my_health = 99999;
is_destructible = false;
drop_amount = 0;
input = true;
can_collide = false;
unloaded = false;
image_speed = 0;
image_index = 0;

with instance_create_depth(x, bbox_top + TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = true;
	other.in = id;
}
with instance_create_depth(bbox_right - TILE_MIN / 2, y, depth - 1, obj_iohelper){
	creator = other;
	input = false;
	other.out[0] = id;
}
with instance_create_depth(bbox_left + TILE_MIN / 2, y, depth - 1, obj_iohelper){
	creator = other;
	input = false;
	other.out[1] = id;
}
with instance_create_depth(x, bbox_bottom - TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = false;
	other.out[2] = id;
}