/// @description Insert description here
// You can write your code in this editor
repeat(3){
	with instance_create_layer(x, y, "Instances", obj_coin){
		motion_set(90, irandom_range(5, 8));
		hspeed += other.hspeed / 2;
	}
}