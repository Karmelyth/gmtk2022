/// @description Insert description here
// You can write your code in this editor
switch sprite_index {
	default: sprite_index = spr_vault_idle; break;
	case spr_vault_idle_open: case spr_vault_opening: sprite_index = spr_vault_idle_open; break;
}
