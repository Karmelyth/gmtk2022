/// @description Insert description here
event_inherited();
spr_on = spr_lamp_on;
spr_off = spr_lamp;
my_health = 99999;
is_destructible = false;
can_collide = false;
input = true;
image_speed = 0;
image_index = 0;

with instance_create_depth(bbox_right - TILE_MIN / 2, bbox_bottom - TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = true;
	other.io = id;
}