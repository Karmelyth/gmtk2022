// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function draw_dice_preview(_x, _y, gunangle) {
	draw_set_alpha(.8)
	with instance_create_layer(_x, _y, layer, obj_fx) {
		mask_index = spr_dice_hit
		image_angle = 0
		
		bounciness = .8
		gravity_base = .25
		gravity = gravity_base
		friction = .03
		maxspeed = 16

		motion_set(gunangle, 18)
		
		var tries = 0,
			xLast = x,
			yLast = y;
		while (tries++ <= 200) {
			if tries != 1 {
				speed = clamp(speed, -maxspeed, maxspeed)
			
				//Going down
				if vspeed > 0 {
					gravity = gravity_base/1.2
				}
				//Going up
				else {
					gravity = gravity_base
				}
			}
			
			//Step Movement
			if(friction != 0 && speed != 0){
			    speed -= min(abs(speed), friction) * sign(speed);
			}
			if(gravity != 0){
			    hspeed += lengthdir_x(gravity, gravity_direction);
			    vspeed += lengthdir_y(gravity, gravity_direction);
			}
			if(speed != 0){
			    x += hspeed;
			    y += vspeed;
			}
			
			if (tries mod 2 == 1) {
				draw_line_width_color(x, y, xLast, yLast, 3, c_white, c_white)
			}
			
			xLast = x
			yLast = y
			
			//Collisions
			if place_meeting(x, y, par_bricklike) {
				break;
			}
			
			//End Step
			if stay_inside_board() {
				break;
			}
			
		}
		
		draw_circle_color(x, y, 5, c_white, c_white, true)
		draw_set_alpha(1)
		
		instance_destroy()
	}
}