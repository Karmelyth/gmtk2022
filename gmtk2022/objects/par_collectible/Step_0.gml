/// @description Move Towards Player
// You can write your code in this editor

if instance_exists(obj_shooter) {
	if distance_to_object(obj_shooter) < 26 {
		move_towards_point(obj_shooter.x, obj_shooter.y, 6)
	}
}


