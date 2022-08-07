/// @description Insert description here
// You can write your code in this editor

if keyboard_string != "" {
	text += keyboard_string
	keyboard_string = ""
}

if string_length(text) > 0 {
	if keyboard_check_pressed(vk_backspace) {
		text = string_copy(text, 1, string_length(text) - 1)
	}
}

if keyboard_check_pressed(vk_escape) && cancellable {
	instance_destroy()
}

if keyboard_check_pressed(vk_enter) {
	on_completion(text)
	instance_destroy()
}