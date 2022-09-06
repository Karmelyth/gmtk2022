/// @description bounce off this mfer
// You can write your code in this editor
if !other.can_collide || other == portal exit;

//var makeParticle = (point_distance(x, y, xprevious, yprevious)) >= speed;
var makeParticle = (point_distance(x, y, lastcollision.x, lastcollision.y)) > speed;
lastcollision.x = x; lastcollision.y = y

x = xprevious
y = yprevious


var collision = {x: clamp(x, other.bbox_left, other.bbox_right), y: clamp(y, other.bbox_top, other.bbox_bottom)};

var dir = point_direction(collision.x,collision.y, x, y);
motion_add(dir, vector_get_length_on_axis(speed, direction, dir + 180) * 2 * .97)

if vspeed < 0 && (abs(hspeed/vspeed) < .8) vspeed = min(vspeed, -4);

//I don't give a shit.
with par_logiclike if !can_collide x += 10000

x += hspeed
y += vspeed
if place_meeting(x, y, obj_block) {
	var	n = 0,
		found = false,
		escapedir = dir;
	while (n < 5) {
		n++
		for (var w = -n; w <= n; w += 1) {
			for (var f = -1; f <= 1; f += 2) {
				var h = (n - abs(w)) * f;
			
				if !instance_exists(instance_position(x + TILE_WIDTH * w, y + TILE_HEIGHT * h, obj_block)) {
					escapedir = point_direction(x, y, x + TILE_WIDTH * w, y + TILE_HEIGHT * h)
					found = true
					break
				}
			
				if h == 0 break
			}
			if found break
		}
		if found break
	}
	if found {
		x += lengthdir_x(6, escapedir)
		y += lengthdir_y(6, escapedir)
		xprevious += lengthdir_x(6, escapedir)
		yprevious += lengthdir_y(6, escapedir)
	}
}
x -= hspeed
y -= vspeed

//Put them back
with par_logiclike if !can_collide x -= 10000


if makeParticle with instance_create_layer(collision.x, collision.y, "FX", obj_hit_small){
	image_xscale *= .75;
	image_yscale *= .75;
	sound_play_pitch(snd_coin_quiet, 1.4 * random_range(.8, 1.3));
}