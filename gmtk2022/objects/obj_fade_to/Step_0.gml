/// @description Insert description here
// You can write your code in this editor

life -= 1
if life <= 0 {
	instance_destroy()
	room_goto(destination)
}