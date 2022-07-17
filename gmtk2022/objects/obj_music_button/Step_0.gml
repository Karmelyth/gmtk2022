/// @description Insert description here
// You can write your code in this editor

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
	if button_pressed(inputs.menu_use) {
		image_index = playing
		if playing = true {
			audio_stop_sound(music)
		}
		else {
			music = audio_play_sound(snd_zeincore, 0, 1)
		}
		playing = !playing
	}
	image_blend = c_white
}
else image_blend = c_gray