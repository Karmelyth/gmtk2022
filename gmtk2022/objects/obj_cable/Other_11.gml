/// @description Propagate STAY_ON
for(var i = 0; i < 4; i++){
	if outputs[i]{
		var d = 180 - 90 * i;
		with instance_place(x + lengthdir_x(TILE_MIN, d), y + lengthdir_y(TILE_MIN, d), obj_cable){
			if outputs[(i + 2) mod 4] STAY_ON = other.STAY_ON;
		}
	}
}
with instance_place(x, y, obj_iohelper){
	if input{
		if (other.active || other.STAY_ON) active = true;
		event_perform(ev_other, ev_user0);
	}
}
image_index = STAY_ON;