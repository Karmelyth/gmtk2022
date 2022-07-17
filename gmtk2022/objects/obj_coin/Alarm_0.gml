/// @description Insert description here
// You can write your code in this editor

if object_index == obj_coin{
	if !irandom(39){
		with instance_create_depth(x, y, depth - 1, obj_coin_silver){
			direction = other.direction;
			speed = other.speed;
		}
	}
}