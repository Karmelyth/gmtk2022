/// @description Stay inside board
// You can write your code in this editor
if !canmove exit;
if (instance_exists(obj_board)) {
	if bbox_bottom > obj_board.bbox_bottom{
		if (touchedBottom){
			if bbox_bottom > obj_board.bbox_bottom + 128{
					if object_index = obj_dice{
					scr_dice_land()
					instance_destroy()
					exit;
				}else{
					y = yprevious;
				}
			}
		}else{
			touchedBottom++;
			y = yprevious;
			vspeed = -3;
			on_dice_bounce(self);
			nograv = false
		}
	}
}

//True when bouncing
if stay_inside_board() {
	sound_play_pitch(snd_die_hit_wall, random_range(.9, 1.1))
	extraspeed = 0;
	nograv = false;
}

// When the dice explodes. Anti-softlock check
if image_blend = c_dkgray{
	if random(6) < 1{
		with(instance_create_layer(x, y, "Projectiles", obj_hit_medium)){
			x += random_range(-8,8);
			y += random_range(-8,8);
		}
	}
	nograv = false;
	portal = instance_place(x, y, portal)
}