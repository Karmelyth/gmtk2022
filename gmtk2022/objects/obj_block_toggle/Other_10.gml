/// @description Insert description here
// You can write your code in this editor
if active{
	sprite_index = spr_off;
	can_collide = false;
	depth += 20;
}else{
	sprite_index = spr_on;
	can_collide = true;
	depth -= 20;
}