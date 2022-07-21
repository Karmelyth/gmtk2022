/// @description Drop mone

if irandom(99) < drop_chance{
	repeat(drop_amount){
		 with instance_create_layer(x, y, "Instances", obj_coin){
			motion_set(random_range(60, 120), irandom_range(3, 5));
			if !place_meeting(x, y, par_bricklike) instance_destroy(self, false);
		}
	}
}