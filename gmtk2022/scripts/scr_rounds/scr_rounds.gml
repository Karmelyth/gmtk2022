// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro BUY_IN 1000
function start_play(){
	global.money -= BUY_IN
	global.payout += BUY_IN * 2
	roll_cuffs()
}

function end_round() {
		
	global.rounds += 1
	
	obj_shooter.can_shoot = false
	
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
	
	if global.rounds > 50 || global.money < BUY_IN {
		var good = global.rounds > 50;
		if good {
			say_line(vo_endgame_win, function(){
					with instance_create_layer(0, 0, "FX", obj_fade_to) {
						destination = results_screen
					}
				}
			)
		}
		else {
			say_line(vo_endgame_lose, function(){
					with instance_create_layer(0, 0, "FX", obj_fade_to) {
						destination = results_screen
					}
				}
			)
		}
	}
	
	else {
		if !obj_board.editor schedule(30, function() {start_round()})
	}
}

function start_round() {
	with(obj_popup) sprite_index = spr_popup_end;
	if global.money >= BUY_IN && ds_list_size(global.levels) > 0 {
		// Sandwich
		if random(15) < 1{
			with(obj_board){
		        var _wid = bbox_right - bbox_left - (272/2), hig = (bbox_bottom - bbox_top - 240)
		        with(instance_create_layer(bbox_left + (272/2) + random(_wid), bbox_top + 80 + random(hig), "Portraits", obj_popup)){
									
		            // Yes    
		        }
		    }   	
		}
		
		var time = 80;
		if ++global.round mod 5 == 0 {
			global.round = 0
			make_new_board()
			time += 40
		}
		
		roll_house()
	
		schedule(time, function() {
			with obj_shooter {
				has_dice = true
				can_shoot = true
				sprite_index = spr_hand_idle_a;
			}
		})
	}
}

function make_new_board() {
	with par_bricklike {
		clear_item()
	}
	schedule(8, start_new_level)
	
}

function clear_item() {
	with instance_create_depth(x, y, depth - 1, obj_brick_flash) {
		sprite_index = other.sprite_index
		image_index = other.image_index
		image_speed = 0
	}
	instance_destroy(self, false);
}

function start_new_level() {
	var i = global.levels[| 0];
	level_load_ext(i)
	say_line(choose(vo_startboard01, vo_startboard02), -1);
	ds_list_delete(global.levels, 0)
}