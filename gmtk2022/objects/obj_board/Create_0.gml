/// @description hiii obj_board
// You can write your code in this editor

//width = 600
//height = 700

//image_xscale = width/(bbox_right - bbox_left)
//image_yscale = height/(bbox_bottom - bbox_top)

editor = false;
canplace = true;
entity_num = 0;
entity_subnum = 0;
current_entity = obj_block;
current_sprite = msknone;
obj_layer = 0;
entity_list = [
/*Bricks*/    [obj_block, obj_block_v], [obj_block_large, obj_block_large_v], [obj_block_metal, obj_block_metal_v],
/*Money*/     [obj_cash_wad], [obj_coin_pouch], [obj_vault],
/*Movement 1*/[obj_bumper],
/*Movement 2*/[obj_portal, obj_portal_1, obj_portal_2, obj_portal_3, obj_portal_4, obj_portal_5],
/*Movement 3*/[obj_launcher_u, obj_launcher_ul, obj_launcher_l, obj_launcher_dl, obj_launcher_d, obj_launcher_dr, obj_launcher_r, obj_launcher_ur],
/*Explosives*/[obj_super_block, obj_super_block_v], [obj_bomb],
/*Logic 1*/	  [obj_switch_on_d, obj_switch_on_r, obj_switch_on_u, obj_switch_on_l, obj_switch_off_d],
/*Logic 2*/	  [obj_cable_h, obj_cable_v, obj_cable_ld, obj_cable_lu, obj_cable_ru, obj_cable_rd],
/*Logic 3*/   [obj_and_gate_up, obj_and_gate_down], [obj_splitter], [obj_block_toggle, obj_block_toggle_off],
/*Ball*/      [obj_ball]
];
entity_auto = [
[0, 0], [0, 0], [0, 0],
[0], [0], [1],
[0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0],
[0, 0], [0],
[2, 2, 2, 2, 2],
[3, 3, 3, 3, 3, 3],
[3, 3], [3], [1, 1],
[0]
];
entity_sprite = [
[spr_handblock, spr_handblock_v], [spr_handblock_big, spr_handblock_big_v], [spr_handblock_metal, spr_handblock_metal_v],
[spr_cash_wad], [spr_bag_idle_a], [spr_vault_idle],
[spr_bumper],
[spr_portal_back_purple, spr_portal_back_yellow, spr_portal_back_orange, spr_portal_back_green, spr_portal_back_blue, spr_portal_back_gray],
[spr_launcher_2, spr_launcher_3, spr_launcher_4, spr_launcher_5, spr_launcher_6, spr_launcher_7, spr_launcher_0, spr_launcher_1],
[spr_evil_block, spr_evil_block_v], [spr_bomb],
[spr_switch_d_on, spr_switch_r_on, spr_switch_u_on, spr_switch_l_on, spr_switch_d_off],
[spr_cable_lr, spr_cable_ud, spr_cable_ld, spr_cable_lu, spr_cable_ru, spr_cable_rd],
[spr_gate_and_u, spr_gate_and_d], [spr_splitter_u], [spr_handblock_toggle, spr_handblock_toggle_off],
[spr_ball]
];

mx = 0;
my = 0;