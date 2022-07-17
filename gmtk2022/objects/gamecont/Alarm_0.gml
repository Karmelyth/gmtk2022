{
	
	if !elvis_is_speaking() && !instance_exists(obj_fade_to){
		var _snd = choose(vo_chatter01, vo_chatter02, vo_chatter03, vo_chatter04, vo_chatter05, vo_chatter06, vo_chatter07, vo_chatter08);
		say_line(_snd, -1);
	}
	alarm[0] = room_speed * random_range(15, 45);
}