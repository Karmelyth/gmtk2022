/// @description Insert description here
// You can write your code in this editor

randomize()
global.money = 6000
global.moneyLast = 0

global.payout = 0
global.payoutLast = 0

global.cuffs_roll = 0
global.house_roll = 0

global.rounds = 0
global.round = -1
global.levels = ds_list_create()
for (var i = 0; i < array_length(global.levelData); i++) {
	ds_list_add(global.levels, i)
}
ds_list_shuffle(global.levels)

delays = ds_list_create()

schedule(120, function() {
	start_round()
})

global.elvis_sound = -1
alarm[0] = room_speed * 30;