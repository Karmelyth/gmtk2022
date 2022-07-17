/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_fade_from) {
	if money != global.money {
		var dif = global.money - money;
		money += abs(dif/20) * sign(dif)
		if abs(dif) <= 25 {
			money = global.money
		}
		money = floor(money)
	}
}