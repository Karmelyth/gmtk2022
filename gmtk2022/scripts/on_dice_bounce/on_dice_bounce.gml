// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function on_dice_bounce(dice){
//	dice.vspeed -= 2
	dice.hit_timer = 30;
	dice.sprite_index = spr_dice_hit;
	dice.image_index += choose(1,1,2);
	dice.image_speed += 0.5;
	sound_play_pitch(snd_die_hit_peg, random_range(0.8, 1.2));
}