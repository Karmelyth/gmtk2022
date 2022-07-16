// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_outside_board(){
	if !instance_exists(obj_board) return false
	
	if bbox_left < obj_board.bbox_left {
		return true
	}
	if bbox_right > obj_board.bbox_right {
		return true
	}
	if bbox_top < obj_board.bbox_top {
		return true
	}
	if bbox_bottom > obj_board.bbox_bottom {
		return true
	}
}