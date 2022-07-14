// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function button_check(BUTTON){

	switch BUTTON{
	
		case mb_left: case mb_right: case mb_middle: case mb_side1: case mb_side2: case mb_none: case mb_any:
			return (mouse_check_button(BUTTON));
		case vk_lshift: case vk_lcontrol: case vk_lalt: case vk_rshift: case vk_rcontrol: case vk_ralt:
			return (keyboard_check_direct(BUTTON));
		default:
			return (keyboard_check(BUTTON));
	}

}

function button_check_pressed(BUTTON){
	
	switch BUTTON{
	
		case mb_left: case mb_right: case mb_middle: case mb_side1: case mb_side2: case mb_none: case mb_any:
			return (mouse_check_button_pressed(BUTTON));
		case vk_lshift: case vk_lcontrol: case vk_lalt: case vk_rshift: case vk_rcontrol: case vk_ralt:
			return (-4);
		default:
			return (keyboard_check_pressed(BUTTON));
	}

}

function button_check_released(BUTTON){
	
	switch BUTTON{
	
		case mb_left: case mb_right: case mb_middle: case mb_side1: case mb_side2: case mb_none: case mb_any:
			return (mouse_check_button_released(BUTTON));
		case vk_lshift: case vk_lcontrol: case vk_lalt: case vk_rshift: case vk_rcontrol: case vk_ralt:
			return (-4);
		default:
			return (keyboard_check_released(BUTTON));
	}

}