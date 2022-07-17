{
	if mask_index == msknone{
		exit;	
	}
	with(other){
		on_dice_bounce(id)	
	}
	mask_index = msknone;
	sound_play_pitch(snd_bumper_hit, random_range(0.8,1.2));
	with(obj_prompt){
		mask_index = msknone;
		sprite_index = spr_prompt_disappear;
	}
	sprite_index = spr_prompt_disappear;
	try{
		on_pick();	
	}catch(_error){
		//	
	}
}