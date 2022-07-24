/// @description Insert description here
// You can write your code in this editor
if sprite_index != spr_vault_idle_open sprite_index = spr_vault_opening;
if !unloaded && sprite_index == spr_vault_idle_open{
	unloaded = true;
	image_index = 0;
	
	repeat(16){
		with instance_create_layer(x, y, "Instances", obj_coin){
			motion_set(random_range(60, 120), irandom_range(7, 12));
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
		}
	}
}