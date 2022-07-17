// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function say_line(sound, _func = -1) {
	if variable_global_exists("elvis_sound"){
		audio_stop_sound(global.elvis_sound);
	}
	global.elvis_sound = sound_play_pitch(sound, 1)
	with obj_elvis {
		alarm[0] = room_speed * 30;
		whendonetalking = _func
		sprite_index = spr_elvis_talk_start
		if sound == vo_eat{
			sprite_index = spr_elvis_eat	
		}
		image_index = 0
	}
}

function getNextSprite (current_sprite) {
	switch (current_sprite) {
		case spr_elvis_talk_start:
			return spr_elvis_talk_loop
		case spr_elvis_talk_loop:
			if !elvis_is_speaking() {
				global.elvis_done = true
				return spr_elvis_talk_end
			}
			return spr_elvis_talk_loop
		case spr_elvis_eat:
			return spr_elvis_talk_loop;
		break;
		default:
			return spr_elvis_idle
	}
}

function elvis_is_speaking() {
	return audio_is_playing(global.elvis_sound)
}