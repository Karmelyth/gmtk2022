var _str = @"Mouse Wheel: Change brick
	Left Click: Place brick (hold Shift to place many)
	Right Click: Un-place brick (hold Shift to un-place many)
	Enter: Output to file
	Backspace: Close editor
	Space: Load an implemented level
		
	Copypaste the contents of output.txt and put it into global.levelData (in scrinit)
	The output is quite unholy, but we don't need it to NOT look unholy"
if(editor){
	draw_rectangle_color(camera_get_view_x(0), camera_get_view_y(0), camera_get_view_x(0) + string_width(_str), camera_get_view_y(0) + string_height(_str) + 8, c_black, c_black, c_black, c_black, false)
	draw_text(camera_get_view_x(0) + 8, camera_get_view_y(0) + 8, _str);
	
	var _c = canplace ? c_lime : c_red;
	gpu_set_fog(true, _c, 0, 0);
	draw_sprite(entity_sprite[entity_num],image_index,mx - 1,my);
	draw_sprite(entity_sprite[entity_num],image_index,mx + 1,my);
	draw_sprite(entity_sprite[entity_num],image_index,mx,my - 1);
	draw_sprite(entity_sprite[entity_num],image_index,mx,my + 1);
	gpu_set_fog(false, _c, 0, 0);
	
	draw_set_alpha(.7);
	draw_sprite(entity_sprite[entity_num],image_index,mx,my);
	draw_set_alpha(1);
}