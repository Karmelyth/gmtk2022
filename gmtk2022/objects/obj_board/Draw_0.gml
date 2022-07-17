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
	}
}