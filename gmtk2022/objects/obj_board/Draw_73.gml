if(editor){
	
	var _str =
	@"Welcome to the Level Editor!
	Controls:
	Mouse Wheel:       Change brick                             Q & E:  Change brick version
	Left Click:        Place brick (hold to place many)         N: New  Blank Level
	Right Click:       Un-place brick (hold to un-place many)   Enter:  Save level
	Up/Down Arrows:    Move level up/down                       Delete: Clear level
	Left/Right Arrows: Cycle through levels                     T:      Reload level from file
	Home:              Close editor
	",
	_str2 = "levelnamegoeshere" + "   " + string(global.level_num + 1) + "/" + string(array_length(global.levelData)) + "saved?"
	
	var _c = c_white;
	if global.level_changed[global.level_num] {
		_str2 = string_replace(_str2, "saved?", " (Unsaved Changes!!!)")
		_c = c_yellow;		
	}else _str2 = string_replace(_str2, "saved?", "")
	
	_str2 = string_replace(_str2, "levelnamegoeshere", current_level.info.name)
	
	draw_rectangle_color(camera_get_view_x(0), camera_get_view_y(0), camera_get_view_x(0) + string_width(_str) + 12, camera_get_view_y(0) + string_height(_str) + string_height(_str2) + 8, c_black, c_black, c_black, c_black, false)
	draw_text(camera_get_view_x(0) + 8, camera_get_view_y(0) + 8, _str);
	 
	draw_text_color(camera_get_view_x(0) + 8, camera_get_view_y(0) + string_height(_str) + 8, _str2, _c, _c, _c, _c, 1);
	
	_c = canplace ? c_lime : c_red;
	if(canplace){
		gpu_set_fog(true, _c, 0, 0);
		draw_sprite(current_sprite,image_index,mx - 1,my);
		draw_sprite(current_sprite,image_index,mx + 1,my);
		draw_sprite(current_sprite,image_index,mx,my - 1);
		draw_sprite(current_sprite,image_index,mx,my + 1);
		gpu_set_fog(false, _c, 0, 0);
	}else{
		gpu_set_fog(true, _c, 0, 0);
		draw_sprite(current_sprite,image_index,mx,my);
		gpu_set_fog(false, _c, 0, 0);
	}
	
	draw_set_alpha(.7);
	draw_sprite(current_sprite,image_index,mx,my);
	draw_set_alpha(1);
}