{
	draw_self()
	if has_dice {
		draw_dice_preview(x, y, gunangle);
		draw_sprite(spr_dice_idle, -1, x, y);
	}
}
