/// @description bounce off this mfer
// You can write your code in this editor

x = xprevious
y = yprevious

var collision = {x: clamp(x, other.bbox_left, other.bbox_right), y: clamp(y, other.bbox_top, other.bbox_bottom)};

var dir = point_direction(collision.x,collision.y, x, y);
motion_add(dir + 180, vector_get_length_on_axis(speed, direction, dir) * 2)
if (dir > 45 && dir < 225){
	vspeed = min(vspeed, -5);
}
instance_create_layer((x + other.x) / 2, (y + other.y) / 2, "FX", obj_hit_small);


on_dice_bounce(self)

if other.object_index == obj_coin_pouch{

	sound_play_pitch(other.my_health > 1 ? snd_bag_hit : snd_bag_open, random_range(1.2, 1.4));

	repeat(4){
		with instance_create_layer(other.x, other.bbox_top - 13, "Instances", obj_coin){
			motion_set(random_range(70, 110), irandom_range(5, 8));
		}
	}	
	with other{
		sprite_index = spr_bag_hurt_a;
		image_index = 0;
	}
}


if other.is_destructible{
	other.my_health--;
	if other.my_health <= 0{
		instance_destroy(other);
	}
}

if other.object_index == obj_coin_pouch{
	roll_cuffs()
}

extraspeed = 0;