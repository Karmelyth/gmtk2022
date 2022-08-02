/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < 4; i++){
	if outputs[i]{
		var d = 180 - 90 * i;
		with instance_place(x + lengthdir_x(TILE_MIN, d), y + lengthdir_y(TILE_MIN, d), obj_cable){
			if outputs[(i + 2) mod 4] active = other.active;
		}
	}
}
with instance_place(x, y, obj_iohelper){
	if input{
		active = other.active;
		event_perform(ev_other, ev_user0);
	}
}

image_blend = active ? c_lime : c_red;