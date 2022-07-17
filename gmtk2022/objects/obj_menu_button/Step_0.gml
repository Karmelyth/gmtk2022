/// @description Insert description here
// You can write your code in this editor


if !clicked {
	if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
		if button_pressed(inputs.menu_use) {
			clicked = true
			image_index = 1
			image_blend = c_white
			with instance_create_layer(x, y, "Portraits", obj_fade_to) {
				destination = intro_room
			}
			audio_stop_sound(ambience)
		}
		image_blend = c_white
	}
	else image_blend = c_gray
}