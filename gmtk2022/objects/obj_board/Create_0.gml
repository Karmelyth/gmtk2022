/// @description hiii obj_board
// You can write your code in this editor

//width = 600
//height = 700

//image_xscale = width/(bbox_right - bbox_left)
//image_yscale = height/(bbox_bottom - bbox_top)

editor = false;
canplace = true;
entity_list = [
obj_block, obj_block_v,
obj_block_large, obj_block_large_v,
obj_block_metal, obj_block_metal_v,
obj_cash_wad, obj_coin_pouch, obj_vault,
obj_bumper, obj_portal,
obj_super_block, obj_super_block_v, obj_bomb
];
entity_num = 0;
entity_sprite = [
spr_handblock, spr_handblock_v,
spr_handblock_big, spr_handblock_big_v, 
spr_handblock_metal, spr_handblock_metal_v,
spr_cash_wad, spr_bag_idle_a, spr_vault_idle,
spr_bumper, spr_portal,
spr_evil_block, spr_evil_block_v, spr_bomb
];
mx = 0;
my = 0;