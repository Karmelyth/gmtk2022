/// @description Insert description here
event_inherited();

active = false;
sprite_index = active ? spr_on : spr_off;
can_collide = !active;
can_output = true;