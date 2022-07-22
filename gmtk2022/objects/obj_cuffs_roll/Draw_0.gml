if (!obj_board.editor) draw_self()

draw_sprite(spr_portrait_frame, 0, x, y);

if (obj_board.editor){
	draw_sprite(obj_board.current_sprite, image_index, x, y);
		draw_sprite(spr_turnable, !(array_length(obj_board.entity_list[obj_board.entity_num]) > 1), bbox_right - 16, bbox_bottom - 16);
}