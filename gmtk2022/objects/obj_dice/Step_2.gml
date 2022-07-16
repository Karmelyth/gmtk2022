/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_board)) {
	if bbox_bottom > obj_board.bbox_bottom {
		scr_dice_land()
		instance_destroy()
		exit
	}
}

stay_inside_board()