/// @description Insert description here
event_inherited();
my_health = 99999;
is_destructible = false;
drop_amount = 0;
input = true;
can_collide = false;
unloaded = false;
image_xscale = 1;
image_speed = 0;
image_index = 0;

in[0].x = bbox_left + TILE_MIN / 2;
in[0].y = bbox_bottom - TILE_MIN / 2;
in[1].x = bbox_left + TILE_MIN / 2;
in[1].y = bbox_top + TILE_MIN / 2;
out.x = bbox_right - TILE_MIN / 2;
out.y = y;