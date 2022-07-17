{
	//alarm[0] = 1;
	image_index = irandom(image_number);
}
my_health = 1;
is_destructible = true;
drop_chance = 29;
drop_amount = 1;
if instance_exists(obj_board) {
	visible = false
	alarm[0] = manhatten_distance(x, y, obj_board.bbox_left, obj_board.bbox_top)/32
}