/// @description Viewport setup
view_visible[0] = true;
view_enabled = true;
var _relation = window_get_width() / window_get_height();
view_set_wport(view_current, cam_width / _relation);
view_set_hport(view_current,cam_height / _relation);