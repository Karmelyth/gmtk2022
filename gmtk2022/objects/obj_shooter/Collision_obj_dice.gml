/// @description Insert description here
// You can write your code in this editor
{
	if (dash_timer){
		with(other){
			instance_create_layer(x, y, "FX", obj_hit_large)
			vspeed = -11;
			hspeed = sign(other.hspeed) * 2;
			sound_play_pitch(choose(snd_dash_hit1, snd_dash_hit2), random_range(.9, 1.1));
			on_dice_bounce(self);
		}
		dash_timer = 0;
	}
}