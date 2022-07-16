{
	draw_self()
	if sprite_index = sprite_list[0] {
		draw_dice_preview(x, y, gunangle);
		draw_sprite(spr_dice_idle, -1, x, y);
	}
}
