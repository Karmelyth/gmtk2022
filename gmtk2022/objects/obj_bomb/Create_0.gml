/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
my_health = 2;
drop_chance = 0;
with instance_create_depth(bbox_right - TILE_MIN / 2, bbox_bottom - TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = true;
	other.io = id;
}