/// @description Insert description here
// You can write your code in this editor

if bbox_top > camera_get_view_y(camera_get_active()) + view_get_hport(view_current) {
	instance_destroy()
}