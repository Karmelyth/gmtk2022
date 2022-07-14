/// @description Set up vars

// ONLY 1 CAM OBJECT AT ONCE PLEASE

// Camera setup:
cam_width  = 400;
cam_height = 400;
view_camera[0] = camera_create_view(
0, // starting x pos
0, // starting y pos
cam_width, // width
cam_height, // height
0, // angle
self, // object to follow
-1, -1, 0, 0
)
alarm[0] = 1;

// Screenshake:
shake = 0; // Screenshake value
shake_reduction = 3; // Amount wich screenshake is reduced by

// Camera focus points:
camera_speed = .1; // Interpolation speed between current cam pos and goal cam pos
cam_focus_points = ds_list_create(); // List of lwos to use for position interpolation
#macro cam_points oCam.cam_focus_points
mouse_weight = 25; // weight of mouse position

// Zoom:
zoom = 1;
zoom_progress = 1;
zoom_step = 4;
zoom_speed = .1;

with instance_create_depth(room_width / 2, room_height / 2, 0, oCamCont){

	cam_add_object(1000, self);
}