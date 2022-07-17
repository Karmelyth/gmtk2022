// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro BUY_IN 1000
function start_play(){
	global.money -= BUY_IN
	global.payout += BUY_IN * 2
	roll_cuffs()
}

function end_round() {
	
	with obj_shooter can_shoot = false
	//Cuffs wins, payout
	if global.cuffs_roll > global.house_roll {
		global.money += global.payout
		global.payout = 0
	}
	//Cuffs loses, wipe payout
	if global.cuffs_roll < global.house_roll {
		global.payout = 0
	}
	//Double or nothing, next round retains this one's payout
	if global.cuffs_roll == global.house_roll {
		
	}
	
	with obj_cuffs_roll {
		with instance_create_depth(x, y, depth - 1, obj_brick_flash) {
			sprite_index = other.sprite_index
			image_index = other.image_index
			image_speed = 0
		}
		sprite_index = spr_none
		image_index = 0
	}
	
	schedule(30, function() {start_round()})
}

function start_round() {
	if global.money > BUY_IN {
		
		if ++global.round == 4 {
			global.round = 0
			make_new_board()
		}
		
		roll_house()
		
		schedule(80, function() {
			with obj_shooter {
				has_dice = true
				can_shoot = true
			}
		})
	}
}

function make_new_board() {
	with par_bricklike {
		clear_item()
	}
	with par_collectible {
		clear_item()
	}
	with obj_bumper {
		clear_item()
	}
	
	
}

function clear_item() {
	with instance_create_depth(x, y, depth - 1, obj_brick_flash) {
		sprite_index = other.sprite_index
		image_index = other.image_index
		image_speed = 0
	}
	instance_destroy()
}