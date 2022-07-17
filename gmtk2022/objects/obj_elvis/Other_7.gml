/// @description Insert description here
// You can write your code in this editor

if global.elvis_done == true {
	global.elvis_done = false
	if is_method(whendonetalking) {
		whendonetalking()
		whendonetalking = -1
	}
}
//temporary game over code
if sprite_index == spr_elvis_eat{
	// game_restart()
}

sprite_index = getNextSprite(sprite_index)
image_index = 0
