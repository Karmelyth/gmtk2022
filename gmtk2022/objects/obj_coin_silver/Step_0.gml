/// @description Insert description here

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

//Landing on the ground
if bbox_bottom >= obj_board.bbox_bottom || landed{
	y = min(y, obj_board.bbox_bottom - (bbox_bottom - y + 10)) - 1;
	landed = true;
}
if bbox_bottom >= obj_board.bbox_bottom - 6{
	y = yprevious;
	hspeed /= 2;
	gravity = .5;
	vspeed = -8;
	landed = true;
}

//FX
if !irandom(40 - (speed > 0) * 25){
	with instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), "Instances", obj_sparkle){
		depth = other.depth + choose(-1, 1);
	}
}
//Portal reset
if portal > -4 && !place_meeting(x, y, portal){
	portal = -4;
}
//Decide rolled value 
if landed{
	fade--;
	var _frequency = 7;
	if fade <= _frequency * 5{
		image_alpha = (fade mod _frequency >= (_frequency / 2));
	}
	if fade <= 0{
		instance_destroy();
		exit;
	}
}else{
	fade = round(room_speed * 1.5);
}
