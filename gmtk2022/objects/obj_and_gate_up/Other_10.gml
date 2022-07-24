/// @description Insert description here
// You can write your code in this editor
var _a1 = in[0].active,
    _a2 = in[1].active;

active = false;
image_index = 0;

if _a1{image_index = 1}else if _a2{image_index = 2}
if _a1 && _a2{
	image_index = 3;
	active = true;
}
with out event_perform(ev_other, ev_user0);