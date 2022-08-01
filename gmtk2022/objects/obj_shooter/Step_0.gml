/// @description Insert description here
// You can write your code in this editor
scr_movement()


gunangle = point_direction(x, y, mouse_x, mouse_y);
if gunangle > 180{
	if gunangle > 270{
		gunangle = 0;	
	}else gunangle = 180;
}

//image_xscale = ((gunangle + 270) % 360) < 180 ? -1 : 1;
//image_angle = gunangle - 90;
var _editor = false,
	inBoard = false;
if instance_exists(obj_board){
	_editor = obj_board.editor;	
	inBoard = point_in_rectangle(mouse_x, mouse_y, obj_board.bbox_left, obj_board.bbox_top, obj_board.bbox_right, obj_board.bbox_bottom)
}
if button_pressed(inputs.shoot) && gunangle > 0 && gunangle < 180 && !(_editor) && can_shoot && inBoard {
	//Shoot chips
	if instance_exists(obj_dice) {
		//Zone where chips cannot be shot to stop people from wasting chips
		if (abs(obj_dice.y - obj_board.bbox_bottom) >  55) && global.money > 100 {
			with instance_create_layer(x, y, "Projectiles", obj_chip) {
				motion_set(other.gunangle, 16)
				global.money -= 100
			}
			sound_play_pitch(choose(snd_chip_throw1, snd_chip_throw2), 1)
			sprite_index = spr_hand_thanos_snap;
			image_index = 0;
			with obj_cuffs {
				sprite_index = spr_cuffs_shoot
				image_index = 0
			}
		}
	}
	//Shoot dice
	else {
		with instance_create_layer(x, y, "Projectiles", obj_dice) {
			motion_set(other.gunangle, 18)
		}
		sound_play_pitch(snd_die_throw, 1)
		sprite_index = spr_hand_cast;
		has_dice = false
		image_index = 0;
		start_play()
		with obj_cuffs {
			sprite_index = spr_cuffs_shoot
			image_index = 0
		}
	}
}

// Dash
var _input = button_check(inputs.right) - button_check(inputs.left)
if mouse_check_button_pressed(mb_right) && dash_timer <= 10 && _input != 0{
	dash_timer = 20;
	dash_direction = _input;
	sound_play_pitch(choose(snd_dash1, snd_dash2), 1);
	if !has_dice{
		sprite_index = spr_hand_dash;
		image_index = 0;
	}
}
if (--dash_timer){
	with instance_create_depth(x, random_range(bbox_top, bbox_bottom), depth + 1, obj_dash){
		image_speed *= random_range(.9, 1.2);
		motion_add(other.direction, random(1) * -1);
	}
	hspeed = sign(dash_direction) * 15;
}

//Portal reset
if portal > -4 && !place_meeting(x, y, portal)portal = -4;