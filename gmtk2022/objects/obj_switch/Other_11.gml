/// @description Insert description here

if !active{	
	switch direction{
		case 0:
			if sign(other.hspeed) == 1 active = !active;
			break;
		case 90:
			if sign(other.vspeed) == 1  active = !active;
			break;
		case 180:
			if sign(other.hspeed) == -1 active = !active;
			break;
		case 270:
			if sign(other.vspeed) == -1  active = !active;
			break;
	}
	with output{event_perform(ev_other, ev_user0)}
}
sprite_index = active ? spr_on : spr_off;
can_collide = !active;