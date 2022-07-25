/// @description bounce off this mfer
// You can write your code in this editor
if !other.can_collide || other == portal exit;

var makeParticle = (point_distance(x, y, xprevious, yprevious)) >= speed;

x = xprevious
y = yprevious

sound_play_pitch(snd_coin_quiet, 1.4 * random_range(.8, 1.3));

var collision = {x: clamp(x, other.bbox_left, other.bbox_right), y: clamp(y, other.bbox_top, other.bbox_bottom)};

var dir = point_direction(collision.x,collision.y, x, y);
motion_add(dir, vector_get_length_on_axis(speed, direction, dir + 180) * 2 * .97)

if vspeed < 0 vspeed = min(vspeed, -4);

var block = instance_place(x, y, par_bricklike),
    i = 50;
while(i > 0 && instance_exists(block)){
	i--;
	var dir2 = point_direction(block.x, block.y, x, y);
	x += lengthdir_x(4, dir2);
	y += lengthdir_y(4, dir2);
	xprevious += lengthdir_x(4, dir2);
	yprevious += lengthdir_y(4, dir2);
	block = instance_place(x, y, par_bricklike);
}

if makeParticle with instance_create_layer(collision.x, collision.y, "FX", obj_hit_small){
	image_xscale *= .75;
	image_yscale *= .75;
}