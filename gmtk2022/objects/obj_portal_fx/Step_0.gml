/// @description Insert description here
// You can write your code in this editor
if !instance_exists(target){instance_destroy(self, false); exit}
var n = 2.4;
if last_index != floor(image_index*n)/n {
	last_index = floor(image_index*n)/n
	var _s = speed;
	motion_add(point_direction(x, y, target.x, target.y), speed);
	speed = _s;
}