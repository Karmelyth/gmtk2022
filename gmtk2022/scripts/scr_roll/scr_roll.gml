// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function roll_cuffs() {
	global.cuffs_roll = irandom(5)
	with obj_cuffs_roll on_roll()
}

function roll_house() {
	global.house_roll = irandom(5)
	if global.house_roll == 5 {global.house_roll = irandom(5)}
	with obj_dice_display on_roll()
}