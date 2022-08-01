/// @description Insert description here
// You can write your code in this editor
event_inherited();
if !active{	
	switch direction{
		case 0:
			if sign(other.hspeed) == 1  active = true;
			break;
		case 90:
			if sign(other.vspeed) == 1  active = true;
			break;
		case 180:
			if sign(other.hspeed) == -1 active = true;
			break;
		case 270:
			if sign(other.vspeed) == -1 active = true;
			break;
	}
	event_perform(ev_other, ev_user1);
}