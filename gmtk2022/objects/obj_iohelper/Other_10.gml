/// @description Insert description here
if !input{
	active = creator.active;
	with instance_place(x, y, obj_cable){
		active = other.active;
	}
}else{
	// IM FUCKING PISSED
	if (place_meeting(x, y, obj_cable) && instance_place(x, y, obj_cable).STAY_ON == true){
		ACTIVE = true;
	}

	creator.active = active
	with creator event_perform(ev_other, ev_user0);
}