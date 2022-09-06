/// @description Insert description here
// You can write your code in this editor


if global.moneyLast != global.money {
	var dif = global.money - global.moneyLast;
	global.moneyLast += abs(dif/20) * sign(dif)
	if abs(dif) <= 25 {
		global.moneyLast = global.money
	}
	global.moneyLast = floor(global.moneyLast)
}

if global.payoutLast != global.payout {
	var dif = global.payout - global.payoutLast;
	global.payoutLast += abs(dif/5) * sign(dif)
	if abs(dif) <= 25 {
		global.payoutLast = global.payout
	}
	global.payoutLast = floor(global.payoutLast)
}

if !instance_exists(obj_fullclear_maker) {
	//Check queue for active voiceline
	var voice = get_voiceline_queue().top();

	//If there is nothing in the queue, or if the voiceline is unimportant, keep progressing.
	if (is_undefined(voice) || !voice.important) {
		for (var i = 0; i < ds_list_size(delays); i++) {
			var o = delays[| i];
			o.time -= 1;
			if o.time <= 0 {
				o.func()
				ds_list_delete(delays, i)
				i--
			}
		}
	}
}