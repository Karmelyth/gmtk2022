/// @description Insert description here
if !input{
	active = creator.active;
	with instance_place(x, y, obj_cable){
		active = other.active;
	}
}else{
	creator.active = active
	with creator event_perform(ev_other, ev_user0);
}