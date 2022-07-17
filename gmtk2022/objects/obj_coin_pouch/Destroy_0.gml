/// @description Insert description here
// You can write your code in this editor
repeat(16){
	with instance_create_layer(x, y, "Instances", obj_coin){
		motion_set(random_range(60, 120), irandom_range(7, 12));
	}
}