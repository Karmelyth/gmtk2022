/// @description Insert description here
// You can write your code in this editor

scr_movement()


gunangle = point_direction(x, y, mouse_x, mouse_y);
image_angle = gunangle - 90;

if button_pressed(inputs.shoot) && gunangle > 0 && gunangle < 180 {
	//Shoot chips
	if instance_exists(obj_dice) {
		with instance_create_layer(x, y, "Projectiles", obj_chip) {
			motion_set(other.gunangle, 15)
		}
	}
	//Shoot dice
	else {
		with instance_create_layer(x, y, "Projectiles", obj_dice) {
			motion_set(other.gunangle, 18)
		}
	}
}