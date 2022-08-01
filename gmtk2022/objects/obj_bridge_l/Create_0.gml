/// @description Insert description here
event_inherited();
my_health = 99999;
is_destructible = false;
drop_amount = 0;
can_collide = false;
unloaded = false;
is_visible = false;
image_speed = 0;
image_index = 0;
image_xscale = 1;

input.x  = bbox_left + TILE_MIN / 2;
input.y  = y;
output.x = bbox_right - TILE_MIN / 2;
output.y = y;