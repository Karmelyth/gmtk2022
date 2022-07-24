/// @description Insert description here
// You can write your code in this editor
switch sprite_index {
	default: sprite_index = spr_bag_idle_a; break;
	case spr_bag_hurt_a: case spr_bag_idle_b: sprite_index = spr_bag_idle_b; break;
	case spr_bag_hurt_b: case spr_bag_idle_c: sprite_index = spr_bag_idle_c; break;
}
