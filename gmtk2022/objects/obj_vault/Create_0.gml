/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
my_health = 99999;
is_destructible = false;
drop_amount = 0;
input = true;
unloaded = false;

with instance_create_depth(bbox_right, bbox_bottom - TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = true;
	other.io = id;
}