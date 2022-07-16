/// @description Stay inside board
// You can write your code in this editor

//True when bouncing
if stay_inside_board() {
	sound_play_pitch(snd_die_hit_wall, random_range(.9, 1.1))
}