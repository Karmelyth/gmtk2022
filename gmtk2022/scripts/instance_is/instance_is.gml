// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_is(instance, obj) {
	return instance.object_index == obj || object_is_ancestor(instance.object_index, obj)
}