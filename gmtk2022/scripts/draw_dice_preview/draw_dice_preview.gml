// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function draw_dice_preview(_x, _y, gunangle) {
	draw_set_alpha(.8)
	with instance_create_layer(_x, _y, layer, obj_fx) {
		mask_index = spr_dice_hit
		image_angle = 0
		
		bounciness = .8
		gravity_base = .26
		gravity = gravity_base
		//friction = .03
		maxspeed = 14
		portal = noone

		motion_set(gunangle, 18)
		
		var points = [{"x": x, "y":y}];
		
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
			
			//if (tries mod 2 == 1) {
			//	draw_line_width_color(x, y, xLast, yLast, 3, c_white, c_white)
			//}
			
			//xLast = x
			//yLast = y
			
			var dist = point_distance(xLast, yLast, x, y);
			while dist >= 10 {
				var dir = point_direction(xLast, yLast, x, y);
				xLast += lengthdir_x(min(dist, 10), dir)
				yLast += lengthdir_y(min(dist, 10), dir)
				array_push(points, {"x": xLast, "y": yLast})
				dist = point_distance(xLast, yLast, x, y);
				//xLast = x
				//yLast = y
			}
			
			//Collisions
			var brick = instance_place(x, y, par_bricklike);
			if instance_exists(brick) && brick.can_collide{
				if instance_is(brick, obj_portal) {
					var tpX = x, tpY = y;
					if brick.teleport(self) {
						if array_length(points) mod 2 == 1 {
							array_push(points, {"x": tpX, "y": tpY})
						}
						array_push(points, {"x": x, "y": y})
						xLast = x
						yLast = y
					}
				}
				else {
					break;
				}
			}
			
			//End Step
			if stay_inside_board() {
				break;
			}
			
		}
		
		array_push(points, {"x": x, "y":y})
		
		for (var i = 1; i < array_length(points); i += 2) {
			draw_line_width_color(points[i].x, points[i].y, points[i - 1].x, points[i - 1].y, 3, c_white, c_white)
		}
		
		draw_circle_color(x, y, 5, c_white, c_white, true)
		draw_set_alpha(1)
		
		instance_destroy()
	}
}