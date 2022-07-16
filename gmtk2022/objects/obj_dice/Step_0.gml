
speed = clamp(speed, -maxspeed, maxspeed)

//Going down
if vspeed > 0 {
	gravity = gravity_base/1.2
}
//Going up
else {
	gravity = gravity_base
}
if (hit_timer && !--hit_timer){
	image_speed = clamp(0, image_speed - 1, 4);
	if(image_speed){
		hit_timer = 10;	
	}
}


/*//Landing on the ground
if y >= obj_shooter.y || landed{
	speed = 0;
	y = obj_shooter.y;
	landed = true;
}

//Decide rolled value
if landed{
	image_speed = 0;
}*/