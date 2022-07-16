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
	with(par_bricklike) instance_destroy();
	editor = true;
}