/// @description Insert description here
// You can write your code in this editor


global.money = 5000
global.moneyLast = 0

global.payout = 0
global.payoutLast = 0

global.cuffs_roll = 0
global.house_roll = 0

global.round = 0

delays = ds_list_create()

schedule(120, function() {
	start_round()
})

global.elvis_sound = -1