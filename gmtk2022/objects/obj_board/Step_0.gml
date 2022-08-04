/// @description Insert description here
// You can write your code in this editor/
/*
function fill_with_bricks(x1,y1,x2,y2){
	with(obj_block) instance_destroy();
	
	var _typ = choose(1, 1, 2);
	
	var _wid = (x2 - x1), _widO = _wid;
	for(var i = x1;i<x2;i+=TILE_WIDTH){
		_wid -= TILE_WIDTH;
		var _hig = (y2 - y1), _higO = _hig;
		for(var o = y1;o<y2;o+=TILE_HEIGHT){
			_hig -= TILE_HEIGHT;
			
			if (range(_wid, 0, (_widO/5)) || range(_wid, (_widO/5) * 4, _widO)){  
				if !range(_hig, _higO * 0.50, _higO * 0.25){ // Top of the lower half is always empty
					with(instance_create_layer(i, o, layer, obj_block)){
						alarm[0] = -1;	
					}
				}
			}
		}
	}
}
{
	#macro TILE_WIDTH 32
	#macro TILE_HEIGHT 16
	if keyboard_check_pressed(vk_delete){
		fill_with_bricks(bbox_left + TILE_WIDTH, bbox_top + TILE_HEIGHT * 4, bbox_right - TILE_WIDTH, bbox_top + ((bbox_bottom - bbox_top) * 0.66));
	}
}
*/
if keyboard_check_pressed(vk_home) {
	if editor{
		global.round = 0
		start_round()
		global.money = 6000
	}else{
		with(par_collectible) instance_destroy(self, false);
		with(obj_dice) instance_destroy(self, false);
		//with(par_bricklike) instance_destroy(self, false);
		end_round()
	}
	editor = !editor;
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

	if button_check(inputs.shoot){
		if canplace{
			with instance_create_layer(mx,my,"Instances",_entity){
				//Object specific placement stuff
				depth -= 2 * other.obj_layer;
				obj_layer = other.obj_layer;
			}
		}
	}
	if button_check(inputs.menu_cancel){
		with instance_create_layer(mx, my, layer, obj_placer){
			mask_index = _sprite;
			sprite_index = mask_index;
			
			var _list = ds_list_create(),
				 _num = instance_place_list(x, y, par_bricklike, _list, false);
			if _num > 0{
			    for (var i = 0; i < _num; ++i){
			       if _list[| i].obj_layer == obj_board.obj_layer instance_destroy(_list[| i], false);
			    }
			}
			ds_list_destroy(_list);
		
			instance_destroy();
		}
		with(collision_point(mx,my,par_bricklike,0,1)){
			if obj_layer == obj_board.obj_layer instance_destroy(self, false);
		}
	}
	
	if keyboard_check_pressed(vk_delete){
		if instance_exists(par_bricklike) with par_bricklike instance_destroy(self, false);
	}
	
	if keyboard_check_pressed(vk_enter){
		var _json = {}, i = 0;
		with(par_bricklike){
			variable_struct_set(_json, string(i), { "x" : x, "y" : y, "object_index" : object_get_name(object_index) });
			i ++;
		}
		with(obj_ball){
			variable_struct_set(_json, string(i), { "x" : x, "y" : y, "object_index" : object_get_name(object_index) });
			i ++;
		}
		clipboard_set_text(json_stringify(_json));
		_json = json_stringify(_json);
		var file = file_text_open_write("output.txt");
		file_text_write_string(file, _json);
		file_text_close(file);	
	}
	if keyboard_check_pressed(vk_space){
		with(par_collectible) instance_destroy(self, false);
		with(par_bricklike) instance_destroy(self, false);
		level_load(0);
	}
}