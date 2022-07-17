/// @description Insert description here
// You can write your code in this editor
{
	if (dash_timer){
		with(other){
			instance_create_layer(x, y, "FX", obj_hit_large)
			vspeed = -11;
			on_dice_bounce(self);
		}
		dash_timer = 0;
	}
}