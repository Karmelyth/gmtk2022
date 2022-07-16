/// @description Insert description here
// You can write your code in this editor

scr_movement()


gunangle = point_direction(x, y, mouse_x, mouse_y);
if gunangle > 180{
	if gunangle > 270{
		gunangle = 0;	
	}else gunangle = 180;
}

//image_xscale = ((gunangle + 270) % 360) < 180 ? -1 : 1;
//image_angle = gunangle - 90;

if button_pressed(inputs.shoot) && gunangle > 0 && gunangle < 180 {
	//Shoot chips
	if instance_exists(obj_dice) {
		with instance_create_layer(x, y, "Projectiles", obj_chip) {
			motion_set(other.gunangle, 15)
		}
		sound_play_pitch(choose(snd_chip_throw1, snd_chip_throw2), 1)
		sprite_index = sprite_list[3];
		image_index = 0;
	}
	//Shoot dice
	else {
		with instance_create_layer(x, y, "Projectiles", obj_dice) {
			motion_set(other.gunangle, 18)
		}
		sound_play_pitch(snd_die_throw, 1)
		sprite_index = sprite_list[1];
		image_index = 0;
	}
}

if instance_exists(obj_dice){
	nodice_timer = 45;	
}else{
	if(nodice_timer && !--nodice_timer) && sprite_index != sprite_list[0]{
		sprite_index = sprite_list[0];	
	}
}