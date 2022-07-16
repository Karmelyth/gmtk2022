/// @description Insert description here
// You can write your code in this editor


if global.moneyLast != global.money {
	var dif = global.money - global.moneyLast;
	global.moneyLast += abs(dif/11) * sign(dif)
	if dif <= 25 {
		global.moneyLast = global.money
	}
	global.moneyLast = floor(global.moneyLast)
}