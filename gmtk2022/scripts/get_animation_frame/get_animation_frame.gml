// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_animation_frame(framecount) {
	var n = (1000 / game_speed) * 6;
	return floor((current_time mod (n * (framecount)))/n)
}