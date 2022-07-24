event_inherited();
image_index = irandom(image_number);
my_health = 1;
is_destructible = true;
drop_chance = 19;
drop_amount = 1;
nexthurt = current_time;
if instance_exists(obj_board) {
	visible = false
	alarm[0] = obj_board.editor ?  1 : manhatten_distance(x, y, obj_board.bbox_left, obj_board.bbox_top)/32
}

if random(60) < 1 && !obj_board.editor && object_index == obj_block{
	instance_create_layer(x,y,"Instances",obj_super_block);
	drop_chance = 0;
	instance_destroy();
}
image_xscale = choose(-1, 1);