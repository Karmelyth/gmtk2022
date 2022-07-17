// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_box_over_screen(alpha) {
	var bottom = camera_get_view_y(camera_get_active()) + view_get_hport(view_current),
		top = camera_get_view_y(camera_get_active()),
		left = camera_get_view_x(camera_get_active()),
		right = camera_get_view_x(camera_get_active()) + view_get_wport(view_current);
	
	draw_set_alpha(alpha)
	draw_rectangle_color(left, top, right, bottom, 0, 0, 0, 0, false)
	draw_set_alpha(1)
}