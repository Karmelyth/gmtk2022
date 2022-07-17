// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function schedule(_delay, _function){
	ds_list_add(gamecont.delays, {time: _delay, func: _function})
}