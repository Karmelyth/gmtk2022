/// @description ONLY 2 PER BOARD PLEASE
if instance_exists(obj_board) {
	visible = false
	alarm[0] = manhatten_distance(x, y, obj_board.bbox_left, obj_board.bbox_top)/32
}
