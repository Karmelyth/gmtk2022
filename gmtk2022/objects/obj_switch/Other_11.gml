/// @description Do output stuff
if can_output with output{event_perform(ev_other, ev_user0)}
sprite_index = active ? spr_on : spr_off;
can_collide = !active;
can_output = true;