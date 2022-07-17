{
	//alarm[0] = 1;
	image_index = irandom(image_number);
}
my_health = 1;
is_destructible = true;
drop_chance = 29;
drop_amount = 1;
nexthurt = current_time;
if instance_exists(obj_board) {
	visible = false
	alarm[0] = manhatten_distance(x, y, obj_board.bbox_left, obj_board.bbox_top)/32
}

if random(40) < 1 && object_index == obj_block{
	instance_create_layer(x,y,"Instances",obj_super_block);
	drop_chance = 0;
	instance_destroy();
}