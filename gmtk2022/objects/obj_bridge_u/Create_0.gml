/// @description Insert description here
event_inherited();
my_health = 99999;
is_destructible = false;
drop_amount = 0;
input = true;
can_collide = false;
unloaded = false;
is_visible = false;
image_speed = 0;
image_index = 0;
image_xscale = 1;

with instance_create_depth(x, bbox_top + TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = true;
	other.input = id;
}
with instance_create_depth(x, bbox_bottom - TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = false;
	other.output = id;
}
