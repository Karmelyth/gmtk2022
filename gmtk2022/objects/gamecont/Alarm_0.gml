{
	
	if !elvis_is_speaking() && !instance_exists(obj_fade_to){
		var _snd = choose(vo_chatter01, vo_chatter02, vo_chatter03, vo_chatter04, vo_chatter05, vo_chatter06, vo_chatter07, vo_chatter08,
						  vo_chatter09, vo_chatter10, vo_chatter11, vo_chatter12, vo_chatter13, vo_chatter14, vo_chatter15, vo_chatter16,
						  vo_chatter17, vo_chatter18, vo_chatter19, vo_chatter20, vo_chatter21, vo_chatter22, vo_chatter23, vo_chatter24,
						  vo_chatter25, vo_chatter26, vo_chatter27, vo_chatter28, vo_chatter29, vo_chatter30, vo_chatter31);

		if !irandom(99) _snd = choose(vo_chatter_rare01, vo_chatter_rare02, vo_chatter_rare03, vo_chatter_rare04, vo_chatter_rare05, vo_chatter_rare06, vo_chatter_rare07, vo_chatter_rare08);
		say_line(_snd, -1);
	}
	alarm[0] = room_speed * random_range(15, 45);
}