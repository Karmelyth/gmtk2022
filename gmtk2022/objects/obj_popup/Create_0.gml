if(obj_board.editor){instance_destroy(); exit}

var _xmargin = TILE_MIN * 8,
    _ymargin = TILE_MIN * 8;

x = clamp(x, obj_board.bbox_left + _xmargin, obj_board.bbox_right - _xmargin);
y = clamp(y, obj_board.bbox_top + _ymargin, obj_board.bbox_bottom - _ymargin);

var _xoff = 272/4, _yoff = 80;
with(instance_create_layer(x - _xoff, y + _yoff, "Portraits", obj_prompt)){
	creator = other.id;
	prompt_type = 0; // Yes
	on_pick = function(){
		if global.money >= 100{
			say_line(choose(vo_buysandwich01, vo_buysandwich02, vo_buysandwich03, vo_buysandwich04), function() {
				schedule(5, function() {
					say_line(vo_eat, function() {
						schedule(5, function() {
							sound_play_pitch(snd_double, 1.5);	
						})
					})			
				})
			})
			global.money -= 100;
		}
	}
}
with(instance_create_layer(x + _xoff, y + _yoff, "Portraits", obj_prompt)){
	creator = other.id;
	prompt_type = 1; // Yes
	on_pick = -1;
}
