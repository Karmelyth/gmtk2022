// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro BUY_IN 1000
#macro game_speed game_get_speed(gamespeed_fps)
function start_play(){
	global.money -= BUY_IN
	global.payout += BUY_IN// * 2 // Why is this here?
//	roll_cuffs()
	global.cuffs_roll = -1;
	if instance_exists(obj_ballplacer) with obj_ballplacer instance_destroy();
	if instance_exists(obj_ball) with obj_ball canmove = true;
}

function end_round() {
		
	global.rounds += 1
	
	obj_shooter.can_shoot = false
	
	//Cuffs wins, payout
	if global.cuffs_roll > global.house_roll {
		global.money += global.payout
		global.payout = 0
		
		sound_play_pitch(snd_youwin, 1);
		if !check_fullclear() {
			if random(100) < 60 schedule(8, function(){
				say_line(choose(vo_youwin01, vo_youwin02, vo_youwin03, vo_youwin04, vo_youwin05, vo_youwin06, vo_youwin07, vo_youwin08,
								vo_youwin09, vo_youwin10, vo_youwin11, vo_youwin12, vo_youwin13, vo_youwin14, vo_youwin15), -1, false);
			})
		}
	}
	//Cuffs loses, wipe payout
	if global.cuffs_roll < global.house_roll {
		global.payout = 0
		
		sound_play_pitch(snd_youlose, 1);
		if !check_fullclear() {
			if global.cuffs_roll == -1 {
				schedule(8, function(){
					say_line(choose(vo_miss01, vo_miss02, vo_miss03, vo_miss04, vo_miss05), -1, false);
				})
			}
			else {
				if random(100) < 60 schedule(8, function(){
					say_line(choose(vo_youlose01, vo_youlose02, vo_youlose03, vo_youlose04, vo_youlose05, vo_youlose06, vo_youlose07, vo_youlose08,
									vo_youlose09, vo_youlose10, vo_youlose11, vo_youlose12, vo_youlose13, vo_youlose14, vo_youlose15), -1, false);
				})
			}
		}
	}
	//Double or nothing, next round retains this one's payout
	if global.cuffs_roll == global.house_roll {
		sound_play(snd_double)
		if !check_fullclear() {
			if !global.lastroundtie {
				say_line(choose(vo_double01, vo_double02, vo_double03, vo_double04, vo_double05, vo_double06, vo_double07, vo_double08, vo_double09, vo_double10), -1);
			}else{
				say_line(choose(vo_doubledouble01, vo_doubledouble02, vo_doubledouble03, vo_doubledouble04, vo_doubledouble05), -1);	
			}
		}
		global.lastroundtie = true;
	}else{
		
		global.lastroundtie = false;
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
	
	if global.rounds >= 50 || global.money < BUY_IN {
		var good = global.rounds >= 50;
		say_line(good ? vo_endgame_win : vo_endgame_lose, function(){
				//Make sure elvis doesnt say anything after the fact.
				get_voiceline_queue().clear()
				ds_list_clear(gamecont.delays)
				with instance_create_layer(0, 0, "FX", obj_fade_to) {
					destination = results_screen
				}
			}
		)
	}
	
	else {
		if !obj_board.editor schedule(30, function() {start_round()})
	}
}

function start_round() {
	if instance_exists(par_bricklike) with par_bricklike event_perform(ev_other, ev_user15);
	if instance_exists(obj_ball) with obj_ball event_perform(ev_other, ev_user15);
	
	with(obj_popup) sprite_index = spr_popup_end;
	if global.money >= BUY_IN && ds_list_size(global.levels) > 0 {
		// Sandwich
		if random(12) < 1 && global.rounds >= 5 && global.round != 0{
			with(obj_board){
		        var _wid = bbox_right - bbox_left - (272/2), hig = (bbox_bottom - bbox_top - 240)
		        with(instance_create_layer(bbox_left + (272/2) + random(_wid), bbox_top + 80 + random(hig), "Portraits", obj_popup)){
									
		            // Yes    
		        }
		    }   	
		}
		
		var time = 80;
		
		
		
		if check_fullclear() && global.rounds > 0 {
			global.round = 0
			
			say_line(choose(vo_fullclear01, vo_fullclear02, vo_fullclear03, vo_fullclear04, vo_fullclear05), function() {
				instance_create_layer(obj_board.x, obj_board.y, "FX", obj_explosion_radius)
				instance_create_layer(0, 0, "Instances", obj_fullclear_maker)
				sound_play(snd_youwin)
				sound_play(snd_explo)
				schedule(4.5 * game_speed, function() {
					make_new_board()
				})
			})
			time += 4 * game_speed
		}
		else if (++global.round mod 5 == 0) {
			global.round = 0
			make_new_board()
			time += 20
		}
		
		roll_house()
	
		schedule(time, function() {
			with obj_shooter {
				has_dice = true
				can_shoot = true
				sprite_index = spr_hand_idle_a;
			}
			if global.round == 4
				schedule(1, function () {
					say_line(choose(vo_lastturn01, vo_lastturn02, vo_lastturn03, vo_lastturn04, vo_lastturn05, vo_lastturn06, vo_lastturn07, vo_lastturn08, vo_lastturn09, vo_lastturn10), -1, false)
				})
		})
	}
}

function check_fullclear() {
	var fullclear = true;
		with obj_block {
			if is_destructible {
				fullclear = false
				break
			}
		}
		with obj_vault {
			if !unloaded {
				fullclear = false
				break
			}
		}
	return fullclear;
}

function make_new_board() {
	with par_bricklike {
		clear_item()
	}
	with par_collectible {
		clear_item()
	}
	with obj_ball {
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
	if global.wasUsingEditor {
		level_load_ext(global.level_num)
	}
	else {
		var i = global.levels[| 0];
		level_load_ext(i)
		say_line(choose(vo_startboard01, vo_startboard02, vo_startboard03, vo_startboard04, vo_startboard05, vo_startboard06, vo_startboard07, vo_startboard08, vo_startboard09, vo_startboard10), -1, false);
		ds_list_delete(global.levels, 0)
	}
}