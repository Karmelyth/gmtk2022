/// @description Insert description here
event_inherited();
direction = 180;
spr_on = spr_switch_r_off;
spr_off = spr_switch_r_on;

with instance_create_depth(bbox_right - TILE_MIN / 2, bbox_top + TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = false;
	other.output = id;
}
with instance_create_depth(bbox_right - TILE_MIN / 2, bbox_bottom - TILE_MIN / 2, depth - 1, obj_iohelper){
	creator = other;
	input = true;
	other.input = id;
}