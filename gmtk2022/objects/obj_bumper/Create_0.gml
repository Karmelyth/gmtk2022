/// @description Insert description here
// You can write your code in this editor

image_index = irandom(image_number);

if instance_exists(obj_board) {
	visible = false
	alarm[0] = manhatten_distance(x, y, obj_board.bbox_left, obj_board.bbox_top)/32
}