/// @description Insert description here
// You can write your code in this editor
switch sprite_index {
	default: sprite_index = spr_vault_idle; break;
	case spr_vault_idle_open: case spr_vault_opening: sprite_index = spr_vault_idle_open; break;
}

if !unloaded && sprite_index == spr_vault_idle_open{
	unloaded = true;
	image_index = 0;
	
	repeat(4){
		with instance_create_layer(x, y, "Instances", obj_coin){
			motion_set(random_range(30, 150), irandom_range(3, 5));
			portal = other;
		}
	}
	repeat(4){
		with instance_create_layer(x, y, "Instances", obj_coin_silver){
			motion_set(random_range(60, 120), irandom_range(4, 6));
			portal = other;
		}
	}
	repeat(2){
		with instance_create_layer(x, y, "Instances", obj_coin_gold){
			motion_set(random_range(70, 110), irandom_range(5, 7));
			portal = other;
		}
	}
	repeat(6){
		with instance_create_layer(x, y, "Instances", obj_banknote){
			motion_set(random_range(40, 140), irandom_range(7, 10));
			depth -= 4;
		}
	}
	repeat(2){
		with instance_create_layer(x, y, "Instances", obj_gold_bar){
			motion_set(random_range(40, 140), irandom_range(4, 7));
			depth -= 4;
			portal = other;
		}
	}
}