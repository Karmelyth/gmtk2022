/// @description Insert description here
event_inherited();
direction = 0;
spr_on = spr_switch_l_off;
spr_off = spr_switch_l_on;

with instance_create_depth(bbox_left + TILE_MIN / 2, bbox_bottom - TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = false;
	other.output = id;
}