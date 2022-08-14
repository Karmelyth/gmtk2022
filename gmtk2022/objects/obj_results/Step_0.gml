/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_fade_from) {
	if money != global.money {
		var dif = global.money - money;
		money += abs(dif/20) * sign(dif)
		if abs(dif) <= 25 {
			money = global.money
			
			if money >= (60000 + 6000) alarm[1] = room_speed * 2;
		}
		money = floor(money)
	}
}