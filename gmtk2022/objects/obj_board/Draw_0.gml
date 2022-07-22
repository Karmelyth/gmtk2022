/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_board_bg, 0, x, y, (image_xscale - 12/TILE_MIN) * 2/3, (image_yscale - 12/TILE_MIN) * 2/3, image_angle, image_blend, image_alpha)
draw_self();
draw_sprite_ext(spr_board_border, 0, x, y, 1, 1, image_angle, image_blend, image_alpha)

//Editor grid
if(editor){
	
	var _c = c_black,
	    _w = 1,
		_a = 1;
	//Vertical lines
	for(var i = 0; i < ((bbox_right - bbox_left - TILE_MIN * 2) / TILE_MIN) + 1; i++){
		_c = i ==  12 || i ==  34 ? c_navy : (i == 23 ? c_blue : c_black);
		_w = _c != c_black || i == 0 || i == 46 ? 2 : 1;
		_a = i mod 2 != 0 && _c == c_black ? .3 : .6;
		draw_set_alpha(_a);
		draw_line_width_color(
						bbox_left + TILE_MIN * i + TILE_MIN - 1, 
						bbox_top + TILE_MIN - 1, 
						bbox_left + TILE_MIN * i + TILE_MIN - 1, 
						bbox_bottom - TILE_MIN + 2,
						_w, _c, _c);
	}
	//Horizontal lines
	for(var i = 0; i < ((bbox_bottom - bbox_top - TILE_MIN * 2) / TILE_MIN) + 1; i++){
		_c = i == 9 || i == 25 ? c_maroon : (i == 17 ? c_red : c_black);
		_w = _c != c_black || i == 0 || i == 34 ? 2 : 1;
		_a = i mod 2 != 0 && _c == c_black ? .3 : .6;
		draw_set_alpha(_a);
		draw_line_width_color(
						bbox_left + TILE_MIN - 1,
						bbox_top + TILE_MIN * i + TILE_MIN - 1,
						bbox_right - TILE_MIN + 2,
						bbox_top + TILE_MIN * i + TILE_MIN - 1,
						_w, _c, _c);
	}
	draw_set_alpha(1);
}