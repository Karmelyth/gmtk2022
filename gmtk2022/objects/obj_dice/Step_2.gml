/// @description Stay inside board
// You can write your code in this editor

if (instance_exists(obj_board)) {
	if bbox_bottom > obj_board.bbox_bottom{
		if (touchedBottom){
			if bbox_bottom > obj_board.bbox_bottom + 128{
				scr_dice_land()
				instance_destroy()
				exit;
			}
		}else{
			touchedBottom = true;
			y = yprevious;
			vspeed = -2;
			on_dice_bounce(self);
		}
	}
}

//True when bouncing
if stay_inside_board() {
	sound_play_pitch(snd_die_hit_wall, random_range(.9, 1.1))
	extraspeed = 0;
}