/// @description Set camera position

var _x = 0,
    _y = 0,
	_weight = 0;

// Mouse position:
_x += mouse_x * mouse_weight;
_y += mouse_y * mouse_weight;
_weight += mouse_weight;

// Instance position(s);
for(var i = 0; i < ds_list_size(cam_points); i++){
	var _point = cam_points[| i];
		
	if (instance_exists(_point.inst)){
		// Instance based addition:
		_x += (_point.inst.x + _point.inst.hspeed) * _point.wght;
		_y += (_point.inst.y + _point.inst.vspeed) * _point.wght;
		_weight += _point.wght;
	}else{
		// Remove struct:
		delete cam_points[| i];
		ds_list_delete(cam_points, i);
	}
}

_x /= _weight;
_y /= _weight;

// Set camera position:
if (_weight > 0){
	
	x = lerp(x, _x, camera_speed);
	y = lerp(y, _y, camera_speed);
}
camera_set_view_pos(view_camera,
x + random_range(-shake / 2, shake / 2) - cam_width / 2 * zoom,
y + random_range(-shake / 2, shake / 2) - cam_height / 2 * zoom
);

// Screenshake handling: 
shake -= shake_reduction;
shake = max(shake, 0);

// Zoom:
zoom_progress = clamp(zoom_progress + (mouse_wheel_down() - mouse_wheel_up()) * (1 / zoom_step), 1, 2);
zoom = lerp(zoom, zoom_progress, zoom_speed);

// Dev:
image_alpha = (dev_enable && ds_map_find_value(dev, "cam"));
