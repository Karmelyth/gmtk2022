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
	var mb = false;
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
			keys = [mb_left]; mb = true;
			break
		case (inputs.mouse_right):
			keys = [mb_right]; mb = true;
			break
		case (inputs.menu_select):
			keys = [mb_middle]; mb = true;
			break
			
		case(inputs.shoot):
			keys = [mb_left]; mb = true;
			break
	}
	var func;
	switch(inputType) {
		case(inputTypes.pressed):
			func = (mb ? mouse_check_button_pressed : keyboard_check_pressed);
			break
		case(inputTypes.check):
			func = (mb ? mouse_check_button : keyboard_check);
			break
		case(inputTypes.released):
			func = (mb ? mouse_check_button_released : keyboard_check_released);
			break
	}
	for (var i = 0; i < array_length(keys); i++) {
		if is_string(keys[i]) {
			if func(ord(keys[i])) return true
		}
		else {
			if func(keys[i]) return true
		}
	}
	return false
}

enum inputs {
	up,
	down,
	left,
	right,
	use,
	shoot,
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