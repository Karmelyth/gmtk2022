if (!obj_board.editor) draw_self()

draw_sprite(spr_portrait_frame, 0, x, y);

if (obj_board.editor){
	draw_sprite(obj_board.current_sprite, image_index, x, y);
		var i = obj_board,
			a = i.entity_list;
		draw_sprite(spr_turnable, !(array_length(a[i.entity_num]) > 1), bbox_right - 16, bbox_bottom - 16);
		a = i.entity_auto;
		draw_sprite(spr_automate, a[i.entity_num][i.entity_subnum], bbox_right - 16, bbox_bottom + 20);
}