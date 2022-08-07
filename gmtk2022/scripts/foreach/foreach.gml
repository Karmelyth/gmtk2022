// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function foreach(array, _function){
	for (var i = 0, l = array_length(array) - 1; i <= l; i++) {
		_function(array[i])
	}
}