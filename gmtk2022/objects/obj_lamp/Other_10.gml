/// @description Insert description here
if always_on active = true;
if active{
	sprite_index = spr_on;
}else{
	sprite_index = spr_off;
}
with output event_perform(ev_other, ev_user1);