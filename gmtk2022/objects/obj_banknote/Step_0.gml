
speed = clamp(speed, -maxspeed, maxspeed)

//Going down
if vspeed > 0 {
	gravity = gravity_base
	
	friction = 0;
	if !irandom(35) target_direction += irandom_range(10, 30) * choose(-1, 1);
	target_direction = clamp(target_direction, 270 - 55, 270 + 55);
	direction = lerp(direction, target_direction, .05);
	maxspeed = 1.3 * maxspeed_deviation;
}


//Going up
else {
	gravity = .15;
	friction = .1;
	maxspeed = 100;
}

if y > obj_shooter.bbox_bottom - 2 instance_destroy();