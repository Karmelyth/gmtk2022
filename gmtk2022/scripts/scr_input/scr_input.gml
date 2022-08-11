function button_pressed(inputName) {
	return getInput(inputName, inputTypes.pressed);
}

function button_check(inputName) {
	return getInput(inputName, inputTypes.check);
}

function button_released(inputName) {
	return getInput(inputName, inputTypes.released);
}

function getInput(inputName, inputType) {
	
	if instance_exists(obj_text_prompt) return false
	
	var keys = [];

	switch (inputName) {
		case (inputs.use):
			keys = ["E", vk_enter, vk_space]
			break
		case (inputs.up):
			keys = ["W", vk_up]
			break
		case (inputs.down):
			keys = ["S", vk_down]
			break
		case (inputs.right):
			keys = ["D", vk_right]
			break
		case (inputs.left):
			keys = ["A", vk_left]
			break
			
		case(inputs.turn_left):
			keys = ["Q"];
			break
		case(inputs.turn_right):
			keys = ["E"];
			break
			
		case(inputs.editor_cycle):
			keys = [vk_left, vk_right]
			break
		case(inputs.editor_left):
			keys = [vk_left]
			break
		case(inputs.editor_right):
			keys = [vk_right]
			break
		case(inputs.editor_clear):
			keys = [vk_delete]
			break
		case(inputs.editor_save):
			keys = [vk_enter]
			break
		case(inputs.editor_new):
			keys = ["N"]
			break
		case(inputs.editor_reload):
			keys = ["T"]
			break 
		case(inputs.editor_translate_down):
			keys = [vk_down]
			break 
		case(inputs.editor_translate_up):
			keys = [vk_up]
			break 
		
		case (inputs.menu_use):
			keys = [mb_left]
			break
		case (inputs.mouse_right):
			keys = [mb_right];
			break
		case (inputs.menu_select):
			keys = [mb_middle];
			break
			
		case(inputs.shoot):
			keys = [mb_left];
			break
		case(inputs.dash):
			keys = [vk_space, mb_right]
			break
	}
	
	for (var i = 0; i < array_length(keys); i++) {
		if check_button(keys[i], inputType) return true
	}
	return false
}

function check_button(input, inputType) {
	if is_string(input) {
		return get_key_function(ord(input), inputType)
	}
	if input == mb_left || input == mb_right || input = mb_middle {
		return get_mouse_function(input, inputType)
	}
	else return get_key_function(input, inputType)
}

function get_key_function(input, inputType) {
	switch(inputType) {
		case(inputTypes.pressed):
			return keyboard_check_pressed(input)
		case(inputTypes.check):
			return keyboard_check(input)
		case(inputTypes.released):
			return keyboard_check_released(input)
	}
}

function get_mouse_function(input, inputType) {
	switch(inputType) {
		case(inputTypes.pressed):
			return mouse_check_button_pressed(input)
		case(inputTypes.check):
			return mouse_check_button(input)
		case(inputTypes.released):
			return mouse_check_button_released(input)
	}
}

enum inputs {
	up,
	down,
	left,
	right,
	use,
	shoot,
	dash,
	menu_use,
	mouse_right,
	menu_select,
	turn_left,
	turn_right,
	editor_save,
	editor_cycle,
	editor_left,
	editor_right,
	editor_clear,
	editor_new,
	editor_reload,
	editor_translate_up,
	editor_translate_down
}

enum inputTypes {
	pressed,
	check,
	released,
}