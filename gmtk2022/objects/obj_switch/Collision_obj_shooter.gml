/// @description Insert description here
// You can write your code in this editor
event_inherited();
other.hspeed *= -1;
if !active && other.dash_timer{	
	switch direction{
		case 0:
			if sign(other.hspeed) == 1  active = true;
			break;
		case 180:
			if sign(other.hspeed) == -1 active = true;
			break;
	}
	event_perform(ev_other, ev_user1);
}
other.hspeed *= -1;