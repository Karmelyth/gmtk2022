// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro brick_height 16
#macro brick_width 32

function fill_with_blocks(x1, y1, x2, y2){
	for (var _x = x1; _x < x2; _x += brick_width) {
		for (var _y = y1; _y < y2; _y += brick_height) {
			var gridX = brick_width * (_x div brick_width),
				gridY = brick_height * (_y div brick_height);
			with instance_create_layer(gridX, gridY, "Instances", obj_block) {
				alarm[0] = -1
			}
		}
	}
}