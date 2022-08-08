/// @description Insert description here
// You can write your code in this editor
sound_play_pitch(snd_cash_wad_hit, random_range(.9, 1.1));
repeat(5){
	with instance_create_layer(x, y, "Instances", obj_banknote){
		motion_set(random_range(40, 140), irandom_range(7, 10));
		depth -= 4;
	}
}