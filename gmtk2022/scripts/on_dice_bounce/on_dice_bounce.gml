// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function on_dice_bounce(dice){
//	dice.vspeed -= 2
	dice.hit_timer = 30;
	dice.sprite_index = dice.spr_hit;
	dice.image_index += choose(1,1,2);
	dice.image_speed += 0.5;
	with(dice) if patience_enable{
		if last_bounce_patience_frame < current_time{
			if point_distance(x,y,last_bounce_coords[0],last_bounce_coords[1]) < TILE_WIDTH{
				var _last_patience = last_bounce_patience
				last_bounce_patience --;
				last_bounce_patience_frame = current_time + 1000;
				if last_bounce_patience <= 8 && _last_patience > 8{
					var _snd = choose(vo_impatient01,vo_impatient02,vo_impatient03,vo_impatient04,vo_impatient05);
					say_line(_snd, -1);
				}
				if last_bounce_patience <= 0{
					mask_index = msknone;
					sound_play_pitch(snd_bag_hit, 0.5);
					image_blend = c_dkgray;
					repeat(6){
						with(instance_create_layer(x, y, "Projectiles", obj_hit_medium)){
							x += random_range(-8,8);
							y += random_range(-8,8);
							direction = point_direction(xstart,ystart,x,y);
							speed = random(2);
						}
					}
					if _last_patience > 0{
						say_line(vo_impatient04,-1);	
					}
				}
			}else last_bounce_patience = min(16,last_bounce_patience);
		}
		last_bounce_coords = [x, y];
	}
}