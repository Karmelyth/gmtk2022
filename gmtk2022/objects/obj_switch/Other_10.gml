/// @description deactivate on input
// You can write your code in this editor
active = !active;
if input.ACTIVE{
	active = true;
	can_output = true;
}
event_perform(ev_other, ev_user1)