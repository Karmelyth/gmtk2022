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

if !(editor) && keyboard_check_pressed(vk_home){
	with(par_collectible) instance_destroy(self, false);
	with(par_bricklike) instance_destroy(self, false);
	end_round()
	editor = true;
}

	if(editor){
		with(par_collectible) instance_destroy(self, false);
		
		if mouse_wheel_up(){
			entity_num --;
			if entity_num < 0{
				entity_num = array_length(entity_list) - 1;	
			}
		}
		if mouse_wheel_down(){
			entity_num ++;
			if entity_num >= array_length(entity_list){
				entity_num = 0;	
			}
		}
		
		mx = clamp((mouse_x div 16) * 16, bbox_left + TILE_MIN, bbox_right - TILE_MIN - sprite_get_width(entity_sprite[entity_num]));
		my = clamp((mouse_y div 16) * 16, bbox_top + TILE_MIN, bbox_bottom - TILE_MIN - sprite_get_height(entity_sprite[entity_num]));
		mx -= (sprite_get_xoffset(entity_sprite[entity_num])) - sprite_get_width(entity_sprite[entity_num]);
		my -= (sprite_get_yoffset(entity_sprite[entity_num])) - sprite_get_height(entity_sprite[entity_num]);;
		
		//Collision
		with instance_create_layer(mx, my, layer, obj_placer){
			//obj_placer handels the canplace variable
			mask_index = other.entity_sprite[other.entity_num];
			sprite_index = mask_index;
			var _oob = !(other.bbox_left + sprite_width < bbox_right) ||
			           other.bbox_right - sprite_width < bbox_left  ||
			           !(other.bbox_top + sprite_height < bbox_bottom) ||
			           other.bbox_bottom - sprite_height < bbox_top;
			if place_meeting(x, y, par_bricklike) || _oob other.canplace = false else other.canplace = true;
			instance_destroy();
		}

		if button_pressed(inputs.shoot) || (button_check(inputs.shoot) && keyboard_check(vk_shift)){
			if canplace{
				with instance_create_layer(mx,my,"Instances",entity_list[entity_num]){
					//Object specific placement stuff
					switch object_index{
						case obj_portal:
							index = floor((instance_number(obj_portal) - 1) / 2);
							break;
					}
				}
			}
		}
		if button_pressed(inputs.menu_cancel) || (button_check(inputs.menu_cancel) && keyboard_check(vk_shift)){
			with(collision_point(mx,my,par_bricklike,0,1)){
				instance_destroy(self, false);
			}
		}
		
		if keyboard_check_pressed(vk_enter){
			var _json = {}, i = 0;
			with(par_bricklike){
				switch object_index{
					case obj_portal:
						variable_struct_set(_json, string(i), { "x" : x, "y" : y, "object_index" : object_get_name(object_index), "index" : index });
						break;
					default:
						variable_struct_set(_json, string(i), { "x" : x, "y" : y, "object_index" : object_get_name(object_index) });
						break;
				}
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
		if keyboard_check_pressed(vk_backspace){
			editor = false;
			global.round = 0
			start_round()
			global.money = 6000
		}
	}