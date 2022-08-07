// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_animation_frame(framecount) {
	var n = 1000 / room_speed * 10;
	return round((current_time mod n * (framecount - 1))/n)
}