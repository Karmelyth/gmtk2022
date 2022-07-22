/// @description Insert description here
// You can write your code in this editor
if !instance_exists(target){instance_destroy(self, false); exit}
var _s = speed;
motion_add(point_direction(x, y, target.x, target.y),speed * .1);
speed = _s;