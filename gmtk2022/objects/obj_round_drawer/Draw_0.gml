/// @description Insert description here
// You can write your code in this editor


draw_self()
draw_sprite(spr_round_indicator, 0, x + 4, y)
draw_sprite(spr_numbers, get_number_index(string(global.round + 1)), x + 28, y + 1)