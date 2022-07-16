// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro TILE_WIDTH 32
#macro TILE_HEIGHT 16
function range(_a, _b, _c){
	return _a >= min(_b, _c) && _a <= max(_b, _c);
}