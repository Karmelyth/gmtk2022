/// @description Insert description here
if prev_active != active{
	event_perform(ev_other, ev_user0);
}
prev_active = active;

if prev_so != STAY_ON{
	event_perform(ev_other, ev_user1);
}
prev_so = STAY_ON;