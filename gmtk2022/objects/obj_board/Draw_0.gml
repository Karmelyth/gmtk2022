{
	draw_self();
	if(editor){
		draw_text(camera_get_view_x(0) + 8, camera_get_view_y(0) + 8, 
		@"Mouse Wheel: Change brick
		Left Click: Place brick (hold Shift to place many)
		Right Click: Un-place brick (hold Shift to un-place many)
		Enter: Output to file
		Backspace: Close editor
		Space: Load an implemented level
		
		Copypaste the contents of output.txt and put it into global.levelData (in scrinit)
		The output is quite unholy, but we don't need it to NOT look unholy
		");
		var mx = (mouse_x div TILE_WIDTH) * TILE_WIDTH, my = (mouse_y div TILE_HEIGHT) * TILE_HEIGHT;
		mx -= (sprite_get_xoffset(entity_sprite[entity_num])) - sprite_get_width(entity_sprite[entity_num]); my -= (sprite_get_yoffset(entity_sprite[entity_num])) - sprite_get_height(entity_sprite[entity_num]);;
		draw_sprite(entity_sprite[entity_num],image_index,mx,my);
		if button_pressed(inputs.shoot) || (button_check(inputs.shoot) && keyboard_check(vk_shift)){
			if !collision_point(mx,my,entity_list[entity_num],0,1){
				instance_create_layer(mx,my,layer,entity_list[entity_num]);
			}
		}
		if button_pressed(inputs.menu_cancel) || (button_check(inputs.menu_cancel) && keyboard_check(vk_shift)){
			with(collision_point(mx,my,par_bricklike,0,1)){
				instance_destroy();
			}
		}
		if mouse_wheel_up(){
			entity_num --;
			if entity_num <= 0{
				entity_num = array_length(entity_list) - 1;	
			}
		}
		if mouse_wheel_down(){
			entity_num ++;
			if entity_num >= array_length(entity_list){
				entity_num = 0;	
			}
		}
		
		if keyboard_check_pressed(vk_enter){
			var _json = {}, i = 0;
			with(par_bricklike){
				variable_struct_set(_json, string(i), { "x" : x, "y" : y, "object_index" : object_index });
				i ++;
			}
			_json = json_stringify(_json);
			var file = file_text_open_write("output.txt");
			file_text_write_string(file, _json);
			file_text_close(file);	
		}
		if keyboard_check_pressed(vk_space){
			with(par_collectible) instance_destroy(self, false);
			with(par_bricklike) instance_destroy(self, false);
			level_load(0);
		}
		if keyboard_check_pressed(vk_backspace){
			editor = false;	
		}
	}
}