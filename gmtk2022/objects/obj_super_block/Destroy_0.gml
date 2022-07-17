event_inherited();
sound_play_pitch(snd_bag_hit, 0.5);
for(var i = 0;i<=30;i++){
	for(var o = -1;o<=1;o+=2){
		with(instance_create_layer(x + (TILE_WIDTH * i * o), y, "Projectiles", obj_hit_medium)){
			image_angle = random(360);
			stay_inside_board();
			with(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_block,0,1)){
				if is_destructible && nexthurt <= current_time{
					my_health--;
					nexthurt = current_time + 5;
					if my_health <= 0{
						instance_destroy();
					}
				}
			}
		}
	}
}