{
	image_index = 0;
	if sprite_index == spr_prompt_appear{
		sprite_index = prompt_type == 0 ? spr_prompt_yes : spr_prompt_no;
		if !instance_exists(creator){
			sprite_index = spr_prompt_disappear;	
		}
	}
	if sprite_index = spr_prompt_yes || sprite_index = spr_prompt_no{
		if !instance_exists(creator) sprite_index = spr_prompt_disappear;	
	}
	if sprite_index = spr_prompt_disappear{
		if instance_exists(creator){
			creator.sprite_index = spr_popup_end;
			creator.image_index = 0;
		}
		instance_destroy();
		exit;
	}
}