/// @description Insert description here
// You can write your code in this editor

if object_index == obj_coin{
	var _delete = false;
	if !irandom(29){
		with instance_create_depth(x, y, depth - 1, obj_coin_silver){
			direction = other.direction;
			speed = other.speed;
			_delete = true;
		}
	}else if !irandom(29){
		with instance_create_depth(x, y, depth - 1, obj_coin_gold){
			direction = other.direction;
			speed = other.speed;
			_delete = true;
		}
	}
}