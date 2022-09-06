// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_self_at(_x, _y) {
	var lastx = x, lasty = y;
	x = _x
	y = _y
	draw_self()
	x = lastx
	y = lasty
}