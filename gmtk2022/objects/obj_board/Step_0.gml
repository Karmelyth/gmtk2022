/// @description Editor Code

//Toggle Editor
if keyboard_check_pressed(vk_home) {
	editor = !editor;
	//Disable editor
	if !editor {
		update_current_level()
		global.round = 0
		global.rounds = 0
		start_round()
		global.round = 0
		global.money = 6000
	}
	//Enable editor
	else{
		with(par_collectible) instance_destroy(self, false);
		with(obj_dice) instance_destroy(self, false);
		//with(par_bricklike) instance_destroy(self, false);
		end_round()
		level_clear()
		level_load_ext(global.level_num)
	}
	with par_bricklike event_perform(ev_other, ev_user15);
}

if(editor){
	with(par_collectible) instance_destroy(self, false);
		
	entity_subnum += button_pressed(inputs.turn_right) - button_pressed(inputs.turn_left);

	if mouse_wheel_up(){
		entity_num --;
		if entity_num < 0 entity_num = array_length(entity_list) - 1;	
	}
	if mouse_wheel_down(){
		entity_num ++;
		if entity_num >= array_length(entity_list) entity_num = 0;	
	}
	
	if entity_subnum < 0 entity_subnum = (array_length(entity_list[entity_num]) - 1);
	if entity_subnum > (array_length(entity_list[entity_num]) - 1) entity_subnum = 0;
	
	var _entity = entity_list[entity_num][abs(entity_subnum) mod array_length(entity_list[entity_num])],
	var _sprite = entity_sprite[entity_num][abs(entity_subnum) mod array_length(entity_sprite[entity_num])];
	current_entity = _entity;
	current_sprite = _sprite;
	
	mx = clamp((mouse_x div 16) * 16, bbox_left + TILE_MIN - 1, bbox_right - TILE_MIN - sprite_get_width(_sprite) + 1);
	my = clamp((mouse_y div 16) * 16, bbox_top + TILE_MIN - 1, bbox_bottom - TILE_MIN - sprite_get_height(_sprite) + 1);
	mx += (sprite_get_xoffset(_sprite));
	my += (sprite_get_yoffset(_sprite));
	var _place = other.entity_list[other.entity_num][other.entity_subnum];
	obj_layer = object_get_parent(_place) == obj_cable ? 1 : 0;
	
	
	//Collision
	with instance_create_layer(mx, my, layer, obj_placer){
		//obj_placer handels the canplace variable
		mask_index = _sprite;
		
		//Lazy fix, sorry:
		if _sprite == spr_ball{	
			_sprite = spr_bomb;
			mask_index = _sprite;
		}
		sprite_index = mask_index;
		
		other.canplace = true;
		var _list = ds_list_create(),
			 _num = instance_place_list(x, y, par_bricklike, _list, false);
		if _num > 0{
		    for (var i = 0; i < _num; ++i){
		       if _list[| i].obj_layer == other.obj_layer{
				   _list[| i].blocking = true;
					obj_board.canplace = false;   
				}
		    }
		}
		ds_list_destroy(_list);
		
		instance_destroy();
	}

	//Place bricks
	if button_check(inputs.shoot){
		if canplace{
			sound_play_pitch(snd_die_hit_peg, random_range(1.7, 3));
			
			with instance_create_layer(mx,my,"Instances",_entity){
				obj_layer = other.obj_layer;
				
				var _factor = (sprite_width * sprite_height) / (TILE_MIN * 8);
				
				repeat(floor(_factor)) with instance_create_depth(x, y, depth + 21 * choose(1, 1, 1, -1), obj_dust){
					motion_add(random(360), random_range(3, 6) * (1 + _factor / 40));
					friction = random_range(.35, .2) * (1 + _factor / 40);
					image_speed *= random_range(.8, 1);
				}
			}
			mark_level_changed()
		}
	}
	//Delete bricks
	if button_check(inputs.mouse_right){
		with instance_create_layer(mx, my, layer, obj_placer){
			mask_index = _sprite;
			sprite_index = mask_index;
			
			var _list = ds_list_create(),
				 _num = instance_place_list(x, y, par_bricklike, _list, false);
			if _num > 0{
			    for (var i = 0; i < _num; ++i){
			       if _list[| i].obj_layer == obj_board.obj_layer{
					   
					   var _factor = (_list[| i].sprite_width * _list[| i].sprite_height) / (TILE_MIN * 8);
					   repeat(3 + _factor) with instance_create_depth(x, y, depth + 21 * choose(1, 1, 1, -1), obj_dust){
							motion_add(random(360), random_range(3, 6) * (1 + _factor / 40));
							friction = random_range(.35, .2) * (1 + _factor / 40);
							image_speed *= random_range(.8, 1);
							gravity = -.1;
						}
					   instance_destroy(_list[| i], false);
					   
					   sound_play_pitch(snd_die_throw, random_range(3, 4));
					}
			    }
				mark_level_changed()
			}
			ds_list_destroy(_list);
		
			instance_destroy();
		}
		with(collision_point(mx,my,par_bricklike,0,1)){
			if obj_layer == obj_board.obj_layer instance_destroy(self, false);
			mark_level_changed()
		}
	}
	
	if button_pressed(inputs.editor_translate_down) {
		with par_bricklike {
			y += TILE_HEIGHT
		}
		mark_level_changed()
	}
	if button_pressed(inputs.editor_translate_up) {
		with par_bricklike {
			y -= TILE_HEIGHT
		}
		mark_level_changed()
	}
	
	//Delete all board elements
	if button_pressed(inputs.editor_clear){
		level_clear()
		mark_level_changed()
	}
	
	//New Level
	if button_pressed(inputs.editor_new) {
		level_clear()
		
		add_new_level()
		level_load_ext(array_length(global.levelData) - 1)
	}
	
	//Reload level from file
	if button_pressed(inputs.editor_reload) && current_level.info.name != "" {
		level_clear()
		current_level = load_level_file(current_level.info.name + ".txt")
		mark_level_changed(false)
		level_load_ext(global.level_num)
	}
	
	//Save Level
	if button_pressed(inputs.editor_save){
		save_current_level()
	}
	
	//Cycle through loaded levels
	if button_pressed(inputs.editor_cycle) {
		if global.level_changed[global.level_num] {
			update_current_level()
		}
		level_clear()
		level_load(button_pressed(inputs.editor_left) ? -1 : 1)
	}
}