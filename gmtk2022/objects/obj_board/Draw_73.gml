if(editor){
	
	var _str =
	@"Mouse Wheel: Change brick   Q & E: Change brick version
	Left Click: Place brick (hold to place many)
	Right Click: Un-place brick (hold to un-place many)
	Enter: Save level
	N: New Blank Level     T: Reload level from file
	Home: Close editor     Delete: Clear level
	Left/Right Arrows: Cycle through levels
	
	levelnamegoeshere" + "   " + string(global.level_num + 1) + "/" + string(array_length(global.levelData))
	
	if global.level_changed[global.level_num] {
		_str = string_replace(_str, "Save level", "Save level (Unsaved Changes!)")
	}
	_str = string_replace(_str, "levelnamegoeshere", current_level.info.name)
	
	draw_rectangle_color(camera_get_view_x(0), camera_get_view_y(0), camera_get_view_x(0) + string_width(_str), camera_get_view_y(0) + string_height(_str) + 8, c_black, c_black, c_black, c_black, false)
	draw_text(camera_get_view_x(0) + 8, camera_get_view_y(0) + 8, _str);
	
	var _c = canplace ? c_lime : c_red;
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