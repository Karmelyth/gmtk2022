/// @description Insert description here
// You can write your code in this editor

with instance_create_layer(x, y - 8, layer, object_index) {
	alarm[0] = -1
	//image_yscale = .5
}
with instance_create_layer(x, y + 8, layer, object_index) {
	alarm[0] = -1
	//image_yscale = .5
}
instance_destroy()