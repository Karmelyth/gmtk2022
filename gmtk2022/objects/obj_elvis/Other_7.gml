/// @description Insert description here
// You can write your code in this editor

if global.elvis_done == true {
	global.elvis_done = false
	if is_method(whendonetalking) {
		whendonetalking()
		whendonetalking = -1
	}
}
sprite_index = getNextSprite(sprite_index)
image_index = 0
