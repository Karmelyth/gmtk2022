/// @description Insert description here
// You can write your code in this editor

if my_health <= 1{
	if sprite_index != spr_bomb_lit{
		sprite_index = spr_bomb_lit;
		sound_play_pitch(snd_fuse, 1);	
	}
}