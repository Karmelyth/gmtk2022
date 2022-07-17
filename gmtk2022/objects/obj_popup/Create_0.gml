{
	var _xoff = 272/4, _yoff = 80;
	with(instance_create_layer(x - _xoff, y + _yoff, "Portraits", obj_prompt)){
		creator = other.id;
		prompt_type = 0; // Yes
		on_pick = function(){
			say_line(vo_eat, -1);	
		}
	}
	with(instance_create_layer(x + _xoff, y + _yoff, "Portraits", obj_prompt)){
		creator = other.id;
		prompt_type = 1; // Yes
		on_pick = -1;
	}
}