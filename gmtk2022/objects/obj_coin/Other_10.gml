/// @description Board bottom collision
y = min(y, obj_board.bbox_bottom-sprite_height/2);
hspeed /= 2;
vspeed = board_bottom_bounce;
landed = true;