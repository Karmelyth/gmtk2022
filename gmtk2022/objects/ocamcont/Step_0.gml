/// @description Insert description here
// You can write your code in this editor
image_alpha = (dev_enable && ds_map_find_value(dev, "cam"));

// Cam control:
if (!focus_object){
	
	hspeed += (button_check(key.right) - button_check(key.left)) * 3;
	vspeed += (button_check(key.down)  - button_check(key.up))   * 3;
}
speed = min(speed, maxspeed);