{
	image_index = 0;
	if sprite_index == spr_popup_appear{
		sprite_index = spr_popup_loop;	
	}
	if sprite_index = spr_popup_end{
		instance_destroy();
		exit;
	}
}