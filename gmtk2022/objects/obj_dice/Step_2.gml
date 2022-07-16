/// @description Stay inside board
// You can write your code in this editor

if (instance_exists(obj_board)) {
	if bbox_bottom > obj_board.bbox_bottom {
		scr_dice_land()
		instance_destroy()
		exit
	}
}

//True when bouncing
if stay_inside_board() {
	sound_play_pitch(snd_die_hit_wall, random_range(.9, 1.1))
}