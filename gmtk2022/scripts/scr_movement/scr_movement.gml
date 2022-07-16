// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_movement(){

	var acceleration = 1,
		maxspeed = 6;

	if button_check(inputs.left) {
		hspeed -= acceleration
	}
	else if button_check(inputs.right) {
		hspeed += acceleration
	}
	speed = clamp(speed, -maxspeed, maxspeed)
}