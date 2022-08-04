/// @description Insert description here
// You can write your code in this editor
if input.active = true{
	active = true;
	with output event_perform(ev_other, ev_user0);
}else{
	active = false;
}
sprite_index = active ? spr_on : spr_off;
can_collide = !active;
can_output = true;