// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_money(_x, _y, moneyString) {

	var xsaved = _x;
	
	_x += 50
	draw_sprite(spr_money_back, 0, _x, _y)
	
	_x += 48 * (5 - string_length(moneyString))


	for (var i = 1; i <= string_length(moneyString); i++) { // Fixed
		draw_sprite(spr_numbers, get_number_index(string_char_at(moneyString, i)), _x + (48 * (i - 1)), _y)
	}
	
	draw_sprite(spr_dollar, get_animation_frame(2), xsaved, _y)
}

function draw_profit(_x, _y, moneyString) {

	var xsaved = _x;
	
	_x += 50
	draw_sprite(spr_money_back, 0, _x, _y)
	
	_x += 48 * (5 - string_length(moneyString))


	var color = (string_count("-", moneyString) ? c_red : c_lime)
	for (var i = 1; i <= string_length(moneyString); i++) { // Fixed
		draw_sprite_ext(spr_numbers_white, get_number_index(string_char_at(moneyString, i)), _x + (48 * (i - 1)), _y, 1, 1, 0, color, 1)
	}
	
	draw_sprite(spr_profits, 0, xsaved, _y)
}

function draw_payout(_x, _y, moneyString) {

	var xsaved = _x;
	_x += 30
	draw_sprite(spr_money_back, 0, _x, _y)
	_x += 48 * (5 - string_length(moneyString))
	for (var i = 1; i <= string_length(moneyString); i++) { // Fixed
		draw_sprite(spr_numbers, get_number_index(string_char_at(moneyString, i)), _x + (48 * (i - 1)), _y)
	}
	draw_sprite(spr_chips, get_animation_frame(2), xsaved, _y)
}

function get_number_index(str) {
	switch(str) {
		case "k": return 10
		case "-": return 11
		default: return floor(real(str))
	}
}

function get_short_money(money) {
	if money >= 100000 {
		money /= 1000
		money = floor(money)
		return string(money) + "k"
	}
	return string(money)
}