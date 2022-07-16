/// @description Insert description here
// You can write your code in this editor

motion_set(90, random_range(2, 3))
motion_add(random(360), random(1))
image_angle = random(360)
gravity = .4
alarm[0] = 6
image_blend = merge_color(c_white, c_blue, .2)